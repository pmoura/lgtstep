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
Copyright 2005 by Vincent Marchetti All rights reserved

Purpose:
Implementation of ExchangeSchemaImpl

History:
12 May 2005: created

Documentation:

*/

#include "ExchangeSchemaImpl.h"
#include <iostream>  // only needed for debugging

#include <set>
using std::set;
#include <stack>
using std::stack;


//#include <boost/scoped_ptr.hpp>
//using boost::scoped_ptr;

namespace KShellSTEP{

namespace EXPRESS{

bool operator< (const inheritance::link& a, const inheritance::link& b){
    return (a.prim < b.prim) or (a.prim == b.prim and a.aux < b.aux);
}

bool operator< (const inheritance::link& a, const EntityPtr& b){
    return a.prim < b;
}

bool operator< (const EntityPtr& a, const inheritance::link& b){
    return a < b.prim;
}

inheritance::inheritance(const vector<inheritance::link>& a):
    links(new inheritance::link[a.size()]),
    number_of_links(a.size()){
        if (links == NULL) throw std::bad_alloc();
        std::copy(a.begin(), a.end(), links.get());
        std::sort(links.get(), links.get()+number_of_links);
    }

vector<EntityPtr>
inheritance::direct_links(const EntityPtr& ie){
	vector<EntityPtr> retVal;
  inheritance::link * begin(links.get());
  inheritance::link * end(links.get() + number_of_links);

  std::pair<inheritance::link *, inheritance::link *> range =
			 equal_range(begin, end , ie);
  for (; range.first != range.second; ++range.first)
				retVal.push_back( range.first->seco );
  return retVal;
}
  
EntitySet
inheritance::inheritance_set(const EntitySet& entities){
	stack<EntityPtr> entity_stack(stack<EntityPtr>::container_type(entities.begin(), entities.end()));
	vector<EntityPtr> retVal;
  inheritance::link * begin(links.get());
  inheritance::link * end(links.get() + number_of_links);
  
	while (not entity_stack.empty()){
		EntityPtr ie = entity_stack.top(); entity_stack.pop();
		vector<EntityPtr>::iterator iient = lower_bound(retVal.begin(), retVal.end(), ie);

		if (iient == retVal.end() or *iient != ie){
			retVal.insert(iient, ie);
			std::pair<inheritance::link *, inheritance::link *> range =
			equal_range(begin, end , ie);

			for (; range.first != range.second; ++range.first)
				entity_stack.push( range.first->seco );
    }
  }
	return EntitySet(retVal);

}

typedef std::pair<EntityPtr,bool> markedPtr;  
EntitySet
inheritance::extrema_set(const EntitySet& entities){
	vector<markedPtr> marked_ptrs(entities.size());
	EntitySet::const_iterator ie = entities.begin();
	vector<markedPtr>::iterator imp = marked_ptrs.begin();
	for (; ie != entities.end(); ++ie, ++imp){
		imp->first = *ie;
		imp->second= true;
	}

	imp = marked_ptrs.begin();
	for (; imp != marked_ptrs.end(); ++imp)
		if (imp -> second){
			EntitySet tmp;
			tmp += imp->first;
			EntitySet inh_tmp = inheritance_set(tmp);
			inh_tmp -= (imp->first);

			vector<markedPtr>::iterator imp2 = marked_ptrs.begin();
			for (; imp2 != marked_ptrs.end(); ++imp2)
				if (imp2->second and inh_tmp.contains(imp2->first))
					imp2->second = false;
		}

	EntitySet retVal;
	imp = marked_ptrs.begin();
	for (; imp != marked_ptrs.end(); ++imp)
		if (imp->second) retVal += (imp->first);
	return retVal;
}



}

namespace Part21{

ExchangeSchemaImpl::ExchangeSchemaImpl( const string& nm,
	                    auto_ptr< indexed_array<EXPRESS::Entity> > ent,
	                    auto_ptr<EXPRESS::inheritance>& super_inh,
	                    auto_ptr<EXPRESS::inheritance>& sub_inh ):_name(nm),
	                                                              _entities(ent),
	                                                              super_inheritance(super_inh),
	                                                              sub_inheritance(sub_inh){};


vector<EXPRESS::EntityPtr>
ExchangeSchemaImpl::parent_entities(EXPRESS::EntityPtr p){
    return super_inheritance->direct_links(p);
}

class InternalMapping: public InstanceMapping{
	private:
	scoped_ptr<InternalMappingType> me;

	public:
	InternalMapping(auto_ptr<InternalMappingType> p):me(p){};
	
	void respond_to_visitor(InstanceMappingVisitor& x) const{
		x.handle_internal(*me);}
};

EXPRESS::EntitySet 
ExchangeSchemaImpl::up_set(const EXPRESS::EntitySet& a) const{
  return super_inheritance->inheritance_set(a);
}

EXPRESS::EntitySet 
ExchangeSchemaImpl::down_set(const EXPRESS::EntitySet& a) const{
  return sub_inheritance->inheritance_set(a);
}

EXPRESS::EntitySet 
ExchangeSchemaImpl::minima(const EXPRESS::EntitySet& a) const{
  return super_inheritance->extrema_set(a);
}

EXPRESS::EntitySet 
ExchangeSchemaImpl::maxima(const EXPRESS::EntitySet& a) const{
  return sub_inheritance->extrema_set(a);
}

class ExternalMapping: public InstanceMapping{
	private:
	scoped_ptr<ExternalMappingType> me;

	public:
	ExternalMapping(auto_ptr<ExternalMappingType> p):me(p){};
	
