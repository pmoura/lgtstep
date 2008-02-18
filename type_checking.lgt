
:- protocol(type_checking).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is 'Validation protocol for EXPRESS data types.']).

	:- public(valid/1).
	:- mode(valid(@nonvar), zero_or_one).
	:- info(valid/1, [
		comment is 'True if the argument is valid.',
		argnames is ['Value']]).

:- end_protocol.
