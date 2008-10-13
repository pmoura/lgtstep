/*
Copyright (C) 2007  Vincent Marchetti

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

Purpose:
implements IConv, a C++ wrapper class for the iconv family of C functions, which allow for converting
among encodings of unicode strings.

History:
27 Mar 2007: created

Documentation:
*/

#include <errno.h>
#include "IConvClass.h"
#include <boost/format.hpp>

namespace KShellSTEP{

iconv_error::iconv_error(int _errno, int _input_offset):
	error_code(_errno),
	input_offset(_input_offset),
	logic_error("iconv error"){
		switch (_errno){
			case EILSEQ: error_msg.assign("iconv: invalid input sequence");break;
			case EINVAL: error_msg.assign("iconv: incomplete input sequence");break;
			default:{
				boost::format msg("iconv: error code: %i");
				error_msg.assign( str( msg % _errno ) );
			}
		}
	};


IConv::IConv(const char * to_enc, const char * from_enc){
	iconv_t res = iconv_open(to_enc, from_enc);
	if (res == (iconv_t)(-1)) {
	    boost::format msg("iconv: failur on open; code: %i");
		throw std::logic_error( str( msg % errno ) );
	}
	iconv_id = res;
};

class char_buff_guard{
	private:
	char * p;
	public:
	char_buff_guard(char * a):p(a){};
	~char_buff_guard(){ delete[] p; };
	void reset(char *a){ delete [] p; p = a;}
};
	
	
std::auto_ptr< std::vector<char> >
IConv::operator()(const std::vector<char>& inp){
	
	char * inBytes = new char[inp.size()];
	if (inBytes == NULL) throw std::bad_alloc();
	char_buff_guard _inp_g(inBytes);
	
	std::copy(inp.begin(), inp.end(), inBytes);
	
	size_t outBytesSize = 4 * inp.size();
	char * outBytes = new char[outBytesSize];
	if (outBytes == NULL) throw std::bad_alloc();
	char_buff_guard _outp_g(outBytes);
	
	size_t inBytesLeft( inp.size() );
	size_t outBytesLeft( outBytesSize );


	// The iconv library whose interface is declared in iconv.h is used to handle unicode conversions
	// There are, however, two differing "standard" definitions out there, which differ in the signature
	// of the iconv function. They differ in whether or not the second argument is declared 'const'
	// 
	// From version 0x0109 included in the gnu LIBICONV library have the declaration:
	// extern size_t iconv (iconv_t cd, const char* * inbuf, size_t *inbytesleft, char* * outbuf, size_t *outbytesleft);
	// 
	// while from 0x010B have:
	// extern size_t iconv (iconv_t cd,  char* * inbuf, size_t *inbytesleft, char* * outbuf, size_t *outbytesleft);
	// 
	// To accommodate these differing definitions: use the compile time preprocessor macro ICONV_CONST_ARG2
	// It should be set to 1 if this systems iconv.h declaration is like that of version 0109 above, and ICONV_CONST_ARG2
	// should be 0 if the declaration is like that of 010B above.
	// 
    // The default is for ICONV_CONST_ARG2 to be 1

    #ifndef ICONV_CONST_ARG2
    #define ICONV_CONST_ARG2 1
    #endif
    
    #if ICONV_CONST_ARG2
    const char * inptr(inBytes);
    #else
    char * inptr(inBytes);
    #endif
	
	char * out_ptr( outBytes );
	
	while (1){
		size_t res = iconv(iconv_id, &inptr ,&inBytesLeft,&out_ptr,&outBytesLeft);
		if (res != (size_t)(-1) and inBytesLeft == 0) break;
		if (res == (size_t)(-1)){
			if (errno == E2BIG){	// need to expand output buffer and continue
				size_t output_offset(out_ptr-outBytes);
				outBytesSize += 4 * inBytesLeft;
				char * p = new char[outBytesSize];
				if (p == NULL) throw std::bad_alloc();
				try{
					std::copy(outBytes, out_ptr, p);
				}
				catch(...){
					delete[] p;
					throw;
				}
				
				
				_outp_g.reset(p);
				outBytes = p;
				out_ptr = outBytes + output_offset;
				outBytesLeft = outBytesSize - output_offset;
			}
			else
				throw iconv_error(errno, inp.size() - inBytesLeft);
		}
		else
			throw std::logic_error("unknown output state of iconv");
	}
	
	std::auto_ptr< std::vector<char> > retVal(
		new std::vector<char>(out_ptr-outBytes,'\0')
	);
	

	std::copy(outBytes, out_ptr, (*retVal).begin() );
	return retVal;
};

IConv::~IConv(){
	try{
		iconv_close(iconv_id);
	}
	catch(...){};
};

}