	void respond_to_visitor(InstanceMappingVisitor& x) const{
		x.handle_external(*me);}
};

//vector<EXPRESS::EntityPtr>
//ExchangeSchemaImpl::superEntities(EXPRESS::EntityPtr xptr)	{
// 	EXPRESS::sub_priority_order func;
// 
// 	pair<vector<EXPRESS::inh_link>::const_iterator,vector<EXPRESS::inh_link>::const_iterator> res =
// 		std::equal_range(	sub_ordered_links.begin(),
// 											sub_ordered_links.end(),
// 											xptr,
// 											func);
// 	vector<EXPRESS::inh_link>::const_iterator ip = res.first;
// 	vector<EXPRESS::EntityPtr> retVal;
// 	for (; ip != res.second; ++ip)
// 		retVal.push_back(func.extract_minor(*ip));
// 	return retVal;
//}



InstanceMapping&
ExchangeSchemaImpl::mapping(const EXPRESS::EntitySet& entities){
	MappingCacheType::iterator ifind = mapping_cache.find(entities);

	if ( ifind == mapping_cache.end() ){
		EXPRESS::EntitySet upSet = up_set( entities);
		EXPRESS::EntitySet indexSet = minima( upSet );
		shared_ptr<InstanceMapping> res;

		if (indexSet.size() == 1)
			res =  shared_ptr<InstanceMapping>(
			    new InternalMapping( internal_mapping( **(indexSet.begin())))
			);

		else if (indexSet.size() > 1)
			res =  shared_ptr<InstanceMapping>(
			    new ExternalMapping( external_mapping( upSet ) )
			);
			
		pair<MappingCacheType::iterator,bool> ix = 
		    mapping_cache.insert(MappingCacheType::value_type(entities,res ));
		    
		// (res.first) -> second = tmp;
		ifind = ix.first;
	}
	return *(ifind->second);
}

class redefined_slot:public ValueSlot{
	public:
	void respond_to_visitor(ValueSlotVisitor& x) const{
		x.handle_redefined();}
};

class value_slot:public ValueSlot{
	private:
	EXPRESS::EntityPtr _entityPtr;
	const EXPRESS::Attribute* _attributePtr;
	public:
	value_slot(const EXPRESS::Entity& a, const EXPRESS::Attribute& b):
		_entityPtr(&a),
		_attributePtr(&b){}
	void respond_to_visitor(ValueSlotVisitor& x) const{
		x.handle_value(*_entityPtr, *_attributePtr);}
};


ValueSlotVector
value_slots(const EXPRESS::Entity& ent, const EXPRESS::EntitySet& theSet){
    // returns the value slots for the attributes of entity ent which will be encoded in the
    // context of an instance containing the entity content theSet
    
    ValueSlotVector retVal;
	EXPRESS::Entity::attribute_iterator ia = ent.attributes().begin();
	for (; ia != ent.attributes().end(); ++ia)
	    if (not (*ia).redeclaration){
            shared_ptr<ValueSlot> newSlot;
            if (not entity_set_intersection(theSet, ia->overrides).empty())
                newSlot.reset(new redefined_slot());
            else
                newSlot.reset(new value_slot(ent, *ia));
            retVal.push_back(newSlot);
 	    }
  return retVal;
}
// 

class internal_mapping_function{
	private:
	ExchangeSchemaImpl& schema;
	int loop_guard;
	std::set<EXPRESS::EntityPtr> tempSet;
	EXPRESS::EntitySet entity_set;
	ValueSlotVector result;

	public:
	internal_mapping_function(ExchangeSchemaImpl& s):
		schema(s),
		loop_guard(8){};

	ValueSlotVector operator()(const EXPRESS::Entity& ent){
	    result.clear();
		EXPRESS::EntitySet tmp;
		EXPRESS::EntityPtr xptr(&ent);

		tmp += xptr;
		entity_set = schema.up_set(tmp);
		recurs(xptr);
    return result;
	}
	void recurs(EXPRESS::EntityPtr x){
    const char* x_name = x->name.c_str();
		if (--loop_guard < 0)
			throw logic_error("recursion overflow in " __FILE__ "\n");

		vector<EXPRESS::EntityPtr> parents = schema.parent_entities(x);
		vector<EXPRESS::EntityPtr>::const_iterator ie = parents.begin();
		for (; ie != parents.end(); ++ie){
			if (tempSet.find(*ie) == tempSet.end())
				recurs(*ie);
    }
    ValueSlotVector vsv( value_slots( *x, entity_set ) );
    result.insert( result.end(), vsv.begin(), vsv.end() );
    int nsize = result.size();
		tempSet.insert(x);
		++loop_guard;
	}
};
// 
// 



// 
// 
auto_ptr<InternalMappingType>
ExchangeSchemaImpl::internal_mapping(const EXPRESS::Entity& ent){
    internal_mapping_function func(*this);
	ValueSlotVector vsv = func(ent);

	return auto_ptr<InternalMappingType>(
	    new InternalMappingType(ent.name, vsv)
	);
};
// 


// 
// 
auto_ptr<ExternalMappingType>
ExchangeSchemaImpl::external_mapping(const EXPRESS::EntitySet& a){
	auto_ptr<ExternalMappingType> retVal(new ExternalMappingType());

	EXPRESS::EntitySet::const_iterator ient = a.begin();
	for (; ient != a.end(); ++ient){
	    ValueSlotVector vsv( value_slots( **ient, a) );
		std::pair<ExternalMappingType::iterator, bool> insert_return =
		retVal->insert( ExternalMappingType::value_type( (**ient).name, vsv ) );
	}
	return retVal;
}

}
}
