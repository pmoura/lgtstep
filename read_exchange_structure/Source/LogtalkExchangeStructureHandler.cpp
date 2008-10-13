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
#include <iostream>

using std::cout;
using std::exception;
using std::endl;


#include "LogtalkExchangeStructureHandler.h"

//#include <ctype>
using std::tolower;


#include "boost/format.hpp"
#include "boost/tuple/tuple.hpp"


namespace KShellSTEP{
namespace Part21{

//#######################################################################
//Class LogtalkValue: encodes the value of an attribute into a Prolog atom
//#######################################################################
class LogtalkValue: private AttributeValueVisitor{
	public:
	typedef boost::tuple<bool, const string&> ReturnType;
	private:
	bool	 bl_result;
	string str_result;
	
	static boost::format string_format;
	static boost::format integer_format;
	static boost::format instance_format;
	static boost::format real_format;
	static boost::format enumeration_format;
	static boost::format alias_format;
	
	void handle_string(const char*);
	void handle_integer(long);
	void handle_boolean(bool);
	void handle_logical(const EXPRESS::Logical&);
	void handle_real(double);
	void handle_enumeration(const EXPRESS::Enumeration::const_iterator&);
	void handle_collection(AttributeValue **, AttributeValue **);
	void handle_instance(const InstanceID&);
	void handle_omitted();
	void handle_binary(const bool*, const bool*);
	void handle_aliased(const char *, AttributeValue * v);
	
