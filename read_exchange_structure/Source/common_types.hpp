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
#include <stdexcept>
using std::logic_error;

#include <vector>
#include <map>
#include <string>
#include <memory>
#include <utility>

using std::string;
using std::auto_ptr;
using std::vector;
using std::pair;
using std::map;

using namespace std::rel_ops;

//#include "auto_vector.h"
#include <boost/shared_ptr.hpp>
using boost::shared_ptr;
#include <boost/scoped_ptr.hpp>
using boost::scoped_ptr;
#include <boost/weak_ptr.hpp>
using boost::weak_ptr;

