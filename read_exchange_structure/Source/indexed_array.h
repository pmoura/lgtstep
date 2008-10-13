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
a container in which objects are stored in an array (with, therefore, fixed memory locations)
but can be found by searching a map-like interface with a string name

History:
4 March 2005: Generated for supporting the Schema and Entity classes

Documentation:
Note this class does not support adding and removing objects, it is generated
from an already existing array of objects, and the objects must support a
get_index_key function
*/


#pragma once

#include <map>
using std::map;


namespace KShellSTEP{


template<class T>
class indexed_array{
	public:
	typedef vector<T> ContainerType;
  typedef typename ContainerType::iterator iterator;
  typedef typename ContainerType::const_iterator const_iterator;

  protected:
  typedef map<string, typename ContainerType::iterator > MapType;

  auto_ptr<ContainerType> data;
  MapType index;

  public:
  indexed_array(auto_ptr<ContainerType>&);

  unsigned int size() const{return data->size();}
  bool empty() const{return (data->size() == 0);}

  iterator begin()  {return data->begin();}
  iterator end()    {return data->end();}

  iterator find(const string& nm){
		typename MapType::iterator _t = index.find(nm);
		if (_t == index.end())
			return end();
		else
			return _t->second;
	}


  const_iterator begin() const  {return data->begin();}
  const_iterator end()   const  {return data->end();}
  const_iterator find(const string& nm) const{
		typename MapType::const_iterator _t = index.find(nm);
		if (_t == index.end())
			return end();
		else
			return _t->second;
	}

};  // close template

template<class T>
const string& get_index_key(const T&);

template<class T>
indexed_array<T>::indexed_array(auto_ptr<ContainerType>& a):
	data(a){
		iterator ix = data->begin();
		for (; ix != data->end(); ++ix)
			index[ get_index_key(*ix)] = ix;
  }



}   // close KShellSTEP
