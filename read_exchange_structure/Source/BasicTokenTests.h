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
declare some common tests for checking and retrieving contents of a CharToken

History:
9 Nov 2004: used as a functional include file in Token Parsing subproject

Documentation:
Declares the following:WordTest, KeyWordTest, DelimiterTest, IsAWord,
IsALiteral, RealNumberTest, IntegerTest,
*/

#pragma once

#include "CharToken.h"

namespace KShellSTEP{


class KeyWordTest:public CharTokenTest{
	private:
	const string myWord;
	public:
	KeyWordTest(const string& a):myWord(a){};
	KeyWordTest(const char* c):myWord(c){};
	virtual ~KeyWordTest(){};

	const string& key() const{return myWord;}

	bool WordTokenTest(const string& word) {return word == myWord;}
};




bool is_a_colon(const CharToken&);
bool is_a_comma(const CharToken&);
bool is_a_semicolon(const CharToken&);
bool is_equal_sign(const CharToken&);
bool is_a_backslash(const CharToken&);
bool is_a_quotation_mark(const CharToken&);
bool is_an_asterix(const CharToken&);

bool is_left_parenthesis(const CharToken&);
bool is_right_parenthesis(const CharToken&);

bool is_left_square_bracket(const CharToken&);
bool is_right_square_bracket(const CharToken&);

bool is_a_period(const CharToken&);
bool is_a_minus(const CharToken&);
bool is_a_plus(const CharToken&);
bool is_a_dollarsign(const CharToken&);


pair<bool, string> is_a_word(const CharToken&);
pair<bool, string> is_a_literal(const CharToken&);
pair<bool, double> is_a_real(const CharToken&);
pair<bool, long> is_an_integer(const CharToken&);


}		// close namespace
