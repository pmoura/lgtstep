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

#include "FixedSchemaServer.h"
#include "load_exchange_schema_from_file.h"

namespace KShellSTEP{
namespace Part21{

class FixedSchemaServerImpl:public FixedSchemaServer{
	protected:
	const path schemaFilePath;
	shared_ptr<ExchangeSchema> theSchemaPtr;

	public:
	FixedSchemaServerImpl(const path& a):schemaFilePath(a){};
	
	boost::filesystem::path
	getSchemaPath(const SchemaIdentifier&){ return schemaFilePath;}
	
	shared_ptr<ExchangeSchema> getSchema(const SchemaIdentifier&){
		if (not theSchemaPtr){
			auto_ptr<ExchangeSchema> res = load_exchange_schema_from_file(
				schemaFilePath.native_file_string().c_str()
			);
			theSchemaPtr = res;
		}
		return theSchemaPtr;
	}


};


auto_ptr<SchemaServer>
FixedSchemaServer::make(const path& p){
	return auto_ptr<SchemaServer>(new FixedSchemaServerImpl(p));
}

}
}
