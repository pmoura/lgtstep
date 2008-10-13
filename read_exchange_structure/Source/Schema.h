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
Declaration of the interface for a representation of an EXPRESS schema

History:
8 Mar 2005: created

Documentation:
*/

#pragma once

#include <algorithm>

#include "visited_by.h"
#include "indexed_array.h"

namespace KShellSTEP{
namespace EXPRESS{


class Enumeration{
	private:
	vector<string> values;
	public:
	const string name;
	
	typedef vector<string>::const_iterator const_iterator;
	Enumeration(const string&, const vector<string>&);

	const_iterator begin() const{return values.begin();}
	const_iterator end()   const{return values.end();}
	size_t         size()  const{return values.size();}
	const_iterator find(const string& x) const{
		return std::find(begin(),end(),x);
	}
};


class Logical{
	private:
	const unsigned int value;
	Logical(unsigned int x):value(x){};

	public:
	static Logical True();
	static Logical False();
	static Logical Unknown();

	bool operator==(const Logical& x) const{return value == x.value;}
};

class Entity;

typedef indexed_array<Entity>::const_iterator EntityPtr;

class EntitySet{
  private:
  vector<EntityPtr> elements;
  public:
  typedef vector<EntityPtr>::iterator iterator;
  typedef vector<EntityPtr>::const_iterator const_iterator;

  friend EntitySet entity_set_union(const EntitySet&, const EntitySet&);
  friend EntitySet entity_set_intersection(const EntitySet&, const EntitySet&);
  friend bool operator<(const EntitySet&, const EntitySet&);
  friend bool operator==(const EntitySet&, const EntitySet&);


  EntitySet(){};
  EntitySet(const EntitySet& a):elements(a.elements){};
  EntitySet& operator=(const EntitySet&);
  EntitySet(const vector<EntityPtr>&);

  const_iterator begin() const{return elements.begin();}
  const_iterator end()   const{return elements.end();}
  bool empty() const					{return elements.empty();}
  unsigned int size() const		{return elements.size();}

  EntitySet& operator+=(EntityPtr);
  EntitySet& operator-=(EntityPtr);

  bool contains(const EntityPtr&) const;
};

EntitySet
entity_set_union(const EntitySet&, const EntitySet&);

EntitySet
entity_set_intersection(const EntitySet&, const EntitySet&);

bool operator==(const EntitySet&, const EntitySet&);
bool operator<(const EntitySet&, const EntitySet&);

#define AttrTypeProxy visited_by<AttributeTypeVisitor>
class AttributeTypeVisitor{
  public:
  virtual ~AttributeTypeVisitor(){};
  virtual void handle_instance()=0;

  virtual void handle_collection(const AttrTypeProxy&)=0;
  virtual void handle_array_optional(const AttrTypeProxy&)=0;

  virtual void handle_enumeration(const Enumeration&)=0;
  virtual void handle_aliased(const string&, const AttrTypeProxy&)=0;
  virtual void handle_multiple(const vector< shared_ptr<AttrTypeProxy> >&)=0;

  virtual void handle_string()=0;
  virtual void handle_boolean()=0;
  virtual void handle_binary()=0;
  virtual void handle_integer()=0;
  virtual void handle_logical()=0;
  virtual void handle_number()=0;
  virtual void handle_real()=0;
};

typedef AttrTypeProxy AttributeType;
#undef  AttrTypeProxy
string attribute_type_to_string(const AttributeType&);  // this intended for debugging/error messages

class Attribute{
  public:
  string name;
  bool   optional;
  shared_ptr<AttributeType> type;
  
  bool redeclaration;  /* true iff it shares name with an explicit attribute in a super entity */
  EntitySet overrides; /* set of children entities with a derived attribute that shares this name */
  
  Attribute(const string& nm):name(nm),redeclaration(false){};
};

class Entity{
  public:
  typedef indexed_array<Attribute>::const_iterator attribute_iterator;
  string name;
  boost::shared_ptr< indexed_array<Attribute> > attributes_ptr;
  indexed_array<Attribute>& 			attributes()				{return *attributes_ptr;}
  const indexed_array<Attribute>& attributes() const	{return *attributes_ptr;}
  
  Entity(const string& nm):name(nm){};
};

class Schema{
	public:
	typedef indexed_array<Entity>::const_iterator entity_iterator;
	virtual const string& name() const = 0;
	virtual const indexed_array<Entity>& entities() const = 0;

	virtual EntitySet up_set(const EntitySet&)   const = 0;
	virtual EntitySet down_set(const EntitySet&) const = 0;

	virtual EntitySet minima(const EntitySet&) const = 0;
	virtual EntitySet maxima(const EntitySet&) const = 0;

};

inline
const string&
get_index_key(const Entity& e){ return e.name;}

inline
const string&
get_index_key(const Attribute& a){ return a.name;}


}   //close EXPRESS
}   //close KShellSTEP
