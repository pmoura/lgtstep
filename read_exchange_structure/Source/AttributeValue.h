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
A visited_by/visitor pattern which represents an AttributeValue from a Part21 exchange structure

History: 
31 Mar 2005: created for use in AttributeValueReading

Documentation: 
*/
#pragma once
#include "visited_by.h"

#include "Schema.h"
#include "InstanceID.h"

namespace KShellSTEP{
namespace Part21{

#define AttributeValueProxy visited_by<AttributeValueVisitor>
class AttributeValueVisitor{
	public:
	virtual ~AttributeValueVisitor(){};
	virtual void handle_string(const char*) = 0;
	virtual void handle_integer(long) = 0;
	virtual void handle_boolean(bool) = 0;
	virtual void handle_logical(const EXPRESS::Logical&) = 0;
	virtual void handle_real(double) = 0;
	virtual void handle_enumeration(const EXPRESS::Enumeration::const_iterator&) = 0;
	virtual void handle_binary(const bool*, const bool*) = 0;
	
	virtual void handle_collection(AttributeValueProxy **, AttributeValueProxy **) = 0;
	
	virtual void handle_instance(const InstanceID&) = 0;
	
	virtual void handle_omitted() = 0;
	
	virtual void handle_aliased(const char *, AttributeValueProxy * v){
		v->respond_to_visitor(*this);}
};

typedef AttributeValueProxy AttributeValue;
#undef AttributeValueProxy

} //close Part21
} // close KShellSTEP
