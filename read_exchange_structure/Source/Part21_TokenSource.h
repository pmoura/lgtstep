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
Copyright ©  2004 Vincent Marchetti All rights reserved

Purpose:
Declares the derived class of TokenSource which breaks an Part 21 STEP data model file into chunks, including interpreting
literal string and comments correctly

History:
9 Nov 2004: used as a functional include file in Token Parsing subproject

Documentation:

*/


#include "TokenSource.h"
#include "IConvClass.h"

namespace KShellSTEP{

class Part21_TokenSource:public TokenSource{
	public:
	Part21_TokenSource(TextSource&);

	protected:
	IConv ucs4_to_utf8;
	IConv latin1_to_utf8;
	void skip_white_space();
	bool read_delimiter_token	(auto_ptr<CharTokenImpl>&);
	bool read_literal_token		(auto_ptr<CharTokenImpl>&);
	bool read_word_token			(auto_ptr<CharTokenImpl>&);
};
}		// close namespace
