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
A template which defines a standard interface for the class which is
visited by a Visitor

History:
13 Feb 2005: created for use in SchemaReading

Documentation:
*/
#pragma once

namespace KShellSTEP{

template<class Visitor>
class visited_by{
	public:
	virtual ~visited_by(){};
	virtual void respond_to_visitor(Visitor&) const = 0;
};

template<class Visitor, class ForwardIterator>
void visit_every_one(Visitor& visitor, ForwardIterator ix, ForwardIterator iend){
	for (; ix != iend; ++ix)
		(**ix).respond_to_visitor(visitor);
};
}	// close KShellSTEP
