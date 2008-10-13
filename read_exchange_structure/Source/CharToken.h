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
Declare the CharToken class, which contains chunks of input text file (words, literals, delimiters)
Also declares the CharTokenTest interface, which specifies how instances of CharToken can be examined

History:
9 Nov 2004: used as a functional include file in Token Parsing subproject

Documentation:
	The macro TokenDebugging provides for compilations of
	members and methods which allow the contents of CharTokens
	to be visible from a Debugger in the abstract base CharTokenImpl class


*/
#pragma once

#include "TextSource.h"

namespace KShellSTEP{


class CharToken;

class CharTokenTest{
	public:
	virtual ~CharTokenTest(){};

	bool operator()(const CharToken&);

	virtual bool LiteralTokenTest(const string&)	{return false;}
	virtual bool WordTokenTest(const string&)		{return false;}
	virtual bool DelimiterTokenTest(char)							{return false;}

};

class CharTokenImpl{
	private:
	mutable short RefCount;

	private:
	//will declare and not define, should never be used
	CharTokenImpl(const CharTokenImpl&);
	CharTokenImpl& operator=(const CharTokenImpl&);

	public:
	CharTokenImpl():RefCount(0){};
	virtual ~CharTokenImpl(){};

	void  AddReference() const		{++RefCount;}
	short DeleteReference() const	{return --RefCount;}

	virtual TextSource::PositionType start()				const = 0;
	virtual TextSource::PositionType stop()					const = 0;
	virtual bool satisfies(CharTokenTest& x)				const = 0;
};



class DelimiterTokenImpl:public CharTokenImpl{
	public:
	char myChar;
	TextSource::PositionType pos;

	public:
	void * operator new(std::size_t);
	void   operator delete(void *);

	public:
	TextSource::PositionType start()	const {return pos;}
	TextSource::PositionType stop()		const	{return pos;}
	bool satisfies(CharTokenTest& t) 	const{
		return t.DelimiterTokenTest(myChar);}
};


class _string_based_token_impl:public CharTokenImpl{
	public:
	string myString;
	TextSource::PositionType _start;
	TextSource::PositionType _stop;

	TextSource::PositionType start()	const {return _start;}
	TextSource::PositionType stop()		const {return _stop;}
};

class LiteralTokenImpl:public _string_based_token_impl{
	public:
	void * operator new(std::size_t);
	void   operator delete(void *);

	public:
	bool satisfies(CharTokenTest& t) const{
		return t.LiteralTokenTest(myString);}
};

class WordTokenImpl:public _string_based_token_impl{
	public:
	void * operator new(std::size_t);
	void   operator delete(void *);

	public:
	bool satisfies(CharTokenTest& t) const{
		return t.WordTokenTest(myString);}
};




class CharToken{
	private:
	const CharTokenImpl * itsCharTokenImpl;

	public:
	CharToken():itsCharTokenImpl(NULL){};
	CharToken(const CharToken& a);
	CharToken(CharTokenImpl* impl);

	~CharToken();

	CharToken& operator=(const CharToken& a);

	friend bool operator==(const CharToken&, const CharToken&);
	const CharTokenImpl& operator*() const {return *itsCharTokenImpl;}
	const CharTokenImpl* operator->() const {return itsCharTokenImpl;}
};

inline
bool
operator==(const CharToken& a,const CharToken& b){
	return a.itsCharTokenImpl == b.itsCharTokenImpl;}


inline CharToken::CharToken(const CharToken& a):
	itsCharTokenImpl(a.itsCharTokenImpl){
		if (itsCharTokenImpl != NULL) itsCharTokenImpl->AddReference();
	}

inline CharToken::CharToken(CharTokenImpl* impl):
	itsCharTokenImpl(impl){
		if (itsCharTokenImpl != NULL) itsCharTokenImpl->AddReference();
	}

inline CharToken::~CharToken(){
	if (itsCharTokenImpl != NULL)
		if (itsCharTokenImpl->DeleteReference()==0)
			delete itsCharTokenImpl;
	}


inline CharToken& CharToken::operator=(const CharToken& a){
	if (itsCharTokenImpl != a.itsCharTokenImpl){
		if (itsCharTokenImpl != NULL)
			if (itsCharTokenImpl->DeleteReference()==0)
				delete itsCharTokenImpl;
		itsCharTokenImpl=a.itsCharTokenImpl;
		if (itsCharTokenImpl != NULL)
			itsCharTokenImpl->AddReference();
	}
	return *this;
}


inline bool CharTokenTest::operator()(const CharToken& tok){
	return (*tok).satisfies(*this);
};

} // close namespace


