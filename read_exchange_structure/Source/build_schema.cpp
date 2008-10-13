/*
Copyright (C) 2006  Vincent Marchetti

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

For author Vincent Marchetti: email vmarchetti@kshell.com
*/
/*
Copyright ©  2005 Vincent Marchetti All rights reserved

Purpose:
defines the function which constructs a schema from items returned from read_schema

History:
8 Mar 2005: created

Documentation:
*/

// -------------------------------------------------------------------------------------------------
/*
This header fragment is required by all the compilation units below
*/
#include "read_schema.h"
#include "Schema.h"
#include "ExchangeSchemaImpl.h"
#include "KShellexcept.h"
#include <boost/format.hpp>


namespace KShellSTEP{
namespace SchemaReading{
typedef map<string, itemList::value_type > itemDict;

auto_ptr<itemDict> build_itemDict(const itemList&);
}


namespace EXPRESS{
class AttributeTypeFactory{
    public:
    virtual ~AttributeTypeFactory(){};
    virtual auto_ptr<AttributeType> operator()(const SchemaReading::attribute_type&)=0;
    static  auto_ptr<AttributeTypeFactory> make(const SchemaReading::itemDict&);
};

auto_ptr< indexed_array<Entity> > 
build_entity_array(const SchemaReading::itemDict&);

typedef  shared_ptr<pair<
auto_ptr<inheritance> /* sub inheritance */,
auto_ptr<inheritance> > >InheritancePairType;

InheritancePairType
build_inheritance(const SchemaReading::itemDict&, const indexed_array<Entity>&);

void resolve_attribute_interaction(     const indexed_array<Entity>&,
                                        const SchemaReading::itemDict&,
                                        inheritance& /* sub inheritance */);

class infinite_recursion:public std::exception{
  public:
  const char * what() const throw() { return "recursion limit reached";}
};

class unknown_name: public std::exception{
    public:
    const string name;
    unknown_name(const string& a): name(a){};
    ~unknown_name() throw(){};
    const char * what() const throw (){ return "unknown name";}
};

class attribute_error: public std::runtime_error{
  public:
  attribute_error(const string& a):runtime_error(a){};
};

class entity_error: public std::runtime_error{
  public:
  entity_error(const string& a):runtime_error(a){};
};

}
}
//

//-------------------------------------------------------------------------------------------------
/*
compilation unit defining the function declared in build_schema.h
*/

#include "build_schema.h"
namespace KShellSTEP{
namespace Part21{

auto_ptr<ExchangeSchema>
build_exchange_schema(const pair<string, SchemaReading::itemList>& a){
    const string& name = a.first;
    const SchemaReading::itemList& items = a.second;

    auto_ptr< SchemaReading::itemDict > names_to_items = SchemaReading::build_itemDict(items);
    
    auto_ptr< indexed_array<EXPRESS::Entity> > entities = EXPRESS::build_entity_array(*names_to_items);
    
    EXPRESS::InheritancePairType tmp = EXPRESS::build_inheritance(*names_to_items, *entities);
 	auto_ptr<EXPRESS::inheritance> sub_inheritance =   tmp->first;
 	auto_ptr<EXPRESS::inheritance> super_inheritance = tmp->second;
    
    EXPRESS::resolve_attribute_interaction( *entities,
                                            *names_to_items,
                                            *sub_inheritance);    

   
	return auto_ptr<ExchangeSchema>(
	    new ExchangeSchemaImpl(name, entities, super_inheritance, sub_inheritance)
	);
}
}
}

//-------------------------------------------------------------------------------------------------


namespace KShellSTEP{ namespace SchemaReading{
class itemDictBuilder:private item_visitor{
    private:
    auto_ptr<itemDict> result;
    itemList::value_type cur;
    
    public:
    auto_ptr<itemDict> operator()(const itemList& items);
    void handle_item(const string&);
};

auto_ptr<itemDict>
itemDictBuilder::operator()(const itemList& items){
	result.reset( new itemDict() );
    item_visitor& self(*this); 
    itemList::const_iterator ix = items.begin();
    for (; ix != items.end(); ++ix){
        cur = *ix;
        (**ix).respond_to_visitor( self );
    }
    return result;
}

void
itemDictBuilder::handle_item(const string& n){
    (*result)[n] = cur;
}
auto_ptr<itemDict>
build_itemDict(const itemList& items){
    itemDictBuilder func;
    return func(items);
}
}}

//-------------------------------------------------------------------------------------------------

