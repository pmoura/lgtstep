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
declare an abstract class which provided an istream-like interface to a function which provides a 'bool getOne(x&)' signature
for getting data piece by piece

History:
9 Nov 2004: used as a functional include file in Token Parsing subproject

Documentation:
Semantics of the template function int InputSource<T>::getOne(T&)
-
Assumes that the input source either has a value ready, or is in its "End of data" state.
If value is available, return true; and set argument to the value; and advance input
	(note that no "peeking" allowed)
If value not available, return false, and argument reference is untouched.
-
In "iterator language"
suppose ix, iend are iterators returning T values, member of object
-
int getOne(T& arg){
	if (ix == iend) return 0;
	arg = *ix;
	++ix;
	return 1;
}



*/


#pragma once


namespace KShellSTEP{

template<class T>
class InputSource{
	public:
	InputSource(){};
	virtual ~InputSource(){};

	virtual bool getOne(T&)=0;
};	// end template

}	// end namespace
