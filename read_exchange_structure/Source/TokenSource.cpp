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
Implement the TokenSource function

History:
9 Nov 2004: used as a functional compilable file in Token Parsing subproject

Documentation:

*/


#include "TokenSource.h"

#include <cstdio>
#include <cctype>
#include "ASCII_codes.h"
#include "KShellexceptImpl.h"

namespace KShellSTEP{

TokenSource::TokenSource(TextSource& src):
	itsSource(src){
		currentState.eos = !itsSource.getOne(currentState.value);
		currentState.position = itsSource.getPosition();

		if (!currentState.eos){
			nextState.eos = !itsSource.getOne(nextState.value);
			nextState.position = itsSource.getPosition();
		}
}

void
TokenSource::advance(){
	currentState = nextState;
	nextState.eos = !itsSource.getOne(nextState.value);
	nextState.position = itsSource.getPosition();
};


bool
TokenSource::getOne(CharToken& rv){
	auto_ptr<CharTokenImpl> x = ParseCharacters();
	if (x.get() == NULL)
		return false;

	rv = CharToken(x.release());
	return true;
}

auto_ptr<CharTokenImpl>
TokenSource::ParseCharacters(){
	skip_white_space();
	auto_ptr<CharTokenImpl> retVal;

	while (not currentEOS()){
		if (read_delimiter_token(retVal)) break;
		if (read_literal_token(retVal))	break;
		if (read_word_token(retVal))	break;
		throw UnknownCharacter(currentChar(),currentPosition());
	}

	return retVal;
}

bool
TokenSource::isEndOfLine(const char& c){
	return (c==Newline or c==Return);
}
}	// close namespace
