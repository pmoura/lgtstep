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
declares commong tasks in parsing TokenLists; declares the TokenRange class

History:
17 Nov 2004: created, not yet verified in a working project

Documentation:
general form of functions is
bool func(TokenIterator, const TokenIterator&, returnBucket&)
Note that the first TokenIterator (the "index") is passed by value,
the second (end of list marker) is passed as an immutable reference

*/
#pragma once

#include "CharToken.h"
#include "CharTokenList.h"


namespace KShellSTEP{



pair< bool,vector<TokenRange> >
split_comma_delimited_list(	TokenIterator, const TokenIterator&);


// following function returns true if the input ix token is a left parenthesis;
// and if it is the TokenRange argument is set to the beginning following the left
// parenthesis and the end token is on the right parenthesis. If the left parenthesis is
// found but not the right; an end-of-file exception is thrown
pair<bool, TokenRange>
matching_parentheses(TokenIterator ix, const TokenIterator&);

pair<bool, TokenRange>
matching_square_brackets(TokenIterator ix, const TokenIterator&);

}	// close namespace







