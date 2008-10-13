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
Decalre the function which parses an exchange structure (Part 21) header

History:
26 May 2005: created

Documentation:
The TokenIterator arguments are passed by reference, and will be modified (incremented)
in parsing. After reading the header the first argument will be pointing past the semicolon
following the ENDSEC keyword.
*/

#include "CharTokenList.h"

#include "Header.h"

namespace KShellSTEP{
namespace Part21{
auto_ptr<Header> read_header(TokenIterator&, const TokenIterator&);
}
}
