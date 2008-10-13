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
To implement the function that reads a Part 21 exchange structure, with derived classes to
provide ExchangeDataManager classes and SchemaServer classes

History:
11 Jun 2005: created

Documentation:

*/

/* -------------------------------------------------------------------------------*/
#include "read_exchange_structure.h"

namespace KShellSTEP{
namespace Part21{
class ExchangeSchemaReference{
    public:
    virtual ExchangeSchema& schema() = 0;
};

class DataManagerReference{
    public:
    virtual ExchangeDataManager& data_manager() = 0;
};

class ExchangeStructureHandlerReference{
    public:
    virtual ExchangeStructureHandler& exchange_structure_handler() = 0;
};
}}

/* -------------------------------------------------------------------------------*/

#include "CharTokenList.h"

namespace KShellSTEP{
namespace Part21{
typedef pair<string, TokenRange> InternalEncodingType;
typedef map<string, TokenRange>  ExternalEncodingType;

class EncodingVisitor{
    public:
    virtual void handle_internal(const InternalEncodingType&) = 0;
    virtual void handle_external(const ExternalEncodingType&) = 0;
};

typedef visited_by<EncodingVisitor> Encoding;

class EncodingMappingDispatch:protected EncodingVisitor{
    protected:
    const InstanceMapping * mapping;
    protected:
    virtual void handle_internal2(const InternalEncodingType&, const InternalMappingType&) = 0;
    virtual void handle_external2(const ExternalEncodingType&, const ExternalMappingType&) = 0;
    
    protected:
    void dispatch(const Encoding& _enc, const InstanceMapping& _map){
        mapping = &_map;
        EncodingVisitor& self(*this);
        _enc.respond_to_visitor(self);
    }
};

class _InternalEncoding:    private virtual EncodingMappingDispatch,
                            private  InstanceMappingVisitor{
    private:
    const InternalEncodingType * encoding;
    public:
    void handle_internal(const InternalEncodingType& _enc){
        encoding = &_enc;
        InstanceMappingVisitor& self(*this);
        mapping->respond_to_visitor(self);
    }
    
    void handle_internal(const InternalMappingType& _mapt){
        handle_internal2( *encoding, _mapt);
    }
    
    void handle_external(const ExternalMappingType&){
        throw logic_error("encoding mapping mismatch");
    }
};

class _ExternalEncoding:    private virtual EncodingMappingDispatch,
                            private  InstanceMappingVisitor{
    private:
    const ExternalEncodingType * encoding;
    
    public:
    void handle_external(const ExternalEncodingType& _enc){
        encoding = &_enc;
        InstanceMappingVisitor& self(*this);
        mapping->respond_to_visitor(self);
    }
    
    void handle_external(const ExternalMappingType& _mapt){
        handle_external2( *encoding, _mapt);
    }
    
    void handle_internal(const InternalMappingType&){
        throw logic_error("encoding mapping mismatch");
    }
};

class Encoding_Mapping_Visitor: public virtual EncodingMappingDispatch,
                                private _InternalEncoding,
                                private _ExternalEncoding
                                {};

}}

/* -------------------------------------------------------------------------------*/