/* *********************************************************
class load_inheritance_links: Create the list of inheritance links;
each inheritance link represents one parent entity to child entity relationship
********************************************************* */

namespace KShellSTEP{ namespace EXPRESS{
struct inh_link{
    EntityPtr super;
    unsigned int priority;
    EntityPtr sub;
};

class load_inheritance_links:private SchemaReading::item_visitor{
	private:
	const indexed_array<Entity>& entities;
	vector<inh_link> result;
	public:
	load_inheritance_links(const indexed_array<Entity>& a):entities(a){};
	InheritancePairType  operator()(const SchemaReading::itemDict&);
	void handle_entity(const string&,const vector<string>&, const SchemaReading::attributeList&);
};



InheritancePairType
load_inheritance_links::operator()(const SchemaReading::itemDict& items){
    SchemaReading::item_visitor& self(*this);
	result.clear();
	SchemaReading::itemDict::const_iterator ie = items.begin();
	for (; ie != items.end(); ++ie)
	    ie->second->respond_to_visitor(self);
	
	
	InheritancePairType retVal( new InheritancePairType::value_type() );
	
	vector<inh_link>::const_iterator ix;
	vector<inheritance::link>::iterator iinh;
    vector<inheritance::link> parent_to_child(result.size());
    
    iinh = parent_to_child.begin();
    for (ix = result.begin(); ix != result.end(); ++ix,++iinh){
        iinh->prim = ix-> super;
        iinh->aux  = 0;
        iinh->seco = ix-> sub;
    };
    
    retVal->first.reset(
            new inheritance( parent_to_child )
    );


    vector<inheritance::link> child_to_parent(result.size());
    iinh = child_to_parent.begin();
    for (ix = result.begin(); ix != result.end(); ++ix,++iinh){
        iinh->prim = ix-> sub;
        iinh->aux  = ix-> priority;
        iinh->seco = ix-> super;
    };
    
    retVal->second.reset(
            new inheritance( child_to_parent)
    );
	return retVal;
}


void
load_inheritance_links::handle_entity(  const string& nm,
                                        const vector<string>& super_entity_names,
                                        const SchemaReading::attributeList&){
	indexed_array<Entity>::const_iterator sub = entities.find(nm);
// 	This is reported as a logic error because: the name nm really ought to appear in the
// 	indexed_array because the indexed array was constructed from these items, among which should
// 	have been this entity
	if (sub == entities.end())  throw std::logic_error("logic error: " __FILE__ ":load_inheritance_links::handle_entity");
  try{
	vector<string>::const_iterator ix = super_entity_names.begin();
	unsigned int priority(0);
	for (; ix != super_entity_names.end(); ++ix, ++priority){
		inh_link link;
		link.sub = sub;
		link.priority = priority;
		indexed_array<Entity>::const_iterator super = entities.find(*ix);
// 		Here, it's a unknown_name (runtime error), it's possible that a schema definition file
// 		has an non-declared entity name given as a super entity in a SUBTYPE OF declaration
		if (super == entities.end())  throw unknown_name(*ix);
		link.super = super;

		result.push_back(link);
	}
  } catch(unknown_name& uk){
    boost::format error_message("unknown name %s  in SUPERTYPE declaration for entity %s");
    throw entity_error( str(error_message % uk.name % nm) );
  }
	return;
}

InheritancePairType
build_inheritance(const SchemaReading::itemDict& items, const indexed_array<Entity>& entities){
    load_inheritance_links func(entities);
    return func(items);
}
}}
//-------------------------------------------------------------------------------------------------


namespace KShellSTEP{
namespace EXPRESS{
/* *********************************************************
class load_entities_func: Create the indexed_array of entities, with each entry
initialized with a name but no attributes as of yet
********************************************************* */
class load_entities_func:private SchemaReading::item_visitor{
	private:
	AttributeTypeFactory& attribute_factory;
	auto_ptr< indexed_array<Entity>::ContainerType>  buffer;

