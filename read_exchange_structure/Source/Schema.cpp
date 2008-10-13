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
implementation of EntitySet class

History:
8 Mar 2005: created

Documentation:
*/

#include "Schema.h"
#include <algorithm>

#include <utility>
using namespace std::rel_ops;	// to get the general != operator

#include <cctype>

namespace KShellSTEP{
namespace EXPRESS{

EntitySet&
EntitySet::operator=(const EntitySet& a){
	if (&a != this) elements = a.elements;
	return *this;
}

EntitySet&
EntitySet::operator+=(EntityPtr x){
	iterator iz = lower_bound(elements.begin(), elements.end(), x);
	if (iz == elements.end() or *iz != x)
		elements.insert(iz, x);
	return *this;
}
/*
EntitySet&
EntitySet::operator+=(indexed_array<Entity>::const_iterator x){
	return EntitySet::operator+=(EntityPtr(&(*x)));
}*/

EntitySet&
EntitySet::operator-=(EntityPtr x){
	iterator iz = find(elements.begin(), elements.end(), x);
	if (iz != elements.end())
		elements.erase(iz);
	return *this;
}

bool
EntitySet::contains(const EntityPtr& x) const{
	const_iterator iz = find(elements.begin(), elements.end(), x);
	return (iz != elements.end());
}


bool operator< (const EntitySet& a, const EntitySet& b){ return a.elements <  b.elements;}
bool operator==(const EntitySet& a, const EntitySet& b){ return a.elements == b.elements;}

EntitySet::EntitySet(const vector<EntityPtr>& a):elements(a){
	std::sort(elements.begin(), elements.end());
}

EntitySet
entity_set_union(const EntitySet& a, const EntitySet& b){
	std::size_t maxSize = a.size() + b.size();
	EntitySet retVal;
	retVal.elements.assign(maxSize, EntityPtr());
	vector<EntityPtr>::iterator ix = std::set_union(a.begin(),a.end(),b.begin(),b.end(),retVal.elements.begin());
	retVal.elements.erase(ix, retVal.elements.end());
	return retVal;
}

EntitySet
entity_set_intersection(const EntitySet& a, const EntitySet& b){
	std::size_t maxSize = std::max(a.size(),b.size());
	EntitySet retVal;
	retVal.elements.assign(maxSize, EntityPtr());
	vector<EntityPtr>::iterator ix = std::set_intersection(a.begin(),a.end(),b.begin(),b.end(),retVal.elements.begin());
	retVal.elements.erase(ix, retVal.elements.end());
	return retVal;
}

Enumeration::Enumeration(const string& _nm, const vector<string>& a):name(_nm),values(a){};


Logical
Logical::True(){return Logical(1);}

Logical
Logical::False(){return Logical(0);}

Logical
Logical::Unknown(){return Logical(2);}

/* ------------------------------------------------------------------ */
class AttributeTypePrinter:public KShellSTEP::EXPRESS::AttributeTypeVisitor{
  public:
  string result;
  public:
  void handle_collection(const AttributeType&);
  void handle_array_optional(const AttributeType&);

  void handle_enumeration(const KShellSTEP::EXPRESS::Enumeration&);
  void handle_aliased(const string&, const AttributeType&);
  void handle_multiple(const vector< shared_ptr<AttributeType> >&);
  void handle_instance();
  void handle_string();
  void handle_boolean();
  void handle_binary();
  void handle_integer();
  void handle_logical();
  void handle_number();
  void handle_real();
};


void
AttributeTypePrinter::handle_collection(const AttributeType& subtype){
  result +=  "COLLECTION OF ";
  subtype.respond_to_visitor(*this);
}
void
AttributeTypePrinter::handle_array_optional(const AttributeType& subtype){
  result += "ARRAY (with optional elements) OF ";
  subtype.respond_to_visitor(*this);

}

void
AttributeTypePrinter::handle_enumeration(const KShellSTEP::EXPRESS::Enumeration& e){
  result += "ENUMERATION OF [";
  KShellSTEP::EXPRESS::Enumeration::const_iterator ix = e.begin();
  int k= e.size();
  for (; ix != e.end(); ++ix, --k){
    result += *ix;
    if (k>1) result += ",";
  }
  result += "]";
}

void
AttributeTypePrinter::handle_aliased(const string& nm , const AttributeType& subtype){
  result += nm;
  result += "(alias for ";
  subtype.respond_to_visitor(*this);
  result += ")";
}

void
AttributeTypePrinter::handle_multiple(const vector< shared_ptr<AttributeType> >& subTypes){
  result += "ONE OF {";
  vector< shared_ptr<AttributeType> >::const_iterator ix = subTypes.begin();
  int k = subTypes.size();
  for (; ix != subTypes.end(); ++ix, --k){
    (**ix).respond_to_visitor(*this);
    if (k>1) result += ",";
  }
  result += "}";
}

void
AttributeTypePrinter::handle_string(){
  result += "STRING";
}
void
AttributeTypePrinter::handle_boolean(){
  result += "BOOLEAN";
}
void
AttributeTypePrinter::handle_binary(){
  result += "BINARY";
}
void
AttributeTypePrinter::handle_instance(){
  result += "INSTANCE";
}

void
AttributeTypePrinter::handle_integer(){
  result += "INTEGER";
}
void
AttributeTypePrinter::handle_logical(){
 result += "LOGICAL";
}
void
AttributeTypePrinter::handle_number(){
  result += "NUMBER";
}
void
AttributeTypePrinter::handle_real(){
  result += "REAL";
}


string attribute_type_to_string(const AttributeType& att){
  AttributeTypePrinter tmp;
  att.respond_to_visitor(tmp);
  return tmp.result;
}

} // close EXPRESS
}	// close KShellSTEP
