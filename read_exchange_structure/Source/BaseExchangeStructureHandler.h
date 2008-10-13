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
Declare a class from the ExchangeStructureHandler that stores the attribute value content
of a Part21 exchange structure

History:
17 Jul 2005: created

Documentation:

*/
#pragma once

#include "read_exchange_structure.h"
#include "SchemaServer.h"


using namespace KShellSTEP::EXPRESS;

namespace KShellSTEP{
namespace Part21{

class InstanceClass;

class InstanceRecord{
	public:
  InstanceID instance;
  //InstanceClass * instance_class;
  unsigned long index;
  InstanceRecord(const InstanceID& a):instance(a){}
};

class MemberRecord{
  public:
  const Entity * entity;
  const Attribute * attribute;
  unsigned long sub_index;
  
  MemberRecord(const Entity& e, const Attribute& a, unsigned long n):
    entity(&e), attribute(&a), sub_index(n){};
  MemberRecord(const MemberRecord& x):
    entity(x.entity), attribute(x.attribute), sub_index(x.sub_index){};
};

inline const string& get_index_key(const MemberRecord& x){return x.attribute->name;}

class InstanceClass{
	public:
  // EntitySet entity_set;
  scoped_ptr< indexed_array<MemberRecord> > members;
  vector<InstanceRecord> instances;
  vector<const AttributeValue *> data;

  InstanceClass(/*const EntitySet& a,*/ auto_ptr<indexed_array<MemberRecord> >& ms):
  	//entity_set(a),
  	members(ms){}
};

class StructureChoice{
	public:
	StructureChoice(){};
	virtual ~StructureChoice(){};

	virtual bool start_structure(const Header&){return true;}
};

class ModelChoice{
	protected:
	int model_count;
	public:
	ModelChoice():model_count(0){};
	ModelChoice(int n):model_count(n){};
	virtual ~ModelChoice(){};
	virtual void start_structure(const Header&){return;}
	virtual bool start_datamodel(){return model_count-- == 0;}
};

class InstanceChoice{
	public:
	InstanceChoice(){};
	virtual ~InstanceChoice(){};
	virtual void start_structure(const Header&){return;}
	virtual void start_datamodel(ExchangeSchema&){return;}
	virtual bool start_instance(const EntitySet&, const InstanceID&){return true;}
};


typedef map<EntitySet, shared_ptr<InstanceClass> > InstanceClassMapType;

class BaseExchangeStructureHandler: public ExchangeStructureHandler{
	protected:
	StructureChoice&	myStructureChoice;
	ModelChoice&			myModelChoice;
	InstanceChoice&		myInstanceChoice;
	SchemaServer&			mySchemaServer;

	shared_ptr<ExchangeDataManager> _dmptr;
	protected:
	typedef vector<const AttributeValue *> ValueBuffer;


	Header::schema_identifiers_type::value_type schemaIDptr;
	ExchangeSchema *	current_schema;
	weak_ptr<InstanceClass> 	current_class;
	ValueBuffer				current_values;


    // vector< shared_ptr<InstanceClass> > instance_classes;
    InstanceClassMapType classes_map;

	public:
	BaseExchangeStructureHandler(	SchemaServer&,
                                    StructureChoice&,
                                    ModelChoice&,
                                    InstanceChoice&);
	virtual ~BaseExchangeStructureHandler(){};

	bool		    start_structure(Header&);
	ReadModelConfig start_datamodel();
	bool		    start_instance(const EntitySet&, const InstanceID&);
	void		    attribute(const Entity&, const Attribute&,const AttributeValue*);
	void		    end_instance();
	void		    end_datamodel();
	void		    end_structure();
};

}
}