	public:
	load_entities_func(AttributeTypeFactory& a):attribute_factory(a){};
	auto_ptr< indexed_array<Entity> > operator()(const SchemaReading::itemDict&);
	void handle_entity(const string&,const vector<string>&, const SchemaReading::attributeList&);
};

class load_attributes_func: private SchemaReading::attribute_visitor,
                            private SchemaReading::attribute_name_visitor{
  protected:
	AttributeTypeFactory& attribute_factory;
	auto_ptr< indexed_array<Attribute>::ContainerType>  buffer;
	indexed_array<Attribute>::ContainerType::iterator newAttributePtr;

  public:
  load_attributes_func(AttributeTypeFactory& a):attribute_factory(a){};
  auto_ptr<indexed_array<Attribute> > operator()(const SchemaReading::attributeList&);

  void handle_explicit_attribute(const SchemaReading::attribute_name& nm, bool, const SchemaReading::attribute_type&);  
  void handle_simple_name(const string&);
};

void 
load_entities_func::handle_entity(const string& nm,const vector<string>&, const SchemaReading::attributeList& attributes){
    indexed_array<Entity>::ContainerType::iterator ib = buffer->insert(buffer->end(), Entity(nm));
    
    load_attributes_func func(attribute_factory);

    try{
      auto_ptr<indexed_array<Attribute> > tmp(func(attributes));
      ib->attributes_ptr = tmp;
    } catch(attribute_error& exc){
      boost::format error_msg("entity %s: %s");
      throw entity_error( str( error_msg % nm % exc.what() ));
    }
    
    
}

auto_ptr< indexed_array<Entity> >
load_entities_func::operator()(const SchemaReading::itemDict& items){
    SchemaReading::item_visitor& self(*this);
    SchemaReading::itemDict::const_iterator ix = items.begin();
    buffer.reset( new indexed_array<Entity>::ContainerType() );
    for (; ix != items.end(); ++ix) ix->second->respond_to_visitor(self);
	  return auto_ptr< indexed_array<Entity> >(new indexed_array<Entity>(buffer));
}

auto_ptr< indexed_array<Entity> > 
build_entity_array(const SchemaReading::itemDict& items){
    auto_ptr<AttributeTypeFactory> tmp = AttributeTypeFactory::make(items);
    AttributeTypeFactory& attribute_factory(*tmp);
    
    load_entities_func func(attribute_factory);
    return func(items);
}

auto_ptr<indexed_array<Attribute> > 
load_attributes_func::operator()(const SchemaReading::attributeList& attributes){
  SchemaReading::attribute_visitor& self(*this);
  SchemaReading::attributeList::const_iterator ix = attributes.begin();
  buffer.reset( new indexed_array<Attribute>::ContainerType() );
  for (; ix != attributes.end(); ++ix)
    (**ix).respond_to_visitor(self);
  return auto_ptr< indexed_array<Attribute> >(new indexed_array<Attribute>(buffer));
}

class AttributeError: public SchemaReading::attribute_name_visitor{
  private:
  const string msg;
  public:
  AttributeError(const string& a):msg(a){};
  void handle_simple_name(const string& nm){
    boost::format error_msg("attribute %s: %s");
    throw attribute_error( str( error_msg % nm % msg) );
  }
};
  
void
load_attributes_func::handle_explicit_attribute(const SchemaReading::attribute_name& nm, bool opt, const SchemaReading::attribute_type& attr_type){
  SchemaReading::attribute_name_visitor& self(*this);
  nm.respond_to_visitor(self);
  newAttributePtr -> optional = opt;
  try{
    auto_ptr<AttributeType> tmp = attribute_factory(attr_type);
    newAttributePtr -> type = tmp;
  } catch (infinite_recursion& exc){
    AttributeError error_thrower("recursion depth limit exceeded");
    nm.respond_to_visitor(error_thrower);
  } catch (unknown_name& uk){
    boost::format error_msg("unknown name %s");
    AttributeError error_thrower( str( error_msg % uk.name) );
    nm.respond_to_visitor(error_thrower);
  }
  
}

void 
load_attributes_func::handle_simple_name(const string& nm){
  newAttributePtr = buffer->insert(buffer->end(), Attribute(nm));
}
}}

//-------------------------------------------------------------------------------------------------

