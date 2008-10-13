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
Declare the interface for the class which provides for creating AttributeValue objects, as well
as for make Instance identifiers

History:
 6 Jun 2005: created

Documentation:
This interface is a merger of two previously defined AttributeValueManager and InstanceManager
*/


#pragma once

#include "AttributeValue.h"
#include "Schema.h"
#include "InstanceID.h"

namespace KShellSTEP{
namespace Part21{


class ExchangeDataManager{
	public:
	static auto_ptr<ExchangeDataManager> make();

	virtual ~ExchangeDataManager(){};

	virtual AttributeValue * make_string(const string&)=0;
	virtual AttributeValue * make_integer(const long&)=0;
	virtual AttributeValue * make_boolean(const bool&)=0;
	virtual AttributeValue * make_logical(const EXPRESS::Logical&)=0;
	virtual AttributeValue * make_real(const double&)=0;
	virtual AttributeValue * make_enumeration(const EXPRESS::Enumeration::const_iterator&)=0;
	virtual AttributeValue * make_collection(const vector<AttributeValue *>&)=0;
	virtual AttributeValue * make_instance (const InstanceID&)=0;
	virtual AttributeValue * make_omitted()=0;
	virtual AttributeValue * make_aliased(const string&, AttributeValue *)=0;
	virtual AttributeValue * make_binary(const vector<bool>&) = 0;

	virtual pair<bool, InstanceID> make_ID(const string&) =0;
};

}
}