namespace KShellSTEP{
namespace Part21{

class unknown_entity_name: public std::exception{
    public:
    string uname;
    unknown_entity_name(const string& a): uname(a){};
    ~unknown_entity_name() throw(){};
};

class ExtractEntitySet:private EncodingVisitor, private virtual ExchangeSchemaReference{
    public:
    /* returns the up-set of all the entities referenced in the encoding */
    EntitySet extract_entity_set(const Encoding&);
    private:
    EntitySet result;
    virtual void handle_internal(const InternalEncodingType&);
    virtual void handle_external(const ExternalEncodingType&);
};

EntitySet
ExtractEntitySet::extract_entity_set(const Encoding& enc){
  result=EntitySet();
  EncodingVisitor& self(*this);
  enc.respond_to_visitor(self);
  return schema().up_set(result);
}

void
ExtractEntitySet::handle_internal(const InternalEncodingType& enc){
  EXPRESS::Schema::entity_iterator ient = schema().entities().find( enc.first );
  if (ient == schema().entities().end()) throw unknown_entity_name(enc.first);
  result += ient;
}

void
ExtractEntitySet::handle_external(const ExternalEncodingType& enc){
  ExternalEncodingType::const_iterator iz = enc.begin();
  for (; iz != enc.end(); ++iz){
    EXPRESS::Schema::entity_iterator ient = schema().entities().find( iz->first );
    if (ient == schema().entities().end()) throw unknown_entity_name(iz->first);
    result += ient;
  }
}


}}

/* -------------------------------------------------------------------------------*/
#include <stack>

namespace KShellSTEP{
namespace Part21{

class TokenRangeBase{
    private:
    std::stack<TokenRange> stk;
    
    protected:
    void  set_token_range(const TokenIterator& a, const TokenIterator& b){
      stk.push(TokenRange(a,b));
    }    
    void release_token_range(){stk.pop();}
    
    const TokenIterator& ix(){return stk.top().begin();}
    const TokenIterator& iend(){return stk.top().end();}
};

class AttributeValueReader: private TokenRangeBase,
                            private EXPRESS::AttributeTypeVisitor,
                            private virtual DataManagerReference{
	private:
	AttributeValue * result;

	TokenIterator _ix;
	TokenIterator _iend;

	public:
	pair<bool, AttributeValue*> read_attribute_value(TokenIterator, const TokenIterator, const EXPRESS::AttributeType&);

	private:
  void handle_instance();

  void handle_collection(const EXPRESS::AttributeType&);
  void handle_array_optional(const EXPRESS::AttributeType&);

  void handle_enumeration(const EXPRESS::Enumeration&);
  void handle_aliased(const string&, const EXPRESS::AttributeType&);
  void handle_multiple(const vector<shared_ptr<EXPRESS::AttributeType > >&);

  void handle_string();
  void handle_boolean();
  void handle_binary();
  void handle_integer();
  void handle_logical();
  void handle_number();
  void handle_real();
  
  void handle_collection(const EXPRESS::AttributeType&, bool);
};

pair<bool, string> read_enumeration_value(TokenIterator, const TokenIterator&);
bool is_omitted_value(const CharToken& tok);

}}

/* -------------------------------------------------------------------------------*/

#include "CharTokenList.h"
#include "BasicTokenTests.h"
#include "TokenListParsing.h"
#include "KShellexceptImpl.h"

namespace KShellSTEP{
namespace Part21{
class eos:public std::exception{};
inline void check_end(const TokenIterator& ix, const TokenIterator& iend){
	if (ix == iend) throw eos();
};
}}

