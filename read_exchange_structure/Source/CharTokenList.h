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
Declare a container (with iterator interface) which acts as a input stream of CharTokens

History:
9 Nov 2004: used as a functional include file in Token Parsing subproject

Documentation:
This is a complex class which allows for deletion of CharTokens from the list as
they are no longer needed
*/
#pragma once


#include "CharToken.h"
#include "InputSource.h"


namespace KShellSTEP{

class CharTokenListPrivate;	// forward reference; contains (hidden) implementation stuff
class CharTokenNode;				// forward reference,

class CharTokenListIterator{
	private:
	CharTokenNode*  				myPtr;
	CharTokenListPrivate*  	myList;

	public:
	CharTokenListIterator():myPtr(0),myList(0){};
	CharTokenListIterator(const CharTokenListIterator&);
	CharTokenListIterator(CharTokenNode*, CharTokenListPrivate*);
	~CharTokenListIterator();
	CharTokenListIterator& operator = (const CharTokenListIterator& a);

	bool operator == (const CharTokenListIterator& a) const {return myPtr == a.myPtr;}
	CharToken* operator->();
	CharToken& operator*();
	CharTokenListIterator& operator++();
};

class CharTokenList{
	private:
	auto_ptr<CharTokenListPrivate> itsPrivatePtr;

	public:
	typedef CharTokenListIterator iterator;

	CharTokenList(InputSource<CharToken>&);
	~CharTokenList();

	iterator begin();
	iterator end();
};

typedef CharTokenListIterator TokenIterator;

class TokenRange{
    private:
    TokenIterator _b;
    TokenIterator _e;
    
    public:
    TokenRange(const TokenIterator& x, const TokenIterator& y): _b(x),_e(y){};
    TokenRange(const TokenRange& a):_b(a._b),_e(a._e){};
    TokenIterator& begin(){return _b;}
    TokenIterator& end(){return _e;}
    const TokenIterator& begin() const{return _b;}
    const TokenIterator& end()   const{return _e;}
};






}	// close namespace

