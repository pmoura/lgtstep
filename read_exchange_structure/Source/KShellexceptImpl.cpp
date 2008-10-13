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
#include "KShellexceptImpl.h"
#include <boost/format.hpp>

namespace KShellSTEP{

SchemaNotKnown::SchemaNotKnown(const string& a): schema_id_name(a){
	boost::format f("unknown schema identifier: %s");
	_what_message = str(f % schema_id_name);
};

UnknownCharacter::UnknownCharacter(char c,const TextSource::PositionType n):FileExceptionPosition(n){
	boost::format f("unknown character ascii(%s)");
	_error_message = str(f % int(c));
	set_what_message();
};


UnterminatedComment::UnterminatedComment(TextSource::PositionType n):
	FileExceptionPositionToEnd("unterminated comment",n){set_what_message();};

UnterminatedLiteral::UnterminatedLiteral(TextSource::PositionType n):
	FileExceptionPositionToEnd("unterminated literal",n){set_what_message();};

UnterminatedPrintDirective::UnterminatedPrintDirective(TextSource::PositionType n):
	FileExceptionPositionToEnd("unterminated print directive",n){set_what_message();};

UnbalancedParentheses::UnbalancedParentheses(TextSource::PositionType n):
	FileExceptionPositionToEnd("unbalanced parentheses",n){set_what_message();};

IncompleteFloatNumber::IncompleteFloatNumber(TextSource::PositionType n):
	FileExceptionPosition("incomplete representation of floating point number",n){set_what_message();};

ErrorEscapeSequence::ErrorEscapeSequence(TextSource::PositionType n):
	FileExceptionPosition("cannot interpret escape sequence in literal value",n){set_what_message();};


ExpectingName::ExpectingName(TextSource::PositionType nstart,TextSource::PositionType nstop):
	FileExceptionPositionRange("expecting name",nstart,nstop){set_what_message();};

ExpectingKeyword::ExpectingKeyword(const string& a,TextSource::PositionType nstart,TextSource::PositionType nstop):
	FileExceptionPositionRange(nstart,nstop){
	boost::format f("expecting keyword %s");
	_error_message = str(f % a);
	set_what_message();
};

UnexpectedEndOfSource::UnexpectedEndOfSource():FileExceptionAtEnd("unexpected end of source"){set_what_message();};

EncodingMismatch::EncodingMismatch(	int nexp,
																		int nobs,
																		TextSource::PositionType ib,
																		TextSource::PositionType ie):
	FileExceptionPositionRange(ib,ie){
	boost::format f("mismatch in number of attributes; %i expected; %i entered");
	_error_message = str( f % nexp % nobs);
	set_what_message();
};

ExpectingSemicolon::ExpectingSemicolon(TextSource::PositionType n):
	FileExceptionPosition("expecting semicolon",n){set_what_message();};

AttributeReadingError::AttributeReadingError(TextSource::PositionType ib, TextSource::PositionType ie):
	FileExceptionPositionRange("error reading attribute name",ib,  ie){set_what_message();};


ExpectingParentheses::ExpectingParentheses(TextSource::PositionType n):
	FileExceptionPosition("expecting parentheses",n){set_what_message();};

ExpectingEquals::ExpectingEquals(TextSource::PositionType n):
	FileExceptionPosition("expecting equals",n){set_what_message();};

UnexpectedEndOfEntity::UnexpectedEndOfEntity(TextSource::PositionType ib, TextSource::PositionType ie):
	FileExceptionPositionRange("unexpected end of entity",ib,ie){set_what_message();};

UnexpectedEndOfType::UnexpectedEndOfType(TextSource::PositionType ib, TextSource::PositionType ie):
	FileExceptionPositionRange("unexpected end of type",ib,ie){set_what_message();};

BoundsSpecifierError::BoundsSpecifierError(TextSource::PositionType ib, TextSource::PositionType ie):
	FileExceptionPositionRange("error readings bounds specifier",ib,ie){set_what_message();};

ValueReadingError::ValueReadingError(const string& a, TextSource::PositionType ib, TextSource::PositionType ie):
	FileExceptionPositionRange(ib,ie){
	boost::format f("error reading attribute value: %s");
	_error_message = str(f % a);
	set_what_message();
};

ExpectingNumber::ExpectingNumber(TextSource::PositionType ib, TextSource::PositionType ie):
	FileExceptionPositionRange("expecting number",ib,  ie){set_what_message();};

ExpectingCommaOrEnd::ExpectingCommaOrEnd(TextSource::PositionType n):
	FileExceptionPosition("expecting comma or end of list",n){set_what_message();};

ExpectingBoundsSpecifier::ExpectingBoundsSpecifier(TextSource::PositionType ib, TextSource::PositionType ie):
	FileExceptionPositionRange("expecting bounds specifier",ib,ie){set_what_message();};


ExpectingInstanceID::ExpectingInstanceID(TextSource::PositionType ib, TextSource::PositionType ie):
	FileExceptionPositionRange("expecting InstanceID",ib,ie){set_what_message();};

ExpectingListOfLiterals::ExpectingListOfLiterals(TextSource::PositionType ib, TextSource::PositionType ie):
	FileExceptionPositionRange("expecting list of literals",ib,ie){set_what_message();};

UnexpectedEndOfHeader::UnexpectedEndOfHeader(TextSource::PositionType n):
	FileExceptionPosition("unexpected end of Header",n){set_what_message();};


ExpectingRedefinedEncoding::ExpectingRedefinedEncoding(TextSource::PositionType n):
	FileExceptionPosition("expecting redefined encoding",n){set_what_message();};

ExpectingEntityName::ExpectingEntityName(TextSource::PositionType ib, TextSource::PositionType ie):
	FileExceptionPositionRange("expecting entity name",ib,ie){set_what_message();};

ExpectingListOfValues::ExpectingListOfValues(TextSource::PositionType ib, TextSource::PositionType ie):
	FileExceptionPositionRange("list of values",ib,ie){set_what_message();};

ExternalEncodingError::ExternalEncodingError(TextSource::PositionType ib, TextSource::PositionType ie):
	FileExceptionPositionRange("external encoding error",ib,ie){set_what_message();};

InstanceReadingError::InstanceReadingError(TextSource::PositionType ib, TextSource::PositionType ie):
	FileExceptionPositionRange("instance reading error",ib,ie){set_what_message();};

ExpectingValues::ExpectingValues(TextSource::PositionType ib, TextSource::PositionType ie):
	FileExceptionPositionRange("expecting values",ib,ie){set_what_message();};

UnknownEntityName::UnknownEntityName(const string& a, TextSource::PositionType ib, TextSource::PositionType ie):
	FileExceptionPositionRange(ib,ie){
	boost::format f("unknown entity name:%s");
	_error_message = str(f % a);
	set_what_message();
};

ExpectingLiteral::ExpectingLiteral(TextSource::PositionType ib, TextSource::PositionType ie):
	FileExceptionPositionRange("expecting literal",ib,ie){set_what_message();};

ExpectingHeaderEntity::ExpectingHeaderEntity(const string& a, TextSource::PositionType ib, TextSource::PositionType ie):
	FileExceptionPositionRange(ib,ie){
	boost::format f("expecting header entity:%s");
	_error_message = str(f % a);
	set_what_message();
};
}
