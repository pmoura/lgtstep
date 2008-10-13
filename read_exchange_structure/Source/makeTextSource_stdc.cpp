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
Define "factory functions" (as defined in TextSource.h) for generating TextSource
(via the concrete BufferTextSource class) as read from files, using UNIX file access conventions

History:
7 Feb 2005: Used


*/
#include "TextSource.h"
#include <cstdlib>
#include <cstdio>
#include "BufferTextSource.h"
//#include "eof.h"


namespace KShellSTEP{

#define maxBufferSize 0x2000000

auto_ptr<TextSource>
makeStdinTextSource(){
	auto_buffer buf(new char[maxBufferSize]);
	char * p(buf.get());
	size_t n(0);

	while (true){
		if (n == maxBufferSize)
			throw std::domain_error("buffer size exceeded");

		int _x = fgetc(stdin);
		if (_x == EOF)	break;
		*p++ = (char) _x;
		++n;
	}

	return auto_ptr<TextSource>(new BufferTextSource(buf,n));
}

class auto_file{
	std::FILE * _p;
	public:
	auto_file(std::FILE * f):_p(f){};
	~auto_file(){std::fclose(_p);}
};


auto_ptr<TextSource>
makeFileTextSource(const char * path){
	std::FILE * infile = std::fopen(path, "r");
	if (infile == 0)
		throw std::domain_error("makeFileTextSource::Failed to open file");

	auto_file _tmp(infile);

	auto_buffer buf(new char[maxBufferSize]);
	char * p(buf.get());
	size_t n(0);

	while (true){
		if (n == maxBufferSize)
			throw std::domain_error("buffer size exceeded");

		int _x = fgetc(infile);
		if (_x == EOF)	break;
		*p++ = (char) _x;
		++n;
	}

	return auto_ptr<TextSource>(new BufferTextSource(buf,n));
}

}	// close namespace