/* -------------------------------------------------------------------------------*/
namespace KShellSTEP{
namespace Part21{

#ifdef KSHELLSTEP_ALL_VALUES_OPTIONAL
const bool all_values_optional(KSHELLSTEP_ALL_VALUES_OPTIONAL);
#else
const bool all_values_optional(false);
#endif


class bad_instance_id: public std::exception{};

class ReadInstanceID: private virtual DataManagerReference{
    public:
    InstanceID read_instanceId(const CharToken& tok);
};

InstanceID
ReadInstanceID::read_instanceId(const CharToken& tok){
  pair<bool, string> res = is_a_word(tok);
  if (not res.first) throw bad_instance_id();
  pair<bool, InstanceID> tmp = data_manager().make_ID(res.second);
  if (not tmp.first) throw bad_instance_id();
  return tmp.second;
}
  
class ReadAttributeSlot:    private ValueSlotVisitor,
                            private AttributeValueReader,
                            private virtual DataManagerReference,
                            private virtual ExchangeStructureHandlerReference
                            {
  private:
  TokenIterator ix;
  TokenIterator iend;
  
  public:
  void read_attribute_slot(const TokenIterator&, const TokenIterator&, const ValueSlot&);
  
  private:
  /* ValueSlotVisitor functions */
  void handle_value(const EXPRESS::Entity&, const EXPRESS::Attribute&);
  void handle_redefined();
};

void 
ReadAttributeSlot::read_attribute_slot(const TokenIterator& _ix, const TokenIterator& _iend, const ValueSlot& vs){
  ix = _ix;
  iend = _iend;
  ValueSlotVisitor& self(*this);
  vs.respond_to_visitor(self);
}


void
ReadAttributeSlot::handle_value(const EXPRESS::Entity& ent, const EXPRESS::Attribute& att){
  AttributeValue * val(NULL);
  
  if ( (all_values_optional or att.optional) and is_omitted_value(*ix))
    val = data_manager().make_omitted();
  else{
    pair<bool, AttributeValue *> res = read_attribute_value(ix,iend, *(att.type));
    if (not res.first){
      string attr_string = EXPRESS::attribute_type_to_string(*(att.type));
      throw ValueReadingError(attr_string, (**TokenIterator(ix)).start(), (**TokenIterator(iend)).stop());
    }
    val = res.second;
  }
  exchange_structure_handler().attribute(ent, att, val);
  return;
}

void
ReadAttributeSlot::handle_redefined(){
  return;
};

class external_encoding_error: public std::exception{};

class InstanceReader:   private virtual ExchangeSchemaReference,
                        private virtual ExchangeStructureHandlerReference,
                        private ExtractEntitySet,
                        private ReadInstanceID,
                        private Encoding_Mapping_Visitor,
                        private ReadAttributeSlot{
  private:
  ExchangeSchema& es;
  ExchangeStructureHandler& esh;
  ExchangeDataManager& edm;
  
  public:
  InstanceReader(ExchangeStructureHandler& _esh, ExchangeSchema& _es, ExchangeDataManager& _edm):
    es(_es),esh(_esh),edm(_edm){};
  void read_instance(TokenIterator, const TokenIterator&);
  
  ExchangeSchema& schema(){return es;}
  ExchangeStructureHandler& exchange_structure_handler(){return esh;}
  ExchangeDataManager& data_manager(){return edm;}
  
  void handle_internal2(const InternalEncodingType&, const InternalMappingType&);
  void handle_external2(const ExternalEncodingType&, const ExternalMappingType&);

  
  private:
  auto_ptr<Encoding> read_encoding(TokenIterator, const TokenIterator&);
  void read_list_of_values(TokenIterator, TokenIterator, const ValueSlotVector&);
};


class InternalEncoding:public Encoding{
  public:
  InternalEncodingType enc;
  public:
  InternalEncoding(const string& s, const TokenRange& r): enc(s,r){};
  void respond_to_visitor(EncodingVisitor& x) const{ x.handle_internal(enc);}
};

class ExternalEncoding:public Encoding{
  public:
  ExternalEncodingType enc;
  public:
  void respond_to_visitor(EncodingVisitor& x) const{ x.handle_external(enc);}
};



auto_ptr<Encoding> 
InstanceReader::read_encoding(TokenIterator ix, const TokenIterator& iend){
  auto_ptr<Encoding> retVal;
  
  while (true){
    pair<bool, string> res = is_a_word(*ix);
    if (res.first){
      ++ix;
      pair<bool, TokenRange> res2=matching_parentheses(ix,iend);
      if (not res2.first)  throw ExpectingValues( (**TokenIterator(ix)).start(), (**TokenIterator(iend)).stop() );
      retVal = auto_ptr<Encoding>(new InternalEncoding(res.second, res2.second));
      break;
    }
    
    pair<bool, TokenRange> eres = matching_parentheses(ix, iend);
    if (eres.first){
      auto_ptr<ExternalEncoding> ie(new ExternalEncoding());
      TokenIterator jx = eres.second.begin();
      TokenIterator jend = eres.second.end();
      while(jx != jend){
        pair<bool, string> tname = is_a_word(*jx);
        if (not tname.first) throw ExpectingEntityName((**TokenIterator(jx)).start(), (**TokenIterator(jx)).stop() );
        ++jx;
        pair<bool, TokenRange> tpar = matching_parentheses(jx, jend);
        if (not tpar.first) throw ExpectingValues( (**TokenIterator(jx)).start(), (**TokenIterator(jend)).stop() );;
        
        ie->enc.insert(
          ExternalEncodingType::value_type( tname.second, tpar.second )
        );
        jx = tpar.second.end();
        ++jx;
      }
      retVal = auto_ptr<Encoding>(ie);
      break;
    }
    throw InstanceReadingError( (**TokenIterator(ix)).start(), (**TokenIterator(iend)).stop() );
  }
  return retVal;
}


void 
InstanceReader::handle_internal2(const InternalEncodingType& enc, const InternalMappingType& mapt){
  const TokenRange& tr = enc.second;
  const ValueSlotVector& vsv = mapt.second;
  read_list_of_values(tr.begin(), tr.end(), vsv);
}

void 
InstanceReader::read_list_of_values(TokenIterator ix, TokenIterator iend, const ValueSlotVector& vsv){
  pair<bool, vector<TokenRange> > res = split_comma_delimited_list(ix,iend);
  if (not res.first) throw ExpectingListOfValues((**TokenIterator(ix)).start(),(**TokenIterator(iend)).stop() );
  vector<TokenRange>& token_ranges = res.second;
  
  if (token_ranges.size() != vsv.size()) 
    throw EncodingMismatch( vsv.size(), token_ranges.size(),(**TokenIterator(ix)).start(),(**TokenIterator(iend)).stop());
  
  ValueSlotVector::const_iterator iv = vsv.begin();
  vector<TokenRange>::const_iterator itr = token_ranges.begin();
  for (; iv != vsv.end(); ++iv, ++itr) read_attribute_slot(itr->begin(), itr->end(), **iv);
}

void
InstanceReader::handle_external2(const ExternalEncodingType& enc, const ExternalMappingType& mapt){
  if (enc.size() != mapt.size()) throw external_encoding_error(); /* a mismatch error */
  
  ExternalEncodingType::const_iterator ip = enc.begin();
  for (; ip != enc.end(); ++ip){
    ExternalMappingType::const_iterator im = mapt.find( ip-> first );
    if (im == mapt.end()) throw external_encoding_error(); /* a mismatch error */
    const TokenRange& tr = ip->second;
    const ValueSlotVector& vsv = im->second;
    read_list_of_values(tr.begin(), tr.end(), vsv);
  }
}




void
InstanceReader::read_instance(TokenIterator ix, const TokenIterator& iend){
  try{
    InstanceID instanceID = read_instanceId(*ix);

    ++ix; check_end(ix,iend);	// should be the "equals" sign
    if (not is_equal_sign(*ix)){
      throw ExpectingEquals( (**ix).start() );
    }
    ++ix; check_end(ix,iend);	// advance to start of attributes
  
    auto_ptr<Encoding> encoding = read_encoding(ix, iend);
  
    EntitySet entities = extract_entity_set(*encoding);
    
    if (exchange_structure_handler().start_instance(entities, instanceID)){
      InstanceMapping& mapping = schema().mapping(entities);
      dispatch(*encoding, mapping);
      exchange_structure_handler().end_instance();
    }
  }
  catch(unknown_entity_name uen){
    throw UnknownEntityName(uen.uname, (**TokenIterator(ix)).start(), (**TokenIterator(iend)).stop());
  }
  catch(bad_instance_id&){
    throw ExpectingInstanceID((**TokenIterator(ix)).start(), (**TokenIterator(ix)).stop());
  }
  catch(external_encoding_error&){
    throw ExternalEncodingError((**TokenIterator(ix)).start(), (**TokenIterator(ix)).stop());
  }
};

}}

