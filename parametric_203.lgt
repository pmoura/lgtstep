
:- object(oriented_edge(_Name, _EdgeElement, _Orientation),
	imports(validated),
	instantiates(oriented_edge)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.',
		parnames is ['Name', 'EdgeElement', 'Orientation']]).

	name(X) :- parameter(1, X).
	edge_element(X) :- parameter(2, X).
	orientation(X) :- parameter(3, X).

:- end_object.


:- object(face_bound(_Name, _Bound, _Orientation),
	imports(validated),
	instantiates(face_bound)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.',
		parnames is ['Name', 'Bound', 'Orientation']]).

	name(X) :- parameter(1, X).
	bound(X) :- parameter(2, X).
	orientation(X) :- parameter(3, X).

:- end_object.


:- object(face_outer_bound(_Name, _Bound, _Orientation),
	imports(validated),
	instantiates(face_outer_bound)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.',
		parnames is ['Name', 'Bound', 'Orientation']]).

	name(X) :- parameter(1, X).
	bound(X) :- parameter(2, X).
	orientation(X) :- parameter(3, X).

:- end_object.


:- object(oriented_face(_Name, _FaceElement, _Orientation),
	imports(validated),
	instantiates(oriented_face)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.',
		parnames is ['Name', 'FaceElement', 'Orientation']]).

	name(X) :- parameter(1, X).
	face_element(X) :- parameter(2, X).
	orientation(X) :- parameter(3, X).

:- end_object.


:- object(oriented_path(_Name, _PathElement, _Orientation),
	imports(validated),
	instantiates(oriented_path)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.',
		parnames is ['Name', 'PathElement', 'Orientation']]).

	name(X) :- parameter(1, X).
	path_element(X) :- parameter(2, X).
	orientation(X) :- parameter(3, X).

:- end_object.


:- object(oriented_open_shell(_Name, _ShellElement, _Orientation),
	imports(validated),
	instantiates(oriented_open_shell)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.',
		parnames is ['Name', 'ShellElement', 'Orientation']]).

	name(X) :- parameter(1, X).
	open_shell_element(X) :- parameter(2, X).
	orientation(X) :- parameter(3, X).

:- end_object.


:- object(oriented_closed_shell(_Name, _ShellElement, _Orientation),
	imports(validated),
	instantiates(oriented_closed_shell)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.',
		parnames is ['Name', 'ShellElement', 'Orientation']]).

	name(X) :- parameter(1, X).
	closed_shell_element(X) :- parameter(2, X).
	orientation(X) :- parameter(3, X).

:- end_object.


:- object(direction(_Name, _DirectionRatios),
	imports(validated),
	instantiates(direction)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.',
		parnames is ['Name', 'DirectionRatios']]).

	name(X) :- parameter(1, X).
	direction_ratios(X) :- parameter(2, X).

:- end_object.


:- object(vector(_Name, _Orientation, _Magnitude),
	imports(validated),
	instantiates(vector)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.',
		parnames is ['Name', 'Orientation', 'Magnitude']]).

	name(X) :- parameter(1, X).
	orientation(X) :- parameter(2, X).
	magnitude(X) :- parameter(3, X).

:- end_object.


:- object(line(_Name, _Point, _Vector),
	imports(validated),
	instantiates(line)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.',
		parnames is ['Name', 'Point', 'Vector']]).

	name(X) :- parameter(1, X).
	pnt(X) :- parameter(2, X).
	dir(X) :- parameter(3, X).

:- end_object.


:- object(dimensional_exponents(_Ln, _Ms, _Tm, _Ec, _Th, _Am, _Lu),
	imports(validated),
	instantiates(dimensional_exponents)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.',
		parnames is ['Length', 'Mass', 'Time', 'ElectricCurrent', 'ThermodynamicTemperature', 'AmountOfSubstance', 'LuminousIntensity']]).

    length_exponent(E)                      :- parameter(1, X), E is X * 1.0.
    mass_exponent(E)                        :- parameter(2, X), E is X * 1.0.
    time_exponent(E)                        :- parameter(3, X), E is X * 1.0.
    electric_current_exponent(E)            :- parameter(4, X), E is X * 1.0.
    thermodynamic_temperature_exponent(E)   :- parameter(5, X), E is X * 1.0.
    amount_of_substance_exponent(E)         :- parameter(6, X), E is X * 1.0.
    luminous_intensity_exponent(E)          :- parameter(7, X), E is X * 1.0.

:- end_object.


:- object(si_unit(_Prefix, _Name),
	imports(validated),
	instantiates(si_unit)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2008/05/14,
		comment is '.',
		parnames is ['Prefix', 'Name']]).

	prefix(Prefix) :- parameter(1, Prefix).
	name(Name) :- parameter(2, Name).

:- end_object.