namespace KShellSTEP{
namespace EXPRESS{
class AttributeTypeFactoryImpl:public AttributeTypeFactory{
  protected:
  virtual const SchemaReading::itemDict& items() =0;
  virtual auto_ptr<AttributeType> resolve_named_type(const string&)=0;
  virtual bool resolves_to_instance(const string&)=0;  
};

class ResolvesToInstance: private SchemaReading::item_visitor,
                          private virtual AttributeTypeFactoryImpl{
  private:
  bool result;
  int recursion_guard;
  
  public:
  ResolvesToInstance():recursion_guard(32){};
  bool operator()(const string&);
  
  private:
  void handle_entity(const string&,const vector<string>&, const SchemaReading::attributeList&);
  void handle_select_type(const string&,const vector<string>&);
  void handle_item(const string&);
};

class ResolveNamedType: private SchemaReading::item_visitor,
                        private virtual AttributeTypeFactoryImpl{
  private:
  auto_ptr<AttributeType> result;
  int recursion_guard;
  
  public:
  ResolveNamedType():recursion_guard(32){};
  auto_ptr<AttributeType> operator()(const string&);
  private:
	void handle_entity(const string&,const vector<string>&, const SchemaReading::attributeList&);
  void handle_select_type(const string&,const vector<string>&);
	void handle_enumeration_type(const string&,const vector<string>&);
	void handle_alias_type(const string& name,const SchemaReading::attribute_type&);
};


class AttributeTypeFactoryImplW: public virtual AttributeTypeFactoryImpl,
                             private SchemaReading::attribute_type_visitor,
                             private ResolveNamedType,
                             private ResolvesToInstance{
  private:
  const SchemaReading::itemDict& _items;
  auto_ptr<AttributeType> result;
  int recursion_guard;
  
  public:
  AttributeTypeFactoryImplW(const SchemaReading::itemDict& a):_items(a),recursion_guard(32){};    
  auto_ptr<AttributeType> operator()(const SchemaReading::attribute_type&);
  
  const SchemaReading::itemDict& items(){return _items;}
  auto_ptr<AttributeType> resolve_named_type(const string& name){ return ((ResolveNamedType *) this)->operator()(name);}
  virtual bool resolves_to_instance(const string& name){ return ((ResolvesToInstance *) this)->operator()(name);}

	void handle_named(const string&);
	void handle_collection(const SchemaReading::attribute_type&, const SchemaReading::bound_specification&);
	void handle_array(const SchemaReading::attribute_type&, const SchemaReading::bound_specification&, bool);
	void handle_boolean();
	void handle_integer();
	void handle_string(bool);
	void handle_binary(bool);
	void handle_logical();
	void handle_number();
	void handle_real();
  
};

  

auto_ptr<AttributeTypeFactory>
AttributeTypeFactory::make(const SchemaReading::itemDict& items){
  return auto_ptr<AttributeTypeFactory>(
    new AttributeTypeFactoryImplW(items)
  );
}


}}

  

#include <cctype>

