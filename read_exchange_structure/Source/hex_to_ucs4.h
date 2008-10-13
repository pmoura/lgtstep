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
Declares a function hex_to_ucs4, which converts an input string of hex characters (0-9,A-F) to
a vector of bytes interpretable as a UCS-4 encoding

History:
27 Mar 2007: created

Documentation:
*/
#include <string>
#include <memory>
#include <vector>


std::auto_ptr< std::vector<char> >
hex_to_ucs4(const std::string&, int);
