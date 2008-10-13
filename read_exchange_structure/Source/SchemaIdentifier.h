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
Defines an identifier for a schema, that can be either a name or a complete object identifier
as defined in clause 3 of ISO 10303-1 and ISO 8824-1; uses the visited_by template pattern

History:
26 May 2005: created

Documentation:

*/
#pragma once
#include "visited_by.h"

namespace KShellSTEP{ namespace EXPRESS{
class SchemaIdentifierVisitor{
	public:
	virtual ~SchemaIdentifierVisitor(){};
	virtual void handle_name(const string& name) = 0;
	virtual void handle_objectID(	const string& name,
																unsigned int /*part*/,
																unsigned int /*version*/){
		handle_name(name);}
};

class SchemaIdentifierError:public logic_error{
	public:
	SchemaIdentifierError(const string& c):logic_error(c){}
};

class SchemaIdentifier:public visited_by<SchemaIdentifierVisitor>{
	public:
	static auto_ptr<SchemaIdentifier> make(const string&);
	virtual bool    										matches(const SchemaIdentifier&) const=0;
	virtual string label() const = 0;
};

}}