namespace KShellSTEP{
namespace EXPRESS{
namespace AttributeTypes{
class String:public AttributeType{
	public:
	void respond_to_visitor(AttributeTypeVisitor& x) const {x.handle_string();}
};

class Instance:public AttributeType{
	public:
	void respond_to_visitor(AttributeTypeVisitor& x) const {x.handle_instance();}
};

class Collection:public AttributeType{
	private:
	scoped_ptr<AttributeType> elementType;
	public:
	Collection(auto_ptr<AttributeType>& a):elementType(a){};
	void respond_to_visitor(AttributeTypeVisitor& x) const {x.handle_collection(*elementType);}
};

class Array:public AttributeType{
	private:
	scoped_ptr<AttributeType> elementType;
	public:
	Array(auto_ptr<AttributeType>& a):elementType(a){};
	void respond_to_visitor(AttributeTypeVisitor& x) const {x.handle_array_optional(*elementType);}
};

class Aliased:public AttributeType{
	private:
	scoped_ptr<AttributeType> aliased_type;
	string alias_name;
	public:
	Aliased(const string& aname, auto_ptr<AttributeType>& atype):
		alias_name(aname),
		aliased_type(atype){
			for (string::iterator ic = alias_name.begin(); ic != alias_name.end(); ++ic)
				*ic = std::toupper(*ic);
		};
	void respond_to_visitor(AttributeTypeVisitor& x) const {x.handle_aliased(alias_name ,*aliased_type);}
};

class Enumeration:public AttributeType{
	EXPRESS::Enumeration myValues;
	public:
	Enumeration(const string& _nm, const vector<string>& a):myValues(_nm,a){};
	void respond_to_visitor(AttributeTypeVisitor& x) const {x.handle_enumeration(myValues);return;}
};

class Binary:public AttributeType{
	public:
	void respond_to_visitor(AttributeTypeVisitor& x) const {x.handle_binary();return;}
};

class Boolean:public AttributeType{
	public:
	void respond_to_visitor(AttributeTypeVisitor& x) const {x.handle_boolean();return;}
};


class Integer:public AttributeType{
	public:
	void respond_to_visitor(AttributeTypeVisitor& x) const {x.handle_integer();return;}
};

class Logical:public AttributeType{
	public:
	void respond_to_visitor(AttributeTypeVisitor& x) const {x.handle_logical();return;}
};

class Real:public AttributeType{
	public:
	void respond_to_visitor(AttributeTypeVisitor& x) const {x.handle_real();return;}
};

class Number:public AttributeType{
	public:
	void respond_to_visitor(AttributeTypeVisitor& x) const {x.handle_number();return;}
};

class MultipleTypes: public AttributeType{
	private:
	const vector< shared_ptr<AttributeType> > types;
	public:
	MultipleTypes(const vector< shared_ptr<AttributeType> >& x):types(x){};
	void respond_to_visitor(AttributeTypeVisitor& x) const {x.handle_multiple(types);}
};
}	// close AttributeTypes namespace

auto_ptr<AttributeType> 
AttributeTypeFactoryImplW::operator()(const SchemaReading::attribute_type& a){
  recursion_guard--;
  if (recursion_guard <= 0) throw infinite_recursion();
  SchemaReading::attribute_type_visitor& self(*this);
  a.respond_to_visitor(self);
  recursion_guard++;
  return result;
}

void AttributeTypeFactoryImplW::handle_boolean(){result.reset(new AttributeTypes::Boolean());}
void AttributeTypeFactoryImplW::handle_integer(){result.reset(new AttributeTypes::Integer());}
void AttributeTypeFactoryImplW::handle_string(bool){result.reset(new AttributeTypes::String());}
void AttributeTypeFactoryImplW::handle_binary(bool){result.reset(new AttributeTypes::Binary());}
void AttributeTypeFactoryImplW::handle_logical(){result.reset(new AttributeTypes::Logical());}
void AttributeTypeFactoryImplW::handle_number(){result.reset(new AttributeTypes::Number());}
void AttributeTypeFactoryImplW::handle_real(){result.reset(new AttributeTypes::Real());}
void AttributeTypeFactoryImplW::handle_named(const string& nm){
  result=this->resolve_named_type(nm);
}

void AttributeTypeFactoryImplW::handle_collection(const SchemaReading::attribute_type& subtype,
                                                  const SchemaReading::bound_specification&){
  auto_ptr<AttributeType> sub = (*this)(subtype);
  result.reset(new AttributeTypes::Collection(sub));
}

void 	AttributeTypeFactoryImplW::handle_array(const SchemaReading::attribute_type& subtype,
                                              const SchemaReading::bound_specification& bs,
                                              bool opt){
  if (opt){
    auto_ptr<AttributeType> tmp = ((AttributeTypeFactory *)this) -> operator()(subtype);
    result.reset(new AttributeTypes::Array(tmp));
  }
  else
    this->handle_collection(subtype, bs);
}



auto_ptr<AttributeType>
ResolveNamedType::operator()(const string& nm){

  recursion_guard--;
  if (recursion_guard <= 0) throw infinite_recursion();
  
  if (this->resolves_to_instance(nm))
    result.reset(new AttributeTypes::Instance() );
  else{
    SchemaReading::itemDict::const_iterator ix = items().find(nm);
    if (ix == items().end()) throw unknown_name(nm);
    SchemaReading::item_visitor& self(*this);
    ix->second->respond_to_visitor(self);
  }
  recursion_guard++;
  return result;
}

void 
ResolveNamedType::handle_entity(const string&,const vector<string>&, const SchemaReading::attributeList&){
  result.reset( new AttributeTypes::Instance() );
}

void 
ResolveNamedType::handle_select_type(const string&,const vector<string>& subTypeNames){
  vector< shared_ptr<AttributeType> > subTypes;
  bool canBeInstance(false);
  
  vector<string>::const_iterator iname = subTypeNames.begin();
  for (; iname != subTypeNames.end(); ++iname)
    if (this->resolves_to_instance(*iname)) canBeInstance=true;
    else{
      auto_ptr<AttributeType> _t(this->resolve_named_type(*iname));
      shared_ptr<AttributeType> _s(_t);
      subTypes.push_back(_s);
    }
  if (canBeInstance){
    shared_ptr<AttributeType> tmp(new AttributeTypes::Instance());
    subTypes.push_back(tmp);
  }
  result.reset( new AttributeTypes::MultipleTypes( subTypes) );
}
	
void 
ResolveNamedType::handle_enumeration_type(const string& name,const vector<string>& values){
  result.reset( new AttributeTypes::Enumeration(name, values));
}

void 
ResolveNamedType::handle_alias_type(const string& name,const SchemaReading::attribute_type& subt){
  auto_ptr<AttributeType> tmp = ((AttributeTypeFactory *) this)-> operator()(subt);
  result.reset( new AttributeTypes::Aliased(name, tmp));
}
  


bool
ResolvesToInstance::operator()(const string& name){

  --recursion_guard;
  if (recursion_guard <= 0) throw infinite_recursion();
  SchemaReading::itemDict::const_iterator ix = items().find(name);
  if (ix == items().end()) throw unknown_name(name);
  SchemaReading::item_visitor& self(*this);
  ix->second->respond_to_visitor(self);
  ++recursion_guard;
  return result;
}
  
void
ResolvesToInstance::handle_entity(const string&,const vector<string>&, const SchemaReading::attributeList&){
  result=true;
}

void
ResolvesToInstance::handle_select_type(const string&,const vector<string>& subtypes){
  bool retVal(true);
  vector<string>::const_iterator ix = subtypes.begin();
  for (; ix != subtypes.end(); ++ix)
    if (not this->operator()(*ix)){
      retVal=false;
      break;
    }
  result = retVal;
}

void
ResolvesToInstance::handle_item(const string&){result=false;}

}
}	// close KShellSTEP




