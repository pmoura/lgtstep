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
#include "EntityFilterChoice.h"
#include <cctype>
#include <boost/format.hpp>

namespace KShellSTEP{
namespace Part21{

EntityFilterChoice::EntityFilterChoice(const vector<string>& a):entity_names_to_skip(a){
	// convert to upper case
	vector<string>::iterator ix = entity_names_to_skip.begin();
	for (; ix != entity_names_to_skip.end(); ++ix){
		string::iterator ic = ix -> begin();
		for (; ic != ix->end(); ++ic)
			*ic = std::toupper(*ic);
	}
};

void
EntityFilterChoice::start_datamodel(ExchangeSchema& schema){
	entities_to_skip = EntitySet();	// clear
	vector<string>::const_iterator ix = entity_names_to_skip.begin();
	for (; ix != entity_names_to_skip.end(); ++ix){
		Schema::entity_iterator ie = schema.entities().find(*ix);
		if (ie == schema.entities().end()){
			boost::format errFormat("entity %s not found in schema %s (for filtering)");
			string errMessage = str( errFormat % *ix % schema.name() );
			throw logic_error(errMessage.c_str());
		}
		entities_to_skip += ie;
	}
}

bool
EntityFilterChoice::start_instance(const EntitySet& eset, const InstanceID&){
	return entity_set_intersection(eset,entities_to_skip).empty();
}


}
}
