/*
Copyright (C) 2007  Vincent Marchetti

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

Purpose:
declares IConv, a C++ wrapper class for the iconv family of C functions, which allow for converting
among encodings of unicode strings.

History:
27 Mar 2007: created

Documentation:
*/

#include <iconv.h>

#include <vector>
#include <stdexcept>
#include <memory>

namespace KShellSTEP{
class iconv_error:public std::logic_error{
	private:
	std::string error_msg;
	
	public:
	const int error_code;
	const int input_offset;
	
	iconv_error(int _errno, int _input_offset);
	~iconv_error() throw(){};
	const char * what() const throw(){return error_msg.c_str();}
};


class IConv{
	protected:
	iconv_t iconv_id;
	
	public:
	IConv(const char * to_enc, const char * from_enc);
	~IConv();
	
	std::auto_ptr< std::vector<char> > 
	operator()(const std::vector<char>& inp);
};
}
