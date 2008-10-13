#include "KShellexcept.h"
#include <iostream>
using namespace std;

using namespace KShellSTEP;

void print_xml_error_message(SchemaNotKnown&, ostream&);
void print_xml_error_message(ISOKeyNotFound&, ostream&);
void print_xml_error_message(FileException&, ostream&);
