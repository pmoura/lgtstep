
:- object(express_aggregate(_Type, _MinSize, _MaxSize),
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is 'Express aggregate type represented as a list of values.',
		parnames is ['Type', 'MinSize', 'MaxSize']]).

    valid(Value) :-
		parameter(1, Type),
		check_type(Value, Type, 0, Length),
        parameter(2, MinSize),
        parameter(3, MaxSize),
		check_size(MinSize, MaxSize, Length).

	check_type([], _, Length, Length).
	check_type([Value| Values], Type, SoFar, Length) :-
		Type::valid(Value),
		SoFar2 is SoFar + 1,
		check_type(Values, Type, SoFar2, Length).

	check_size(MinSize, MaxSize, Length) :-
		Length >= MinSize,
        (	MaxSize == unbounded -> true
		;	Length =< MaxSize
		).

:- end_object.


:- object(express_list(Type, MinSize, MaxSize),
	extends(express_aggregate(Type, MinSize, MaxSize))).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is 'Express list type represented as a list of values.',
		parnames is ['Type', 'MinSize', 'MaxSize']]).

:- end_object.


:- object(express_set(Type, MinSize, MaxSize),
	extends(express_aggregate(Type, MinSize, MaxSize))).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is 'Express set type represented as a list of values.',
		parnames is ['Type', 'MinSize', 'MaxSize']]).

:- end_object.


:- object(express_bag(Type, MinSize, MaxSize),
	extends(express_aggregate(Type, MinSize, MaxSize))).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is 'Express bag type represented as a list of values.',
		parnames is ['Type', 'MinSize', 'MaxSize']]).

:- end_object.


:- object(express_list_unique(Type, MinSize, MaxSize),
	extends(express_aggregate(Type, MinSize, MaxSize))).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is 'Express type of list of non duplicated items.',
		parnames is ['Type', 'MinSize', 'MaxSize']]).

    valid(Value) :-
		^^valid(Value),
		unique(Value, []).

	unique([], _).
	unique([Value| Values], SoFar) :-
		not_member(SoFar, Value),
		not_member(Values, Value),
		unique(Values, [Value| SoFar]).

	not_member([], _).
	not_member([Old| Olds], Value) :-
		Old \== Value,
		not_member(Olds, Value).

:- end_object.


:- object(express_array(Type, MinSize, MaxSize),
	extends(express_aggregate(Type, MinSize, MaxSize))).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.',
		parnames is ['Type', 'MinSize', 'MaxSize']]).

:- end_object.


:- object(express_boolean,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is 'Express boolean type.']).

    valid(true).
    valid(false).

:- end_object.


:- object(express_logical,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is 'Express logical type.']).

    valid(true).
    valid(false).
    valid(unknown).

:- end_object.
