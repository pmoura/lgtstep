EXPRESS_SCHEMA_CATALOG=express_schema/schema_catalog.xml

SOURCE_FILES=	main_read_exchange_structure.cpp BaseExchangeStructureHandler.cpp \
				BasicTokenTests.cpp CatalogSchemaServer.cpp CharTokenImpl.cpp \
				CharTokenList.cpp EXPRESS_TokenSource.cpp EncodingToProlog.cpp \
				EntityFilterChoice.cpp ExchangeDataManager.cpp ExchangeSchemaImpl.cpp \
				Fd_TextSource.cpp FixedSchemaServer.cpp IConvClass.cpp KShellexcept.cpp \
				KShellexceptImpl.cpp LogtalkExchangeStructureHandler.cpp \
				ModelBaseExchangeStructureHandler.cpp Part21_TokenSource.cpp \
				PrologExchangeStructureHandler.cpp Schema.cpp SchemaIdentifier.cpp \
				SetsBaseExchangeStructureHandler.cpp TextSource.cpp TokenListParsing.cpp \
				TokenSource.cpp build_schema.cpp hex_to_ucs4.cpp \
				load_exchange_schema_from_file.cpp makeTextSource_stdc.cpp \
				print_xml_error_message.cpp read_exchange_structure.cpp \
				read_header.cpp read_schema.cpp

OBJECT_FILES=$(addsuffix .o,$(basename ${SOURCE_FILES}))

CPPFLAGS +=	 -include Source/common_types.hpp

LIBS = boost_regex boost_filesystem boost_program_options boost_iostreams xml2 z pthread iconv m stdc++
LDLIBS += $(addprefix -l, $(LIBS))

vpath %.cpp Source

#  The iconv library whose interface is declared in iconv.h is used to handle unicode conversions
#  There are, however, two differing "standard" definitions out there, which differ in the signature
#  of the iconv function. They differ in whether or not the second argument is declared 'const'
#  
#  From version 0x0109 included in the gnu LIBICONV library have the declaration:
#  extern size_t iconv (iconv_t cd, const char* * inbuf, size_t *inbytesleft, char* * outbuf, size_t *outbytesleft);
#  
#  while from 0x010B have:
#  extern size_t iconv (iconv_t cd,  char* * inbuf, size_t *inbytesleft, char* * outbuf, size_t *outbytesleft);
#  
#  This library is used in the source code IConvClass.cpp. Control compilation through a preprocessor macro ICONV_CONST_ARG2
#  To accommodate these differing definitions: use the compile time preprocessor macro ICONV_CONST_ARG2
#  It should be set to 1 if this systems iconv.h declaration is like that of version 0109 above, and ICONV_CONST_ARG2
#  should be 0 if the declaration is like that of 010B above.
#  
#  The default is for ICONV_CONST_ARG2 to be 1

IConvClass.o: CPPFLAGS += -DICONV_CONST_ARG2=@ICONV_CONST_ARG2

all: read_exchange_structure

clean:
	-rm main_read_exchange_structure
	-rm *.o
	
	
read_exchange_structure: main_read_exchange_structure
	cp main_read_exchange_structure read_exchange_structure
	
main_read_exchange_structure: ${OBJECT_FILES}

test: read_exchange_structure run_test

run_test:
	env EXPRESS_SCHEMA_CATALOG=${EXPRESS_SCHEMA_CATALOG} ./read_exchange_structure -f part21_files/Part02.step