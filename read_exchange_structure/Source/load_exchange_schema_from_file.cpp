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
implement a function which reads a schema file

History: 
 2 Jun 2005: created 

Documentation: 

*/


#include "load_exchange_schema_from_file.h"

#include "TextSource.h"
#include "EXPRESS_TokenSource.h"
#include "CharTokenList.h"
#include "read_schema.h"
#include "build_schema.h"

using KShellSTEP::SchemaReading::item;
using KShellSTEP::SchemaReading::read_schema;

namespace KShellSTEP{
namespace Part21{
auto_ptr<ExchangeSchema> load_exchange_schema_from_file(const char * pathname){
	auto_ptr<TextSource> _t = makeFileTextSource(pathname);
	
	TextSource& infile = *_t;

	EXPRESS_TokenSource f(infile);
	CharTokenList cl(f);
	TokenIterator ix(  cl.begin());
	TokenIterator iend(cl.end()  );
	
	pair<string, SchemaReading::itemList> res = SchemaReading::read_schema(ix,iend);
	auto_ptr<ExchangeSchema> schema_ptr = build_exchange_schema(res);
	return schema_ptr;
}	// close function
}
}
