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
Declare the abstact TokenSource class, which provides tokens one by one, and also their positions
in the underlying TextSource

History:
9 Nov 2004: used as a functional include file in Token Parsing subproject

Documentation:
This class is an abstract superclass for classes that parse character streams into CharTokens.
This class provides following utility for such parsers:
1. An interface to the TextInputSource that provides look - ahead ability.
2. Handling the creation of CharTokenImpl ementations, providing exception-safety

*/

#pragma once

#include "CharToken.h"

#include "TextSource.h"	// defines InputSource as well
#include "KShellexcept.h"


namespace KShellSTEP{

class TokenSource:public InputSource<CharToken>{
	public:
	TokenSource(TextSource&);

	virtual bool getOne(CharToken&);

	private:
	TextSource& itsSource;

	struct SourceState{
		char	value;
		bool	eos;
		TextSource::PositionType position;
	};

	SourceState currentState;
	SourceState nextState;

	protected:
	// utilities offered to derived classes
	const char& currentChar()							{return currentState.value;}
	const bool& currentEOS() 							{return currentState.eos;}
	const TextSource::PositionType& currentPosition()	{return currentState.position;}

	const char& nextChar()		{return nextState.value;}
	const bool& nextEOS()		{return nextState.eos;}

	void advance();
	bool isEndOfLine(const char&);

	private:
	auto_ptr<CharTokenImpl> ParseCharacters();

	protected:
	virtual void skip_white_space()=0;
	virtual bool read_delimiter_token	(auto_ptr<CharTokenImpl>&)=0;
	virtual bool read_literal_token		(auto_ptr<CharTokenImpl>&)=0;
	virtual bool read_word_token			(auto_ptr<CharTokenImpl>&)=0;
};



}	// close namespace
