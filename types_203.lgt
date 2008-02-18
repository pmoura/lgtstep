:- object(hour_in_day,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(Value) :- integer(Value), !, wr1(Value).
	valid(typed_value(hour_in_day,Value)) :- integer(Value), wr1(Value).

	% WR1:(0 <= SELF) AND (SELF < 24)
	wr1(Value) :- 0 =< Value, Value < 24.

:- end_object.


:- object(classified_item,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(X) :- product_definition_formation::valid(X), !.
	valid(X) :- assembly_component_usage::valid(X), !.

:- end_object.


:- object(text,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(Value) :- atom(Value), !.
	valid(typed_value(text,Value)) :- atom(Value).

:- end_object.


:- object(length_measure,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(Value) :- float(Value), !.
	valid(typed_value(length_measure,Value)) :- float(Value).

:- end_object.


:- object(person_organization_select,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(X) :- person::valid(X), !.
	valid(X) :- organization::valid(X), !.
	valid(X) :- person_and_organization::valid(X), !.

:- end_object.


:- object(dimension_count,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(Value) :- integer(Value), !, wr1(Value).
	valid(typed_value(dimension_count,Value)) :- integer(Value), wr1(Value).

	% WR1:SELF > 0
	wr1(Value) :- Value > 0.

:- end_object.


:- object(b_spline_curve_form,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(polyline_form).
	valid(circular_arc).
	valid(elliptic_arc).
	valid(parabolic_arc).
	valid(hyperbolic_arc).
	valid(unspecified).

:- end_object.


:- object(approved_item,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(X) :- product_definition_formation::valid(X), !.
	valid(X) :- product_definition::valid(X), !.
	valid(X) :- configuration_effectivity::valid(X), !.
	valid(X) :- configuration_item::valid(X), !.
	valid(X) :- security_classification::valid(X), !.
	valid(X) :- change_request::valid(X), !.
	valid(X) :- change::valid(X), !.
	valid(X) :- start_request::valid(X), !.
	valid(X) :- start_work::valid(X), !.
	valid(X) :- certification::valid(X), !.
	valid(X) :- contract::valid(X), !.

:- end_object.


:- object(change_request_item,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(X) :- product_definition_formation::valid(X), !.

:- end_object.


:- object(wireframe_model,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(X) :- shell_based_wireframe_model::valid(X), !.
	valid(X) :- edge_based_wireframe_model::valid(X), !.

:- end_object.


:- object(b_spline_surface_form,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(plane_surf).
	valid(cylindrical_surf).
	valid(conical_surf).
	valid(spherical_surf).
	valid(toroidal_surf).
	valid(surf_of_revolution).
	valid(ruled_surf).
	valid(generalised_cone).
	valid(quadric_surf).
	valid(surf_of_linear_extrusion).
	valid(unspecified).

:- end_object.


:- object(ahead_or_behind,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(ahead).
	valid(behind).

:- end_object.


:- object(si_unit_name,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(metre).
	valid(gram).
	valid(second).
	valid(ampere).
	valid(kelvin).
	valid(mole).
	valid(candela).
	valid(radian).
	valid(steradian).
	valid(hertz).
	valid(newton).
	valid(pascal).
	valid(joule).
	valid(watt).
	valid(coulomb).
	valid(volt).
	valid(farad).
	valid(ohm).
	valid(siemens).
	valid(weber).
	valid(tesla).
	valid(henry).
	valid(degree_celsius).
	valid(lumen).
	valid(lux).
	valid(becquerel).
	valid(gray).
	valid(sievert).

:- end_object.


:- object(unit,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(X) :- named_unit::valid(X), !.

:- end_object.


:- object(month_in_year_number,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(Value) :- integer(Value), !, wr1(Value).
	valid(typed_value(month_in_year_number,Value)) :- integer(Value), wr1(Value).

	% WR1:(1 <= SELF) AND (SELF <= 12)
	wr1(Value) :- 1 =< Value, Value =< 12.

:- end_object.


:- object(minute_in_hour,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(Value) :- integer(Value), !, wr1(Value).
	valid(typed_value(minute_in_hour,Value)) :- integer(Value), wr1(Value).

	% WR1:(0 <= SELF) AND (SELF <= 59)
	wr1(Value) :- 0 =< Value, Value =< 59.

:- end_object.


:- object(positive_length_measure,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(Value) :- length_measure::valid(Value), !, wr1(Value).
	valid(typed_value(positive_length_measure,Value)) :- length_measure::valid(Value), wr1(Value).

	% WR1:SELF > 0
	wr1(Value) :- Value > 0.

:- end_object.


:- object(transition_code,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(discontinuous).
	valid(continuous).
	valid(cont_same_gradient).
	valid(cont_same_gradient_same_curvature).

:- end_object.


:- object(contracted_item,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(X) :- product_definition_formation::valid(X), !.

:- end_object.


:- object(mass_measure,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(Value) :- float(Value), !.
	valid(typed_value(mass_measure,Value)) :- float(Value).

:- end_object.


:- object(trimming_preference,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(cartesian).
	valid(parameter).
	valid(unspecified).

:- end_object.


:- object(date_time_item,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(X) :- product_definition::valid(X), !.
	valid(X) :- change_request::valid(X), !.
	valid(X) :- start_request::valid(X), !.
	valid(X) :- change::valid(X), !.
	valid(X) :- start_work::valid(X), !.
	valid(X) :- approval_person_organization::valid(X), !.
	valid(X) :- contract::valid(X), !.
	valid(X) :- security_classification::valid(X), !.
	valid(X) :- certification::valid(X), !.

:- end_object.


:- object(si_prefix,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(exa).
	valid(peta).
	valid(tera).
	valid(giga).
	valid(mega).
	valid(kilo).
	valid(hecto).
	valid(deca).
	valid(deci).
	valid(centi).
	valid(milli).
	valid(micro).
	valid(nano).
	valid(pico).
	valid(femto).
	valid(atto).

:- end_object.


:- object(label,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(Value) :- atom(Value), !.
	valid(typed_value(label,Value)) :- atom(Value).

:- end_object.


:- object(plane_angle_measure,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(Value) :- float(Value), !.
	valid(typed_value(plane_angle_measure,Value)) :- float(Value).

:- end_object.


:- object(boolean_operand,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(X) :- solid_model::valid(X), !.

:- end_object.


:- object(pcurve_or_surface,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(X) :- pcurve::valid(X), !.
	valid(X) :- surface::valid(X), !.

:- end_object.


:- object(positive_plane_angle_measure,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(Value) :- plane_angle_measure::valid(Value), !, wr1(Value).
	valid(typed_value(positive_plane_angle_measure,Value)) :- plane_angle_measure::valid(Value), wr1(Value).

	% WR1:SELF > 0
	wr1(Value) :- Value > 0.

:- end_object.


:- object(specified_item,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(X) :- product_definition::valid(X), !.
	valid(X) :- shape_aspect::valid(X), !.

:- end_object.


:- object(volume_measure,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(Value) :- float(Value), !.
	valid(typed_value(volume_measure,Value)) :- float(Value).

:- end_object.


:- object(context_dependent_measure,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(Value) :- float(Value), !.
	valid(typed_value(context_dependent_measure,Value)) :- float(Value).

:- end_object.


:- object(preferred_surface_curve_representation,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(curve_3d).
	valid(pcurve_s1).
	valid(pcurve_s2).

:- end_object.


:- object(transformation,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(X) :- item_defined_transformation::valid(X), !.
	valid(X) :- functionally_defined_transformation::valid(X), !.

:- end_object.


:- object(work_item,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(X) :- product_definition_formation::valid(X), !.

:- end_object.


:- object(day_in_week_number,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(Value) :- integer(Value), !, wr1(Value).
	valid(typed_value(day_in_week_number,Value)) :- integer(Value), wr1(Value).

	% WR1:(1 <= SELF) AND (SELF <= 7)
	wr1(Value) :- 1 =< Value, Value =< 7.

:- end_object.


:- object(vector_or_direction,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(X) :- vector::valid(X), !.
	valid(X) :- direction::valid(X), !.

:- end_object.


:- object(shell,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(X) :- vertex_shell::valid(X), !.
	valid(X) :- wire_shell::valid(X), !.
	valid(X) :- open_shell::valid(X), !.
	valid(X) :- closed_shell::valid(X), !.

:- end_object.


:- object(founded_item_select,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(X) :- founded_item::valid(X), !.
	valid(X) :- representation_item::valid(X), !.

:- end_object.


:- object(day_in_month_number,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(Value) :- integer(Value), !.
	valid(typed_value(day_in_month_number,Value)) :- integer(Value).

:- end_object.


:- object(knot_type,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(uniform_knots).
	valid(unspecified).
	valid(quasi_uniform_knots).
	valid(piecewise_bezier_knots).

:- end_object.


:- object(week_in_year_number,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(Value) :- integer(Value), !, wr1(Value).
	valid(typed_value(week_in_year_number,Value)) :- integer(Value), wr1(Value).

	% WR1:(1 <= SELF) AND (SELF <= 53)
	wr1(Value) :- 1 =< Value, Value =< 53.

:- end_object.


:- object(count_measure,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(Value) :- number(Value), !.
	valid(typed_value(count_measure,Value)) :- valid(Value).

:- end_object.


:- object(surface_model,
	implements(type_checking)).

	valid(X) :- shell_based_surface_model::valid(X), !.

:- end_object.


:- object(curve_on_surface,
	implements(type_checking)).

	valid(X) :- pcurve::valid(X), !.
	valid(X) :- surface_curve::valid(X), !.
	valid(X) :- composite_curve_on_surface::valid(X), !.

:- end_object.


:- object(certified_item,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(X) :- supplied_part_relationship::valid(X), !.

:- end_object.


:- object(person_organization_item,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(X) :- change::valid(X), !.
	valid(X) :- start_work::valid(X), !.
	valid(X) :- change_request::valid(X), !.
	valid(X) :- start_request::valid(X), !.
	valid(X) :- configuration_item::valid(X), !.
	valid(X) :- product::valid(X), !.
	valid(X) :- product_definition_formation::valid(X), !.
	valid(X) :- product_definition::valid(X), !.
	valid(X) :- contract::valid(X), !.
	valid(X) :- security_classification::valid(X), !.

:- end_object.


:- object(year_number,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(Value) :- integer(Value), !.
	valid(typed_value(year_number,Value)) :- integer(Value).

:- end_object.


:- object(axis2_placement,
	implements(type_checking)).

	valid(X) :- axis2_placement_2d::valid(X), !.
	valid(X) :- axis2_placement_3d::valid(X), !.

:- end_object.


:- object(supported_item,
	implements(type_checking)).

	valid(X) :- action_directive::valid(X), !.
	valid(X) :- action::valid(X), !.
	valid(X) :- action_method::valid(X), !.

:- end_object.


:- object(solid_angle_measure,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(Value) :- float(Value), !.
	valid(typed_value(solid_angle_measure,Value)) :- float(Value).

:- end_object.


:- object(shape_definition,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(X) :- product_definition_shape::valid(X), !.
	valid(X) :- shape_aspect::valid(X), !.
	valid(X) :- shape_aspect_relationship::valid(X), !.

:- end_object.


:- object(second_in_minute,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(Value) :- float(Value), !, wr1(Value).
	valid(typed_value(second_in_minute,Value)) :- float(Value), wr1(Value).

	% WR1:(0 <= SELF) AND (SELF < 60)
	wr1(Value) :- 0 =< Value, Value < 60.

:- end_object.


:- object(reversible_topology_item,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(X) :- edge::valid(X), !.
	valid(X) :- path::valid(X), !.
	valid(X) :- face::valid(X), !.
	valid(X) :- face_bound::valid(X), !.
	valid(X) :- closed_shell::valid(X), !.
	valid(X) :- open_shell::valid(X), !.

:- end_object.


:- object(parameter_value,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(Value) :- float(Value), !.
	valid(typed_value(parameter_value,Value)) :- float(Value).

:- end_object.


:- object(area_measure,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(Value) :- float(Value), !.
	valid(typed_value(area_measure,Value)) :- float(Value).

:- end_object.


:- object(characterized_product_definition,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(X) :- product_definition::valid(X), !.
	valid(X) :- product_definition_relationship::valid(X), !.

:- end_object.


:- object(day_in_year_number,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(Value) :- integer(Value), !.
	valid(typed_value(day_in_year_number,Value)) :- integer(Value).

:- end_object.


:- object(descriptive_measure,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(Value) :- atom(Value), !.
	valid(typed_value(descriptive_measure,Value)) :- atom(Value).

:- end_object.


:- object(start_request_item,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(X) :- product_definition_formation::valid(X), !.

:- end_object.


:- object(date_time_select,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(X) :- date::valid(X), !.
	valid(X) :- local_time::valid(X), !.
	valid(X) :- date_and_time::valid(X), !.

:- end_object.


:- object(source,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(made).
	valid(bought).
	valid(not_known).

:- end_object.


:- object(set_of_reversible_topology_item,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(Value) :- express_set(reversible_topology_item,0,unbounded)::valid(Value), !.
	valid(typed_value(set_of_reversible_topology_item,Value)) :- express_set(reversible_topology_item,0,unbounded)::valid(Value).

:- end_object.


:- object(geometric_set_select,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(X) :- point::valid(X), !.
	valid(X) :- curve::valid(X), !.
	valid(X) :- surface::valid(X), !.

:- end_object.


:- object(identifier,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(Value) :- atom(Value), !.
	valid(typed_value(identifier,Value)) :- atom(Value).

:- end_object.


:- object(trimming_select,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(X) :- cartesian_point::valid(X), !.
	valid(X) :- parameter_value::valid(X), !.

:- end_object.


:- object(measure_value,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(X) :- length_measure::valid(X), !.
	valid(X) :- mass_measure::valid(X), !.
	valid(X) :- plane_angle_measure::valid(X), !.
	valid(X) :- solid_angle_measure::valid(X), !.
	valid(X) :- area_measure::valid(X), !.
	valid(X) :- volume_measure::valid(X), !.
	valid(X) :- parameter_value::valid(X), !.
	valid(X) :- context_dependent_measure::valid(X), !.
	valid(X) :- descriptive_measure::valid(X), !.
	valid(X) :- positive_length_measure::valid(X), !.
	valid(X) :- positive_plane_angle_measure::valid(X), !.
	valid(X) :- count_measure::valid(X), !.

:- end_object.


:- object(characterized_definition,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(X) :- characterized_product_definition::valid(X), !.
	valid(X) :- shape_definition::valid(X), !.

:- end_object.


:- object(list_of_reversible_topology_item,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(Value) :- express_list(reversible_topology_item,0,unbounded)::valid(Value), !.
	valid(typed_value(list_of_reversible_topology_item,Value)) :- express_list(reversible_topology_item,0,unbounded)::valid(Value).

:- end_object.


:- object(reversible_topology,
	implements(type_checking)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	valid(X) :- reversible_topology_item::valid(X), !.
	valid(X) :- list_of_reversible_topology_item::valid(X), !.
	valid(X) :- set_of_reversible_topology_item::valid(X), !.

:- end_object.
