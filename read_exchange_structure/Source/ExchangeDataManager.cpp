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
Copyright 2005 by Vincent Marchetti All rights reserved

Purpose:
Implement the class which provides for allocationof Attribute Value data

History:
 6 Jun 2005: created

Documentation:
merges the implementations of the previous AttributeValueManager and InstanceManager
*/


#include "ExchangeDataManager.h"

#include "array_pool.h"
#include <boost/pool/object_pool.hpp>
#include "ASCII_codes.h"

namespace KShellSTEP{
namespace Part21{


namespace ValueTypes{
class String:public AttributeValue{
	private:
	const char *const c;
	public:
	String(const char * a):c(a){};
	void respond_to_visitor(AttributeValueVisitor& a) const{
		a.handle_string(c);}
};

class EmptyString: public AttributeValue{
	public:
	void respond_to_visitor(AttributeValueVisitor& a) const{
		const char c('\0');
		a.handle_string(&c);}
};


class Integer: public AttributeValue{
	private:
	const long value;
	public:
	Integer(long x):value(x){};
	void respond_to_visitor(AttributeValueVisitor& a) const{
		a.handle_integer(value);}
};

class Boolean: public AttributeValue{
	private:
	const bool value;
	public:
	Boolean(bool x):value(x){};
	void respond_to_visitor(AttributeValueVisitor& a) const{
		a.handle_boolean(value);}
};

class Logical: public AttributeValue{
	private:
	const EXPRESS::Logical value;
	public:
	Logical(EXPRESS::Logical x):value(x){};
	void respond_to_visitor(AttributeValueVisitor& a) const{
		a.handle_logical(value);}
};

class Real: public AttributeValue{
	private:
	const double value;
	public:
	Real(double x):value(x){};
	void respond_to_visitor(AttributeValueVisitor& a) const{
		a.handle_real(value);}
};

class Enum: public AttributeValue{
	private:
	const EXPRESS::Enumeration::const_iterator value;
	public:
	Enum(EXPRESS::Enumeration::const_iterator x):value(x){};
	void respond_to_visitor(AttributeValueVisitor& a) const{
		a.handle_enumeration(value);}
};

class Collection:public AttributeValue{
	private:
	AttributeValue** const iv;
	AttributeValue** const ivend;
	public:
	Collection(AttributeValue** a,AttributeValue** b):iv(a),ivend(b){};
	void respond_to_visitor(AttributeValueVisitor& a) const{
		a.handle_collection(iv,ivend);}
};

class Instance:public AttributeValue{
	private:
	const InstanceID value;
	public:
	Instance(const InstanceID& x):value(x){};
	void respond_to_visitor(AttributeValueVisitor& a) const{
		a.handle_instance(value);}
};

class Omitted:public AttributeValue{
	public:
	Omitted(){};
	void respond_to_visitor(AttributeValueVisitor& a) const{
		a.handle_omitted();}
};

class Aliased:public AttributeValue{
	private:
	const char *const alias_name;
	AttributeValue * const value;
	public:
	Aliased(const char * c, AttributeValue * v):alias_name(c), value(v){};
	void respond_to_visitor(AttributeValueVisitor& a) const{
		a.handle_aliased(alias_name, value);}
};

class Binary:public AttributeValue{
	private:
	const bool * bx;
	const bool * bend;
	public:
	Binary(const bool * a, const bool * b):bx(a),bend(b){};
	void respond_to_visitor(AttributeValueVisitor& a) const{
		a.handle_binary(bx,bend);}
};


}	// close namespace ValueTypes






class ExchangeDataManagerImpl:public ExchangeDataManager{
	private:
	array_pool<char> idPool;

	array_pool<char> text_pool;
	array_pool<bool> bit_pool;
	array_pool<AttributeValue *> value_pool;

	boost::object_pool<ValueTypes::EmptyString> empty_string_pool;
	boost::object_pool<ValueTypes::String>      string_pool;

	boost::object_pool<ValueTypes::Integer>     integer_pool;
	boost::object_pool<ValueTypes::Boolean>     boolean_pool;
	boost::object_pool<ValueTypes::Logical>     logical_pool;
	boost::object_pool<ValueTypes::Real>     		real_pool;
	boost::object_pool<ValueTypes::Enum>     		enumeration_pool;
	boost::object_pool<ValueTypes::Collection>  collection_pool;
	boost::object_pool<ValueTypes::Instance>  	instance_pool;
	boost::object_pool<ValueTypes::Omitted>  		omitted_pool;
	boost::object_pool<ValueTypes::Aliased>  		aliased_pool;
	boost::object_pool<ValueTypes::Binary>  		binary_pool;


	public:
	pair<bool, InstanceID> make_ID(const string&);

