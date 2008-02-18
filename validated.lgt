
:- category(validated).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2007/09/23,
		comment is 'Objects importing this category are assumed as already validated.']).

	validate(_, instance(This, [], [])) :-	% the object importing this category is valid
		this(This).							% i.e. do not attempt to validate it

:- end_category.
