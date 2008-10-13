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
Implement the BasicTokenTests

History:
9 Nov 2004: used as a functional compilable file in Token Parsing subproject

Documentation:

*/

#include "BasicTokenTests.h"
#include "ASCII_codes.h"


#include <cstdio>	// for real number parsing
#include <cctype>
namespace KShellSTEP{

class DelimiterTest:public CharTokenTest{
	private:
	const char myChar;

	public:
	DelimiterTest(char c):
		myChar(c){};
	virtual ~DelimiterTest(){};


	bool DelimiterTokenTest(char c) {return myChar == c;}
};


DelimiterTest _is_a_colon(Colon);
DelimiterTest _is_a_comma(Comma);
DelimiterTest _is_a_semicolon(Semicolon);
DelimiterTest _is_equal_sign(EqualSign);
DelimiterTest _is_a_backslash(BackSlash);
DelimiterTest _is_a_left_parenthesis(LeftParenthesis);
DelimiterTest _is_a_right_parenthesis(RightParenthesis);
DelimiterTest _is_a_period(Period);
DelimiterTest _is_a_minus(MinusSign);
DelimiterTest _is_a_plus(PlusSign);
DelimiterTest _is_a_left_square(LeftSquareBracket);
DelimiterTest _is_a_right_square(RightSquareBracket);
DelimiterTest _is_a_dollar_sign(DollarSign);
DelimiterTest _is_a_quotation_mark(QuoteMark);
DelimiterTest _is_an_asterix(Asterix);

bool is_a_colon(const CharToken& x)			{return _is_a_colon(x);}
bool is_a_comma(const CharToken& x)			{return _is_a_comma(x);}
bool is_a_semicolon(const CharToken& x)	{return _is_a_semicolon(x);}
bool is_equal_sign(const CharToken& x)	{return _is_equal_sign(x);}
bool is_a_backslash(const CharToken& x)	{return _is_a_backslash(x);}
bool is_left_parenthesis(const CharToken& x) {return _is_a_left_parenthesis(x);}
bool is_right_parenthesis(const CharToken& x) {return _is_a_right_parenthesis(x);}
bool is_a_period(const CharToken& x)		{return _is_a_period(x);}
bool is_a_quotation_mark(const CharToken&x ){return _is_a_quotation_mark(x);}
bool is_a_minus(const CharToken& x)     {return _is_a_minus(x);}
bool is_a_plus(const CharToken& x)      {return _is_a_plus(x);}
bool is_a_dollarsign(const CharToken& x){ return _is_a_dollar_sign(x);}
bool is_an_asterix(const CharToken& x)  { return _is_an_asterix(x);}

bool is_left_square_bracket(const CharToken& x){ return _is_a_left_square(x);}
bool is_right_square_bracket(const CharToken& x){ return _is_a_right_square(x);}

#pragma mark -


#pragma mark -
 class IsAWord:public CharTokenTest{
	private:
	string* contents_copy;		// copy of whatever the word is.

	public:
	IsAWord():contents_copy(NULL){};
	virtual ~IsAWord(){};

	bool operator()(const CharToken& tok, string& cp){	// argument to receive a copy
		assert(contents_copy == NULL);
		contents_copy = &cp;
		return CharTokenTest::operator()(tok);
	};

	virtual bool WordTokenTest(const string& word){
		assert(contents_copy != NULL);
		*contents_copy = word;
		return true;
	};
};
pair<bool, string>
is_a_word(const CharToken& tok){
	IsAWord tmp;
	pair<bool, string> retVal;
	retVal.first =  tmp(tok,retVal.second);
	return retVal;
};


class IsALiteral:public CharTokenTest{
	private:
	string* contents_copy;		// copy of whatever the literal is.

	public:
	IsALiteral():contents_copy(NULL){};
	virtual ~IsALiteral(){};

	bool operator()(const CharToken& tok, string& cp){	// argument to receive a copy
		assert(contents_copy == NULL);
		contents_copy = &cp;
		return CharTokenTest::operator()(tok);
	};

	virtual bool LiteralTokenTest(const string& word){
		assert(contents_copy != NULL);
		*contents_copy = word;
		return true;
	};
};

pair<bool, string>
is_a_literal(const CharToken& tok){
	IsALiteral tmp;
	pair<bool, string> retVal;
	retVal.first =  tmp(tok,retVal.second);
	return retVal;
};


class RealNumberTest: public CharTokenTest{
	private:
	double* resultPtr;

	public:
	RealNumberTest():resultPtr(NULL){};
	virtual ~RealNumberTest(){};

	virtual bool operator()(const CharToken& tok, double& x){
		assert(resultPtr == NULL);
		resultPtr = &x;
		return CharTokenTest::operator()(tok);
		};

	virtual bool WordTokenTest(const string& comp){
		int resultVal = std::sscanf(comp.c_str(),"%lg",resultPtr);
		return (resultVal != 0);
	};
};


pair<bool, double> is_a_real(const CharToken& tok){
	RealNumberTest _rnt;
  pair<bool, double> retVal;
	retVal.first =  _rnt(tok, retVal.second);
  return retVal;
}

class IntegerTest: public CharTokenTest{
	private:
	long* resultPtr;

	public:
	IntegerTest():resultPtr(NULL){};
	virtual ~IntegerTest(){};

	virtual bool operator()(const CharToken& tok, long& n){	// argument to receive a copy
		assert(resultPtr == NULL);
		resultPtr = &n;
		return CharTokenTest::operator()(tok);
	};

	virtual bool WordTokenTest(const string& comp){
		int resultVal = std::sscanf(comp.c_str(),"%ld",resultPtr);
		return (resultVal != 0);
	};
};

pair<bool, long> is_an_integer(const CharToken& tok){
	IntegerTest _itst;
  pair<bool, long> retVal;
	retVal.first =  _itst(tok,retVal.second);
  return retVal;
};
}		// close namesapce
