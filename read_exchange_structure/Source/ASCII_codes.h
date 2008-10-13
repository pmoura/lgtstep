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
Declare common names for ASCII characters
History:
9 Nov 2004: used as a functional include file in Token Parsing subproject

Documentation:

*/

#pragma once

namespace KShellSTEP{

const char Apostrophe=39;		// '
const char Ampersand=38;		// &
const char Comma=44;			// ,
const char Colon=58;			// :
const char Semicolon=59;		// ;
const char Slash=47;			// / (the comment slash)
const char BackSlash=92;		// (the other slash, which indicates C line continuation)
const char Space=32;			// blank space
const char LeftParenthesis=40;
const char RightParenthesis=41;
const char Asterix=42;
const char DollarSign=36;
const char CrossHatch=35;		// #
const char Underscore=95;
const char Period=46;
const char EqualSign=61;
const char LessSign=60;		// <
const char GreaterSign=62;		// >
const char QuestionMark=63;	//?
const char QuoteMark=34;		//"

const char PlusSign=43;
const char MinusSign=45;

const char LeftSquareBracket=91;	// [
const char RightSquareBracket=93;	// ]
const char LeftBracket=123;		// {
const char RightBracket=125;		// }

const char VerticalSlash=124;		// |

const char Hyphen=45;			// same as MinusSign

const char Newline = 10;
const char Return = 13;
}						// close namespace