/* -------------------------------------------------------------------------------*/

#include "read_exchange_structure.h"

#include "Part21_TokenSource.h"
#include "read_header.h"
#include "ASCII_codes.h"


namespace KShellSTEP{
namespace Part21{

using namespace KShellSTEP::EXPRESS;

KeyWordTest key_DATA("DATA");
KeyWordTest key_ENDSECT("ENDSEC");


/*
following functions have either behavior:
return false and argument is unchanged or
return true and argument is advanced to the semicolon
*/
KeyWordTest key_ISO_10303_21("ISO-10303-21");
KeyWordTest key_END_ISO_10303_21("END-ISO-10303-21");



void read_exchange_structure(TextSource& source, ExchangeStructureHandler& handler ){
	Part21_TokenSource tokenSource(source);
	CharTokenList cl(tokenSource);
	TokenIterator ix(cl.begin());
	TokenIterator iend(cl.end());

	try{
	check_end(ix,iend);
	if (not key_ISO_10303_21(*ix)){
		throw ISOKeyNotFound();
	}
	++ix; check_end(ix,iend);
	if (not is_a_semicolon(*ix)){
		throw ExpectingSemicolon( (**ix).start() );
	}
	++ix; check_end(ix,iend);


	auto_ptr<Header> headerPtr = read_header(ix,iend);
	if (not (handler.start_structure(*headerPtr))) return;

  
	while (true){
		check_end(ix,iend);
		if (key_END_ISO_10303_21(*ix)){
		  ++ix;
		  break;
		}
		if (not key_DATA(*ix)){
			throw ExpectingKeyword(key_DATA.key(), (**ix).start(), (**ix).stop());
		}
		++ix; check_end(ix,iend);

		{
			if (not is_a_semicolon(*ix)){
				throw logic_error("multiple data sections not implemented yet");
			}
		}
		++ix;
		ReadModelConfig res = handler.start_datamodel();
		if (res){
		  InstanceReader instance_reader(handler, res.schema(), res.data_manager() );

			while (true){
				check_end(ix,iend);
				if (key_ENDSECT(*ix)) break;
				TokenIterator isc(ix);
				++isc;
				while (true){
					check_end(isc,iend);
					if (is_a_semicolon(*isc)) break;
					++isc;
				}

        instance_reader.read_instance(ix,isc);
				ix = isc;
				++ix;
			}
			handler.end_datamodel();
		}
		else{
			while (true){
				check_end(ix,iend);
				if (key_ENDSECT(*ix)) break;
				++ix;
			}
		}
		++ix;check_end(ix,iend);
		if (not is_a_semicolon(*ix))
			throw ExpectingSemicolon( (**ix).start() );
		++ix;
	}// end of the while (true) loop
	}
	catch(eos&){
		throw UnexpectedEndOfSource();
	}

	handler.end_structure();
	return;
}



}
}


