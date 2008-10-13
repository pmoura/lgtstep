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
Declares the class which implements ExchangeSchema functionality

History:
12 May 2005: created

Documentation:

*/

#pragma once

#include "ExchangeSchema.h"
#include <boost/scoped_array.hpp>
#include <boost/scoped_ptr.hpp>

namespace KShellSTEP{
namespace EXPRESS{



class inheritance{
    public:
    struct link{
        EntityPtr prim;
        EntityPtr seco;
        unsigned int aux;
    };
    protected:
    unsigned int number_of_links;
    boost::scoped_array<link> links;
    
    public:
    inheritance(const vector<link>&);
    
    
    vector<EntityPtr> direct_links(const EntityPtr&);
    EntitySet inheritance_set(const EntitySet&);
    EntitySet extrema_set(const EntitySet&);
};


}}

namespace KShellSTEP{
namespace Part21{

typedef map<EXPRESS::EntitySet, shared_ptr<InstanceMapping> > MappingCacheType;

class ExchangeSchemaImpl:public ExchangeSchema{
	private:
	boost::scoped_ptr< indexed_array<EXPRESS::Entity> > _entities;
    boost::scoped_ptr<EXPRESS::inheritance> super_inheritance;
    boost::scoped_ptr<EXPRESS::inheritance> sub_inheritance;
    const string _name;
    
	MappingCacheType mapping_cache;

	public:
	ExchangeSchemaImpl( const string& nm,
	                    auto_ptr< indexed_array<EXPRESS::Entity> > ent,
	                    auto_ptr<EXPRESS::inheritance>& super_inh,
	                    auto_ptr<EXPRESS::inheritance>& sub_inh );
	   
	const string& name() const{ return _name;}
	indexed_array<EXPRESS::Entity>& entities() const{return *_entities;}
	
	EXPRESS::EntitySet up_set(const EXPRESS::EntitySet&) const;
    EXPRESS::EntitySet down_set(const EXPRESS::EntitySet&) const;
    EXPRESS::EntitySet minima(const EXPRESS::EntitySet&) const;
    EXPRESS::EntitySet maxima(const EXPRESS::EntitySet&) const;

	InstanceMapping& mapping(const EXPRESS::EntitySet&);

	protected:
	friend class internal_mapping_function;
	vector<EXPRESS::EntityPtr>      parent_entities(EXPRESS::EntityPtr);
	auto_ptr<InternalMappingType>   internal_mapping(const EXPRESS::Entity&);
	auto_ptr<ExternalMappingType>   external_mapping(const EXPRESS::EntitySet&);

};

}
}
