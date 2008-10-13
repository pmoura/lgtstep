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
Declare and define a class which implements the virtual interface of TextSource,
it needs a memory buffer of characters

History:
7 Feb 2005: Used


*/


#include "TextSource.h"
#include <boost/shared_array.hpp>

namespace KShellSTEP{

typedef boost::shared_array<char> auto_buffer;

class BufferTextSource:public TextSource{
    private:
    auto_buffer ibegin;
    char *			 iend;
    char * ptr;
    PositionType pos;
    bool CR;

    public:
    BufferTextSource(auto_buffer& buf, std::size_t buf_size):
        ibegin(buf),
        pos(0),
        CR(false){
        	ptr = ibegin.get();
        	iend = ptr+ buf_size;
        };

//     void Reset(){
//         ptr = ibegin.get();
//         pos = 0;
//         CR = false;}

    PositionType getPosition() const{ return pos;}

    bool getOne(char& c){
        if (ptr == iend) return false;
        c = *ptr++;

        if (CR && (c == 0x0A)){	// indicates a DOS end of line combination
            if (ptr == iend) return false;
            c = *ptr++;
        }

        if (c == 0x0D){
            CR = true;
            c = '\n';
        }
        else{
            CR = false;
            if (c == 0x0A) c = '\n';
        }
        ++pos;
        return true;
    }

};
}
