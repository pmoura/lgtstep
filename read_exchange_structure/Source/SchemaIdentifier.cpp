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
implements the classe which represent schema names or objects ID, also the parsing function
which creates such a representation from a string.

History:
26 May 2005: created

Documentation:

*/

#include "SchemaIdentifier.h"

#include "boost/regex.hpp"
#include <cctype>

namespace KShellSTEP{
namespace EXPRESS{


class _schema_name:public SchemaIdentifierVisitor{
	public:
	string result;
	void handle_name(const string& name){result = name;}
};

string
schema_name(const SchemaIdentifier& x){
	_schema_name tmp;
	x.respond_to_visitor(tmp);
	return tmp.result;
}

class _SchemaIDMatcher:public SchemaIdentifierVisitor{
	public:
	bool result;
	void handle_name		(const string&){result = false;}
	void handle_objectID(const string& ,unsigned int,unsigned int){result = false;}
};

class _stringIDMatcher:public _SchemaIDMatcher{
	private:
	const string& myName;
	public:
	_stringIDMatcher(const string& a):myName(a){};
	void handle_name		(const string& nm){result = (myName == nm);}
};



class stringIdentifier:public SchemaIdentifier{
	private:
	const string name;
	public:
	stringIdentifier(const string& a):name(a){};

	auto_ptr<SchemaIdentifier> clone() const{
		return auto_ptr<SchemaIdentifier>(new stringIdentifier(name));
	}

	bool	matches(const SchemaIdentifier& sid) const{
		_stringIDMatcher tmp(name);
		sid.respond_to_visitor(tmp);
		return tmp.result;
	}
	
	string
	label() const{return name;}
	void respond_to_visitor(SchemaIdentifierVisitor& x) const {
		x.handle_name(name);}
};


auto_ptr<SchemaIdentifier>
SchemaIdentifier::make(const string& sid){
	auto_ptr<SchemaIdentifier> retVal;
	while (true){
		boost::regex simple_name("\\s*(\\w+)\\s*(\\{[a-z0-9 ]*\\})?");
		boost::smatch simple_name_result;

		if (boost::regex_match(sid.begin(), sid.end(), simple_name_result, simple_name)){
			string theName( simple_name_result.str(1));
			string::iterator ic = theName.begin();
			for (; ic != theName.end(); ++ic)  *ic = std::toupper(*ic);
			retVal.reset( new stringIdentifier(theName));
			break;
		}

		string msg("cannot interpret schema identifier [");
		msg += sid;
		msg += "]";
		throw SchemaIdentifierError(msg);
	}
	return retVal;
}

}
}