namespace KShellSTEP{
namespace Part21{

bool is_omitted_value(const CharToken& tok){return is_a_dollarsign(tok);}

pair<bool, AttributeValue*>
AttributeValueReader::read_attribute_value(TokenIterator ix, const TokenIterator iend, const EXPRESS::AttributeType& tp){
  result = NULL;
  AttributeTypeVisitor& self(*this);
  
  set_token_range(ix,iend);
  tp.respond_to_visitor(self);
  release_token_range();
  
  if (result == NULL) return pair<bool, AttributeValue*>(false, NULL);
  return pair<bool, AttributeValue*>(true, result);
};

void AttributeValueReader::handle_string(){
    TokenIterator _ix = ix();
	#ifdef ALL_STRINGS_OPTIONAL
	if (is_omitted_value(*_ix)){
	  result = data_manager().make_string(string());
	  return;
	}
	#endif
	pair<bool, string> tmp = is_a_literal(*_ix);
	if (tmp.first) result = data_manager().make_string(tmp.second);
	else result = NULL;
	
  return;
}

void
AttributeValueReader::handle_integer(){
	pair<bool, long> res = is_an_integer(*TokenIterator(ix()));
	if (res.first) result = data_manager().make_integer(res.second);
	else result = NULL;
	return;
}

void
AttributeValueReader::handle_real(){
	pair<bool, double> res = is_a_real(*TokenIterator(ix()));
	if (res.first) result = data_manager().make_real(res.second);
	else result = NULL;
}

void
AttributeValueReader::handle_number(){
    result = NULL;
    handle_real();
    if (result == NULL)  handle_integer();
    return;
}

void
AttributeValueReader::handle_instance(){
	TokenIterator _ix = ix();
	while(true){
	    pair<bool, string> res = is_a_word(*_ix);
	    if (not res.first) break;
	    pair<bool, InstanceID>  res2 = data_manager().make_ID(res.second);
        if (not res2.first) break;
        result = data_manager().make_instance(res2.second);
        return;
    }
    result = NULL;
    return;
}

void
AttributeValueReader::handle_boolean(){
	pair<bool,string> res = read_enumeration_value(ix(),iend());
    if (res.first){
        if (res.second == "T"){
            result = data_manager().make_boolean(true);
            return;
        }
        else if (res.second == "F"){
            result = data_manager().make_boolean(false);
            return;
        }
    }
    result = NULL;
    return;
}


void
AttributeValueReader::handle_logical(){
	pair<bool,string> res = read_enumeration_value(ix(),iend());
    if (res.first){
        if (res.second == "T"){
            result = data_manager().make_logical(EXPRESS::Logical::True());
            return;
        }
        else if (res.second == "F"){
            result = data_manager().make_logical(EXPRESS::Logical::False());
            return;
        }
        else if (res.second == "U"){
            result = data_manager().make_logical(EXPRESS::Logical::Unknown());
            return;
        }

    }
    result = NULL;
    return;
}

void
AttributeValueReader::handle_enumeration(const EXPRESS::Enumeration& _enum){
  // check to see if looking at a type declaration of the Enumeration
  TokenIterator _ix = ix();
  TokenIterator _iend = iend();
  pair<bool,string> res2 = read_enumeration_value(_ix,_iend);
  if( not res2.first){
    pair<bool, string> tmp = is_a_word(*_ix);
    while (tmp.first){
      if (tmp.second == _enum.name){
        ++_ix;
        pair<bool, TokenRange> res = matching_parentheses(_ix,_iend);
        if (res.first){
          _ix = res.second.begin();
          _iend = res.second.end();
          res2 = read_enumeration_value(_ix,_iend);
          break;
        }
      }
      result = NULL;
      return;
    }
    
  }
  
	while(res2.first){
    EXPRESS::Enumeration::const_iterator ival = _enum.find(res2.second);
	  if (ival != _enum.end()){
	    result = data_manager().make_enumeration(ival);
	    return;
	  }
	}
	result = NULL;
	return;
}

void
AttributeValueReader::handle_collection(const EXPRESS::AttributeType& ct){
  handle_collection(ct, false);
}

void
AttributeValueReader::handle_array_optional(const EXPRESS::AttributeType& ct){
  handle_collection(ct, true);
}


void
AttributeValueReader::handle_collection(const EXPRESS::AttributeType& ct, bool opt){
  TokenIterator _ix = ix();
  TokenIterator _iend = iend();
  pair<bool, TokenRange> res = matching_parentheses(_ix,_iend);
  while(res.first){
    vector<AttributeValue *> values;
  	pair<bool,vector<TokenRange> > res2 = split_comma_delimited_list(res.second.begin(), res.second.end());
	  if (not res2.first) break;
	  
	  vector<TokenRange>::iterator jx = res2.second.begin();
	  for (; jx != res2.second.end(); ++jx){
      if (opt and is_omitted_value(*(jx->begin())))
        values.push_back( data_manager().make_omitted() );
      else{
        pair<bool,AttributeValue *> sub_res = read_attribute_value(jx->begin(), jx->end(), ct);
        if (not sub_res.first){
          string attr_string = EXPRESS::attribute_type_to_string(ct);
          throw ValueReadingError(attr_string, (**TokenIterator(jx->begin())).start(), (**TokenIterator(jx->end())).stop());
        }
        values.push_back(sub_res.second);
      }
		}
		
		result = data_manager().make_collection(values);
		return;
	}
	result = NULL;
	return;
}

void
AttributeValueReader::handle_binary(){
	// see wg11n090 section 7.3.6
	// binary values (bool) are stored in a vector, most significant bits first
	string tmp;
  TokenIterator _ix = ix();
	TokenIterator _iend = iend();
	
  if (is_a_quotation_mark(*_ix)){
	    while (true){
    		++_ix;
		    if (_ix == _iend) break;
    		if (is_a_quotation_mark(*_ix)) break;
        pair<bool, string> res = is_a_word(*_ix);
	      if (not res.first) break;
		    tmp += res.second;
	    }
	}

  while(true){
	  if (tmp.empty()) break;
	  int nskip = tmp[0]-'0';
	  if (nskip < 0 or nskip > 3) break;
	  vector<bool> buf;
	  for (int k = 1; k < tmp.size(); ++k){
		  char x = tmp[k];
		  if (x >= '0' and x <= '9')
			  x = x-'0';
		  else if (x >= 'A' and x <= 'F')
			  x = x-'A' + 10;
		  else
			  break;

		  for (int j = 3; j >= 0; --j, --nskip){
			  if (nskip <= 0)
				  buf.push_back( bool( x & ('1' << j)));
		  }
	  }
	  result = data_manager().make_binary(buf);
	  return;
  }
  result = NULL;
  return;
 }

void
AttributeValueReader::handle_multiple(const vector<shared_ptr<EXPRESS::AttributeType> >& cts){
	vector<shared_ptr<EXPRESS::AttributeType> >::const_iterator ip = cts.begin();
	for (; ip != cts.end(); ++ip){
		pair<bool, AttributeValue *> res = read_attribute_value(ix(),iend(), **ip);
		if (res.first){
		    result = res.second;
		    return;
		}
	}
	result = NULL;
	return;
}

void
AttributeValueReader::handle_aliased(const string& alias_name, const EXPRESS::AttributeType& ct){
	pair<bool,AttributeValue *> res = read_attribute_value(ix(),iend(), ct);
	if (res.first){
		result = res.second;
		return;
  }

	TokenIterator _ix = ix();
	pair<bool, string> tmp = is_a_word(*_ix);
	while(tmp.first){
	  if (tmp.second != alias_name) break;
      ++_ix;
	  pair<bool,TokenRange> tmp2 = matching_parentheses(_ix,iend());
	  if (not tmp2.first) break;
    res = read_attribute_value(tmp2.second.begin(), tmp2.second.end(), ct);
	  if (not res.first) break;
	  result = data_manager().make_aliased(alias_name,res.second);
	  return;
	}
  result = NULL;
  return;
}


pair<bool, string>
read_enumeration_value(TokenIterator ix, const TokenIterator& iend){
  pair<bool, string> tmp = is_a_word(*ix);
  while (tmp.first){
		if (tmp.second.size() < 3) break;
    if (tmp.second[0] != Period || tmp.second[tmp.second.size()-1] != Period) break;
		return pair<bool,string>(true, string(tmp.second,1,tmp.second.size()-2));
	}
	return pair<bool, string>(false,string());
}

}}

