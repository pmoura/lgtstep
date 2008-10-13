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
Copyright ©  2004 Vincent Marchetti All rights reserved

Purpose:
implementation of functions for first-pass parsing of an EXPRESS schema file (EXPRESS entities and types are read, but
internal name references not resolved)

History:
26 Nov 2004: created for use in SchemaReading
12 May 2004: added the modify_case functions

Documentation:
The modify_case function converts the case of all letters of a string (or vectors of strings) to
upper case. This allows these names to be matched by the encoding of entity names, type names, and enumeration
values as specified in Part 21. If a macro PRESERVE_SCHEMA_CASE is defined at compile time then this
case conversion will NOT be done
*/


#include "read_schema.h"
#include "BasicTokenTests.h"

#include "KShellexceptImpl.h"
#include "TokenListParsing.h"

#include "ASCII_codes.h"
#include <cctype>

using namespace std;

void modify_case(string& a){
#ifndef PRESERVE_SCHEMA_CASE
    string::iterator ic = a.begin();
    for (; ic != a.end(); ++ic) *ic = std::toupper(*ic);
#endif
}

void modify_case(vector<string>& va){
    vector<string>::iterator j = va.begin();
    for(; j != va.end(); ++j) modify_case(*j);
}

namespace KShellSTEP{
namespace SchemaReading{

class eos:public std::exception{};
#define advance		{++ix; if (ix == iend) throw eos();}

#pragma mark KeyWords
//      EXPRESS Schema keywords
KeyWordTest key_ARRAY       ("ARRAY");
KeyWordTest key_BAG         ("BAG");
KeyWordTest key_BINARY      ("BINARY");
KeyWordTest key_BOOLEAN     ("BOOLEAN");
KeyWordTest key_DERIVE      ("DERIVE");
KeyWordTest key_END_SCHEMA  ("END_SCHEMA");
KeyWordTest key_END_TYPE    ("END_TYPE");
KeyWordTest key_ENTITY      ("ENTITY");
KeyWordTest key_END_ENTITY  ("END_ENTITY");
KeyWordTest key_ENUMERATION ("ENUMERATION");
KeyWordTest key_FIXED       ("FIXED");
KeyWordTest key_INVERSE     ("INVERSE");
KeyWordTest key_INTEGER     ("INTEGER");
KeyWordTest key_LIST        ("LIST");
KeyWordTest key_LOGICAL     ("LOGICAL");
KeyWordTest key_NUMBER      ("NUMBER");
KeyWordTest key_OPTIONAL    ("OPTIONAL");
KeyWordTest key_OF          ("OF");
KeyWordTest key_REAL        ("REAL");
KeyWordTest key_SUBTYPE     ("SUBTYPE");
KeyWordTest key_SCHEMA      ("SCHEMA");
KeyWordTest key_SELECT      ("SELECT");
KeyWordTest key_SELF		    ("SELF");
KeyWordTest key_SET         ("SET");
KeyWordTest key_STRING      ("STRING");
KeyWordTest key_TYPE        ("TYPE");
KeyWordTest key_UNIQUE      ("UNIQUE");
KeyWordTest key_WHERE       ("WHERE");
// -----------------------------------

void read_list_of_names(TokenIterator, const TokenIterator&, vector<string>&);
TokenIterator find_next_semicolon(TokenIterator, const TokenIterator&);
TokenIterator find_next_colon(TokenIterator, const TokenIterator&);

#pragma mark SchemaParsing
class item_base: public item{
	public:
	string name;
};

auto_ptr<item_base> read_entity(TokenIterator, const TokenIterator&);
auto_ptr<item_base> read_type  (TokenIterator, const TokenIterator&);


pair<string, itemList>
read_schema(TokenIterator& ix,
            const TokenIterator& iend){
	pair<string, itemList> retVal;
	string& name = retVal.first;
	itemList& items = retVal.second;
	
	try{
	while (not key_SCHEMA(*ix))
		advance;

	advance;	// go to the schemaName
  pair<bool, string> name_res = is_a_word(*ix);
	if (not name_res.first) throw ExpectingName( (**ix).start(), (**ix).stop());
  name = name_res.second;
  
	while (not key_END_SCHEMA(*ix)){
		if (key_ENTITY(*ix) or key_TYPE(*ix)){
			auto_ptr<item_base> newItem;
			TokenIterator istart(ix);
			TokenIterator iname(++ix);
			try{
				if (key_ENTITY(*istart)){
					while (not key_END_ENTITY(*ix)) advance;
					newItem = read_entity(istart,ix);
				}
				if (key_TYPE(*istart)){
					while (not key_END_TYPE(*ix)) advance;
					newItem = read_type(istart,ix);
				}
			} catch (eos&){
				throw UnexpectedEndOfSource();
			}
      pair<bool, string> tmpres = is_a_word(*iname); 
			if (not tmpres.first) throw ExpectingName((**iname).start(),(**iname).stop());
      newItem->name = tmpres.second;
			// set the name of the item (type or entity
			modify_case(newItem->name);
			shared_ptr<item> tmp(newItem);
			items.push_back(tmp);
		}
		advance;
	}
	}catch (eos&){
		throw;
	}
	return retVal;
}


class simple_attribute_name:public attribute_name{
	public:
	string name;
	void respond_to_visitor(attribute_name_visitor& x) const {x.handle_simple_name(name);}
};

class specified_attribute_name:public simple_attribute_name{
	public:
	string entity_name;
	void respond_to_visitor(attribute_name_visitor& x) const {x.handle_specified_name(name,entity_name);}
};

auto_ptr<attribute_name>
read_attribute_name(TokenIterator ix,const TokenIterator& iend){
	TokenIterator ix_arg(ix);
	auto_ptr<attribute_name> retVal;

	auto_ptr<simple_attribute_name> simpName;
	if (key_SELF(*ix)){
		TokenIterator ibackslash;
		TokenIterator ientity;
		TokenIterator iperiod;
		try{
			advance;
			ibackslash=ix;
			advance;
			ientity=ix;
			advance;
			iperiod=ix;
			advance;
		}
		catch(eos&){
			throw AttributeReadingError((**ix_arg).start(), (**TokenIterator(iend)).stop());
		}
		if (not (is_a_backslash(*ibackslash) and is_a_period(*iperiod)))
			throw AttributeReadingError((**ix_arg).start(), (**TokenIterator(iend)).stop());

		auto_ptr<specified_attribute_name> _tmp(new specified_attribute_name);
    pair<bool, string> tmpres =  is_a_word(*ientity);
		if (not tmpres.first) throw ExpectingName((**ientity).start(),(**ientity).stop());
    _tmp->entity_name = tmpres.second;
		modify_case(_tmp->entity_name);
		simpName = _tmp;
	}
	else{
		simpName.reset(new simple_attribute_name);
	}
  pair<bool, string> simpres = is_a_word(*ix);
	if (not simpres.first) throw ExpectingName((**ix).start(),(**ix).stop());
  simpName -> name = simpres.second;
	retVal=simpName;
	return retVal;
}


// used in reading both entities and types (spec alias-types)
auto_ptr<attribute_type> read_attribute_type(TokenIterator,const TokenIterator&);

class attribute_base: public attribute{
	public:
	auto_ptr<attribute_name> name_ptr;
};

#pragma mark EntityParsing
class entity:public item_base{
	public:
	vector<string> super_entity_names;
	vector< shared_ptr<attribute> > attributes;

