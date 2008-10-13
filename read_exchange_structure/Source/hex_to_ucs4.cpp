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
Implements a function hex_to_ucs4, which converts an input string of hex characters (0-9,A-F) to
a vector of bytes interpretable as a UCS-4 encoding

History:
27 Mar 2007: created

Documentation:
*/


#include "hex_to_ucs4.h"

#include <stdexcept>

using std::string;
using std::vector;


std::auto_ptr< vector<char> >
hex_to_ucs4(const string& hex, int nb){
	if (nb != 1 and nb !=2 and nb != 4)
		throw std::logic_error("invalid size value to hex_to_ucs4");
	
	if (hex.size() % (2*nb) )
		throw std::logic_error("invalid size");
		
	size_t  retValSize( 2 * hex.size() / nb );
	std::auto_ptr< vector<char> > retVal(
		new vector<char>( retValSize, '\0')
	);
	
	size_t ctr( retValSize / 4);
	int hex_ix(0);
	int rv_ix(0);
	for (; ctr; ctr--){
		int j(nb);
		rv_ix += (4-nb);
		for (; j; j--){
			char c('\0');
			for (int k=1; k>=0;k--){
				char h( hex[hex_ix++] );
				if (h >= '0' and h <= '9') h = h-'0';
				else if (h >= 'A' and h <= 'F') h = h-'A'+10;
				else throw std::logic_error("invalid hex character");
				c = c | (h << (4*k));
			}
			(*retVal)[rv_ix++] = c;
		}
	}
	return retVal;
}
