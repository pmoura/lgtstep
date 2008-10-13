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
implements the  function which parses an exchange structure (Part 21) header

History:
26 May 2005: created

Documentation:
The TokenIterator arguments are passed by reference, and will be modified (incremented)
in parsing. After reading the header the first argument will be pointing past the semicolon
following the ENDSEC keyword.
*/


#include "Header.h"
#include "read_header.h"

#include "BasicTokenTests.h"
#include "KShellexceptImpl.h"
#include "TokenListParsing.h"

#include "boost/regex.hpp"

namespace KShellSTEP{
namespace Part21{

KeyWordTest key_HEADER("HEADER");
KeyWordTest key_ENDSEC("ENDSEC");
KeyWordTest key_FILE_DESCRIPTION("FILE_DESCRIPTION");
KeyWordTest key_FILE_NAME("FILE_NAME");
KeyWordTest key_FILE_SCHEMA("FILE_SCHEMA");





class HeaderImpl:public Header{
	public:
	schema_identifiers_type _schema_identifiers;
	const schema_identifiers_type& schema_identifiers(){return _schema_identifiers;}
};

class ReadHeaderEntity{
	protected:
	HeaderImpl& myImpl;

	public:
	ReadHeaderEntity(HeaderImpl& a):myImpl(a){};
	virtual ~ReadHeaderEntity(){};
	TokenIterator parse_tokens(TokenIterator, const TokenIterator);

	protected:
	string read_literal(TokenIterator ix, TokenIterator iend){
		while (true){
			pair<bool, string> tmp = is_a_literal(*ix);
			if (not tmp.first) break;
			++ix;
			if (ix != iend) break;
			return tmp.second;
		}
		throw ExpectingLiteral( (**ix).start(), (**iend).stop());
	};

	vector<string>	read_list_of_literals(TokenIterator ix , TokenIterator iend){
		while (true){
			vector<string> retVal;
			pair<bool, TokenRange> vs = matching_parentheses(ix,iend);
			if (not vs.first) break;
			pair<bool,vector<TokenRange> > ps = split_comma_delimited_list(vs.second.begin(), vs.second.end());
			if (not ps.first) break;
			vector<TokenRange>::iterator ips = ps.second.begin();
			for (; ips != ps.second.end(); ++ips){
				retVal.push_back( read_literal( (*ips).begin(), (*ips).end() ));
			}
			return retVal;
		}
		throw ExpectingListOfLiterals((**ix).start(), (**iend).stop());
	}


	private:
	virtual void handle_label(TokenIterator)=0;
	virtual void handle_attribute(unsigned int, TokenIterator, const TokenIterator) = 0;
};




class ReadFileDescription:public ReadHeaderEntity{
	public:
	ReadFileDescription(HeaderImpl& a): ReadHeaderEntity(a){};
	void handle_label(TokenIterator){return;	}
	void handle_attribute(unsigned int , TokenIterator, const TokenIterator){return;}
};

class ReadFileName:public ReadHeaderEntity{
	public:
	ReadFileName(HeaderImpl& a): ReadHeaderEntity(a){};
	void handle_attribute(unsigned int , TokenIterator, const TokenIterator){};
	void handle_label(TokenIterator){return;}
};



class ReadFileSchema:public ReadHeaderEntity{
	public:
	ReadFileSchema(HeaderImpl& a): ReadHeaderEntity(a){};
	void handle_attribute(unsigned int n, TokenIterator ix, const TokenIterator iend){
		switch (n){
			case 0:
				vector<string> sids = read_list_of_literals(ix,iend);
				vector<string>::iterator isid = sids.begin();
				for (; isid != sids.end(); ++isid){
					auto_ptr<SchemaIdentifier> tmp = KShellSTEP::EXPRESS::SchemaIdentifier::make(*isid);
					shared_ptr<SchemaIdentifier> tmp2(tmp);
					myImpl._schema_identifiers.push_back(tmp2);
				}
				break;
		}
	};

	void handle_label(TokenIterator ix){
		if (not key_FILE_SCHEMA(*ix))
			throw ExpectingHeaderEntity(key_FILE_SCHEMA.key(), (**ix).start(), (**ix).stop());
	}

};

TokenIterator
ReadHeaderEntity::parse_tokens(TokenIterator ix, const TokenIterator iend){
	handle_label(ix);
	++ix;

	pair<bool, TokenRange> res = matching_parentheses(ix,iend);
	if (not res.first) throw ExpectingParentheses( (**ix).start() );

	pair<bool, vector<TokenRange> > res2 = 
    split_comma_delimited_list(res.second.begin(),res.second.end());
	if (not res2.first) throw ExpectingParentheses( (**res.second.begin()).start() );

	int n = 0;
	vector<TokenRange>::iterator itr = res2.second.begin();
	for (; itr != res2.second.end(); ++itr,++n){
		handle_attribute(n, (*itr).begin(), (*itr).end());
	}

	ix = res.second.end();	// now pointing to right parentheses
	++ix;										// pointing past, should be a semicolon

	++ix;										// now pointing to the "end" of this header entity (and start of the next)
	return ix;
}

void check_end(TokenIterator ix, TokenIterator iend){
	if (ix == iend)
		throw UnexpectedEndOfHeader( (**ix).start() );
}

TokenIterator
find_next_semicolon(TokenIterator ix,const TokenIterator iend){
	while (true){
		++ix;
		check_end(ix,iend);
		if (is_a_semicolon(*ix))
			return ix;
	}
}

auto_ptr<Header>
read_header(TokenIterator& ix , const TokenIterator& iend){
	check_end(ix,iend);
	if (not key_HEADER(*ix))
		throw ExpectingKeyword(key_HEADER.key(), (**ix).start(), (**ix).stop());
	++ix;
	check_end(ix,iend);
	if (not is_a_semicolon(*ix))
		throw ExpectingSemicolon((**ix).start());
	++ix;
	check_end(ix,iend);	// now should be pointing at the first entity

	auto_ptr<HeaderImpl> temp(new HeaderImpl());
	HeaderImpl& impl = *temp;
	vector<shared_ptr<ReadHeaderEntity> > predefined_entities;
	shared_ptr<ReadHeaderEntity> _t;

	_t.reset(new ReadFileDescription(impl));
	predefined_entities.push_back(_t);
	_t.reset(new ReadFileName(impl));
	predefined_entities.push_back(_t);
	_t.reset(new ReadFileSchema(impl));
	predefined_entities.push_back(_t);

	vector<shared_ptr<ReadHeaderEntity> >::const_iterator ient = predefined_entities.begin();
	for (; ient != predefined_entities.end(); ++ient){
		TokenIterator ic = find_next_semicolon(ix,iend);
		(**ient).parse_tokens(ix,ic);
		ix = ic;
		++ix;
		check_end(ix,iend);
	}

	while (true){
		check_end(ix,iend);
		if (key_ENDSEC(*ix)){
			++ix;
			check_end(ix,iend);
			if (not is_a_semicolon(*ix))
				throw ExpectingSemicolon( (**ix).start() );
			++ix;
			break;
		}

		throw ExpectingHeaderEntity("user defined", (**ix).start(), (**ix).stop() );
	}

	auto_ptr<Header> retVal(temp);
	return retVal;
}

}
}
