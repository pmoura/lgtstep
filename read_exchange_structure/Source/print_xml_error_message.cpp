#include "print_xml_error_message.h"
#include <libxml/tree.h>
#include <boost/format.hpp>

class xml_position:public ErrorPositionVisitor{
	public:
	xmlNodePtr positionNode;
	
	xml_position(xmlNodePtr a){
	    positionNode = xmlNewChild(a, NULL, BAD_CAST "position", NULL);
	}
	
	void position(const TextSource::PositionType& n){
	    xmlNodePtr t = xmlNewChild(positionNode,NULL, BAD_CAST "character",NULL);
		xmlNewProp(t, BAD_CAST "index", BAD_CAST str(boost::format("%i") % n).c_str());
	}
	void position_range(const TextSource::PositionType& ns,const TextSource::PositionType& ne){
	    xmlNodePtr t = xmlNewChild(positionNode,NULL, BAD_CAST "character_range",NULL);
		xmlNewProp(t, BAD_CAST "start", BAD_CAST str(boost::format("%i") % ns).c_str());
		xmlNewProp(t, BAD_CAST "stop",  BAD_CAST str(boost::format("%i") % ne).c_str());
	}
	void position_to_end(const TextSource::PositionType& n){
	    xmlNodePtr t = xmlNewChild(positionNode,NULL, BAD_CAST "character_to_end",NULL);
		xmlNewProp(t, BAD_CAST "index", BAD_CAST str(boost::format("%i") % n).c_str());
	}
	void at_end(){
	    xmlNewChild(positionNode,NULL, BAD_CAST "at_end",NULL);
	}
};


xmlDocPtr _create_doc_and_root(){
    xmlDocPtr doc = xmlNewDoc(BAD_CAST "1.0");
    if (doc == NULL)
        throw logic_error("failed creating XML document");
    xmlNodePtr root = xmlNewNode(NULL, BAD_CAST "part21_reading_exception");
    if (root == NULL){
        xmlFreeDoc(doc);
        throw logic_error("failed creating XML document root");
    }
    xmlDocSetRootElement(doc, root);
    return doc;
}

void _print_error_message(xmlDocPtr doc, ostream& os){
	char *buffer;
	int bufsize;
	xmlDocDumpMemoryEnc(doc,(xmlChar **)  &buffer, &bufsize, "UTF-8");
	os.write(buffer,bufsize);
	xmlFree(buffer);
}
    
        

void print_xml_error_message(SchemaNotKnown& exc, ostream& os){
    xmlDocPtr doc = _create_doc_and_root();
    xmlNodePtr root = xmlDocGetRootElement(doc);
    xmlNodePtr t = xmlNewChild(root, NULL, BAD_CAST "unknown_schema",NULL);
    xmlNewChild(t, NULL, BAD_CAST "schema_identifier", BAD_CAST exc.name() );

    _print_error_message(doc, os);
    xmlFreeDoc(doc);
}
    
void print_xml_error_message(ISOKeyNotFound&, ostream& os){
    xmlDocPtr doc = _create_doc_and_root();
    xmlNodePtr root = xmlDocGetRootElement(doc);
    xmlNewChild(root, NULL, BAD_CAST "ISO_key_not_found",NULL);
    _print_error_message(doc, os);
    xmlFreeDoc(doc);
}


void print_xml_error_message(FileException& exc, ostream& os){
    xmlDocPtr doc = _create_doc_and_root();    
    xmlNodePtr root = xmlDocGetRootElement(doc);
    xmlNodePtr t = xmlNewChild(root, NULL, BAD_CAST "parse_structure_exception",NULL);
    xmlNewChild(t, NULL, BAD_CAST "message", BAD_CAST exc.error_message() );
    xml_position visitor(t);
    exc.respond_to_visitor(visitor);
    _print_error_message(doc, os);
    xmlFreeDoc(doc);
}
