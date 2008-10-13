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
implements a function ucs4_to_prolog which converts a vector of char, interpreted as a UCS-4 encoding of
unicode text, into a clear text encoding as used by SWI-Prolog for strings

History:
27 Mar 2007: created

Documentation:
*/

#include "EncodingToProlog.h"
#include "ASCII_codes.h"

#include <stdexcept>
#include <vector>
using std::vector;
using std::auto_ptr;

namespace KShellSTEP{
EncodingToProlog::EncodingToProlog():utf8_to_ucs4("UCS-4","UTF-8"){};

string
EncodingToProlog::operator()(const char* s){
	// convert the UTF-8 form of the string to UCS-4; then
	// apply escape sequences to "special characters, i.e. backslash and quote, then
	// apply prolog escape sequence mapping to unprintable characters
	size_t nsize(std::strlen(s));
	vector<char> coding_utf8( nsize, '\0');
	std::copy(s, s+nsize, coding_utf8.begin());
	auto_ptr< vector<char> > coding_ucs4p = utf8_to_ucs4( coding_utf8 );
	vector<char>& coding_ucs4 = *coding_ucs4p;
	
	// step through the UCS-4 encoding (notes 4 bytes/character) and
	// insert a backslash (4 character backslash) before any backslash or quotation mark
	int nx(0);
	while (nx < coding_ucs4.size()){
	    bool clear_char(true);
	    for (int kx = 0; kx < 3; kx++)
	        if (coding_ucs4[nx+kx]){
	            clear_char=false;
	            break;
	         }

	    char c=coding_ucs4[nx+3];
	    if (clear_char and (c==QuoteMark or c==BackSlash)){
	        char * buf = "\0\0\0\\";
	        coding_ucs4.insert(coding_ucs4.begin() + nx, buf, buf+4);
	        nx += 4;
	    }
	    nx += 4;
    }
	
	// now step through the UCS-4 encoding and convert non-printable
	// characters to the special prolog (particularly SWI-Prolog) escape sequences
	string retVal(1,'\x22');            // double quotes
	int ctr(coding_ucs4.size() / 4);
	int ix(0);
	for(; ctr; ctr--){
	    int k(4);
		char id('U');
		if (coding_ucs4[ix] == 0 and coding_ucs4[ix+1] == 0){
			if (coding_ucs4[ix+2] == 0){
                char c(coding_ucs4[ix+3]);
				if (c>='\x20' and c<='\x7E'){
					retVal.push_back(c);
					ix += 4;
					continue;
				}			
		    }
            id='u'; k = 2;
        }

		retVal.push_back('\\');
		retVal.push_back(id);
		ix += (4-k);
        for (; k; k--){
            char d(coding_ucs4[ix++]);
            for (int h=1; h>=0;h--){
                char dd = (d >> (4*h)) & 0x0F;
                if (dd < 0xA) dd = '0'+dd;
                else dd='A'- 0xA + dd;
                retVal.push_back(dd);
            }
        }
	}
	retVal.push_back('\x22');
	return retVal;
}
}
