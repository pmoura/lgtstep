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
#include "CatalogSchemaServer.h"
#include "load_exchange_schema_from_file.h"

#include <libxml/parser.h>
#include <libxml/tree.h>
#include <libxml/xpath.h>

#include <boost/filesystem/operations.hpp>

struct gParser{
	~gParser(){xmlCleanupParser();}};

struct gXPathContext{
	xmlXPathContextPtr ptr;
	gXPathContext(xmlXPathContextPtr a):ptr(a){};
	~gXPathContext(){xmlXPathFreeContext(ptr);}};
	
struct gXPathObject{
	xmlXPathObjectPtr ptr;
	gXPathObject(xmlXPathObjectPtr a):ptr(a){};
	~gXPathObject(){xmlXPathFreeObject(ptr);}};



namespace KShellSTEP{
namespace Part21{

#define xmlLibFailure throw std::logic_error("allocation failure in xmllib: file CatalogSchemaServer.cpp")

class CatalogSchemaServerImpl:public CatalogSchemaServer{
	protected:
	path catalog_path;
	xmlDocPtr catalog_doc;
	
	struct CacheEntryType {
		shared_ptr<SchemaIdentifier> sidPtr;
		shared_ptr<ExchangeSchema> schemaPtr;
	};

	typedef vector<CacheEntryType> CacheType;
	CacheType cache;
	CacheType::iterator find(const SchemaIdentifier& sid){
		CacheType::iterator ix = cache.begin();
		for (; ix != cache.end(); ++ix)
			if (sid.matches(*(ix->sidPtr))) break;
		return ix;
	}
	
	pair<path, shared_ptr<SchemaIdentifier> >
	getPathSchemaId(const SchemaIdentifier& sid){
		xmlXPathContextPtr xpathCtx = xmlXPathNewContext(catalog_doc);
		if (xpathCtx == NULL) xmlLibFailure;
		gXPathContext _gXPath(xpathCtx);

		xmlXPathObjectPtr xpathObj = xmlXPathEvalExpression(BAD_CAST "//identifier", xpathCtx);
		if (xpathObj == NULL) xmlLibFailure;
		gXPathObject _gXPathObject(xpathObj);
		
		int n = xpathObj -> nodesetval -> nodeNr;
		shared_ptr<SchemaIdentifier> tmpId;
		for (; n; n--){
			xpathCtx -> node = xpathObj->nodesetval->nodeTab[n-1];
			
			xmlXPathObjectPtr identPathObj = xmlXPathEvalExpression(BAD_CAST "./label", xpathCtx);
			int _nobj = identPathObj->nodesetval->nodeNr;
			if (_nobj > 1)
				std::logic_error("catalog structure error in xmllib: file CatalogSchemaServer.cpp");
				
			if (_nobj == 1){
				xmlChar* labelStr = identPathObj->nodesetval->nodeTab[0]->children->content;
				auto_ptr<SchemaIdentifier> _id = SchemaIdentifier::make(string((const char *) labelStr));
				tmpId = _id;
			}
			if (tmpId.get() != NULL and sid.matches(*tmpId)) break;			
		}
		if (n){
			xmlXPathObjectPtr xpathObj2 = xmlXPathEvalExpression(BAD_CAST "../@path", xpathCtx);
			if (xpathObj2 == NULL) xmlLibFailure;
			gXPathObject _gXPathObject2(xpathObj2);
			if (xpathObj2 -> nodesetval -> nodeNr){
				xmlChar* pathStr = xpathObj2 -> nodesetval -> nodeTab[0] -> children -> content;
				path _path((const char *) pathStr, boost::filesystem::native);
				path _complete = boost::filesystem::complete(_path, catalog_path.branch_path());
				return pair<path, shared_ptr<SchemaIdentifier> >(_complete, tmpId);
			}
		}
		throw  SchemaNotKnown(sid.label());

	}

	public:
	CatalogSchemaServerImpl(const path& a):catalog_path(a){
		xmlInitParser();
		LIBXML_TEST_VERSION
		gParser _gParser;
		catalog_doc = xmlReadFile(catalog_path.native_file_string().c_str(), NULL, 0);
		if (catalog_doc == NULL)
			throw logic_error("failed to parse schema catalog file (xml)");
	}

	~CatalogSchemaServerImpl(){
		xmlFreeDoc(catalog_doc);
	};
	
	
	path
	getSchemaPath(const SchemaIdentifier& sid){
		return getPathSchemaId(sid).first;
	}
	
	shared_ptr<ExchangeSchema>
	getSchema(const SchemaIdentifier& sid){
		CacheType::iterator ie = find(sid);
		if (ie == cache.end()){
			pair<path, shared_ptr<SchemaIdentifier> > res =
				getPathSchemaId(sid);
			auto_ptr<ExchangeSchema> newSchema = load_exchange_schema_from_file(
				res.first.native_file_string().c_str()
			);
			CacheEntryType entry;
			entry.sidPtr = res.second;
			entry.schemaPtr = newSchema;
			ie=cache.insert(cache.end(), entry);
		}
		return ie->schemaPtr;
	}
};

auto_ptr<SchemaServer>
CatalogSchemaServer::make(const path& a){
	return auto_ptr<SchemaServer>(new CatalogSchemaServerImpl(a));
}

}
}