	void respond_to_visitor(item_visitor& x) const{
		x.handle_entity(name, super_entity_names, attributes);}
};

class explicit_attribute: public attribute_base{
	public:
	bool optional;
	auto_ptr<attribute_type> attribute_type_ptr;
	void respond_to_visitor(attribute_visitor& x) const{
		x.handle_explicit_attribute(*name_ptr, optional, *attribute_type_ptr);}
};

auto_ptr<attribute> read_derived_attribute(TokenIterator, const TokenIterator&);


auto_ptr<item_base>
read_entity(TokenIterator ix,
            const TokenIterator& iend){
  auto_ptr<entity> retVal(new entity);
  TokenIterator istart(ix);
  try{
	TokenIterator isc = find_next_semicolon(ix,iend);
	for(; ix != isc; ++ix){
		if (key_SUBTYPE(*ix)){
			advance;
			if (not key_OF(*ix))
				throw ExpectingKeyword(key_OF.key(), (**ix).start(), (**ix).stop());
			advance;
      
      pair<bool, TokenRange> _res = matching_parentheses(ix,iend);			
			if (not _res.first) throw ExpectingParentheses( (**ix).start() );
      TokenRange& supertype_name_range = _res.second;

			read_list_of_names(supertype_name_range.begin(), supertype_name_range.end(), retVal->super_entity_names);
			// change the case of the names of the super entities, so they can be identified in the list of entities
			modify_case(retVal->super_entity_names);
			break;
		}
	}
	ix = ++isc;


	// ix is now pointing past the semicolon of the sub-super declaration, the start of the
	// explicit attributes

	// read explicit attributes
	while (not (ix == iend or key_DERIVE(*ix) or key_UNIQUE(*ix) or key_INVERSE(*ix) or key_WHERE(*ix))){
		TokenIterator isc = find_next_semicolon(ix,iend);
		TokenIterator ic =  find_next_colon(ix,isc);
		
		while (ix != ic){
			TokenIterator inext(ix);
			while (inext != ic and not is_a_comma(*inext)) ++inext;
			
			auto_ptr<explicit_attribute> attr( new explicit_attribute);
			attr->name_ptr = read_attribute_name(ix,inext);
			
			ix = ++ic;
    		if (key_OPTIONAL(*ix)){
				attr->optional = true;
				advance;
			}
			else
				attr->optional = false;
			attr->attribute_type_ptr = read_attribute_type(ix,isc);
			
			shared_ptr<attribute> tmp(attr);
			retVal->attributes.push_back( tmp );
			
			ix = inext;
			if (ix != ic) ++ix;
		}
		ix = ++isc;
	}

	// read derived attributes
	if (key_DERIVE(*ix)){
		++ix;
		while (not (ix == iend or  key_UNIQUE(*ix) or key_INVERSE(*ix) or key_WHERE(*ix))){
			TokenIterator isc = find_next_semicolon(ix,iend);
			TokenIterator ic = find_next_colon(ix,isc);
			auto_ptr<attribute> dval = read_derived_attribute(ix,ic);
			retVal->attributes.push_back( shared_ptr<attribute>(dval) );
			ix = ++isc;
		}
	}
	}	// end of enclosing try block
	catch(eos&){
		throw UnexpectedEndOfEntity((**istart).start(),(**TokenIterator(iend)).stop());}
	return auto_ptr<item_base>(retVal);
};

class derived_attribute: public attribute_base{
	public:
	void respond_to_visitor(attribute_visitor& x) const{
		x.handle_derived_attribute(*name_ptr);}
};


auto_ptr<attribute> read_derived_attribute(TokenIterator ix, const TokenIterator& iend){
	auto_ptr<derived_attribute> retVal(new derived_attribute);
	retVal->name_ptr = read_attribute_name(ix,iend);
	return auto_ptr<attribute>(retVal);
}

#pragma mark TypeParsing
class select_type:public item_base{
	public:
	vector<string> selectNames;
	void respond_to_visitor(item_visitor& x) const{
		x.handle_select_type(name, selectNames);}
};

class enumeration_type:public item_base{
	public:
	vector<string> enumerationValues;
	void respond_to_visitor(item_visitor& x) const{
		x.handle_enumeration_type(name, enumerationValues);}
};

class alias_type: public item_base{
	public:
	auto_ptr<attribute_type> aliased_type;
	void respond_to_visitor(item_visitor& x) const{
		x.handle_alias_type(name, *aliased_type);}
};

auto_ptr<item_base> read_type(TokenIterator ix,const TokenIterator& iend){
	auto_ptr<item_base> retVal;
	TokenIterator itype(ix);
  try{
	advance;
	TokenIterator iname(ix);
	advance;
	if (not is_equal_sign(*ix))
		throw ExpectingEquals( (**ix).start()  );
	advance;

	TokenIterator isc = find_next_semicolon(ix,iend);

	if (key_SELECT(*ix)){
		auto_ptr<select_type> tmpVal(new select_type);
		advance;
    
    pair<bool, TokenRange> res = matching_parentheses(ix,isc);
		
		if (not res.first){
			throw ExpectingParentheses( (**ix).start() );
		}
    TokenRange& select_name_range = res.second;
    
		read_list_of_names(select_name_range.begin(), select_name_range.end(), tmpVal->selectNames);
		// modify the list of names the SELECT selects from
		modify_case(tmpVal-> selectNames);
		retVal = tmpVal;
	}
	else if (key_ENUMERATION(*ix)){
		advance;
		if (not key_OF(*ix))
			throw ExpectingKeyword("",(**ix).start(),(**isc).stop());
		advance;

		auto_ptr<enumeration_type> tmpVal(new enumeration_type);
    pair<bool, TokenRange> res = matching_parentheses(ix,isc);
		if (not res.first) throw ExpectingParentheses( (**ix).start() );
    TokenRange& enum_name_range = res.second;
		read_list_of_names(enum_name_range.begin(), enum_name_range.end(), tmpVal->enumerationValues);
		// change the case of the values of the enumeration
		modify_case(tmpVal->enumerationValues);

		retVal = tmpVal;
	}
	else{
		auto_ptr<alias_type> tmpVal(new alias_type);
		tmpVal->aliased_type = read_attribute_type(ix,isc);
		retVal = tmpVal;
	}

	}catch(eos&){
		throw UnexpectedEndOfType((**itype).start(),(**TokenIterator(iend)).stop());}

	return auto_ptr<item_base>(retVal);
};


#pragma mark attribute_type classes
class _chain:public attribute_type{
	public:
	auto_ptr<unsigned int> width_ptr;
	bool fixed_length;
};

class _binary:public _chain{
	public:
	void respond_to_visitor(attribute_type_visitor& x) const{
		if (width_ptr.get() == NULL)
			x.handle_binary(fixed_length);
		else
			x.handle_binary(fixed_length, *width_ptr);
		return;
	}

};

class _string:public _chain{
	public:
	void respond_to_visitor(attribute_type_visitor& x) const{
		if (width_ptr.get() == NULL)
			x.handle_string(fixed_length);
		else
			x.handle_string(fixed_length, *width_ptr);
		return;
	}
};


class _boolean:public attribute_type{
	public:
	void respond_to_visitor(attribute_type_visitor& x) const{
		x.handle_boolean();return;
	}
};

class _integer:public attribute_type{
	public:
	void respond_to_visitor(attribute_type_visitor& x) const{
		x.handle_integer();}
};


class _logical:public attribute_type{
	public:
	void respond_to_visitor(attribute_type_visitor& x) const{
		x.handle_logical();}
};

class _number:public attribute_type{
	public:
	void respond_to_visitor(attribute_type_visitor& x) const{
		x.handle_number();}

};

class _real:public attribute_type{
	public:
	auto_ptr<unsigned int> precision;
	void respond_to_visitor(attribute_type_visitor& x) const{
		x.handle_real();}
};

class _collection:public attribute_type{
	public:
	auto_ptr<attribute_type> contained_type;
	auto_ptr<bound_specification> bounds;
	void respond_to_visitor(attribute_type_visitor& x) const{
		x.handle_collection(*contained_type, *bounds);}
};

class _array:public _collection{
	public:
	bool optional;
	bool unique;
	void respond_to_visitor(attribute_type_visitor& x) const{
		x.handle_array(*contained_type, *bounds, optional);}

};

class _bag:public _collection{
}	;

class _list:public _collection{
	public:
	bool unique;
};

class _set:public _collection{
};

class _named:public attribute_type{
	public:
	string name;
	void respond_to_visitor(attribute_type_visitor& x) const{
		x.handle_named(name);}
};

#pragma mark attribute_type parsing
class bound_specification_none: public bound_specification{
	public:
	void respond_to_visitor(bound_specification_visitor& x) const{
		x.handle_no_bounds();}
};

auto_ptr<bound_specification> read_bound_spec_tokens(TokenIterator ix, const TokenIterator& iend);


auto_ptr<attribute_type>
read_attribute_type(TokenIterator ix,const TokenIterator& iend){
	auto_ptr<attribute_type> retVal;

	if (key_STRING(*ix) || key_BINARY(*ix)){
		auto_ptr<_chain> tmpVal;
		if (key_STRING(*ix))
			tmpVal.reset(new _string);
		else
			tmpVal.reset(new _binary);

		tmpVal->width_ptr.reset(NULL);
		tmpVal->fixed_length = false;
		++ix;
    pair<bool, TokenRange> res = matching_parentheses(ix,iend);
		if (ix != iend and res.first){
      TokenRange& widthRange = res.second;
			TokenIterator iw(widthRange.begin());
      pair<bool, long> res = is_an_integer(*iw);
			if (res.first){
				tmpVal->width_ptr.reset(new unsigned int);
				*(tmpVal->width_ptr) = res.second;
				ix = widthRange.end();
				advance;
				if (key_FIXED(*ix)){
					tmpVal->fixed_length = true;
					advance;
				}
			}
		}
		retVal = tmpVal;
	}	// end STRING or BINARY

	else if (key_LOGICAL(*ix))
		retVal.reset(new _logical);

	else if (key_BOOLEAN(*ix))
		retVal.reset(new _boolean);


	else if (key_INTEGER(*ix))
		retVal.reset(new _integer);

	else if (key_NUMBER(*ix))
		retVal.reset(new _number);

	else if (key_REAL(*ix)){
		auto_ptr<_real> tmpVal(new _real);
		++ix;
    pair<bool, TokenRange> res=matching_parentheses(ix,iend);
		if (ix != iend and res.first){
      TokenRange& precision_range=res.second;
      
			TokenIterator iz = precision_range.begin();
      pair<bool, long> res = is_an_integer(*iz);
			if (res.first){
				(tmpVal -> precision).reset(new (unsigned int));
				*(tmpVal->precision) = res.second;
			}
			else{
				throw ExpectingNumber((**(precision_range.begin())).start(), (**(precision_range.end())).stop());
			}}
		retVal = tmpVal;
	}	// end of parsing REAL

	else if (key_LIST(*ix) || key_BAG(*ix) || key_SET(*ix) || key_ARRAY(*ix)){
		TokenIterator icollection = ix;
		auto_ptr<bound_specification> temp_bound_spec;
		advance;
    pair<bool, TokenRange> res = matching_square_brackets(ix,iend);
		if (res.first){
      TokenRange& bound_spec_range = res.second;
			temp_bound_spec = read_bound_spec_tokens(bound_spec_range.begin(), bound_spec_range.end());
			ix = bound_spec_range.end();
			advance;
		}
		else{
			temp_bound_spec.reset(new bound_specification_none);
			if (key_ARRAY(*icollection))
			  throw ExpectingBoundsSpecifier((**icollection).start(),(**icollection).stop());}

		if (not key_OF(*ix))
			throw ExpectingKeyword(key_OF.key(),(**ix).start(),(**ix).stop());
		advance;

		auto_ptr<_collection> tmpVal;
		if (key_ARRAY(*icollection)){
			auto_ptr<_array> tmpVal2(new _array);
			tmpVal2->optional = false;
			tmpVal2->unique = false;
			if (key_OPTIONAL(*ix)){
				tmpVal2->optional = true;
				advance;
			}
			if (key_UNIQUE(*ix)){
				tmpVal2->unique = true;
				advance;
			}
			tmpVal = tmpVal2;
		}
		else if (key_BAG(*icollection))
			tmpVal.reset(new _bag);
		else if (key_LIST(*icollection)){
			auto_ptr<_list> tmpVal2(new _list);
			tmpVal2->unique = false;
			if (key_UNIQUE(*ix)){
				tmpVal2->unique = true;
				advance;
			}
			tmpVal = tmpVal2;
		}
		else if (key_SET(*icollection))
			tmpVal.reset(new _set);

		tmpVal->bounds = temp_bound_spec;
		tmpVal -> contained_type = read_attribute_type(ix,iend);
		retVal = tmpVal;
	}
	else{
		auto_ptr<_named> tmp(new _named);
		pair<bool, string> tmp2 = is_a_word(*ix);
		if (not tmp2.first)
			throw ExpectingName((**ix).start(), (**ix).stop());
		tmp->name = tmp2.second;
		modify_case(tmp->name);
		retVal = tmp;
	}
	return auto_ptr<attribute_type>(retVal);
}


class lower_bound_specification:public bound_specification{
	public:
	unsigned int lower_bound;
	virtual void respond_to_visitor(bound_specification_visitor& x) const{
		x.handle_lower(lower_bound);}
};

class lower_and_upper_bound_specification:public lower_bound_specification{
	public:
	unsigned int upper_bound;
	virtual void respond_to_visitor(bound_specification_visitor& x) const{
		x.handle_lower_and_upper(lower_bound, upper_bound);}
};

auto_ptr<bound_specification>
read_bound_spec_tokens(TokenIterator ix, const TokenIterator& iend){
	auto_ptr<lower_bound_specification> retVal;

	TokenIterator ilowx(ix);
	try{
	advance;
	if (not is_a_colon(*ix))
		throw BoundsSpecifierError( (**ix).start(), (**TokenIterator(iend)).stop());
	advance;
	TokenIterator iuppx(ix);

	pair<bool, long> res = is_an_integer(*iuppx);
	if (res.first){
		auto_ptr<lower_and_upper_bound_specification> dummyVal(new lower_and_upper_bound_specification);
		dummyVal->upper_bound = res.second;
		retVal=dummyVal;
	}
	else{
		retVal.reset(new lower_bound_specification);
	}

  pair<bool, long> res2 = is_an_integer(*ilowx);
	if (res2.first)
		retVal -> lower_bound = res2.second;
	else
		throw BoundsSpecifierError( (**ilowx).start(), (**TokenIterator(iend)).stop());
	} catch(eos&){
		throw BoundsSpecifierError( (**ilowx).start(), (**TokenIterator(iend)).stop());}

	return auto_ptr<bound_specification>(retVal);
}


void
read_list_of_names(TokenIterator ix, const TokenIterator& iend, vector<string>& retVal){
	// should be pointing at first word of comma separated list
  pair<bool, vector<TokenRange> > res = split_comma_delimited_list(	ix,iend);
  vector<TokenRange>& each_name_range = res.second;
  
	vector<TokenRange>::iterator jx(each_name_range.begin());
	vector<TokenRange>::iterator jend(each_name_range.end());
	for (; jx != jend; ++jx){
		TokenIterator kx((*jx).begin());
		TokenIterator kend((*jx).end());
		pair<bool,string> tmp = is_a_word(*kx);
		if (not tmp.first) throw ExpectingName( (**kx).start(),(**kx).stop());
		retVal.push_back(tmp.second);
		++kx;
		if (kx != kend)
			throw ExpectingCommaOrEnd((**kx).start() );
	}
}

TokenIterator
find_next_semicolon(TokenIterator ix, const TokenIterator& iend){
	while (not is_a_semicolon(*ix))
		advance;
	return ix;
}

TokenIterator
find_next_colon(TokenIterator ix, const TokenIterator& iend){
	while (not is_a_colon(*ix))
		advance;
	return ix;
}


} // close SchemaReading
}	// close KShellSTEP
