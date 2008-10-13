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
declares functions for first-pass parsing of an EXPRESS schema file (EXPRESS entities and types are read, but
internal name references not resolved)

History:
26 Nov 2004: created for use in SchemaReading

Documentation:
*/
#pragma once

#include "CharTokenList.h"
#include "visited_by.h"

#include <boost/shared_ptr.hpp>

namespace KShellSTEP{
namespace SchemaReading{


#pragma mark bound_specification

class bound_specification_visitor{
	public:
	virtual ~bound_specification_visitor(){};

	virtual void handle_no_bounds(){return;}
	virtual void handle_lower(unsigned int){this->handle_no_bounds();return;}
	virtual void handle_lower_and_upper(unsigned int lower, unsigned int){this->handle_lower(lower);return;}
};

typedef visited_by<bound_specification_visitor> bound_specification;

class attribute_name_visitor{
	public:
	virtual ~attribute_name_visitor(){};
	virtual void handle_simple_name(const string&){return;}
	virtual void handle_specified_name(const string& nm, const string&){this->handle_simple_name(nm);}
};

typedef visited_by<attribute_name_visitor> attribute_name;


#pragma mark attribute_type



class attribute_type_visitor{
	public:
	virtual ~attribute_type_visitor(){};
	virtual void handle_attribute_type()									{return;}
	virtual void handle_named(const string&)							{this->handle_attribute_type();return;}
	virtual void handle_collection(const visited_by<attribute_type_visitor>&, const bound_specification&){this->handle_attribute_type();return;}
	virtual void handle_array(const visited_by<attribute_type_visitor>& containedType, const bound_specification& bs, bool /*optional_elements*/)
		{this->handle_collection(containedType,bs);return;}
	virtual void handle_simple()													{this->handle_attribute_type();return;}

	virtual void handle_boolean(){this->handle_simple();return;}

	virtual void handle_integer(){this->handle_simple();return;}

	virtual void handle_string(bool)				{this->handle_simple();return;}
	virtual void handle_string(bool f,int)	{this->handle_string(f);return;}

	virtual void handle_binary(bool)				{this->handle_simple();return;}
	virtual void handle_binary(bool f,int)	{this->handle_string(f);return;}

	virtual void handle_logical(){this->handle_simple();return;}

	virtual void handle_number(){this->handle_simple();return;}

	virtual void handle_real(){this->handle_simple();return;}
};

typedef visited_by<attribute_type_visitor> attribute_type;

#pragma mark attribute

class attribute_visitor{
	public:
	virtual ~attribute_visitor(){};
	virtual void handle_attribute(const attribute_name&)	{return;}
	virtual void handle_explicit_attribute(const attribute_name& nm, bool, const attribute_type&){this->handle_attribute(nm);return;}
	virtual void handle_derived_attribute(const attribute_name& nm){this->handle_attribute(nm);return;}
};

typedef visited_by<attribute_visitor> attribute;
typedef vector< boost::shared_ptr<attribute> > attributeList;


#pragma mark item

class item_visitor{
	public:
	virtual ~item_visitor(){};
	virtual void handle_item(const string& /* name */){return;}
	virtual void handle_entity(const string& name,const vector<string>&, const attributeList&) {this->handle_item(name);return;}

	virtual void handle_type(const string& name){this->handle_item(name);return;}
	virtual void handle_select_type(const string& name,const vector<string>&)				{this->handle_type(name); return;}
	virtual void handle_enumeration_type(const string& name,const vector<string>&)	{this->handle_type(name); return;}
	virtual void handle_alias_type(const string& name,const attribute_type&)				{this->handle_type(name); return;}
};

typedef visited_by<item_visitor> item;
typedef vector< boost::shared_ptr<item> > itemList;


std::pair<string, itemList>
read_schema(TokenIterator&, const TokenIterator&);

}	// close SchemaReading
}	// close KShellSTEP


