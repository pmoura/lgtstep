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
Implement the character-level parsing of EXPRESS files; embodies the
EXPRESS language definitions of string literal and comments

History:
9 Nov 2004: used as a functional compilable file in Token Parsing subproject

Documentation:

*/

#include "EXPRESS_TokenSource.h"

#include <cctype>	// to get the is[x] function
#include "ASCII_codes.h"
#include "KShellexceptImpl.h"


namespace KShellSTEP{

EXPRESS_TokenSource::EXPRESS_TokenSource(TextSource& a):
	TokenSource(a){};


namespace EXPRESS_Parsing{

inline
int
isWhiteSpace(const char& c){
	return (std::isspace(c));	// includes end of line characters
}


inline
int
isDelimiter(const char& c){
	return (c==Comma							||
					c==Semicolon					||
					c==Colon							||
					c==LeftParenthesis		||
					c==RightParenthesis		||
					c==LeftSquareBracket	||
					c==RightSquareBracket	||
					c==LeftBracket				||
					c==RightBracket				||
					c==EqualSign					||
					c==BackSlash					||
					c==LessSign						||
					c==GreaterSign				||
					c==VerticalSlash			||
					c==PlusSign						||
					c==MinusSign					||
					c==Period							||
					c==QuestionMark				||
					c==Asterix						||
					c==Slash							||
					false);
}

inline
int
isWordChar(const char& c){
	return (	std::isalnum(c)		||
				 		c==Underscore			||
				 		false);
}

const char lower_case_e = 'e';
const char upper_case_E = 'E';

}	// close EXPRESS_Parsing namespace

using namespace EXPRESS_Parsing;

void
EXPRESS_TokenSource::skip_white_space(){
	// skip over white space, returns, line feeds, block comments, and tail comments
	while (not currentEOS()){
		if (isWhiteSpace(currentChar())) advance();

		else if (currentChar() == LeftParenthesis && nextChar() == Asterix){
			// look ahead for the asterix denoting a block comment
			TextSource::PositionType start_pos = currentPosition();
			advance();
			advance();	// now looking past the asterix
			while (true){	// reading block comment
				if (currentEOS()) throw UnterminatedComment(start_pos);

				if (currentChar() == Asterix && nextChar() == RightParenthesis){
					advance();
					advance();
					break;
				}
				advance();
			}
		}
		else if (currentChar() == Hyphen && nextChar() == Hyphen){
			// skip forward to end of line
			advance();
			advance();
			while (not (currentEOS() or isEndOfLine(currentChar()))) advance();
			if (not currentEOS()) advance();
		}
		else break;
	} // loop skipping over white space, comments
}

bool
EXPRESS_TokenSource::read_delimiter_token	(auto_ptr<CharTokenImpl>& retVal){
	if (isDelimiter(currentChar())){
		auto_ptr<DelimiterTokenImpl> tmpVal(new DelimiterTokenImpl);
		tmpVal -> myChar = currentChar();
		tmpVal -> pos    = currentPosition();
		advance();
		retVal = tmpVal;
		return true;
	}
	return false;
}

bool
EXPRESS_TokenSource::read_literal_token		(auto_ptr<CharTokenImpl>& retVal){
	if (currentChar() == Apostrophe){
		TextSource::PositionType start_pos = currentPosition();
		// the literal token loop
		auto_ptr<LiteralTokenImpl> tmpVal(new LiteralTokenImpl);
		string& buffer = tmpVal -> myString;
		buffer.reserve(32);

		tmpVal -> _start = currentPosition();
		TextSource::PositionType& _stop = tmpVal->_stop;

		advance();
		while (true){
			if (currentEOS())
				throw UnterminatedLiteral(start_pos);

			if (currentChar() == Apostrophe){
				if (not nextEOS() and nextChar() == Apostrophe){
					buffer.push_back(Apostrophe);
					advance();
					advance();
				}
				else{
					_stop = currentPosition();
					advance();
					break;	// out of literal loop
				}
			}
			else if (currentChar() == TextSource::EndOfLine)
				advance();	// not treated as error
			else{
				buffer.push_back(currentChar());
				advance();
			}
		}
		retVal = tmpVal;
		return true;
	}
	return false;
}

bool
EXPRESS_TokenSource::read_word_token			(auto_ptr<CharTokenImpl>& retVal){
	if (std::isdigit(currentChar()) or isWordChar(currentChar())){
		auto_ptr<WordTokenImpl> tmpVal(new WordTokenImpl);
		string& buffer = tmpVal -> myString;
		buffer.reserve(16);

		tmpVal -> _start = currentPosition();
		TextSource::PositionType& _stop = tmpVal -> _stop;

		if (std::isdigit(currentChar())){
			// number reading loop
			while(not currentEOS() and std::isdigit(currentChar())){
				buffer.push_back(currentChar());
				_stop= currentPosition();
				advance();
			}
			if (currentChar() == Period){
				buffer.push_back(currentChar());
				_stop= currentPosition();
				advance();
				while(not currentEOS() and std::isdigit(currentChar())){
					buffer.push_back(currentChar());
					_stop= currentPosition();
					advance();
				}
			}
			if (currentChar() == lower_case_e or currentChar() == upper_case_E){
				buffer.push_back(currentChar());
				_stop= currentPosition();
				advance();
				if (currentChar() == PlusSign or currentChar() == MinusSign){
					buffer.push_back(currentChar());
					_stop= currentPosition();
					advance();}

				if (not std::isdigit(currentChar()))
					throw IncompleteFloatNumber(currentPosition());

				while(not currentEOS() and std::isdigit(currentChar())){
					buffer.push_back(currentChar());
					_stop= currentPosition();
					advance();}
			}
		}
		else if (isWordChar(currentChar()))
			while (not currentEOS() and isWordChar(currentChar())){
				buffer.push_back(currentChar());
				_stop = currentPosition();
				advance();
			}
		retVal = tmpVal;
		return true;
	}
	return false;
}



}	// close namespace
