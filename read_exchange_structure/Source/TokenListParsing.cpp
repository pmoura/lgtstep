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
implements commong tasks in parsing TokenLists

History:
17 Nov 2004: created, not yet verified in a working project

Documentation:

*/

#include "TokenListParsing.h"
#include "KShellexcept.h"
#include "BasicTokenTests.h"

#include "KShellexceptImpl.h"

namespace KShellSTEP{

std::pair<bool, TokenRange>
matching_parentheses(TokenIterator ix, const TokenIterator& iend){
  if (not is_left_parenthesis(*ix))
    return pair<bool, TokenRange>(false, TokenRange(TokenIterator(), TokenIterator()));

  TokenIterator i0(ix);	// save the start location
  ++ix;
  TokenIterator ibegin = ix;
  int NLevel(0);

  while (true){
    if (ix == iend)
      throw UnbalancedParentheses( (**i0).start());

    if (is_left_parenthesis(*ix))
      NLevel++;
    else if (is_right_parenthesis(*ix)){
      if (NLevel == 0)
        break;
      else
        NLevel--;
    }
    ++ix;
  }
  return pair<bool, TokenRange>(true,TokenRange(ibegin,ix));
}

std::pair<bool, TokenRange>
matching_square_brackets(TokenIterator ix, const TokenIterator& iend){
  if (not is_left_square_bracket(*ix))
    return pair<bool, TokenRange>(false, TokenRange(TokenIterator(), TokenIterator()));

  TokenIterator i0(ix);	// save the start location
  ++ix;
  TokenIterator ibegin = ix;

	while (not is_right_square_bracket(*ix)){
		pair<bool, TokenRange> tmpVal = matching_parentheses(ix,iend);
		if (tmpVal.first)
			ix = tmpVal.second.end();
		++ix;
		if (ix == iend)
      throw UnbalancedParentheses( (**i0).start());
	}
	return pair<bool, TokenRange>(true, TokenRange(ibegin,ix));
}


pair< bool, std::vector<TokenRange> >
split_comma_delimited_list(	TokenIterator ix, const TokenIterator& iend){
  pair< bool, vector<TokenRange> > retVal(true, vector<TokenRange>());
	if (ix != iend){
  	while(true){
      TokenIterator ib(ix);	// start of a range

      while (not (ix == iend or is_a_comma(*ix))){
        pair<bool, TokenRange> skipover = matching_parentheses(ix,iend);
        if (skipover.first) ix = skipover.second.end();
        ++ix;
      }

      retVal.second.push_back(TokenRange(ib,ix));
      if (ix == iend)
        break;
      ++ix;	// advance past the comma
    }
  }
  return retVal;
}
}	// close namespace
