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

using std::exception;
using std::endl;


#include "PrologExchangeStructureHandler.h"
#include "ASCII_codes.h"

//#include <ctype>
using std::tolower;


#include "boost/format.hpp"
#include "boost/tuple/tuple.hpp"

#include "EncodingToProlog.h"

namespace KShellSTEP{
namespace Part21{

//#######################################################################
//Class PrologValue: encodes the value of an attribute into a Prolog atom
//#######################################################################
class PrologValue: private AttributeValueVisitor{
	public:
	typedef boost::tuple<bool, const string&> ReturnType;
	private:
	bool	 bl_result;
	string   str_result;
	const string empty_string;
	EncodingToProlog utf8_to_prolog;

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
	PrologValue():empty_string("\x22\x22"){};
	ReturnType operator()(const AttributeValue*);
};


boost::format PrologValue::integer_format("%i");
boost::format PrologValue::instance_format("'%s'");
boost::format PrologValue::real_format("%16.8e");
boost::format PrologValue::enumeration_format("'%s'");
boost::format PrologValue::alias_format("typed_value(%s,%s)");

    

void
PrologValue::handle_string(const char* s){
	bl_result = true;
    size_t nsize( std::strlen(s) );
	if (  nsize == 0 ){
	    str_result.assign(empty_string);
	    return;
	}
	
	str_result.assign( utf8_to_prolog(s) ); 
}

void
PrologValue::handle_integer(long i){
	bl_result = true;
	str_result.assign( str ( integer_format % i ));}

void
PrologValue::handle_boolean(bool x){
	bl_result = true;
	if (x)
		str_result.assign("true");
	else
		str_result.assign("false");
}

void
PrologValue::handle_logical(const EXPRESS::Logical& x){
	bl_result = true;
	if (x == EXPRESS::Logical::True())
		str_result.assign("true");
	else if (x == EXPRESS::Logical::False())
		str_result.assign("false");
	else
		str_result.assign("unknown");
}

void
PrologValue::handle_real(double x){
	bl_result = true;
	str_result.assign( str ( real_format % x ) );}

void
PrologValue::handle_enumeration(const EXPRESS::Enumeration::const_iterator& ie){
	bl_result = true;
	string enumValue(*ie);
	string::iterator ic = enumValue.begin();
	for (; ic != enumValue.end(); ++ic) *ic = std::tolower(*ic);

	str_result.assign(str( enumeration_format % (enumValue)  ) );}

void
PrologValue::handle_collection(AttributeValue **ix, AttributeValue ** ie){
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
PrologValue::handle_instance(const InstanceID& _id){
	bl_result = true;
	str_result.assign( str( instance_format % (_id.map_to_Part21())));
}


void
PrologValue::handle_omitted(){
	bl_result = false;
}

void
PrologValue::handle_binary(const bool*, const bool*){
	bl_result = true;
	throw logic_error("binary to prolog not yet implemented");}

void
PrologValue::handle_aliased(const char * nm, AttributeValue * v){
	bl_result = true;
	string subValue( (*this)(v).get<1>() );
	string typeName(nm);
	string::iterator ic = typeName.begin();
	for (; ic != typeName.end(); ++ic) *ic = std::tolower(*ic);

	str_result.assign( str( alias_format % typeName % subValue ));
}



PrologValue::ReturnType
PrologValue::operator()(const AttributeValue* x){
	x->respond_to_visitor(*this);
	return boost::make_tuple(bl_result, boost::cref(str_result));
}

//#######################################################################
// End Class PrologValue
//#######################################################################




PrologExchangeStructureHandler::PrologExchangeStructureHandler(	SchemaServer& ss,
																																		StructureChoice& sc,
																																		ModelChoice& mc,
																																		InstanceChoice& ic,
																																		ostream& _os):
	BaseExchangeStructureHandler(ss,sc,mc,ic),
	os(_os){};



void
PrologExchangeStructureHandler::end_structure(){

	InstanceClassMapType::const_iterator iclass;
	vector<InstanceRecord>::const_iterator iinstance;
	vector<InstanceRecord>::const_iterator iinstance_end;

	boost::format entityset_clause_format("instance_entity('%s',%s).\n");
	bool instance_entity_clauses_present(false);
	for (iclass = classes_map.begin(); iclass != classes_map.end(); ++iclass){
		const EntitySet& class_entities = iclass->first;
		vector<string> entityNames;
		EntitySet::const_iterator ie = class_entities.begin();
		for (; ie != class_entities.end(); ++ie){
			string& stringToPrint = *( entityNames.insert( entityNames.end(), (**ie).name) );
			string::iterator ic = stringToPrint.begin();
			for (; ic != stringToPrint.end(); ++ic)  (*ic) = std::tolower( *ic );
		}

		iinstance_end = iclass->second->instances.end();
		for (iinstance = iclass->second->instances.begin(); iinstance != iinstance_end; ++iinstance){
			string idstring = (*iinstance).instance.map_to_Part21();
			vector<string>::const_iterator ie = entityNames.begin();
			for (; ie != entityNames.end(); ++ie){
				instance_entity_clauses_present = true;
				os << entityset_clause_format % idstring % (*ie);
			}}}
	// this declaration effectively defines instance_entity, avoiding error messages resulting
	// from an empty model
	if (not instance_entity_clauses_present)
		os << "instance_entity(_,_) :- fail.\n";

	PrologValue get_prolog_value;

	boost::format value_clause_format("instance_attribute_value('%s',%s,%s).\n");
	bool instance_attribute_value_clauses_present(false);
	for (iclass = classes_map.begin(); iclass != classes_map.end(); ++iclass){
		const EntitySet& class_entities = iclass->first;
		iinstance_end = iclass->second->instances.end();
		for (iinstance = iclass->second->instances.begin(); iinstance != iinstance_end; ++iinstance){
			string idstring = (*iinstance).instance.map_to_Part21();
			indexed_array<MemberRecord>& members = *(iclass->second->members);
			indexed_array<MemberRecord>::const_iterator iattr = members.begin();
			for (; iattr != members.end(); ++iattr){
				unsigned int offset = (*iinstance).index * members.size() + (*iattr).sub_index;
				const AttributeValue * valuePtr = iclass->second->data[offset];
				PrologValue::ReturnType res = get_prolog_value(valuePtr);
				if (res.get<0>()){
					instance_attribute_value_clauses_present = true;
					os << value_clause_format % idstring % ((*iattr).attribute)->name % res.get<1>();
				}}}}
	// this declaration effectively defines instance_attribute_value, avoiding error messages resulting
	// from an empty model
	if (not instance_attribute_value_clauses_present)
		os << "instance_attribute_value(_,_,_) :- fail.\n";


};



}
}
