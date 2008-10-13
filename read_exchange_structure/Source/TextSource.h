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
Declare the TextSource class, a provider of characters which keeps track of position

History:
9 Nov 2004: used as a functional include file in Token Parsing subproject
7 Feb 2005: The Text Source classes have been refactored to isolate implementation, this
interface is now highly abstract

Documentation:
The position counting algorithm is meant to be compatible with BBEdit's character position,
and the main complication is skipping over DOS line endings. If a character is reported to be at position
n, the following AppleScript will locate that character when it is in the front of BBEdit:
_
tell application "BBEdit"
	select character n of front window
end tell


*/
#pragma once

#include <fcntl.h>
#include <sys/file.h> // to get O_RDONLY



#include "InputSource.h"

using std::size_t;

namespace KShellSTEP{

int open_file_descriptor(const char*);

class fd_guard{ // used to automatically close a file_descriptor, on leaving a scope
    private:
    const int _fd;
    public:
    fd_guard(const char *fp):_fd( open_file_descriptor(fp) ){};
    ~fd_guard(){ close(_fd);}
    
    int get(){return _fd;}
};


class TextSource:public InputSource<char>{
	public:
	static const char EndOfLine;
	typedef size_t PositionType;

	virtual PositionType getPosition() const = 0;
};


auto_ptr<TextSource> makeFileTextSource(const char * path);
auto_ptr<TextSource> makeStdinTextSource();
auto_ptr<TextSource> makeFileDescriptorTextSource(int fd);

}	// close namespace

