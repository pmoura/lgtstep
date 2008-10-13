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
Implement the KShellexcept exceptions, including the factory functions which make them.

History:
9 Nov 2004: used as a functional compilable file in Token Parsing subproject

Documentation:

*/
#include "KShellexcept.h"
#include <cstdio>
#include "boost/format.hpp"

namespace KShellSTEP{

class ErrorPositionString: public ErrorPositionVisitor{
	public:
	string result;

	void position(const TextSource::PositionType& n){
		boost::format f("character position %i");
		result = str(f % n);
	}
	void position_range(const TextSource::PositionType& n1,const TextSource::PositionType& n2){
		boost::format f("character range %i to %i");
		result = str(f % n1 % n2);
	}
	void position_to_end(const TextSource::PositionType& n){
		boost::format f("character position %i to end");
		result = str(f % n);
	}
	virtual void at_end(){
		result = string("at end of file");
	}
};

const char *
FileException::what() const throw(){
	return _what_message.c_str();
}

const char *
SchemaNotKnown::what() const throw(){
	return _what_message.c_str();
}

void
FileException::set_what_message(){
	ErrorPositionString err_pos_string;
	respond_to_visitor(err_pos_string);
	boost::format f("%s : %s");
	_what_message = str(f % _error_message % err_pos_string.result);
};


}
