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
 *  Copyright © 1997-2002 Metrowerks Corporation.  All Rights Reserved.
 *
 *  Questions and comments to:
 *       <mailto:support@metrowerks.com>
 *       <http://www.metrowerks.com/>
 */

/*
A version of write_prolog_clauses that writes translation errors to an XML format
returns error code of 1 for such translation errors
returns error code of 2, and plain text error, for "processing" errors
*/

#include <iostream>
#include <fstream>
using namespace std;


#include "load_exchange_schema_from_file.h"
#include "read_exchange_structure.h"
#include "ModelBaseExchangeStructureHandler.h"
#include "SetsBaseExchangeStructureHandler.h"
#include "PrologExchangeStructureHandler.h"
#include "LogtalkExchangeStructureHandler.h"
#include "SchemaIdentifier.h"
#include "print_xml_error_message.h"

#include "boost/program_options.hpp"
using namespace boost::program_options;

#include "boost/filesystem/path.hpp"
using boost::filesystem::path;

#include "boost/format.hpp"

#include "EntityFilterChoice.h"

#include "KShellexcept.h"

#include "TextSource.h"
#include "SchemaServer.h"

using namespace KShellSTEP;
using namespace KShellSTEP::Part21;

auto_ptr<options_description> common_options();
auto_ptr<SchemaServer> choose_schema_server(variables_map&);
auto_ptr<ofstream> choose_output_file(variables_map&);

string version(){
		#ifdef VERSION_IDENTIFICATION
		    #define AS_STRING_POST(X) #X
		    #define AS_STRING(X) AS_STRING_POST(X)
		    return string(AS_STRING(VERSION_IDENTIFICATION));
	  #else
        return string("unspecified version");
    #endif
};


class fstream_guard{  // controls the "lifecycle" of an output file
  private:
  scoped_ptr<ofstream> _stream;
  public:
  fstream_guard(const path& filepath):_stream( new ofstream(filepath.native_file_string().c_str()) ){};
  ~fstream_guard(){ _stream->close(); }

  ostream* get(){ return _stream.get() ;}
};
    
