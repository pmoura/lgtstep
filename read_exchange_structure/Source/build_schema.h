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
Declare the function which constructs a schema from items returned from read_schema

History:
8 Mar 2005: created

Documentation:
*/
#pragma once

#include "ExchangeSchema.h"
#include "read_schema.h"

namespace KShellSTEP{
namespace Part21{
auto_ptr<ExchangeSchema>
build_exchange_schema(const pair<string, SchemaReading::itemList>&);
}
}
