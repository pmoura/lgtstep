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
Implement the character-level parsing of STEP Part 21 files; embodies the
Part 21 definitions of string literal and comments

History:
9 Nov 2004: used as a functional compilable file in Token Parsing subproject

Documentation:

*/

#include "Part21_TokenSource.h"

#include <cctype>	// to get the is[x] function
#include "ASCII_codes.h"

#include "KShellexceptImpl.h"

#include "hex_to_ucs4.h"

namespace KShellSTEP{

Part21_TokenSource::Part21_TokenSource(TextSource& a):
	TokenSource(a),
	ucs4_to_utf8("UTF-8","UCS-4"),
	latin1_to_utf8("UTF-8","ISO-8859-1"){};


namespace Part21_Parsing{

inline
bool
isHexChar(char c){
	return ((c>='0' and c<='9') or (c>='A' and c<='F'));
}

inline
int
isPrintDirective(char c){
	return (c=='N' || c=='F');
}

inline
int
isWhiteSpace(const char& c){
	return (std::isspace(c));	// includes end of line characters, tabs, spaces
}


inline
int
isDelimiter(const char& c){
	return (c==Comma 						||
					c==Semicolon				||
					c==DollarSign				||
					c==LeftParenthesis	||
					c==RightParenthesis	||
					//c==PlusSign					||
					c==EqualSign				||
					c==Asterix					||
					//c==MinusSign				||
					//c==CrossHatch				||
					//c==Period						||
					c==QuoteMark				||
					false);
}

inline
int
isWordChar(const char& c){
	return (	std::isalnum(c)		||
						c==Underscore			||
						c==CrossHatch			||
						c==PlusSign       ||
						c==MinusSign      ||
						c==Period         ||
						false);
}

const char lower_case_e = 'e';
const char upper_case_E = 'E';

}	// close Part21_Parsing namespace

using namespace Part21_Parsing;


void
Part21_TokenSource::skip_white_space(){
	// skip over white space, returns, line feeds, block comments, and tail comments
	while (not currentEOS()){
		if (isWhiteSpace(currentChar())) advance();

		else if (currentChar() == Slash && nextChar() == Asterix){
			// look ahead for the asterix denoting a block comment
			TextSource::PositionType start_pos = currentPosition();
			advance();
			advance();	// now looking past the asterix
			while (true){	// reading block comment
				if (currentEOS()) throw UnterminatedComment(start_pos);

				if (currentChar() == Asterix && nextChar() == Slash){
					advance();
					advance();
					break;
				}
				advance();
			}
		}
		else if (currentChar() == BackSlash && isPrintDirective(nextChar())){
			TextSource::PositionType start_pos = currentPosition();
			advance();	// over backslash
			advance();	// over print directive
			if (currentEOS() || currentChar() != BackSlash){
				throw UnterminatedPrintDirective(start_pos);
			}
			else{
				advance();
			}
		}
		else break;
	} // loop skipping over white space, comments
}

bool
Part21_TokenSource::read_delimiter_token	(auto_ptr<CharTokenImpl>& retVal){
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
Part21_TokenSource::read_literal_token		(auto_ptr<CharTokenImpl>& retVal){
	if (currentChar() == Apostrophe){
	  IConv * current_alphabet_conv = &latin1_to_utf8;
		auto_ptr<IConv> alt_conv_ptr;
	  
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
			else if (currentChar() == BackSlash){
			  if (nextEOS()) throw ErrorEscapeSequence(currentPosition());
			  advance();
				if (currentChar() == BackSlash){
					buffer.push_back(BackSlash);
					buffer.push_back(BackSlash);
					advance();
				}
				else if (currentChar() == 'N' or currentChar() == 'F'){
				  if (nextEOS() or nextChar() != BackSlash)
				    throw ErrorEscapeSequence(currentPosition());
				  advance();
				  advance();  // skip over this print directive without adding anything
				}
				else if (currentChar() == 'P'){	// alphabet directive
					advance();
					if (currentEOS()) throw ErrorEscapeSequence(currentPosition());
					char c = currentChar();
					if (not (c>= 'A'  and c<='I')) throw ErrorEscapeSequence(currentPosition());
					string alphabet_label("ISO-8859-");
					alphabet_label.push_back(c-'A'+'1');
					alt_conv_ptr.reset( new IConv("UTF-8", alphabet_label.c_str()));
					current_alphabet_conv = alt_conv_ptr.get();
					advance();
					if (currentEOS() or currentChar() != BackSlash) throw ErrorEscapeSequence(currentPosition());
					advance();
				}
				else if (currentChar() == 'S'){ // PAGE directive, use a shifted ISO 8859-?
				  advance();
				  if (currentEOS() or currentChar() != BackSlash) throw ErrorEscapeSequence(currentPosition());
				  advance();
				  if (currentEOS()) throw ErrorEscapeSequence(currentPosition());
				  vector< char > encoded_tmp(1, currentChar() | 0x80);
				  auto_ptr< vector<char> > tmp2 = (*current_alphabet_conv)(encoded_tmp);
				  buffer.insert(buffer.end(), tmp2->begin(), tmp2->end());
				  advance();
				}
				else if (currentChar() == 'X'){
					string hex_chars;
					int hexLength=4;
					if (nextEOS()) throw ErrorEscapeSequence(currentPosition());
					advance();
					if (currentChar() == BackSlash){// ARBITRARY directive
						hexLength=1;
						for(int jj=2; jj; jj--){
							advance();
							if (currentEOS()) throw ErrorEscapeSequence(currentPosition());
							char c=currentChar();
							if (not isHexChar(c)) throw ErrorEscapeSequence(currentPosition());
							hex_chars.push_back(c);
						}
					}
					else if (currentChar() == '2' or currentChar() == '4'){
						hexLength = currentChar() - '0';
						advance();
						if (currentEOS() or currentChar() != BackSlash) throw ErrorEscapeSequence(currentPosition());
						advance();
						while(1){
							if (currentEOS()) throw ErrorEscapeSequence(currentPosition());
							if (currentChar() == BackSlash) break;
							if (not isHexChar( currentChar() )) throw ErrorEscapeSequence(currentPosition());
							hex_chars.push_back( currentChar() );
							advance();
						}
						if (hex_chars.size() % (2*hexLength)) throw ErrorEscapeSequence(currentPosition());
						advance();
						if (currentEOS() or currentChar() != 'X') throw ErrorEscapeSequence(currentPosition());
						advance();
						if (currentEOS() or currentChar() != '0') throw ErrorEscapeSequence(currentPosition());
						advance();
						if (currentEOS() or currentChar() != BackSlash) throw ErrorEscapeSequence(currentPosition());
					}
					else throw ErrorEscapeSequence(currentPosition());
					
					auto_ptr< vector<char> > escaped_bytes = hex_to_ucs4(hex_chars, hexLength);
					auto_ptr< vector<char> > encoded_bytes = ucs4_to_utf8( *escaped_bytes);
					buffer.insert(buffer.end(), encoded_bytes->begin(), encoded_bytes->end());
					
					advance();
				}
				else throw ErrorEscapeSequence(currentPosition());
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
Part21_TokenSource::read_word_token			(auto_ptr<CharTokenImpl>& retVal){
	if (std::isdigit(currentChar()) or isWordChar(currentChar())){
		auto_ptr<WordTokenImpl> tmpVal(new WordTokenImpl);
		string& buffer = tmpVal -> myString;
		buffer.reserve(16);

		tmpVal -> _start = currentPosition();
		TextSource::PositionType& _stop = tmpVal -> _stop;

		if /*(std::isdigit(currentChar())){
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
		else if */ (isWordChar(currentChar()))
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