	AttributeValue * make_string(const string&);
	AttributeValue * make_integer(const long&);
	AttributeValue * make_boolean(const bool&);
	AttributeValue * make_logical(const EXPRESS::Logical&);
	AttributeValue * make_real(const double&);
	AttributeValue * make_enumeration(const EXPRESS::Enumeration::const_iterator&);
	AttributeValue * make_collection(const vector<AttributeValue *>&);
	AttributeValue * make_instance(const InstanceID&);
	AttributeValue * make_omitted();
	AttributeValue * make_aliased(const string&, AttributeValue*);
	AttributeValue * make_binary(const vector<bool>&);

};

class InstanceIDHelper:public InstanceID{
	public:
	InstanceIDHelper(const char * a, const char* b):InstanceID(a,b){};
	InstanceIDHelper():InstanceID(){};
};

pair<bool, InstanceID>
ExchangeDataManagerImpl::make_ID(const string& idstr){
// 	bool res(false);
// 	int k(0);
// 	int N(idstr.size());
// 	while (true){
// 
// 		if (N <= 1  or idstr[0] != CrossHatch) break;
// 
// 		int ii;
// 		for (ii = 1; ii < N; ++ii)
// 			if (idstr[ii] != '0'){
// 				k = ii;
// 				break;
// 			}
// 		if (ii == N) break;
// 		for (; ii < N; ++ii){
// 			char c(idstr[ii]);
// 			if ( c < '0' or c > '9') break;
// 		}
// 		res = (ii == N);
// 		break;
// 	}
// 	if (not res)
// 		return pair<bool, InstanceID>(false,InstanceIDHelper());
// 	int J( (N-k+1)/2);
// 	char *ix = idPool.allocate( J );
// 	char *ib(ix);
// 	int m1(N-1);
// 	int m2(N-2);
// 	for (int mm = 0; mm < J; ++mm,m1-=2 ,m2-=2, ++ix){
// 		char ca = (idstr[m1]-'0');
// 		char cb('\x0F');
// 		if (m2 >= k) cb = idstr[m2] - '0';
// 		*ix = (ca << 4) | cb;
// 	}
    int N(idstr.size());
    char *ix = idPool.allocate( N );
   	char *ib(ix);
   	for (; N; ++ix, --N) *ix = idstr[N-1];  // copy in backwards
   	
	return pair<bool,InstanceID>(true, InstanceIDHelper(ib,ix));
}

string
InstanceID::map_to_Part21() const{
    int N( ie-ib );
	string retVal((size_t) N, ' ');
	const char * ix(ib);
	for (;N; ++ix, --N) retVal[N-1] = *ix;
	return retVal;
}



class pool_alloc_error:public logic_error{
	public:
	pool_alloc_error():logic_error("boost/pool allocation fault"){};
};




AttributeValue *
ExchangeDataManagerImpl::make_string(const string& s){
	AttributeValue *retVal;
	if (s.empty())
		retVal = empty_string_pool.construct();
	else{
		char * c = text_pool.allocate(s.size() + 1);
		char * ix = std::copy(s.begin(), s.end(), c);
		*ix = '\0';
		retVal = string_pool.construct(c);
	}
	if (retVal == NULL) throw pool_alloc_error();
	return retVal;
};

AttributeValue *
ExchangeDataManagerImpl::make_integer(const long& n){
	AttributeValue * retVal = integer_pool.construct(n);
	if (retVal == NULL) throw pool_alloc_error();
	return retVal;
};

AttributeValue *
ExchangeDataManagerImpl::make_boolean(const bool& n){
	AttributeValue * retVal = boolean_pool.construct(n);
	if (retVal == NULL) throw pool_alloc_error();
	return retVal;
};

AttributeValue *
ExchangeDataManagerImpl::make_logical(const EXPRESS::Logical& n){
	AttributeValue * retVal = logical_pool.construct(n);
	if (retVal == NULL) throw pool_alloc_error();
	return retVal;
};

AttributeValue *
ExchangeDataManagerImpl::make_real(const double& n){
	AttributeValue * retVal = real_pool.construct(n);
	if (retVal == NULL) throw pool_alloc_error();
	return retVal;
};

AttributeValue *
ExchangeDataManagerImpl::make_enumeration(const EXPRESS::Enumeration::const_iterator& n){
	AttributeValue * retVal = enumeration_pool.construct(n);
	if (retVal == NULL) throw pool_alloc_error();
	return retVal;
};


AttributeValue *
ExchangeDataManagerImpl::make_collection(const vector<AttributeValue *>& values){
	AttributeValue ** iav = value_pool.allocate( values.size() );
	std::copy(values.begin(), values.end(), iav);

	AttributeValue * retVal = collection_pool.construct(iav, iav + values.size() );
	if (retVal == NULL) throw pool_alloc_error();
	return retVal;
};

AttributeValue *
ExchangeDataManagerImpl::make_instance(const InstanceID& value ){
	AttributeValue * retVal = instance_pool.construct(value);
	if (retVal == NULL) throw pool_alloc_error();
	return retVal;
};

AttributeValue *
ExchangeDataManagerImpl::make_omitted(){
	AttributeValue * retVal = omitted_pool.construct();
	if (retVal == NULL) throw pool_alloc_error();
	return retVal;
};

AttributeValue *
ExchangeDataManagerImpl::make_aliased(const string& alias_name, AttributeValue* value){
	char * c = text_pool.allocate(alias_name.size() + 1);
	char * ix = std::copy(alias_name.begin(), alias_name.end(), c);
	*ix = '\0';

	AttributeValue * retVal = aliased_pool.construct(c, value);
	if (retVal == NULL) throw pool_alloc_error();
	return retVal;
};

AttributeValue *
ExchangeDataManagerImpl::make_binary(const vector<bool>& bits){
	bool * ib = bit_pool.allocate(bits.size());
	std::copy(bits.begin(), bits.end(), ib);

	AttributeValue* retVal = binary_pool.construct(ib,ib+bits.size());
	if (retVal == NULL) throw pool_alloc_error();
	return retVal;
}


auto_ptr<ExchangeDataManager>
ExchangeDataManager::make(){
	auto_ptr<ExchangeDataManager>  retVal;
	retVal.reset( new ExchangeDataManagerImpl());
	return retVal;
}

}
}
