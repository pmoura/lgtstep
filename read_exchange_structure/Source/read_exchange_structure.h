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
To declare the function that reads a Part 21 exchange structure, with derived classes to
provide ExchangeDataManager classes and SchemaServer classes

History:
11 Jun 2005: created

Documentation:

*/


#pragma once
#include "TextSource.h"

#include "Header.h"
#include "InstanceID.h"
#include "ExchangeSchema.h"
#include "ExchangeDataManager.h"

namespace KShellSTEP{
namespace Part21{

using namespace KShellSTEP::EXPRESS;

class ReadModelConfig{
  private:
  ExchangeDataManager* _dmg;
  ExchangeSchema* _es;
  bool res;
  public:
  ReadModelConfig():res(false){};
  ReadModelConfig(ExchangeDataManager& a, ExchangeSchema& b):_dmg(&a),_es(&b),res(true){};
  
  ExchangeDataManager& data_manager(){return *_dmg;}
  ExchangeSchema& schema(){return *_es;}
  operator bool() {return res;}
};

class ExchangeStructureHandler{
	public:
	virtual ~ExchangeStructureHandler(){};

	virtual bool		        start_structure(Header&)=0;
	virtual ReadModelConfig start_datamodel()=0;
	virtual bool		        start_instance(const EntitySet&, const InstanceID&)=0;
	virtual void		        attribute(const Entity&, const Attribute&,const AttributeValue*)=0;
	virtual void		        end_instance()=0;
	virtual void		        end_datamodel()=0;
	virtual void		        end_structure()=0;
};

void read_exchange_structure(TextSource&, ExchangeStructureHandler&);

}
}
