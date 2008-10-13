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
Copyright ©  2005 Vincent Marchetti All rights reserved

Purpose:
A template which uses provides a memory mamangement system for a collection of data values
which are all destroyed together

History:
31 Mar 2005: created for use in ReadAttributeValue

Documentation:
*/


#include <cassert>

namespace KShellSTEP{
template<class T>
class array_pool{
	private:
	vector<T*> allocated_blocks;
	const size_t default_block_size;

	T* insertion_point;
	size_t space_left;

	void make_new_block(){
		insertion_point = new T[default_block_size];
		allocated_blocks.push_back(insertion_point);
		assert(insertion_point != NULL);
		space_left = default_block_size;
	}

	public:
	array_pool(size_t n = 1024):default_block_size(n){
		make_new_block();}
	~array_pool(){
		try{
		typename vector<T*>::iterator ix = allocated_blocks.begin();
		for (; ix != allocated_blocks.end(); ++ix)
			delete[] *ix;
		} catch(...){}
	}
	T* allocate(size_t N){
		assert(N >= 0);
		T* retVal;
		if (N > default_block_size){
			retVal = new T[N];
			allocated_blocks.push_back(retVal);
		}
		else{
			if (N>space_left) make_new_block();
			retVal = insertion_point;
			insertion_point += N;
			space_left -= N;
		}
		assert(retVal != NULL);
		return retVal;
	}
};
}
