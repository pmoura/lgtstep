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
Declare exceptions used by KShellSTEP code
History:
9 Nov 2004: used as a functional include file in Token Parsing subproject

Documentation:
Version of 9 Nov 2004 only includes character_parse_error exceptions
_
It is necessary to use factory creators to make the complex exceptions, those that record
the positions of errors, because of the way that the standard exceptions from which these are
derived protect themselves with const declarations; it is very awkward to have an exception
generate its own error message after it is constructed.

*/

#pragma once
#include <stdexcept>
#include "TextSource.h"

#include "visited_by.h"


namespace KShellSTEP{


class KShellexcept: public std::logic_error{	// use logic_error to have access to
																							// what_arg initializatin
	public:
	~KShellexcept() throw(){};
	KShellexcept():logic_error("KShell exception"){};
	KShellexcept(const char * c):logic_error(c){};
	KShellexcept(const string& arg):logic_error(arg){};
 };

class SchemaNotKnown: public KShellexcept{
	protected:
	const string schema_id_name;
	string _what_message;

	public:
	SchemaNotKnown(const string& a);
	~SchemaNotKnown() throw(){};
	const char* name(){return schema_id_name.c_str();}
	const char* what() const throw();
};

class ISOKeyNotFound: public KShellexcept{
	public:
	ISOKeyNotFound():KShellexcept("ISO-10303-21 keyword not found at start of file"){};
	~ISOKeyNotFound() throw(){};
};

class ErrorPositionVisitor{
	public:
	virtual void position(const TextSource::PositionType&){return;}
	virtual void position_range(const TextSource::PositionType&,const TextSource::PositionType&){return;}
	virtual void position_to_end(const TextSource::PositionType&){return;}
	virtual void at_end(){return;}
};


class FileException:public KShellexcept, public visited_by<ErrorPositionVisitor>{
	protected:
	string _error_message;
	string _what_message;
	void set_what_message();

	public:
	FileException():KShellexcept(){};
	FileException(const string& a):_error_message(a),KShellexcept(a){};
	~FileException() throw(){};
	const char* what() const throw();
	const char* error_message() const{ return _error_message.c_str();}
};

}



