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
implement a class from the ExchangeStructureHandler that stores the attribute value content
of a Part21 exchange structure

History:
17 Jul 2005: created

Documentation:

*/

#include "BaseExchangeStructureHandler.h"
#include <set>
using std::set;

using namespace KShellSTEP::EXPRESS;

namespace KShellSTEP{



namespace Part21{

class attribute_name_conflict: public std::exception{
  public:
  set<string> names;
  attribute_name_conflict(const set<string>& a):names(a){};
  ~attribute_name_conflict() throw(){};
};


class LoadMemberRecords: private ValueSlotVisitor, private InstanceMappingVisitor{
    private:
    ExchangeSchema& schema;
    auto_ptr< indexed_array<MemberRecord>::ContainerType > recs;
    set<string> attribute_names;
    set<string> name_conflicts;
    
    public:
    LoadMemberRecords(ExchangeSchema& a):schema(a){};
    auto_ptr< indexed_array<MemberRecord> >  operator()(const EntitySet& eset){
      recs.reset( new  indexed_array<MemberRecord>::ContainerType() );
      attribute_names.clear();
      name_conflicts.clear();
      
      const InstanceMapping& mapt = schema.mapping(eset);
      InstanceMappingVisitor& self(*this);
      mapt.respond_to_visitor(self);
      
      if (name_conflicts.size()) throw attribute_name_conflict( name_conflicts );
      
      return auto_ptr< indexed_array<MemberRecord> >(
        new indexed_array<MemberRecord>(recs)
      );
    }
    
    private:
    void handle_value(const EXPRESS::Entity& e, const EXPRESS::Attribute& a){
      MemberRecord tmp(e, a, recs -> size() );
      recs -> push_back( tmp );
      if (attribute_names.count(a.name)) name_conflicts.insert(a.name);
      attribute_names.insert(a.name);
    }
    void handle_redefined(){};
    
    void handle_internal(const InternalMappingType& mapt){
      const ValueSlotVector& slots = mapt.second;
      ValueSlotVector::const_iterator ix = slots.begin();
      ValueSlotVisitor& self(*this);
      for (; ix != slots.end(); ++ix)
        (**ix).respond_to_visitor(self);
    }
    
