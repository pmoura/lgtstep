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
#include "SetsBaseExchangeStructureHandler.h"


using std::endl;
namespace KShellSTEP{
namespace Part21{




SetsBaseExchangeStructureHandler::SetsBaseExchangeStructureHandler(	SchemaServer& ss,
																																		StructureChoice& sc,
																																		ModelChoice& mc,
																																		InstanceChoice& ic,
																																		ostream& _os):
	BaseExchangeStructureHandler(ss,sc,mc,ic),
	os(_os){};




void
SetsBaseExchangeStructureHandler::end_structure(){
	InstanceClassMapType::const_iterator ix = classes_map.begin();
	for (; ix != classes_map.end(); ++ix){
		InstanceClass& theInstanceClass = *(ix->second);
		const EntitySet& theSet = ix->first;

		EntitySet::const_iterator iz = theSet.begin();
		for (; iz != theSet.end(); ++iz)
			os << (**iz).name << ' ';

		os << theInstanceClass.instances.size() << std::endl;
	}
}



}
}
