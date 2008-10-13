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
The interface for a schema which includes functions to get InstanceMapping; also includes
declaration of the ValueSlot (specifies how a particular attribute value should be encoded)
and the InstanceMapping, specifies how a instance is encoded

History:
12 May 2005: created

*/

#pragma once

#include "Schema.h"
#include "visited_by.h"


namespace KShellSTEP{
namespace Part21{

class ValueSlotVisitor{
    public:
    virtual void handle_value(const EXPRESS::Entity&, const EXPRESS::Attribute&)=0;
    virtual void handle_redefined()=0;
};

typedef visited_by<ValueSlotVisitor> ValueSlot;
typedef vector< shared_ptr<ValueSlot> > ValueSlotVector;

typedef pair<string, ValueSlotVector> InternalMappingType;
typedef map<string, ValueSlotVector>  ExternalMappingType;

class InstanceMappingVisitor{
    public:
    virtual ~InstanceMappingVisitor(){
    }
    virtual void handle_internal(const InternalMappingType&) =0;
    virtual void handle_external(const ExternalMappingType&) =0;
};

typedef visited_by<InstanceMappingVisitor> InstanceMapping;

class ExchangeSchema:public EXPRESS::Schema{
	public:
	virtual InstanceMapping& mapping(const EXPRESS::EntitySet&)=0;
};


}
}