    void handle_external(const ExternalMappingType& mapt){
      ValueSlotVisitor& self(*this);
      ExternalMappingType::const_iterator im = mapt.begin();
      for (; im != mapt.end(); ++im){
        const ValueSlotVector& slots = ( im -> second);
        ValueSlotVector::const_iterator ix = slots.begin();
        for (; ix != slots.end(); ++ix)
          (**ix).respond_to_visitor(self);
      }
    }

};
    
// namespace BaseExchangeStructureHandlerUtil{
// void check_for_name_conflict(const vector<MemberRecord>&, const EntitySet&);
// string entity_set_to_string(const KShellSTEP::EXPRESS::EntitySet&);
// 
// 
// class attribute_to_member: public ValueSlotVisitor{
// 	// will put the attribute into the list if
// 	// it is not redefined
// 	private:
// 	vector<MemberRecord>& atts;
// 	public:
// 	attribute_to_member(vector<MemberRecord>& a):atts(a){};
// 	void handle_value(const EXPRESS::Entity& ent, const EXPRESS::Attribute& att){
// 		MemberRecord tmp;
// 		tmp.entity = &ent;
// 		tmp.attribute = &att;
// 		tmp.sub_index = atts.size();
// 		atts.push_back(tmp);
// 	}
// 	void handle_redefined(){};
// };
// 
// class get_mapping_members: private InstanceMappingVisitor{
// 	private:
// 	vector<MemberRecord> result;
// 	auto_ptr<attribute_to_member> collect_values;
// 
// 	public:
// 	get_mapping_members(){
// 		collect_values.reset(new attribute_to_member(result));
// 	}
// 
// 	vector<MemberRecord> operator()(const InstanceMapping& a){
// 		result.clear();
// 		a.respond_to_visitor(*this);
// 		return result;
// 	}
// 
// 	void handle_internal(const InternalMappingType& mapt){
//     const ValueSlotVector& slots = mapt.second;
// 		ValueSlotVector::const_iterator ix = slots.begin();
// 		for (; ix != slots.end(); ++ix)
// 			(**ix).respond_to_visitor(*collect_values);
// 	}
// 
// 	void handle_external(const ExternalMappingType& mapt){
// 		ExternalMappingType::const_iterator im = mapt.begin();
// 		for (; im != mapt.end(); ++im){
// 			const ValueSlotVector& slots = ( im -> second);
// 			ValueSlotVector::const_iterator ix = slots.begin();
// 			for (; ix != slots.end(); ++ix)
// 				(**ix).respond_to_visitor(*collect_values);
// 		}
// 	}
// };
// 
// }
// using namespace BaseExchangeStructureHandlerUtil;



BaseExchangeStructureHandler::	BaseExchangeStructureHandler(	SchemaServer& ss,
																StructureChoice& sc,
																ModelChoice& mc,
																InstanceChoice& ic):
	myStructureChoice(sc),
	myModelChoice(mc),
	myInstanceChoice(ic),
	mySchemaServer(ss){
			auto_ptr<ExchangeDataManager> tmp(ExchangeDataManager::make());
			_dmptr = tmp;
}


bool
BaseExchangeStructureHandler::start_structure(Header& header){
	if (myStructureChoice.start_structure(header)){
		myModelChoice.start_structure(header);
		myInstanceChoice.start_structure(header);

		if (header.schema_identifiers().size() != 1){
			throw logic_error("header file shows more/less than one schema identifier");
		}
		schemaIDptr = header.schema_identifiers()[0];
		return true;
	}
	return false;
}

ReadModelConfig
BaseExchangeStructureHandler::start_datamodel(){
	if (myModelChoice.start_datamodel()){
		shared_ptr<ExchangeSchema> es = mySchemaServer.getSchema(*schemaIDptr);
		current_schema = es.get();
		myInstanceChoice.start_datamodel(*current_schema);
		return ReadModelConfig(*_dmptr, *current_schema);
	}
	return ReadModelConfig();
}



bool
BaseExchangeStructureHandler::start_instance(const EntitySet& eset, const InstanceID& _id){

	if (myInstanceChoice.start_instance(eset,_id)){
	  InstanceClassMapType::iterator ip = classes_map.find(eset);
	  if (ip == classes_map.end()){
      auto_ptr<indexed_array<MemberRecord> > cvs;
      try{
        LoadMemberRecords func(*current_schema);
        cvs = func(eset);
      }
      catch(attribute_name_conflict& x){  // construct error string
        string msg("Conflict of attribute names: (");
        int i = x.names.size()-1;
        set<string>::const_iterator ix = x.names.begin();
        for(; ix != x.names.end(); ++ix,--i){
            msg += *ix;
            if (i) msg += ", ";
        }
        msg += ") in instance with entity content [";
        int j = eset.size()-1;
        EntitySet::const_iterator jx = eset.begin();
        for(; jx != eset.end(); ++jx, --j){
          msg += (**jx).name;
          if (j) msg += ", ";
        }
        msg += "]";
        throw logic_error(msg);
      }
      
	    shared_ptr<InstanceClass> cp(new InstanceClass(/*eset,*/ cvs));
	    classes_map.insert(
	    	InstanceClassMapType::value_type(eset,cp)
	    );
	    current_class = cp;
	    //instance_classes.push_back(cp);
	  }
	  else{
	  	current_class = ip->second;
	  }

	  InstanceRecord newRec(_id);
		//newRec.instance_class = current_class;
    shared_ptr<InstanceClass> tmp(current_class);
		newRec.index = tmp->instances.size();
	  tmp -> instances.push_back(newRec);
	  current_values.assign( tmp->members->size(), NULL);

	  return true;
  }
  return false;
}


void
BaseExchangeStructureHandler::attribute(const Entity&, const Attribute& attr,const AttributeValue* val){
  shared_ptr<InstanceClass> tmp(current_class);
  
  indexed_array<MemberRecord>::const_iterator ia = tmp->members->find( attr.name);
  if (ia == tmp->members->end()){
    throw logic_error("unknown attribute in reading instance_class");
  }
  current_values[ia -> sub_index] = val;
}

void
BaseExchangeStructureHandler::end_instance(){
  shared_ptr<InstanceClass> tmp(current_class);
  tmp -> data.insert(tmp->data.end(),current_values.begin(), current_values.end());
}

void
BaseExchangeStructureHandler::end_datamodel(){return;}

void
BaseExchangeStructureHandler::end_structure(){return;}

// namespace BaseExchangeStructureHandlerUtil{
// 
// void
// check_for_name_conflict(const vector<MemberRecord>& vs, const EntitySet& eset){
// 	// check for conflicting attribute names
// 	set<string> attrNames;
// 	vector<MemberRecord>::const_iterator im = vs.begin();
// 	for (; im != vs.end(); ++im){
// 		std::pair<set<string>::iterator, bool> res = attrNames.insert( (*im).attribute->name );
// 		if (not res.second){
// 			string errMsg("model uses entity set ");
// 			errMsg += entity_set_to_string(eset);
// 			errMsg += string(" with conflicting attribute \x22");
// 			errMsg += (*im).attribute->name;
// 			errMsg += '\x22';
// 			throw logic_error(errMsg.c_str());
// 		}
//  	}
// };
// 
// string
// entity_set_to_string(const EntitySet& a){
// 	string retVal("{");
// 	if (a.size() > 0){
// 		EntitySet::const_iterator iz = a.begin();
// 		for (int i = a.size() - 1; i > 0; --i, ++iz){
// 			retVal += (**iz).name;
// 			retVal += ", ";
// 		}
// 		retVal += (**iz).name;
// 	}
// 	retVal += "}";
// 	return retVal;
// }
// }	// close namespace

}
}