	public:
	ReturnType operator()(const AttributeValue*);
};


//boost::format LogtalkValue::string_format("\x22%s\x22");
boost::format LogtalkValue::string_format("'%s'");
boost::format LogtalkValue::integer_format("%i");
boost::format LogtalkValue::instance_format("'%s'");
boost::format LogtalkValue::real_format("%16.8e");
boost::format LogtalkValue::enumeration_format("'%s'");
boost::format LogtalkValue::alias_format("typed_value(%s,%s)");

void
LogtalkValue::handle_string(const char* s){
	bl_result = true;
	str_result.assign( str ( string_format % s) ); }
	
void 
LogtalkValue::handle_integer(long i){
	bl_result = true;
	str_result.assign( str ( integer_format % i ));}
	
void 
LogtalkValue::handle_boolean(bool x){
	bl_result = true;
	if (x)
		str_result.assign("true");
	else
		str_result.assign("false");
}
	
void 
LogtalkValue::handle_logical(const EXPRESS::Logical& x){
	bl_result = true;
	if (x == EXPRESS::Logical::True())
		str_result.assign("true");
	else if (x == EXPRESS::Logical::False())
		str_result.assign("false");
	else
		str_result.assign("unknown");
}
	
void 
LogtalkValue::handle_real(double x){
	bl_result = true;
	str_result.assign( str ( real_format % x ) );}
	
void 
LogtalkValue::handle_enumeration(const EXPRESS::Enumeration::const_iterator& ie){
	bl_result = true;
	string enumValue(*ie);
	string::iterator ic = enumValue.begin();
	for (; ic != enumValue.end(); ++ic) *ic = std::tolower(*ic);

	str_result.assign(str( enumeration_format % (enumValue)  ) );}
	
void 
LogtalkValue::handle_collection(AttributeValue **ix, AttributeValue ** ie){
	bl_result = true;
	if (ix == ie)
		str_result.assign("[]");
	else{
		string tmp("[");
		while(true){
			tmp += (*this)(*ix).get<1>();
			++ix;
			if (ix == ie)
				break;
			else
				tmp += ',';
		}
		tmp += ']';
		str_result.assign(tmp);
	}
}

void 
LogtalkValue::handle_instance(const InstanceID& _id){
	bl_result = true;
	str_result.assign( str( instance_format % (_id.map_to_Part21())));
}


void 
LogtalkValue::handle_omitted(){
	bl_result = false;
}
	
void
LogtalkValue::handle_binary(const bool*, const bool*){
	bl_result = true;
	throw logic_error("binary to prolog not yet implemented");}
	
void 
LogtalkValue::handle_aliased(const char * nm, AttributeValue * v){
	bl_result = true;
	string subValue( (*this)(v).get<1>() );
	string typeName(nm);
	string::iterator ic = typeName.begin();
	for (; ic != typeName.end(); ++ic) *ic = std::tolower(*ic);
	
	str_result.assign( str( alias_format % typeName % subValue ));
}



LogtalkValue::ReturnType
LogtalkValue::operator()(const AttributeValue* x){
	x->respond_to_visitor(*this);
	return boost::make_tuple(bl_result, boost::cref(str_result));
}

//#######################################################################
// End Class LogtalkValue
//#######################################################################




LogtalkExchangeStructureHandler::LogtalkExchangeStructureHandler(	SchemaServer& ss,
																																		StructureChoice& sc,
																																		ModelChoice& mc,
																																		InstanceChoice& ic,
																																		ostream& _os):
	BaseExchangeStructureHandler(ss,sc,mc,ic),
	os(_os){};

	

void
LogtalkExchangeStructureHandler::end_structure(){
	boost::format start_object(":- object('%s',instantiates(%s)).\n");
	boost::format object_predicate("\t%s(%s).\n");
	boost::format end_object(":- end_object.\n\n");
	
	boost::format alias1("\t:- alias(%s,attr_spec/4,%s_attr_spec/4).\n");
	boost::format redirect1("\tattr_spec(N,T,S,K) :- ::%s_attr_spec(N,T,S,K).\n");
	boost::format alias2("\t:- alias(%s,domain_rule/2,%s_domain_rule/2).\n");
	boost::format redirect2("\tdomain_rule(S,R) :- ::%s_domain_rule(S,R).\n");
	
	InstanceClassMapType::const_iterator iclass;
	vector<InstanceRecord>::const_iterator iinstance;
	vector<InstanceRecord>::const_iterator iinstance_end;
	LogtalkValue get_prolog_value;
	
	for (iclass = classes_map.begin(); iclass != classes_map.end(); ++iclass){
		const EntitySet class_entities = (*current_schema).minima(iclass->first);
		vector<string> entityNames;
		EntitySet::const_iterator ie = class_entities.begin();
		for (; ie != class_entities.end(); ++ie){
			string& stringToPrint = *( entityNames.insert( entityNames.end(), (**ie).name) );
			string::iterator ic = stringToPrint.begin();
			for (; ic != stringToPrint.end(); ++ic)  (*ic) = std::tolower( *ic );
		}
		
		string inst_declaration(entityNames[0]);
		for (int k = 1; k < entityNames.size(); ++k)
			(inst_declaration += ",") += entityNames[k];
        // 
        //(inst_declaration += ",") += "model_instance";


		iinstance_end = iclass->second->instances.end();
		for (iinstance = iclass->second->instances.begin(); iinstance != iinstance_end; ++iinstance){
			string idstring = (*iinstance).instance.map_to_Part21();
			vector<string>::const_iterator ie = entityNames.begin();
			os << (start_object % idstring % inst_declaration);
			
			if (entityNames.size() > 1){
			    int kk;
			    const int klen(entityNames.size());
			    for (kk=0; kk<klen;++kk)
			        os << (alias1 % entityNames[kk] % entityNames[kk]);
			    for (kk=0; kk<klen;++kk)   
			        os << (redirect1 %  entityNames[kk]);
			    for (kk=0; kk<klen;++kk)
			        os << (alias2 % entityNames[kk] % entityNames[kk]);
			    for (kk=0; kk<klen;++kk)   
			        os << (redirect2 %  entityNames[kk]);
			        
			}
			
			
			
			indexed_array<MemberRecord>& members = *(iclass->second->members);
			indexed_array<MemberRecord>::const_iterator iattr = members.begin();
			for (; iattr != members.end(); ++iattr){
				unsigned int offset = (*iinstance).index * members.size() + (*iattr).sub_index;
				const AttributeValue * valuePtr = iclass->second->data[offset];
				LogtalkValue::ReturnType res = get_prolog_value(valuePtr);
				if (res.get<0>()){
					os << object_predicate % ((*iattr).attribute)->name % res.get<1>();
				}
			}

			os << end_object;
		}
	}

};



}
}
