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
declare the interface for the structure which stores exchange structure header information

History:
26 May 2005: created

Documentation:
As of 26 May is an incomplete version, only includes header information from FILE_DESCRIPTION and
FILE_SCHEMA entities.
*/


#pragma once
#include "visited_by.h"

#include "SchemaIdentifier.h"
using KShellSTEP::EXPRESS::SchemaIdentifier;



namespace KShellSTEP{
namespace Part21{



class Header{
	public:
	typedef vector<shared_ptr<SchemaIdentifier> > schema_identifiers_type;
	virtual const schema_identifiers_type& schema_identifiers() = 0;
};

}
}
