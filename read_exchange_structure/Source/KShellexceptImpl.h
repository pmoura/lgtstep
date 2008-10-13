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
#include "KShellexcept.h"

namespace KShellSTEP{
class FileExceptionPosition: public FileException{
	protected:
	const TextSource::PositionType pos;
	public:
	FileExceptionPosition(TextSource::PositionType n): pos(n){};
	FileExceptionPosition(const string& a, TextSource::PositionType n):FileException(a), pos(n){};
	void respond_to_visitor(ErrorPositionVisitor& x) const{	x.position(pos);}
};

class FileExceptionAtEnd: public FileException{
	public:
	FileExceptionAtEnd():FileException(){};
	FileExceptionAtEnd(const string& arg):FileException(arg){};
	void respond_to_visitor(ErrorPositionVisitor& x) const{	x.at_end();}
};


class FileExceptionPositionRange: public FileException{
	protected:
	const TextSource::PositionType start_pos;
	const TextSource::PositionType stop_pos;
	public:
	FileExceptionPositionRange(	TextSource::PositionType nstart,
															TextSource::PositionType nstop):	start_pos(nstart),stop_pos(nstop){};
	FileExceptionPositionRange(	const string& a,
															TextSource::PositionType nstart,
															TextSource::PositionType nstop):	FileException(a),start_pos(nstart),stop_pos(nstop){};
	void respond_to_visitor(ErrorPositionVisitor& x) const{	x.position_range(start_pos, stop_pos);}
};

class FileExceptionPositionToEnd: public FileException{
	protected:
	const TextSource::PositionType pos;
	public:
	FileExceptionPositionToEnd( TextSource::PositionType n): pos(n){};
	FileExceptionPositionToEnd(const string& a, TextSource::PositionType n):FileException(a), pos(n){};
	void respond_to_visitor(ErrorPositionVisitor& x) const{	x.position_to_end(pos);}
};

class UnexpectedEndOfSource: public FileExceptionAtEnd{
	public:
	UnexpectedEndOfSource();
};

class UnknownCharacter: public FileExceptionPosition{
	public:
	UnknownCharacter(char c, TextSource::PositionType n);
};

class UnterminatedComment: public FileExceptionPositionToEnd{
	public:
	UnterminatedComment(TextSource::PositionType);
};

class UnterminatedLiteral: public FileExceptionPositionToEnd{
	public:
	UnterminatedLiteral(TextSource::PositionType);
};

class UnterminatedPrintDirective: public FileExceptionPositionToEnd{
	public:
	UnterminatedPrintDirective(TextSource::PositionType);
};

class UnbalancedParentheses: public FileExceptionPositionToEnd{
	public:
	UnbalancedParentheses(TextSource::PositionType);
};

class IncompleteFloatNumber: public FileExceptionPosition{
	public:
	IncompleteFloatNumber(TextSource::PositionType);
};

class ErrorEscapeSequence: public FileExceptionPosition{
	public:
	ErrorEscapeSequence(TextSource::PositionType);
};


class ExpectingName: public FileExceptionPositionRange{
	public:
	ExpectingName(TextSource::PositionType nstart,TextSource::PositionType nstop);
};

class ExpectingKeyword: public FileExceptionPositionRange{
	public:
	ExpectingKeyword(const string&, TextSource::PositionType ,TextSource::PositionType );
};

class EncodingMismatch: public FileExceptionPositionRange{
	public:
	EncodingMismatch(int nexp, int nobs, TextSource::PositionType ib, TextSource::PositionType ie);
};

class ExpectingSemicolon: public FileExceptionPosition{
	public:
	ExpectingSemicolon(TextSource::PositionType);
};

class AttributeReadingError:public FileExceptionPositionRange{
	public:
	AttributeReadingError(TextSource::PositionType ib, TextSource::PositionType ie);
};

class ExpectingParentheses: public FileExceptionPosition{
	public:
	ExpectingParentheses(TextSource::PositionType);
};

class ExpectingEquals: public FileExceptionPosition{
	public:
	ExpectingEquals(TextSource::PositionType);
};

class UnexpectedEndOfEntity: public FileExceptionPositionRange{
	public:
	UnexpectedEndOfEntity(TextSource::PositionType ib, TextSource::PositionType ie);
};

class UnexpectedEndOfType: public FileExceptionPositionRange{
	public:
	UnexpectedEndOfType(TextSource::PositionType ib, TextSource::PositionType ie);
};

class BoundsSpecifierError: public FileExceptionPositionRange{
	public:
	BoundsSpecifierError(TextSource::PositionType ib, TextSource::PositionType ie);
};

class ValueReadingError: public FileExceptionPositionRange{
	public:
	ValueReadingError(const string&, TextSource::PositionType ib, TextSource::PositionType ie);
};

class ExpectingNumber: public FileExceptionPositionRange{
	public:
	ExpectingNumber(TextSource::PositionType ib, TextSource::PositionType ie);
};

class ExpectingCommaOrEnd: public FileExceptionPosition{
	public:
	ExpectingCommaOrEnd(TextSource::PositionType);
};

class ExpectingBoundsSpecifier: public FileExceptionPositionRange{
	public:
	ExpectingBoundsSpecifier(TextSource::PositionType ib, TextSource::PositionType ie);
};

class UnknownEntityName: public FileExceptionPositionRange{
	public:
	UnknownEntityName(const string&, TextSource::PositionType ib, TextSource::PositionType ie);
};

class ExpectingValues: public FileExceptionPositionRange{
	public:
	ExpectingValues( TextSource::PositionType ib, TextSource::PositionType ie);
};

class ExpectingRedefinedEncoding:public FileExceptionPosition{
	public:
	ExpectingRedefinedEncoding(TextSource::PositionType);
};

class ExpectingEntityName: public FileExceptionPositionRange{
	public:
	ExpectingEntityName( TextSource::PositionType ib, TextSource::PositionType ie);
};

class InstanceReadingError: public FileExceptionPositionRange{
	public:
	InstanceReadingError( TextSource::PositionType ib, TextSource::PositionType ie);
};

class ExpectingListOfValues: public FileExceptionPositionRange{
	public:
	ExpectingListOfValues( TextSource::PositionType ib, TextSource::PositionType ie);
};

class ExternalEncodingError: public FileExceptionPositionRange{
	public:
	ExternalEncodingError( TextSource::PositionType ib, TextSource::PositionType ie);
};

class ExpectingInstanceID: public FileExceptionPositionRange{
	public:
	ExpectingInstanceID( TextSource::PositionType ib, TextSource::PositionType ie);
};

class ExpectingListOfLiterals: public FileExceptionPositionRange{
	public:
	ExpectingListOfLiterals( TextSource::PositionType ib, TextSource::PositionType ie);
};

class UnexpectedEndOfHeader: public FileExceptionPosition{
	public:
	UnexpectedEndOfHeader(TextSource::PositionType);
};

class ExpectingHeaderEntity: public FileExceptionPositionRange{
	public:
	ExpectingHeaderEntity(const string&, TextSource::PositionType ib, TextSource::PositionType ie);
};

class ExpectingLiteral: public FileExceptionPositionRange{
	public:
	ExpectingLiteral( TextSource::PositionType ib, TextSource::PositionType ie);
};


}
