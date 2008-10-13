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
declares a function ucs4_to_prolog which converts a vector of char, interpreted as a UCS-4 encoding of
unicode text, into a clear text encoding as used by SWI-Prolog for strings

History:
27 Mar 2007: created

Documentation:
*/

#include <string>
#include "IConvClass.h"

using std::string;

namespace KShellSTEP{
class EncodingToProlog{
    private:
    IConv utf8_to_ucs4;
    
    public:
    EncodingToProlog();
    string operator()(const char *);
    string operator()(const string& a){return operator()(a.c_str());}
};
}



std::string
ucs4_to_prolog(const std::vector<char>&);
