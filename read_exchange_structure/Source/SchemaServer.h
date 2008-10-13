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
declare an interface obtaining an ExchangeSchema instance from a SchemaIdentifier

History:
 2 Jun 2005: created

Documentation:
It is up to the implementation of the make_schema_server function to define a
derived class of this that provides the functionality
*/
#pragma once
#include "SchemaIdentifier.h"
using KShellSTEP::EXPRESS::SchemaIdentifier;

#include "ExchangeSchema.h"

#include <boost/shared_ptr.hpp>
using boost::shared_ptr;

#include <boost/filesystem/path.hpp>
#include "KShellexcept.h"


namespace KShellSTEP{
namespace Part21{


class SchemaServer{
	public:
	virtual ~SchemaServer(){};
	virtual boost::filesystem::path    getSchemaPath(const SchemaIdentifier&)=0;
	virtual shared_ptr<ExchangeSchema> getSchema(const SchemaIdentifier&)=0;
};
}
}