int main(int argc, char ** argv){
	variables_map vm;

	try{
	try{
	options_description desc("Options");
	
	auto_ptr<options_description> _common_optionsPtr = common_options();
	desc.add(*_common_optionsPtr);

	desc.add_options()("verify_schema,v",	value< string >(),
	                   "verify the argument (path) can be read as a schema, return schema name to stdout")
	                  ("locate_schema,l", value< string >(),
	                   "locate schema (by identifier), return path to stdout")
										("prolog,p",			"output prolog facts")
										("logtalk,g",     "output logtalk objects")
										("model,m",				"print schema name")
										("entity_sets,e", "print entity sets content")
										("xml_message,x",	"print exception messages in xml format")
										("version","print version");

	store( parse_command_line(argc,argv,desc), vm);
	notify(vm);

	if (vm.count("version")){
		cout << version() << endl;
		return EXIT_SUCCESS;
	}

	if (vm.count("help")){
		cout << desc << endl;
		return EXIT_SUCCESS;
	}

	// implement the "verify_schema option
	if (vm.count("verify_schema")){
		path schemaPath(vm["verify_schema"].as<string>(),boost::filesystem::native);
		auto_ptr<ExchangeSchema> tmp = load_exchange_schema_from_file(schemaPath.native_file_string().c_str());
		cout << tmp->name() << endl;
		return EXIT_SUCCESS;
	}

  auto_ptr<SchemaServer> _s = choose_schema_server(vm);
  SchemaServer& schema_server = *_s;
	
	// implement the locate_schema option
	if (vm.count("locate_schema")){
	  auto_ptr<SchemaIdentifier> _sidPtr = SchemaIdentifier::make( vm["locate_schema"].as<string>() );
		path schemaPath = schema_server.getSchemaPath(*_sidPtr);
		cout << schemaPath.native_file_string() << endl;
		return EXIT_SUCCESS;
	}


  auto_ptr<fd_guard> _fdguard;
  int input_fd;
  if (vm.count("file")){
    path inputPath(vm["file"].as<string>(),boost::filesystem::native);
    _fdguard.reset( new fd_guard( inputPath.string().c_str() ) );
    input_fd = _fdguard->get();
  }
  else{
    input_fd = 0; // stdin
  }
  
  ostream* osPtr;
  auto_ptr<fstream_guard> _fsguard;
  if (vm.count("output")){
    path outputPath(vm["output"].as<string>(),boost::filesystem::native);
    _fsguard.reset( new fstream_guard( outputPath ) );
    osPtr = (*_fsguard).get();
  }
  else{
    osPtr = &cout;
  }
  
	ostream& os = *osPtr;

	// ###########################################
	// see if command line options specify skipping any instances
	// based on entity
	auto_ptr<InstanceChoice> _q;
	if (vm.count("ignore_entities")){
		_q.reset(new EntityFilterChoice( vm["ignore_entities"].as< vector<string> >()));
	}
	else{
		_q.reset(new InstanceChoice());
	}
	InstanceChoice& instance_choice = *_q;
	// ###########################################
	StructureChoice structure_choice;
	ModelChoice model_choice;

  scoped_ptr<TextSource> _textsourceptr(makeFileDescriptorTextSource(input_fd));
	TextSource& infile = *_textsourceptr;


	auto_ptr<ExchangeStructureHandler> _r;
	if (vm.count("model")){
		_r.reset(new ModelBaseExchangeStructureHandler(schema_server,structure_choice, model_choice, instance_choice, os));
	}
	else if (vm.count("entity_sets")){
		_r.reset(new SetsBaseExchangeStructureHandler(schema_server,structure_choice, model_choice, instance_choice, os));
	}
	else if (vm.count("prolog")){
		_r.reset(new PrologExchangeStructureHandler(schema_server,structure_choice, model_choice, instance_choice, os));
	}
  else if (vm.count("logtalk")){
		_r.reset(new LogtalkExchangeStructureHandler(schema_server,structure_choice, model_choice, instance_choice, os));
	}

	else{
		_r.reset(new BaseExchangeStructureHandler(schema_server,structure_choice, model_choice, instance_choice));
	}
	ExchangeStructureHandler& esh = *_r;

	read_exchange_structure(infile,esh);



	}
	catch(SchemaNotKnown& exc){
		if (vm.count("xml_message"))
			print_xml_error_message(exc,cerr);
		else
			cerr << exc.what() << endl;
		return 1;
	}

	catch(ISOKeyNotFound& exc){
		if (vm.count("xml_message"))
			print_xml_error_message(exc,cerr);
		else
			cerr << exc.what() << endl;
		return 1;
	}

	catch(FileException& exc){
		if (vm.count("xml_message")){
            print_xml_error_message(exc,cerr);
		}
		else
			cerr << exc.what() << endl;
		return 1;
	}
	}
	catch (exception& exc){
		cerr << exc.what() << endl;
		return 2;
	}
	return EXIT_SUCCESS;
}


#include "FixedSchemaServer.h"
#include "CatalogSchemaServer.h"


auto_ptr<options_description>
common_options(){
    auto_ptr<options_description> retVal(new options_description());
    options_description& desc = *retVal;
    desc.add_options()("help,h",				"produce help message")
                      ("schema,s",			value< string >(),			"use specified EXPRESS file for schema")
										  ("catalog,c",			value< string >(),			"path of schema catalog")           
                      ("file,f", 				value< string >(),			"input file (default is standard input stream)")
										  ("output,o",			value< string >(),			"output file (default is standard output stream)");
    return retVal;
}

auto_ptr<SchemaServer>
choose_schema_server(variables_map& vm){
	if (vm.count("schema")){
		path schemaPath(vm["schema"].as<string>(),boost::filesystem::native);
		return FixedSchemaServer::make(schemaPath);
	}
	
	path schema_catalog;
	while (true){
	  if (vm.count("catalog")){
		  schema_catalog = path(vm["catalog"].as<string>(),boost::filesystem::native);
			break;
		}
		char * tmp = std::getenv("EXPRESS_SCHEMA_CATALOG");
		if (tmp != NULL){
			schema_catalog = path(tmp,boost::filesystem::native);
			break;
		}
    throw logic_error("option \'--schema\'; \'--catalog\'; or environment variable EXPRESS_SCHEMA_CATALOG must be specified");
  }
  return CatalogSchemaServer::make(schema_catalog);
}


auto_ptr<ofstream>
choose_output_file(variables_map& vm){
  	if (vm.count("output")){
		  path outputPath(vm["output"].as<string>(),boost::filesystem::native);
		  return auto_ptr<ofstream>(new ofstream(outputPath.native_file_string().c_str()));
    }
    return auto_ptr<ofstream>();
}