//-------------------------------------------------------------------------------------------------
namespace KShellSTEP{
namespace EXPRESS{


class AttributeFinder: private SchemaReading::attribute_name_visitor{
  private:
  Entity* ent;
  indexed_array<Attribute>::iterator result;
  
  public:
  indexed_array<Attribute>::iterator find_attribute(const EntityPtr&, const SchemaReading::attribute_name&);
  private:
  void handle_simple_name(const string&);
};

indexed_array<Attribute>::iterator 
AttributeFinder::find_attribute(const EntityPtr& entity, const SchemaReading::attribute_name& nm){
  ent=const_cast<Entity *>(&(*entity));
  SchemaReading::attribute_name_visitor& self(*this);
  nm.respond_to_visitor(self);
  return result;
}

void
AttributeFinder::handle_simple_name(const string& name){
  result= (*ent).attributes().find(name);
}

  
class AttributeCompare  : public AttributeFinder,
                          public SchemaReading::item_visitor,
                          public SchemaReading::attribute_visitor{
  private:
  EntityPtr sub;
  EntityPtr super;

  public:
  AttributeCompare(const EntityPtr& _super, const EntityPtr _sub): sub(_sub),super(_super){};
  
  /* item visitor function */
  void handle_entity(const string& name,const vector<string>&, const SchemaReading::attributeList&);
  
  /*  attribute  visitor functions */
  void handle_explicit_attribute(const SchemaReading::attribute_name& nm, bool, const SchemaReading::attribute_type&);
  void handle_derived_attribute(const SchemaReading::attribute_name& nm);
};

void resolve_attribute_interaction(     const indexed_array<Entity>& entities,
                                        const SchemaReading::itemDict& items,
                                        inheritance& sub_inheritance){
  indexed_array<Entity>::const_iterator ient = entities.begin();
  for (; ient != entities.end(); ++ient){
    EntityPtr super(&(*ient));
    EntitySet _tmp;
    _tmp += super;
    EntitySet downset = sub_inheritance.inheritance_set(_tmp);
    downset -= super;
    
    EntitySet::const_iterator isub = downset.begin();
    for (; isub != downset.end(); ++isub){
      AttributeCompare visitor(super, *isub);
      SchemaReading::itemDict::const_iterator iitem = items.find( (**isub).name );
      if (iitem == items.end()) throw std::exception();
      iitem->second->respond_to_visitor( visitor );
    }
  }
}


void 
AttributeCompare::handle_entity(const string&,const vector<string>&, const SchemaReading::attributeList& attributes){
  SchemaReading::attributeList::const_iterator iattr = attributes.begin();
  SchemaReading::attribute_visitor& self(*this);
  for (; iattr != attributes.end(); ++iattr) (**iattr).respond_to_visitor(self);
}

void
AttributeCompare::handle_explicit_attribute(const SchemaReading::attribute_name& nm, bool, const SchemaReading::attribute_type&){
  indexed_array<Attribute>::iterator iattr = find_attribute(super, nm);
  if (iattr != (*super).attributes().end()){
    indexed_array<Attribute>::iterator isubattr = find_attribute(sub,nm);
    (*isubattr).redeclaration = true;
  }
}

void
AttributeCompare::handle_derived_attribute(const SchemaReading::attribute_name& nm){
  indexed_array<Attribute>::iterator iattr = find_attribute(super, nm);
  if (iattr != (*super).attributes().end()){
    (*iattr).overrides += sub;
  }
}


}}

