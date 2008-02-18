:- object(certification,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(name/1).
	:- mode(name(?label), one, explicit).

	:- public(purpose/1).
	:- mode(purpose(?text), one, explicit).

	:- public(kind/1).
	:- mode(kind(?certification_type), one, explicit).

	context_elements(Value) :-
		self(Self),
		findall(X, (application_context_element::descendant_instance(X), X::frame_of_reference(Self)), Value).

:- end_object.


:- object(action_status,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(status/1).
	:- mode(status(?label), one, explicit).

	:- public(assigned_action/1).
	:- mode(assigned_action(?executed_action), one, explicit).

:- end_object.


:- object(versioned_action_request,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(id/1).
	:- mode(id(?identifier), one, explicit).

	:- public(version/1).
	:- mode(version(?label), one, explicit).

	:- public(purpose/1).
	:- mode(purpose(?text), one, explicit).

	:- public(description/1).
	:- mode(description(?text), one, explicit).

:- end_object.


:- object(shape_aspect_relationship,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(name/1).
	:- mode(name(?label), one, explicit).

	:- public(description/1).
	:- mode(description(?text), one, explicit).

	:- public(relating_shape_aspect/1).
	:- mode(relating_shape_aspect(?shape_aspect), one, explicit).

	:- public(related_shape_aspect/1).
	:- mode(related_shape_aspect(?shape_aspect), one, explicit).

:- end_object.


:- object(document_reference,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(assigned_document/1).
	:- mode(assigned_document(?document), one, explicit).

	:- public(source/1).
	:- mode(source(?label), one, explicit).

:- end_object.


:- object(security_classification_level,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(name/1).
	:- mode(name(?label), one, explicit).

:- end_object.


:- object(certification_assignment,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(assigned_certification/1).
	:- mode(assigned_certification(?certification), one, explicit).

:- end_object.


:- object(property_definition_representation,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(definition/1).
	:- mode(definition(?property_definition), one, explicit).

	:- public(used_representation/1).
	:- mode(used_representation(?representation), one, explicit).

:- end_object.


:- object(approval_role,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(role/1).
	:- mode(role(?label), one, explicit).

:- end_object.


:- object(document_type,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(product_data_type/1).
	:- mode(product_data_type(?label), one, explicit).

:- end_object.


:- object(alternate_product_relationship,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(name/1).
	:- mode(name(?label), one, explicit).

	:- public(definition/1).
	:- mode(definition(?text), one, explicit).

	:- public(alternate/1).
	:- mode(alternate(?product), one, explicit).

	:- public(base/1).
	:- mode(base(?product), one, explicit).

	:- public(basis/1).
	:- mode(basis(?text), one, explicit).

	unique_rule(ur1, [alternate, base]).

	domain_rules([wr1]).

	% rule wr1:alternate :<>: base
	domain_rule(wr1) :-
		::alternate(Alternate), Alternate::id(AlternateId),
		::base(Base), Base::id(BaseId),
		AlternateId \== BaseId.

:- end_object.


:- object(representation_item,
	instantiates(express_entity),
	specializes(express_object)).

	:- public(name/1).
	:- mode(name(?label), one, explicit).

	domain_rules([wr1]).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).


	:- public(used_in_representation/1).
	:- dynamic(used_in_representation/1).

	:- public(uses_item/1).

	uses_item(Item) :-
		(	nonvar(Item) ->
			::attr_spec(Attr, _, _, Kind), Kind \== derived,
			::uses_item_via_attr(Item, Attr), !
		;	setof(Attr, Type^Cardinality^Kind^(::attr_spec(Attr, Type, Cardinality, Kind), Kind \== derived), Attributes),
			list::member(Attr, Attributes),
			setof(Item, ::uses_item_via_attr(Item, Attr), Items),
			list::member(Item, Items)
		).

	% The uses_item_via_attr provides a mechanism by which specializations of representation
	% item can stop checking an attribute for value of a target value -- this would be used for
	% optimization; if you know an attribute does not refer to a representation_item (as in 'name' 
	% below; or for derived attributes if they simply reorder representation_items already referred to in
	% other attributes, or more seriously if an inverse attribute leads to circular references
	:- protected(uses_item_via_attr/2).

	uses_item_via_attr(Item, Attr) :-
		Goal =.. [Attr, Value],
		::Goal,
		uses_item_via_value(Item, Value).

	uses_item_via_value(Value,  [Head | _]) :-
		uses_item_via_value(Value, Head).
	uses_item_via_value(Value,  [_ | Tail]) :-
		uses_item_via_value(Value, Tail).
	uses_item_via_value(Value,  Value) :-
		catch(current_object(Value), _, fail),
		(	Value::ancestor(representation_item)
		;	Value::ancestor(founded_item)
		), !.

	:- public(descendant_item/1).
	descendant_item(X) :-
		::uses_item(Y),
		(	X = Y
		;	Y::descendant_item(X)
		).

	% rule wr1:SIZEOF (using_representations(SELF)) > 0
	domain_rule(wr1) :-
		::used_in_representation(_), !.

:- end_object.


:- object(date_and_time,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(date_component/1).
	:- mode(date_component(?date), one, explicit).

	:- public(time_component/1).
	:- mode(time_component(?local_time), one, explicit).

:- end_object.


:- object(configuration_design,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(configuration/1).
	:- mode(configuration(?configuration_item), one, explicit).

	:- public(design/1).
	:- mode(design(?product_definition_formation), one, explicit).

	unique_rule(ur1, [configuration, design]).

:- end_object.


:- object(product_category,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(name/1).
	:- mode(name(?label), one, explicit).

	:- public(description/1).
	:- mode(description(?text), zero_or_one, explicit).

:- end_object.


:- object(shape_aspect,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(name/1).
	:- mode(name(?label), one, explicit).

	:- public(description/1).
	:- mode(description(?text), one, explicit).

	:- public(of_shape/1).
	:- mode(of_shape(?product_definition_shape), one, explicit).

	:- public(product_definitional/1).
	:- mode(product_definitional(?express_logical), one, explicit).

:- end_object.


:- object(security_classification_assignment,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(assigned_security_classification/1).
	:- mode(assigned_security_classification(?security_classification), one, explicit).

:- end_object.


:- object(topological_representation_item,
	instantiates(express_entity),
	specializes(representation_item)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

:- end_object.


:- object(approval_person_organization,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(person_organization/1).
	:- mode(person_organization(?person_organization_select), one, explicit).

	:- public(authorized_approval/1).
	:- mode(authorized_approval(?approval), one, explicit).

	:- public(role/1).
	:- mode(role(?approval_role), one, explicit).

:- end_object.


:- object(application_protocol_definition,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(status/1).
	:- mode(status(?label), one, explicit).

	:- public(application_interpreted_model_schema_name/1).
	:- mode(application_interpreted_model_schema_name(?label), one, explicit).

	:- public(application_protocol_year/1).
	:- mode(application_protocol_year(?year_number), one, explicit).

	:- public(application/1).
	:- mode(application(?application_context), one, explicit).

:- end_object.


:- object(shape_definition_representation,
	instantiates(express_entity),
	specializes(property_definition_representation)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	domain_rules([wr1, wr2]).

	% rule wr1:(('CONFIG_CONTROL_DESIGN.SHAPE_DEFINITION' IN TYPEOF(SELF. definition.definition)) OR ( 'CONFIG_CONTROL_DESIGN.PRODUCT_DEFINITION_SHAPE' IN TYPEOF( SELF.definition)))
	domain_rule(wr1) :-
		::definition(Def),
		(	Def::ancestor(product_definition_shape) ->
			true
		;	Def::definition(DefDef),
			DefDef::ancestor(shape_definition), !
		).

	% rule wr2:'CONFIG_CONTROL_DESIGN.SHAPE_REPRESENTATION' IN TYPEOF(SELF.used_representation)
	domain_rule(wr2) :-
		::used_representation(Representation),
		Representation::ancestor(shape_representation), !.

:- end_object.


:- object(action_assignment,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(assigned_action/1).
	:- mode(assigned_action(?action), one, explicit).

:- end_object.


:- object(action_request_assignment,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(assigned_action_request/1).
	:- mode(assigned_action_request(?versioned_action_request), one, explicit).

:- end_object.


:- object(date_time_role,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(name/1).
	:- mode(name(?label), one, explicit).

:- end_object.


:- object(product_concept,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(id/1).
	:- mode(id(?identifier), one, explicit).

	:- public(name/1).
	:- mode(name(?label), one, explicit).

	:- public(description/1).
	:- mode(description(?text), one, explicit).

	:- public(market_context/1).
	:- mode(market_context(?product_concept_context), one, explicit).

	unique_rule(ur1, [id]).

:- end_object.


:- object(functionally_defined_transformation,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(name/1).
	:- mode(name(?label), one, explicit).

	:- public(description/1).
	:- mode(description(?text), one, explicit).

:- end_object.


:- object(person_and_organization_assignment,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(assigned_person_and_organization/1).
	:- mode(assigned_person_and_organization(?person_and_organization), one, explicit).

	:- public(role/1).
	:- mode(role(?person_and_organization_role), one, explicit).

:- end_object.


:- object(start_work,
	instantiates(express_entity),
	specializes(action_assignment)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(items/1).
	:- mode(items(?express_set(work_item,1,unbounded)), one, explicit).

:- end_object.


:- object(address,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(internal_location/1).
	:- mode(internal_location(?label), zero_or_one, explicit).

	:- public(street_number/1).
	:- mode(street_number(?label), zero_or_one, explicit).

	:- public(street/1).
	:- mode(street(?label), zero_or_one, explicit).

	:- public(postal_box/1).
	:- mode(postal_box(?label), zero_or_one, explicit).

	:- public(town/1).
	:- mode(town(?label), zero_or_one, explicit).

	:- public(region/1).
	:- mode(region(?label), zero_or_one, explicit).

	:- public(postal_code/1).
	:- mode(postal_code(?label), zero_or_one, explicit).

	:- public(country/1).
	:- mode(country(?label), zero_or_one, explicit).

	:- public(facsimile_number/1).
	:- mode(facsimile_number(?label), zero_or_one, explicit).

	:- public(telephone_number/1).
	:- mode(telephone_number(?label), zero_or_one, explicit).

	:- public(electronic_mail_address/1).
	:- mode(electronic_mail_address(?label), zero_or_one, explicit).

	:- public(telex_number/1).
	:- mode(telex_number(?label), zero_or_one, explicit).

	domain_rules([wr1]).

	% rule wr1:EXISTS(internal_location) OR EXISTS(street_number) OR EXISTS(street) OR EXISTS(postal_box) OR EXISTS(town) OR EXISTS(region) OR EXISTS(postal_code) OR EXISTS(country) OR EXISTS(facsimile_number) OR EXISTS(telephone_number) OR EXISTS(electronic_mail_address) OR EXISTS(telex_number)
	domain_rule(wr1) :- ::internal_location(_), !.
	domain_rule(wr1) :- ::street_number(_), !.
	domain_rule(wr1) :- ::street(_), !.
	domain_rule(wr1) :- ::postal_box(_), !.
	domain_rule(wr1) :- ::town(_), !.
	domain_rule(wr1) :- ::region(_), !.
	domain_rule(wr1) :- ::postal_code(_), !.
	domain_rule(wr1) :- ::country(_), !.
	domain_rule(wr1) :- ::facsimile_number(_), !.
	domain_rule(wr1) :- ::telephone_number(_), !.
	domain_rule(wr1) :- ::electronic_mail_address(_), !.
	domain_rule(wr1) :- ::telex_number(_), !.

:- end_object.


:- object(change_request,
	instantiates(express_entity),
	specializes(action_request_assignment)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(items/1).
	:- mode(items(?express_set(change_request_item,1,unbounded)), one, explicit).

:- end_object.


:- object(approval,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(status/1).
	:- mode(status(?approval_status), one, explicit).

	:- public(level/1).
	:- mode(level(?label), one, explicit).

:- end_object.


:- object(certification_type,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(description/1).
	:- mode(description(?label), one, explicit).

:- end_object.


:- object(change,
	instantiates(express_entity),
	specializes(action_assignment)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(items/1).
	:- mode(items(?express_set(work_item,1,unbounded)), one, explicit).

:- end_object.


:- object(action_request_solution,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(method/1).
	:- mode(method(?action_method), one, explicit).

	:- public(request/1).
	:- mode(request(?versioned_action_request), one, explicit).

:- end_object.


:- object(contract_assignment,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(assigned_contract/1).
	:- mode(assigned_contract(?contract), one, explicit).

:- end_object.


:- object(representation_relationship,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(name/1).
	:- mode(name(?label), one, explicit).

	:- public(description/1).
	:- mode(description(?text), one, explicit).

	:- public(rep_1/1).
	:- mode(rep_1(?representation), one, explicit).

	:- public(rep_2/1).
	:- mode(rep_2(?representation), one, explicit).

:- end_object.


:- object(contract,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(name/1).
	:- mode(name(?label), one, explicit).

	:- public(purpose/1).
	:- mode(purpose(?text), one, explicit).

	:- public(kind/1).
	:- mode(kind(?contract_type), one, explicit).

:- end_object.


:- object(connected_face_set,
	instantiates(express_entity),
	specializes(topological_representation_item)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(cfs_faces/1).
	:- mode(cfs_faces(?express_set(face,1,unbounded)), one, explicit).

:- end_object.


:- object(action,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(name/1).
	:- mode(name(?label), one, explicit).

	:- public(description/1).
	:- mode(description(?text), one, explicit).

	:- public(chosen_method/1).
	:- mode(chosen_method(?action_method), one, explicit).

:- end_object.


:- object(person_and_organization_role,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(name/1).
	:- mode(name(?label), one, explicit).

:- end_object.


:- object(measure_with_unit,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).
	:- public(value_component/1).
	:- mode(value_component(?measure_value), one, explicit).

	:- public(unit_component/1).
	:- mode(unit_component(?unit), one, explicit).

	domain_rules([wr1]).

	% rule wr1:valid_units(SELF)
	domain_rule(wr1) :-
		self(Self),
		valid_units::true(Self).

:- end_object.


:- object(product_definition,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(id/1).
	:- mode(id(?identifier), one, explicit).

	:- public(description/1).
	:- mode(description(?text), one, explicit).

	:- public(formation/1).
	:- mode(formation(?product_definition_formation), one, explicit).

	:- public(frame_of_reference/1).
	:- mode(frame_of_reference(?product_definition_context), one, explicit).

:- end_object.


:- object(plane_angle_measure_with_unit,
	instantiates(express_entity),
	specializes(measure_with_unit)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	domain_rules([wr1]).

	% rule wr1:'CONFIG_CONTROL_DESIGN.PLANE_ANGLE_UNIT' IN TYPEOF(SELF\measure_with_unit.unit_component)
	domain_rule(wr1) :-
		::unit_component(Unit),
		Unit::ancestor(plane_angle_unit), !.

:- end_object.


:- object(application_context_element,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(name/1).
	:- mode(name(?label), one, explicit).

	:- public(frame_of_reference/1).
	:- mode(frame_of_reference(?application_context), one, explicit).

:- end_object.


:- object(solid_angle_measure_with_unit,
	instantiates(express_entity),
	specializes(measure_with_unit)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	domain_rules([wr1]).

	% rule wr1:'CONFIG_CONTROL_DESIGN.SOLID_ANGLE_UNIT' IN TYPEOF(SELF\measure_with_unit.unit_component)
	domain_rule(wr1) :-
		::unit_component(Unit),
		Unit::ancestor(solid_angle_unit), !.

:- end_object.


:- object(path,
	instantiates(express_entity),
	specializes(topological_representation_item)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(edge_list/1).
	:- mode(edge_list(?express_list_unique(oriented_edge,1,unbounded)), one, explicit).

	domain_rules([wr1]).

	% rule wr1:path_head_to_tail (SELF)
	domain_rule(wr1) :-
		self(Self),
		path_head_to_tail::true(Self).

:- end_object.


:- object(contract_type,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(description/1).
	:- mode(description(?label), one, explicit).

:- end_object.


:- object(personal_address,
	instantiates(express_entity),
	specializes(address)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(people/1).
	:- mode(people(?express_set(person,1,unbounded)), one, explicit).

	:- public(description/1).
	:- mode(description(?text), one, explicit).

:- end_object.


:- object(product_definition_relationship,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(id/1).
	:- mode(id(?identifier), one, explicit).

	:- public(name/1).
	:- mode(name(?label), one, explicit).

	:- public(description/1).
	:- mode(description(?text), one, explicit).

	:- public(relating_product_definition/1).
	:- mode(relating_product_definition(?product_definition), one, explicit).

	:- public(related_product_definition/1).
	:- mode(related_product_definition(?product_definition), one, explicit).

:- end_object.


:- object(length_measure_with_unit,
	instantiates(express_entity),
	specializes(measure_with_unit)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	domain_rules([wr1]).

	% rule wr1:'CONFIG_CONTROL_DESIGN.LENGTH_UNIT' IN TYPEOF (SELF\measure_with_unit.unit_component)
	domain_rule(wr1) :-
		::unit_component(Unit),
		Unit::ancestor(length_unit), !.

:- end_object.


:- object(approval_status,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(name/1).
	:- mode(name(?label), one, explicit).

:- end_object.


:- object(executed_action,
	instantiates(express_entity),
	specializes(action)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

:- end_object.


:- object(approval_assignment,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(assigned_approval/1).
	:- mode(assigned_approval(?approval), one, explicit).

:- end_object.


:- object(document_relationship,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(name/1).
	:- mode(name(?label), one, explicit).

	:- public(description/1).
	:- mode(description(?text), one, explicit).

	:- public(relating_document/1).
	:- mode(relating_document(?document), one, explicit).

	:- public(related_document/1).
	:- mode(related_document(?document), one, explicit).

:- end_object.


:- object(cc_design_approval,
	instantiates(express_entity),
	specializes(approval_assignment)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(items/1).
	:- mode(items(?express_set(approved_item,1,unbounded)), one, explicit).

:- end_object.


:- object(property_definition,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(name/1).
	:- mode(name(?label), one, explicit).

	:- public(description/1).
	:- mode(description(?text), one, explicit).

	:- public(definition/1).
	:- mode(definition(?characterized_definition), one, explicit).

:- end_object.


:- object(uncertainty_measure_with_unit,
	instantiates(express_entity),
	specializes(measure_with_unit)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).
	:- public(name/1).
	:- mode(name(?label), one, explicit).

	:- public(description/1).
	:- mode(description(?text), one, explicit).

	domain_rules([wr1]).

	% rule wr1: valid_measure_value(SELF\measure_with_unit.value_component);
	domain_rule(wr1) :-
		::value_component(Component),
		valid_measure_value::true(Component).

:- end_object.


:- object(approval_relationship,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(name/1).
	:- mode(name(?label), one, explicit).

	:- public(description/1).
	:- mode(description(?text), one, explicit).

	:- public(relating_approval/1).
	:- mode(relating_approval(?approval), one, explicit).

	:- public(related_approval/1).
	:- mode(related_approval(?approval), one, explicit).

:- end_object.


:- object(product_category_relationship,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(name/1).
	:- mode(name(?label), one, explicit).

	:- public(description/1).
	:- mode(description(?text), one, explicit).

	:- public(category/1).
	:- mode(category(?product_category), one, explicit).

	:- public(sub_category/1).
	:- mode(sub_category(?product_category), one, explicit).

	domain_rules([wr1]).

	% rule wr1:acyclic_product_category_relationship(SELF,[SELF.sub_category])
	domain_rule(wr1) :-
		self(Self),
		acyclic_product_category_relationship::true(Self).

:- end_object.


:- object(product_context,
	instantiates(express_entity),
	specializes(application_context_element)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(discipline_type/1).
	:- mode(discipline_type(?label), one, explicit).

:- end_object.


:- object(oriented_path,
	instantiates(express_entity),
	specializes(path)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(path_element/1).
	:- mode(path_element(?path), one, explicit).

	:- public(orientation/1).
	:- mode(orientation(?express_boolean), one, explicit).

	:- public(edge_list/1).
	:- mode(edge_list(?express_list_unique(oriented_edge,1,unbounded)), one, derived).

	domain_rules([wr1]).

	% derived edge_list:LIST [1:?] OF UNIQUE oriented_edge := conditional_reverse(SELF.orientation, SELF.path_element.edge_list)
	edge_list(Edges) :-
		::orientation(Orientation),
		::path_element(Path),
		Path::edge_list(List),
		conditional_reverse::eval(Orientation, List, Edges).

	% rule wr1:NOT ('CONFIG_CONTROL_DESIGN.ORIENTED_PATH' IN TYPEOF (SELF.path_element))
	domain_rule(wr1) :-
		::path_element(Path),
		\+ Path::ancestor(oriented_path).

:- end_object.


:- object(named_unit,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(dimensions/1).
	:- mode(dimensions(?dimensional_exponents), one, explicit).

:- end_object.


:- object(founded_item,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/03/30,
		comment is '.']).

	:- public(used_in_representation/1).
	:- dynamic(used_in_representation/1).
	
	:- public(uses_item/1).
	:- public(descendant_item/1).

	descendant_item(X) :-
		::uses_item(Y),
		(X=Y ; Y::descendant_item(X)).

:- end_object.


:- object(supplied_part_relationship,
	instantiates(express_entity),
	specializes(product_definition_relationship)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

:- end_object.


:- object(design_make_from_relationship,
	instantiates(express_entity),
	specializes(product_definition_relationship)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

:- end_object.


:- object(action_method,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(name/1).
	:- mode(name(?label), one, explicit).

	:- public(description/1).
	:- mode(description(?text), one, explicit).

	:- public(consequence/1).
	:- mode(consequence(?text), one, explicit).

	:- public(purpose/1).
	:- mode(purpose(?text), one, explicit).

:- end_object.


:- object(approval_date_time,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(date_time/1).
	:- mode(date_time(?date_time_select), one, explicit).

	:- public(dated_approval/1).
	:- mode(dated_approval(?approval), one, explicit).

:- end_object.


:- object(context_dependent_shape_representation,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(representation_relation/1).
	:- mode(representation_relation(?shape_representation_relationship), one, explicit).

	:- public(represented_product_relation/1).
	:- mode(represented_product_relation(?product_definition_shape), one, explicit).

	domain_rules([wr1]).

	% rule wr1:'CONFIG_CONTROL_DESIGN.PRODUCT_DEFINITION_RELATIONSHIP' IN TYPEOF(SELF.represented_product_relation.definition)
	domain_rule(wr1) :-
		::represented_product_relation(Rep),
		Rep::definition(Def),
		Def::ancestor(product_definition_relationship), !.

:- end_object.


:- object(person_and_organization,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(the_person/1).
	:- mode(the_person(?person), one, explicit).

	:- public(the_organization/1).
	:- mode(the_organization(?organization), one, explicit).

:- end_object.


:- object(geometric_representation_item,
	instantiates(express_entity),
	specializes(representation_item)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(dim/1).
	:- mode(dim(?dimension_count), one, derived).

	domain_rules([wr1]).

	% derived dim:dimension_count := dimension_of(SELF)
 	dim(Dimension) :- 
 		self(Self),
		dimension_of::eval(Self, Dimension).

	% rule wr1:SIZEOF (QUERY (using_rep <* using_representations (SELF) | NOT ('CONFIG_CONTROL_DESIGN.GEOMETRIC_REPRESENTATION_CONTEXT' IN TYPEOF (using_rep.context_of_items)))) = 0
	domain_rule(wr1) :-
		\+ (	::used_in_representation(Rep),
				Rep::context_of_items(Context),
				\+ Context::ancestor(geometric_representation_context)
			).

:- end_object.


:- object(cc_design_certification,
	instantiates(express_entity),
	specializes(certification_assignment)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(items/1).
	:- mode(items(?express_set(certified_item,1,unbounded)), one, explicit).

:- end_object.


:- object(dimensional_exponents,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(length_exponent/1).
	:- mode(length_exponent(?float), one, explicit).

	:- public(mass_exponent/1).
	:- mode(mass_exponent(?float), one, explicit).

	:- public(time_exponent/1).
	:- mode(time_exponent(?float), one, explicit).

	:- public(electric_current_exponent/1).
	:- mode(electric_current_exponent(?float), one, explicit).

	:- public(thermodynamic_temperature_exponent/1).
	:- mode(thermodynamic_temperature_exponent(?float), one, explicit).

	:- public(amount_of_substance_exponent/1).
	:- mode(amount_of_substance_exponent(?float), one, explicit).

	:- public(luminous_intensity_exponent/1).
	:- mode(luminous_intensity_exponent(?float), one, explicit).

:- end_object.


:- object(loop,
	instantiates(express_entity),
	specializes(topological_representation_item)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

:- end_object.


:- object(organizational_address,
	instantiates(express_entity),
	specializes(address)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(organizations/1).
	:- mode(organizations(?express_set(organization,1,unbounded)), one, explicit).

	:- public(description/1).
	:- mode(description(?text), one, explicit).

:- end_object.


:- object(security_classification,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(name/1).
	:- mode(name(?label), one, explicit).

	:- public(purpose/1).
	:- mode(purpose(?text), one, explicit).

	:- public(security_level/1).
	:- mode(security_level(?security_classification_level), one, explicit).

:- end_object.


:- object(cc_design_security_classification,
	instantiates(express_entity),
	specializes(security_classification_assignment)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(items/1).
	:- mode(items(?express_set(classified_item,1,unbounded)), one, explicit).

:- end_object.


:- object(action_request_status,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(status/1).
	:- mode(status(?label), one, explicit).

	:- public(assigned_request/1).
	:- mode(assigned_request(?versioned_action_request), one, explicit).

:- end_object.


:- object(length_unit,
	instantiates(express_entity),
	specializes(named_unit)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	domain_rules([wr1]).

	% rule wr1:(SELF\named_unit.dimensions.length_exponent = 1) AND (SELF\named_unit.dimensions.mass_exponent = 0) AND (SELF\named_unit.dimensions.time_exponent = 0) AND (SELF\named_unit.dimensions.electric_current_exponent = 0) AND (SELF\named_unit.dimensions.thermodynamic_temperature_exponent = 0) AND (SELF\named_unit.dimensions.amount_of_substance_exponent = 0) AND (SELF\named_unit.dimensions.luminous_intensity_exponent = 0)
	domain_rule(wr1) :-
		::dimensions(Dims),
		Dims::length_exponent(1.0),
		Dims::mass_exponent(0.0),
		Dims::time_exponent(0.0),
		Dims::electric_current_exponent(0.0),
		Dims::thermodynamic_temperature_exponent(0.0),
		Dims::amount_of_substance_exponent(0.0),
		Dims::luminous_intensity_exponent(0.0).

:- end_object.


:- object(shell_based_wireframe_model,
	instantiates(express_entity),
	specializes(geometric_representation_item)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(sbwm_boundary/1).
	:- mode(sbwm_boundary(?express_set(shell,1,unbounded)), one, explicit).

	domain_rules([wr1]).

	% rule wr1:constraints_geometry_shell_based_wireframe_model(SELF)
	domain_rule(wr1) :-
		self(Self),
		constraints_geometry_shell_based_wireframe_model::true(Self).

:- end_object.


:- object(surface,
	instantiates(express_entity),
	specializes(geometric_representation_item)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

:- end_object.


:- object(coordinated_universal_time_offset,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(hour_offset/1).
	:- mode(hour_offset(?hour_in_day), one, explicit).

	:- public(minute_offset/1).
	:- mode(minute_offset(?minute_in_hour), zero_or_one, explicit).

	:- public(sense/1).
	:- mode(sense(?ahead_or_behind), one, explicit).

:- end_object.


:- object(area_measure_with_unit,
	instantiates(express_entity),
	specializes(measure_with_unit)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	domain_rules([wr1]).

	% rule wr1:'CONFIG_CONTROL_DESIGN.AREA_UNIT' IN TYPEOF(SELF\measure_with_unit.unit_component)
	domain_rule(wr1) :-
		::unit_component(Unit),
		Unit::ancestor(area_unit), !.

:- end_object.


:- object(configuration_item,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(id/1).
	:- mode(id(?identifier), one, explicit).

	:- public(name/1).
	:- mode(name(?label), one, explicit).

	:- public(description/1).
	:- mode(description(?text), zero_or_one, explicit).

	:- public(item_concept/1).
	:- mode(item_concept(?product_concept), one, explicit).

	:- public(purpose/1).
	:- mode(purpose(?label), zero_or_one, explicit).

	unique_rule(ur1, [id]).

:- end_object.


:- object(organization_relationship,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(name/1).
	:- mode(name(?label), one, explicit).

	:- public(description/1).
	:- mode(description(?text), one, explicit).

	:- public(relating_organization/1).
	:- mode(relating_organization(?organization), one, explicit).

	:- public(related_organization/1).
	:- mode(related_organization(?organization), one, explicit).

:- end_object.


:- object(document_usage_constraint,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(source/1).
	:- mode(source(?document), one, explicit).

	:- public(subject_element/1).
	:- mode(subject_element(?label), one, explicit).

	:- public(subject_element_value/1).
	:- mode(subject_element_value(?text), one, explicit).

:- end_object.


:- object(representation_map,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(mapping_origin/1).
	:- mode(mapping_origin(?representation_item), one, explicit).

	:- public(mapped_representation/1).
	:- mode(mapped_representation(?representation), one, explicit).

	:- public(map_usage/1).
	:- mode(map_usage(?express_set(mapped_item,1,unbounded)), one, inverse).
	map_usage(Value) :-
		self(Self),
		findall(X, (mapped_item::descendant_instance(X), X::mapping_source(Self)), Value).

	domain_rules([wr1]).

	% rule wr1:item_in_context(SELF.mapping_origin, SELF.mapped_representation.context_of_items)
	domain_rule(wr1) :-
		::mapping_origin(Origin),
		::mapped_representation(Representation),
		Representation::context_of_items(Context),
		item_in_context::true(Origin, Context), !.

:- end_object.


:- object(application_context,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(application/1).
	:- mode(application(?text), one, explicit).

	:- public(context_elements/1).
	:- mode(context_elements(?express_set(application_context_element,1,unbounded)), one, inverse).

	context_elements(Value) :-
		self(Self),
		findall(X, (application_context_element::descendant_instance(X), X::frame_of_reference(Self)), Value).

:- end_object.


:- object(representation_context,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(context_identifier/1).
	:- mode(context_identifier(?identifier), one, explicit).

	:- public(context_type/1).
	:- mode(context_type(?text), one, explicit).

	:- public(representations_in_context/1).
	:- mode(representations_in_context(?express_set(representation,1,unbounded)), one, inverse).

	representations_in_context(Value) :-
		self(Self),
		findall(X, (representation::descendant_instance(X), X::context_of_items(Self)), Value).

:- end_object.


:- object(start_request,
	instantiates(express_entity),
	specializes(action_request_assignment)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(items/1).
	:- mode(items(?express_set(start_request_item,1,unbounded)), one, explicit).

:- end_object.


:- object(mapped_item,
	instantiates(express_entity),
	specializes(representation_item)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(mapping_source/1).
	:- mode(mapping_source(?representation_map), one, explicit).

	:- public(mapping_target/1).
	:- mode(mapping_target(?representation_item), one, explicit).

	domain_rules([wr1]).

	% rule wr1:acyclic_mapped_representation(using_representations(SELF), [SELF])
	domain_rule(wr1) :-
		self(Self),
		acyclic_mapped_representation::true(Self).

:- end_object.


:- object(assembly_component_usage_substitute,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(name/1).
	:- mode(name(?label), one, explicit).

	:- public(definition/1).
	:- mode(definition(?text), one, explicit).

	:- public(base/1).
	:- mode(base(?assembly_component_usage), one, explicit).

	:- public(substitute/1).
	:- mode(substitute(?assembly_component_usage), one, explicit).

	unique_rule(ur1, [base, substitute]).

	domain_rules([wr1, wr2]).

	% rule wr1:base.relating_product_definition :=: substitute. relating_product_definition
	domain_rule(wr1) :-
		::base(Base), Base::relating_product_definition(Definition),
		::substitute(Substitute), Substitute::relating_product_definition(Definition).

	% rule wr2:base :<>: substitute
	domain_rule(wr2) :-
		::base(Base), Base::id(BaseId),
		::substitute(Substitute), Substitute::id(SubstituteId),
		BaseId \== SubstituteId.

:- end_object.


:- object(document,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(id/1).
	:- mode(id(?identifier), one, explicit).

	:- public(name/1).
	:- mode(name(?label), one, explicit).

	:- public(description/1).
	:- mode(description(?text), one, explicit).

	:- public(kind/1).
	:- mode(kind(?document_type), one, explicit).

	unique_rule(ur1, [id]).

:- end_object.


:- object(poly_loop,
	instantiates(express_entity),
	specializes(loop,geometric_representation_item)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- alias(loop, uses_item_via_attr/2, loop_uses_item_via_attr/2).
	:- alias(geometric_representation_item, uses_item_via_attr/2, geometric_representation_item_uses_item_via_attr/2).

	:- public(polygon/1).
	:- mode(polygon(?express_list_unique(cartesian_point,3,unbounded)), one, explicit).

	uses_item_via_attr(Item, Attr) :-
		::loop_uses_item_via_attr(Item, Attr).
	uses_item_via_attr(Item, Attr) :-
		::geometric_representation_item_uses_item_via_attr(Item, Attr).

:- end_object.


:- object(product,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(id/1).
	:- mode(id(?identifier), one, explicit).

	:- public(name/1).
	:- mode(name(?label), one, explicit).

	:- public(description/1).
	:- mode(description(?text), one, explicit).

	:- public(frame_of_reference/1).
	:- mode(frame_of_reference(?express_set(product_context,1,unbounded)), one, explicit).

	unique_rule(ur1, [id]).

:- end_object.


:- object(global_uncertainty_assigned_context,
	instantiates(express_entity),
	specializes(representation_context)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(uncertainty/1).
	:- mode(uncertainty(?express_set(uncertainty_measure_with_unit,1,unbounded)), one, explicit).

:- end_object.


:- object(composite_curve_segment,
	instantiates(express_entity),
	specializes(founded_item)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(transition/1).
	:- mode(transition(?transition_code), one, explicit).

	:- public(same_sense/1).
	:- mode(same_sense(?express_boolean), one, explicit).

	:- public(parent_curve/1).
	:- mode(parent_curve(?curve), one, explicit).

	:- public(using_curves/1).
	:- mode(using_curves(?express_bag(composite_curve,1,unbounded)), one, inverse).

	using_curves(Value) :-
		self(Self),
		findall(X, (composite_curve::descendant_instance(X), X::segments(Self)), Value).

	domain_rules([wr1]).

	% rule wr1:'CONFIG_CONTROL_DESIGN.BOUNDED_CURVE' IN TYPEOF(parent_curve)
	domain_rule(wr1) :-
		::parent_curve(Curve),
		Curve::ancestor(bounded_curve), !.
		
	uses_item(X) :-
		::parent_curve(X).

:- end_object.


:- object(representation,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(name/1).
	:- mode(name(?label), one, explicit).

	:- public(items/1).
	:- mode(items(?express_set(representation_item,1,unbounded)), one, explicit).

	:- public(context_of_items/1).
	:- mode(context_of_items(?representation_context), one, explicit).

	:- public(uses_item/1).

	uses_item(X) :-
		::items(Items),
		list::member(Item, Items),
		(Item=X ; Item::descendant_item(X)).

:- end_object.


:- object(date,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(year_component/1).
	:- mode(year_component(?year_number), one, explicit).

:- end_object.


:- object(si_unit,
	instantiates(express_entity),
	specializes(named_unit)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(prefix/1).
	:- mode(prefix(?si_prefix), zero_or_one, explicit).

	:- public(name/1).
	:- mode(name(?si_unit_name), one, explicit).

	:- public(dimensions/1).
	:- mode(dimensions(?dimensional_exponents), one, derived).

	% derived dimensions:dimensional_exponents := dimensions_for_si_unit(SELF.name)
	dimensions(Value) :-
		::name(Name),
		dimensions_for_si_unit::eval(Name, Value).

:- end_object.


:- object(surface_patch,
	instantiates(express_entity),
	specializes(founded_item)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(parent_surface/1).
	:- mode(parent_surface(?bounded_surface), one, explicit).

	:- public(u_transition/1).
	:- mode(u_transition(?transition_code), one, explicit).

	:- public(v_transition/1).
	:- mode(v_transition(?transition_code), one, explicit).

	:- public(u_sense/1).
	:- mode(u_sense(?express_boolean), one, explicit).

	:- public(v_sense/1).
	:- mode(v_sense(?express_boolean), one, explicit).

	:- public(using_surfaces/1).
	:- mode(using_surfaces(?express_bag(rectangular_composite_surface,1,unbounded)), one, inverse).

	using_surfaces(Value) :-
		self(Self),
		findall(X, (rectangular_composite_surface::descendant_instance(X), X::segments(Self)), Value).
		
	uses_item(X) :-
		::parent_surface(X).

	domain_rules([wr1]).

	% rule wr1:NOT ('CONFIG_CONTROL_DESIGN.CURVE_BOUNDED_SURFACE' IN TYPEOF (parent_surface))
	domain_rule(wr1) :-
		::parent_surface(Surface),
		\+ Surface::ancestor(bounded_surface).

:- end_object.


:- object(action_directive,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(name/1).
	:- mode(name(?label), one, explicit).

	:- public(description/1).
	:- mode(description(?text), one, explicit).

	:- public(analysis/1).
	:- mode(analysis(?text), one, explicit).

	:- public(comment/1).
	:- mode(comment(?text), one, explicit).

	:- public(requests/1).
	:- mode(requests(?express_set(versioned_action_request,1,unbounded)), one, explicit).

:- end_object.


:- object(effectivity,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(id/1).
	:- mode(id(?identifier), one, explicit).

:- end_object.


:- object(date_and_time_assignment,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(assigned_date_and_time/1).
	:- mode(assigned_date_and_time(?date_and_time), one, explicit).

	:- public(role/1).
	:- mode(role(?date_time_role), one, explicit).

:- end_object.


:- object(solid_model,
	instantiates(express_entity),
	specializes(geometric_representation_item)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

:- end_object.


:- object(organizational_project,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(name/1).
	:- mode(name(?label), one, explicit).

	:- public(description/1).
	:- mode(description(?text), one, explicit).

	:- public(responsible_organizations/1).
	:- mode(responsible_organizations(?express_set(organization,1,unbounded)), one, explicit).

:- end_object.


:- object(geometric_set,
	instantiates(express_entity),
	specializes(geometric_representation_item)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(elements/1).
	:- mode(elements(?express_set(geometric_set_select,1,unbounded)), one, explicit).

:- end_object.


:- object(curve,
	instantiates(express_entity),
	specializes(geometric_representation_item)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

:- end_object.


:- object(item_defined_transformation,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(name/1).
	:- mode(name(?label), one, explicit).

	:- public(description/1).
	:- mode(description(?text), one, explicit).

	:- public(transform_item_1/1).
	:- mode(transform_item_1(?representation_item), one, explicit).

	:- public(transform_item_2/1).
	:- mode(transform_item_2(?representation_item), one, explicit).

:- end_object.


:- object(face,
	instantiates(express_entity),
	specializes(topological_representation_item)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(bounds/1).
	:- mode(bounds(?express_set(face_bound,1,unbounded)), one, explicit).

	domain_rules([wr1, wr2]).

	% rule wr1:NOT mixed_loop_type_set(list_to_set(list_face_loops(SELF)))
	domain_rule(wr1) :-
		self(Self),
		list_face_loops::eval(Self, LoopsList),
		list_to_set::eval(LoopsList, LoopsSet),
		\+ mixed_loop_type_set::true(LoopsSet).

	% rule wr2:SIZEOF (QUERY (temp <* bounds | 'CONFIG_CONTROL_DESIGN.FACE_OUTER_BOUND' IN TYPEOF(temp))) <= 1
	domain_rule(wr2) :- 
		::bounds(Bounds),
		(	setof(X, (list::member(X, Bounds), X::ancestor(face_outer_bound)), XList) ->
			XList = [_]
		;	true
		).

:- end_object.


:- object(person,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(id/1).
	:- mode(id(?identifier), one, explicit).

	:- public(last_name/1).
	:- mode(last_name(?label), zero_or_one, explicit).

	:- public(first_name/1).
	:- mode(first_name(?label), zero_or_one, explicit).

	:- public(middle_names/1).
	:- mode(middle_names(?express_list(label,1,unbounded)), zero_or_one, explicit).

	:- public(prefix_titles/1).
	:- mode(prefix_titles(?express_list(label,1,unbounded)), zero_or_one, explicit).

	:- public(suffix_titles/1).
	:- mode(suffix_titles(?express_list(label,1,unbounded)), zero_or_one, explicit).

	unique_rule(ur1, [id]).

	domain_rules([wr1]).

	% rule wr1:EXISTS (last_name) OR EXISTS (first_name)
	domain_rule(wr1) :-
		(	::last_name(_) ->
			true
		;	::first_name(_)
		).

:- end_object.


:- object(edge,
	instantiates(express_entity),
	specializes(topological_representation_item)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(edge_start/1).
	:- mode(edge_start(?vertex), one, explicit).

	:- public(edge_end/1).
	:- mode(edge_end(?vertex), one, explicit).

:- end_object.


:- object(bounded_surface,
	instantiates(express_entity),
	specializes(surface)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

:- end_object.


:- object(local_time,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(hour_component/1).
	:- mode(hour_component(?hour_in_day), one, explicit).

	:- public(minute_component/1).
	:- mode(minute_component(?minute_in_hour), zero_or_one, explicit).

	:- public(second_component/1).
	:- mode(second_component(?second_in_minute), zero_or_one, explicit).

	:- public(zone/1).
	:- mode(zone(?coordinated_universal_time_offset), one, explicit).

	domain_rules([wr1]).

	% rule wr1:valid_time (SELF)
	domain_rule(wr1) :-
		self(Self),
		valid_time::true(Self).

:- end_object.


:- object(organization,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(id/1).
	:- mode(id(?identifier), zero_or_one, explicit).

	:- public(name/1).
	:- mode(name(?label), one, explicit).

	:- public(description/1).
	:- mode(description(?text), one, explicit).

:- end_object.


:- object(wire_shell,
	instantiates(express_entity),
	specializes(topological_representation_item)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(wire_shell_extent/1).
	:- mode(wire_shell_extent(?express_set(loop,1,unbounded)), one, explicit).

	domain_rules([wr1]).

	% rule wr1:NOT mixed_loop_type_set(wire_shell_extent)
	domain_rule(wr1) :-
		::wire_shell_extent(WSE),
		\+ mixed_loop_type_set::true(WSE).

:- end_object.


:- object(shell_based_surface_model,
	instantiates(express_entity),
	specializes(geometric_representation_item)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(sbsm_boundary/1).
	:- mode(sbsm_boundary(?express_set(shell,1,unbounded)), one, explicit).

	domain_rules([wr1]).

	% rule wr1:constraints_geometry_shell_based_surface_model(SELF)
	domain_rule(wr1) :-
		self(Self),
		constraints_geometry_shell_based_surface_model::true(Self).

:- end_object.


:- object(product_definition_formation,
	instantiates(express_entity),
	specializes(express_object)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(id/1).
	:- mode(id(?identifier), one, explicit).

	:- public(description/1).
	:- mode(description(?text), one, explicit).

	:- public(of_product/1).
	:- mode(of_product(?product), one, explicit).

	unique_rule(ur1, [id, of_product]).

:- end_object.


:- object(cc_design_contract,
	instantiates(express_entity),
	specializes(contract_assignment)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(items/1).
	:- mode(items(?express_set(contracted_item,1,unbounded)), one, explicit).

:- end_object.


:- object(cc_design_date_and_time_assignment,
	instantiates(express_entity),
	specializes(date_and_time_assignment)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(items/1).
	:- mode(items(?express_set(date_time_item,1,unbounded)), one, explicit).

	domain_rules([wr1]).

	% rule wr1:cc_design_date_time_correlation(SELF)
	domain_rule(wr1) :-
		self(Self),
		cc_design_date_time_correlation::true(Self).

:- end_object.


:- object(shape_representation,
	instantiates(express_entity),
	specializes(representation)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

:- end_object.


:- object(cc_design_specification_reference,
	instantiates(express_entity),
	specializes(document_reference)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(items/1).
	:- mode(items(?express_set(specified_item,1,unbounded)), one, explicit).

:- end_object.


:- object(product_related_product_category,
	instantiates(express_entity),
	specializes(product_category)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(products/1).
	:- mode(products(?express_set(product,1,unbounded)), one, explicit).

:- end_object.


:- object(reparametrised_composite_curve_segment,
	instantiates(express_entity),
	specializes(composite_curve_segment)).

	:- public(param_length/1).
	:- mode(param_length(?parameter_value), one, explicit).

	domain_rules([wr1]).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	% rule wr1:param_length > 0
	domain_rule(wr1) :-
		::param_length(Length),
		Length > 0.

:- end_object.


:- object(mass_measure_with_unit,
	instantiates(express_entity),
	specializes(measure_with_unit)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	domain_rules([wr1]).

	% rule wr1:'CONFIG_CONTROL_DESIGN.MASS_UNIT' IN TYPEOF (SELF\measure_with_unit.unit_component)
	domain_rule(wr1) :-
		::unit_component(Unit),
		Unit::ancestor(mass_unit), !.

:- end_object.


:- object(product_definition_formation_with_specified_source,
	instantiates(express_entity),
	specializes(product_definition_formation)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(make_or_buy/1).
	:- mode(make_or_buy(?source), one, explicit).

:- end_object.


:- object(global_unit_assigned_context,
	instantiates(express_entity),
	specializes(representation_context)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(units/1).
	:- mode(units(?express_set(unit,1,unbounded)), one, explicit).

:- end_object.


:- object(mass_unit,
	instantiates(express_entity),
	specializes(named_unit)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	domain_rules([wr1]).

	% rule wr1:(SELF\named_unit.dimensions.length_exponent = 0) AND (SELF\named_unit.dimensions.mass_exponent = 1) AND (SELF\named_unit.dimensions.time_exponent = 0) AND (SELF\named_unit.dimensions.electric_current_exponent = 0) AND (SELF\named_unit.dimensions.thermodynamic_temperature_exponent = 0) AND (SELF\named_unit.dimensions.amount_of_substance_exponent = 0) AND (SELF\named_unit.dimensions.luminous_intensity_exponent = 0)
	domain_rule(wr1) :- 
		::dimensions(Dims),
		Dims::length_exponent(0.0),
		Dims::mass_exponent(1.0),
		Dims::time_exponent(0.0),
		Dims::electric_current_exponent(0.0),
		Dims::thermodynamic_temperature_exponent(0.0),
		Dims::amount_of_substance_exponent(0.0),
		Dims::luminous_intensity_exponent(0.0).

:- end_object.


:- object(oriented_edge,
	instantiates(express_entity),
	specializes(edge)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(edge_element/1).
	:- mode(edge_element(?edge), one, explicit).

	:- public(orientation/1).
	:- mode(orientation(?express_boolean), one, explicit).

	:- public(edge_start/1).
	:- mode(edge_start(?vertex), one, derived).

	:- public(edge_end/1).
	:- mode(edge_end(?vertex), one, derived).

	domain_rules([wr1]).

	uses_item(X) :- ::edge_element(X).

	% derived edge_start:vertex := boolean_choose(SELF.orientation, SELF.edge_element.edge_start, SELF.edge_element.edge_end)

	edge_start(Value) :- ::orientation(true), ::edge_element(Ee), Ee::edge_start(Value).
	edge_start(Value) :- ::orientation(false), ::edge_element(Ee), Ee::edge_end(Value).

	% derived edge_end:vertex := boolean_choose(SELF.orientation, SELF.edge_element.edge_end, SELF.edge_element.edge_start)
	edge_end(Value) :- ::orientation(true), ::edge_element(Ee), Ee::edge_end(Value).
	edge_end(Value) :- ::orientation(false), ::edge_element(Ee), Ee::edge_start(Value).

	% rule wr1:NOT ('CONFIG_CONTROL_DESIGN.ORIENTED_EDGE' IN TYPEOF (SELF.edge_element))
	domain_rule(wr1) :- ::edge_element(Ee), \+ Ee::ancestor(oriented_edge).

:- end_object.


:- object(oriented_face,
	instantiates(express_entity),
	specializes(face)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(face_element/1).
	:- mode(face_element(?face), one, explicit).

	:- public(orientation/1).
	:- mode(orientation(?express_boolean), one, explicit).

	:- public(bounds/1).
	:- mode(bounds(?express_set(face_bound,1,unbounded)), one, derived).

	domain_rules([wr1]).

	% derived bounds:SET [1:?] OF face_bound := conditional_reverse (SELF.orientation, SELF.face_element.bounds)
	bounds(Bounds) :-
		::orientation(Orientation),
		::face_element(Face),
		Face::bounds(List),
		conditional_reverse::eval(Orientation, List, Bounds).

	% rule wr1:NOT ('CONFIG_CONTROL_DESIGN.ORIENTED_FACE' IN TYPEOF(SELF.face_element))
	domain_rule(wr1) :-
		::face_element(Face),
		\+ Face::ancestor(oriented_face).

:- end_object.


:- object(week_of_year_and_day_date,
	instantiates(express_entity),
	specializes(date)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(week_component/1).
	:- mode(week_component(?week_in_year_number), one, explicit).

	:- public(day_component/1).
	:- mode(day_component(?day_in_week_number), zero_or_one, explicit).

:- end_object.


:- object(closed_shell,
	instantiates(express_entity),
	specializes(connected_face_set)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

:- end_object.


:- object(product_definition_with_associated_documents,
	instantiates(express_entity),
	specializes(product_definition)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(documentation_ids/1).
	:- mode(documentation_ids(?express_set(document,1,unbounded)), one, explicit).

:- end_object.


:- object(vertex,
	instantiates(express_entity),
	specializes(topological_representation_item)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

:- end_object.


:- object(face_bound,
	instantiates(express_entity),
	specializes(topological_representation_item)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(bound/1).
	:- mode(bound(?loop), one, explicit).

	:- public(orientation/1).
	:- mode(orientation(?express_boolean), one, explicit).

:- end_object.


:- object(product_definition_shape,
	instantiates(express_entity),
	specializes(property_definition)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	unique_rule(ur1, [definition]).

	domain_rules([wr1]).

	% rule wr1:(NOT ('CONFIG_CONTROL_DESIGN.SHAPE_DEFINITION' IN TYPEOF(SELF\ property_definition.definition)))
	domain_rule(wr1) :-
		::definition(Def),
		\+ shape_definition::valid(Def), !.

:- end_object.


:- object(volume_measure_with_unit,
	instantiates(express_entity),
	specializes(measure_with_unit)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	domain_rules([wr1]).

	% rule wr1:'CONFIG_CONTROL_DESIGN.VOLUME_UNIT' IN TYPEOF(SELF\ measure_with_unit.unit_component)
	domain_rule(wr1) :-
		::unit_component(Unit), 
		Unit::ancestor(volume_unit), !.

:- end_object.


:- object(cc_design_person_and_organization_assignment,
	instantiates(express_entity),
	specializes(person_and_organization_assignment)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(items/1).
	:- mode(items(?express_set(person_organization_item,1,unbounded)), one, explicit).

	domain_rules([wr1]).

	% rule wr1:cc_design_person_and_organization_correlation(SELF)
	domain_rule(wr1) :-
		self(Self),
		cc_design_person_and_organization_correlation::true(Self).

:- end_object.


:- object(shape_representation_relationship,
	instantiates(express_entity),
	specializes(representation_relationship)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	domain_rules([wr1]).

	% rule wr1:'CONFIG_CONTROL_DESIGN.SHAPE_REPRESENTATION' IN (TYPEOF (SELF\representation_relationship.rep_1) + TYPEOF(SELF\representation_relationship.rep_2))
	domain_rule(wr1) :-
		::rep_1(X),
		X::ancestor(shape_representation).
	domain_rule(wr1) :-
		::rep_2(Y),
		Y::ancestor(shape_representation).

:- end_object.


:- object(surface_replica,
	instantiates(express_entity),
	specializes(surface)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(parent_surface/1).
	:- mode(parent_surface(?surface), one, explicit).

	:- public(transformation/1).
	:- mode(transformation(?cartesian_transformation_operator_3d), one, explicit).

	domain_rules([wr1]).

	% rule wr1:acyclic_surface_replica (SELF,parent_surface)
	domain_rule(wr1) :-
		self(Self),
		acyclic_surface_replica::true(Self).

:- end_object.


:- object(b_spline_surface,
	instantiates(express_entity),
	specializes(bounded_surface)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(u_degree/1).
	:- mode(u_degree(?integer), one, explicit).

	:- public(v_degree/1).
	:- mode(v_degree(?integer), one, explicit).

	:- public(control_points_list/1).
	:- mode(control_points_list(?express_list(express_list(cartesian_point,2,unbounded),2,unbounded)), one, explicit).

	:- public(surface_form/1).
	:- mode(surface_form(?b_spline_surface_form), one, explicit).

	:- public(u_closed/1).
	:- mode(u_closed(?express_logical), one, explicit).

	:- public(v_closed/1).
	:- mode(v_closed(?express_logical), one, explicit).

	:- public(self_intersect/1).
	:- mode(self_intersect(?express_logical), one, explicit).

	:- public(u_upper/1).
	:- mode(u_upper(?integer), one, derived).

	:- public(v_upper/1).
	:- mode(v_upper(?integer), one, derived).

	:- public(control_points/1).
	:- mode(control_points(?express_array(express_array(cartesian_point,0,unbounded),0,unbounded)), one, derived).

	domain_rules([wr1]).

	% derived u_upper:INTEGER := SIZEOF(control_points_list) - 1
	u_upper(Value) :-
		::control_points_list(X),
		list::length(X, N),
		Value is N-1.

	% derived v_upper:INTEGER := SIZEOF(control_points_list[1]) - 1
	v_upper(Value) :-
		::control_points_list([X|_]),
		list::length(X, N),
		Value is N-1.

	% derived control_points:ARRAY [0:?] OF ARRAY [0:?] OF cartesian_point := make_array_of_array( control_points_list,0,u_upper,0,v_upper)
	control_points(Value) :-
		::control_points_list(Value).

	% rule wr1:('CONFIG_CONTROL_DESIGN.UNIFORM_SURFACE' IN TYPEOF(SELF)) OR ('CONFIG_CONTROL_DESIGN.QUASI_UNIFORM_SURFACE' IN TYPEOF(SELF)) OR ('CONFIG_CONTROL_DESIGN.BEZIER_SURFACE' IN TYPEOF(SELF)) OR ('CONFIG_CONTROL_DESIGN.B_SPLINE_SURFACE_WITH_KNOTS' IN TYPEOF(SELF))
	domain_rule(wr1) :- 
		(	::ancestor(uniform_surface)
		;	::ancestor(quasi_uniform_surface)
		;	::ancestor(bezier_surface)
		;	::ancestor(b_spline_surface_with_knots)
		),
		!.

:- end_object.


:- object(pcurve,
	instantiates(express_entity),
	specializes(curve)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(basis_surface/1).
	:- mode(basis_surface(?surface), one, explicit).

	:- public(reference_to_curve/1).
	:- mode(reference_to_curve(?definitional_representation), one, explicit).

	domain_rules([wr1, wr2, wr3]).

	% rule wr1:SIZEOF (reference_to_curve\representation.items) = 1
	domain_rule(wr1) :-
		::reference_to_curve(Reference),
		Reference::items([_]).

	% rule wr2:'CONFIG_CONTROL_DESIGN.CURVE' IN TYPEOF(reference_to_curve\representation.items[1])
	domain_rule(wr2) :-
		::reference_to_curve(Reference),
		Reference::items([Crv| _]),
		Crv::ancestor(curve), !.

	% rule wr3:reference_to_curve\representation.items[1]\ geometric_representation_item.dim = 2
	domain_rule(wr3) :-
		::reference_to_curve(Reference),
		Reference::items([Crv| _]),
		Crv::dim(2).

:- end_object.


:- object(connected_edge_set,
	instantiates(express_entity),
	specializes(topological_representation_item)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(ces_edges/1).
	:- mode(ces_edges(?express_set(edge,1,unbounded)), one, explicit).

:- end_object.


:- object(directed_action,
	instantiates(express_entity),
	specializes(executed_action)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(directive/1).
	:- mode(directive(?action_directive), one, explicit).

:- end_object.


:- object(serial_numbered_effectivity,
	instantiates(express_entity),
	specializes(effectivity)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(effectivity_start_id/1).
	:- mode(effectivity_start_id(?identifier), one, explicit).

	:- public(effectivity_end_id/1).
	:- mode(effectivity_end_id(?identifier), zero_or_one, explicit).

:- end_object.


:- object(conic,
	instantiates(express_entity),
	specializes(curve)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(position/1).
	:- mode(position(?axis2_placement), one, explicit).

:- end_object.


:- object(vector,
	instantiates(express_entity),
	specializes(geometric_representation_item)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(orientation/1).
	:- mode(orientation(?direction), one, explicit).

	:- public(magnitude/1).
	:- mode(magnitude(?length_measure), one, explicit).

	domain_rules([wr1]).

	% rule wr1:magnitude >= 0
	domain_rule(wr1) :-
		::magnitude(Magnitude),
		Magnitude >= 0.

:- end_object.


:- object(faceted_brep_shape_representation,
	instantiates(express_entity),
	specializes(shape_representation)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	domain_rules([wr1, wr2, wr3, wr4, wr5, wr6, wr7]).

	% rule wr1:SIZEOF (QUERY (it <* items | NOT (SIZEOF(['CONFIG_CONTROL_DESIGN.FACETED_BREP', 'CONFIG_CONTROL_DESIGN.MAPPED_ITEM', 'CONFIG_CONTROL_DESIGN.AXIS2_PLACEMENT_3D'] * TYPEOF(it)) = 1))) = 0
	domain_rule(wr1) :- 
		::items(Items),
		\+ (	list::member(Item, Items),
				\+ findall(Cls,
					   (list::member(Cls, [faceted_brep,mapped_item,axis2_placement_3d]),
						Item::ancestor(Cls)),
					   [_])
			).
		   
	% rule wr2:SIZEOF (QUERY (it <* items | SIZEOF(['CONFIG_CONTROL_DESIGN.FACETED_BREP', 'CONFIG_CONTROL_DESIGN.MAPPED_ITEM'] * TYPEOF(it)) = 1)) > 0
	domain_rule(wr2) :- 
		::items(Items),
		list::member(Item, Items),
		Item::(ancestor(faceted_brep); ancestor(mapped_item)), !.
		
	% rule wr3:SIZEOF (QUERY (fbrep <* QUERY ( it <* items | 'CONFIG_CONTROL_DESIGN.FACETED_BREP' IN TYPEOF(it)) | NOT (SIZEOF (QUERY (csh <* msb_shells (fbrep, 'CONFIG_CONTROL_DESIGN') | NOT (SIZEOF (QUERY (fcs <* csh.cfs_faces | NOT (('CONFIG_CONTROL_DESIGN.FACE_SURFACE' IN TYPEOF (fcs)) AND (('CONFIG_CONTROL_DESIGN.PLANE' IN TYPEOF (fcs\face_surface.face_geometry)) AND ('CONFIG_CONTROL_DESIGN.CARTESIAN_POINT' IN TYPEOF (fcs\face_surface.face_geometry\plane.position.location)))))) = 0))) = 0))) = 0
	domain_rule(wr3) :- 
		::items(Items),
		\+ (	list::member(Item, Items),
				Item::ancestor(faceted_brep),
				msb_shells::eval(Item, Shells),
				list::member(Shell, Shells),
				Shell::cfs_faces(Faces),
				list::member(Face,Faces),
				\+ (	Face::ancestor(face_surface),
						Face::face_geometry(Geom),
						Geom::ancestor(plane),
						Geom::position(Pos),
						Pos::location(Loc),
						Loc::ancestor(cartesian_point)
					)
			).

	% rule wr4:SIZEOF (QUERY (fbrep <* QUERY ( it <* items | 'CONFIG_CONTROL_DESIGN.FACETED_BREP' IN TYPEOF(it)) | NOT (SIZEOF (QUERY (csh <* msb_shells (fbrep, 'CONFIG_CONTROL_DESIGN') | NOT (SIZEOF (QUERY (fcs <* csh.cfs_faces | NOT (SIZEOF (QUERY (bnds <* fcs.bounds | 'CONFIG_CONTROL_DESIGN.FACE_OUTER_BOUND' IN TYPEOF(bnds))) = 1))) = 0))) = 0))) = 0
	domain_rule(wr4) :- 
		::items(Items),
		\+ (	list::member(Item, Items),
				Item::ancestor(faceted_brep),
				msb_shells::eval(Item, Shells),
				list::member(Shell,Shells),
				Shell::cfs_faces(Faces),
				list::member(Face,Faces),
				Face::bounds(Bounds),
				\+ findall(B,(list::member(B,Bounds),B::ancestor(face_outer_bound)),[_])
			).

	% rule wr5:SIZEOF (QUERY (msb <* QUERY (it <* items | 'CONFIG_CONTROL_DESIGN.MANIFOLD_SOLID_BREP' IN TYPEOF(it)) | 'CONFIG_CONTROL_DESIGN.ORIENTED_CLOSED_SHELL' IN TYPEOF (msb\manifold_solid_brep.outer))) = 0
	domain_rule(wr5) :- 
		::items(Items),
		\+ (	list::member(Item, Items),
				Item::ancestor(manifold_solid_brep),
				Item::outer(Outer),
				Outer::ancestor(oriented_closed_shell)
			).

	% rule wr6:SIZEOF (QUERY (brv <* QUERY (it <* items | 'CONFIG_CONTROL_DESIGN.BREP_WITH_VOIDS' IN TYPEOF(it)) | NOT (SIZEOF (QUERY (csh <* brv\brep_with_voids.voids | csh\oriented_closed_shell.orientation)) = 0))) = 0
	domain_rule(wr6) :- 
		::items(Items),
		\+ (	list::member(Item, Items),
				Item::ancestor(brep_with_voids),
				Item::voids(Voids),
				list::member(Void,Voids),
				Void::orientation(true)
			).
			
	% rule wr7:SIZEOF (QUERY (mi <* QUERY (it <* items | 'CONFIG_CONTROL_DESIGN.MAPPED_ITEM' IN TYPEOF(it)) | NOT ('CONFIG_CONTROL_DESIGN.FACETED_BREP_SHAPE_REPRESENTATION' IN TYPEOF(mi\mapped_item.mapping_source.mapped_representation)))) = 0
	domain_rule(wr7) :- 
		::items(Items),
		\+ (	list::member(Item, Items),
				Item::ancestor(mapped_item),
				Item::mapping_source(MapSource),
				MapSource::mapped_representation(MapRep),
				\+ MapRep::ancestor(faceted_brep_shape_representation)
			).

:- end_object.


:- object(dated_effectivity,
	instantiates(express_entity),
	specializes(effectivity)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(effectivity_start_date/1).
	:- mode(effectivity_start_date(?date_and_time), one, explicit).

	:- public(effectivity_end_date/1).
	:- mode(effectivity_end_date(?date_and_time), zero_or_one, explicit).

:- end_object.


:- object(vertex_shell,
	instantiates(express_entity),
	specializes(topological_representation_item)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(vertex_shell_extent/1).
	:- mode(vertex_shell_extent(?vertex_loop), one, explicit).

:- end_object.


:- object(offset_surface,
	instantiates(express_entity),
	specializes(surface)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(basis_surface/1).
	:- mode(basis_surface(?surface), one, explicit).

	:- public(distance/1).
	:- mode(distance(?length_measure), one, explicit).

	:- public(self_intersect/1).
	:- mode(self_intersect(?express_logical), one, explicit).

:- end_object.


:- object(conversion_based_unit,
	instantiates(express_entity),
	specializes(named_unit)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(name/1).
	:- mode(name(?label), one, explicit).

	:- public(conversion_factor/1).
	:- mode(conversion_factor(?measure_with_unit), one, explicit).

:- end_object.


:- object(oriented_closed_shell,
	instantiates(express_entity),
	specializes(closed_shell)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(closed_shell_element/1).
	:- mode(closed_shell_element(?closed_shell), one, explicit).

	:- public(orientation/1).
	:- mode(orientation(?express_boolean), one, explicit).

	:- public(cfs_faces/1).
	:- mode(cfs_faces(?express_set(face,1,unbounded)), one, derived).

	domain_rules([wr1]).

	% derived cfs_faces:SET [1:?] OF face := conditional_reverse(SELF.orientation, SELF.closed_shell_element.cfs_faces)
	cfs_faces(Faces) :-
		::orientation(Orientation),
		::closed_shell_element(Cse),
		Cse::cfs_faces(CseFaces),
		conditional_reverse::eval(Orientation, CseFaces, Faces).

	% rule wr1:NOT ('CONFIG_CONTROL_DESIGN.ORIENTED_CLOSED_SHELL' IN TYPEOF(SELF.closed_shell_element))
	domain_rule(wr1) :-
		::closed_shell_element(Cse),
		\+ Cse::ancestor(oriented_closed_shell).

:- end_object.


:- object(advanced_brep_shape_representation,
	instantiates(express_entity),
	specializes(shape_representation)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	domain_rules([wr1, wr2, wr3, wr4, wr5, wr6]).

	% rule wr1:SIZEOF (QUERY (it <* SELF.items | NOT (SIZEOF (['CONFIG_CONTROL_DESIGN.MANIFOLD_SOLID_BREP', 'CONFIG_CONTROL_DESIGN.FACETED_BREP', 'CONFIG_CONTROL_DESIGN.MAPPED_ITEM', 'CONFIG_CONTROL_DESIGN.AXIS2_PLACEMENT_3D'] * TYPEOF(it)) = 1))) = 0
	% all items in this rep are manifold_solid_brep, mapped_item, axis2_placement_3d, or faceted_brep
	domain_rule(wr1) :-
		::items(Items),
		forall(
			list::member(Item, Items),
			(	Item::ancestor(manifold_solid_brep)
			;	Item::ancestor(faceted_brep)
			;	Item::ancestor(mapped_item)
			;	Item::ancestor(axis2_placement_3d)
			)).

	% rule wr2:SIZEOF (QUERY (it <* SELF.items | SIZEOF (['CONFIG_CONTROL_DESIGN.MANIFOLD_SOLID_BREP', 'CONFIG_CONTROL_DESIGN.MAPPED_ITEM'] * TYPEOF(it)) =1 )) > 0
	% at least one item is a manifold_solid_brep or a mapped_item (and for mapped_item, see rule wr6)
	domain_rule(wr2) :-
		::items(Items),
		list::member(Item, Items),
		Item::(ancestor(manifold_solid_brep); ancestor(mapped_item)), !.
	
	% rule wr3:SIZEOF (QUERY (msb <* QUERY (it <* SELF.items | 'CONFIG_CONTROL_DESIGN.MANIFOLD_SOLID_BREP' IN TYPEOF(it)) | NOT (SIZEOF (QUERY (csh <* msb_shells(msb, 'CONFIG_CONTROL_DESIGN') | NOT (SIZEOF (QUERY(csf <* csh.cfs_faces | NOT('CONFIG_CONTROL_DESIGN.ADVANCED_FACE' IN TYPEOF(csf)))) = 0 ))) = 0))) = 0
	% all the faces which make up any manifold_solid_brep are advanced_face
	domain_rule(wr3) :-
		forall(
			(::items(Items),
			 list::member(Item, Items),
			 Item::ancestor(manifold_solid_brep),
			 (Item::outer(Shell);(Item::ancestor(brep_with_voids)->Item::voids(Shells),list::member(Shell,Shells))),
			 Shell::cfs_faces(Faces),list::member(Face,Faces)), 
			Face::ancestor(advanced_face)).

	% rule wr4:SIZEOF (QUERY (msb <* QUERY (it <* items | 'CONFIG_CONTROL_DESIGN.MANIFOLD_SOLID_BREP' IN TYPEOF(it)) | 'CONFIG_CONTROL_DESIGN.ORIENTED_CLOSED_SHELL' IN TYPEOF (msb\manifold_solid_brep.outer))) = 0
	% for any manifold_solid_brep, the "outer" attribute is NOT a oriented_closed_shell
	domain_rule(wr4) :-
		forall(
			(::items(Items),
	 	 	 list::member(Item, Items),
			 Item::ancestor(manifold_solid_brep)),
			(Item::outer(Shell),
			 \+ Shell::ancestor(oriented_closed_shell))).

	% rule wr5:SIZEOF (QUERY (brv <* QUERY (it <* items | 'CONFIG_CONTROL_DESIGN.BREP_WITH_VOIDS' IN TYPEOF(it)) | NOT (SIZEOF (QUERY (csh <* brv\brep_with_voids.voids | csh\oriented_closed_shell.orientation)) = 0))) = 0
	% for any brep_with_voids (a subtype of manifold_solid_brep), the "voids" shells have false orientation
	domain_rule(wr5) :-
		forall(
			(::items(Items),
			 list::member(Item, Items),
			 Item::ancestor(brep_with_voids),
			 Item::voids(Voids),
			 list::member(VoidShell,Voids)),
			VoidShell::orientation(false)).
		  
	% rule wr6:SIZEOF (QUERY (mi <* QUERY (it <* items | 'CONFIG_CONTROL_DESIGN.MAPPED_ITEM' IN TYPEOF(it)) | NOT ('CONFIG_CONTROL_DESIGN.ADVANCED_BREP_SHAPE_REPRESENTATION' IN TYPEOF(mi\mapped_item.mapping_source.mapped_representation)))) = 0
	% for any mapped_item, the domain of the mapping is an advanced_brep_representation
	domain_rule(wr6) :-
		forall(
			(::items(Items),
			 list::member(Item, Items),
			 Item::ancestor(mapped_item)),
			(Item::mapping_source(RepMap),
			 RepMap::mapped_representation(Rep),
			 Rep::ancestor(advanced_brep_shape_representation))).

:- end_object.


:- object(edge_loop,
	instantiates(express_entity),
	specializes(loop, path)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(ne/1).
	:- mode(ne(?integer), one, derived).

	domain_rules([wr1]).

	:- alias(loop, uses_item_via_attr/2, loop_uses_item_via_attr/2).
	:- alias(path, uses_item_via_attr/2, path_uses_item_via_attr/2).
	
	uses_item_via_attr(Item, Attr) :-
		::loop_uses_item_via_attr(Item, Attr).
	uses_item_via_attr(Item, Attr) :-
		::path_uses_item_via_attr(Item, Attr).

	% derived ne:INTEGER := SIZEOF(SELF\path.edge_list)
	ne(Value) :-
		::edge_list(X),
		list::length(X, Value).

	% rule wr1:SELF\path.edge_list[1].edge_start :=: SELF\path.edge_list[ne].edge_end
	domain_rule(wr1) :-
		::edge_list([E1 | EList]),
		check_end_to_end(E1,[E1 | EList]).

	check_end_to_end(E1, [E2]) :- !, E1::edge_start(X), E2::edge_end(X).
	check_end_to_end(E1, [_| EList]) :- check_end_to_end(E1,EList).

:- end_object.


:- object(cartesian_transformation_operator,
	instantiates(express_entity),
	specializes(geometric_representation_item, functionally_defined_transformation)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(axis1/1).
	:- mode(axis1(?direction), zero_or_one, explicit).

	:- public(axis2/1).
	:- mode(axis2(?direction), zero_or_one, explicit).

	:- public(local_origin/1).
	:- mode(local_origin(?cartesian_point), one, explicit).

	:- public(scale/1).
	:- mode(scale(?float), zero_or_one, explicit).

	:- public(scl/1).
	:- mode(scl(?float), one, derived).

	domain_rules([wr1]).

	:- alias(geometric_representation_item, uses_item_via_attr/2, geometric_representation_item_uses_item_via_attr/2).
	:- alias(functionally_defined_transformation, uses_item_via_attr/2, functionally_defined_transformation_uses_item_via_attr/2).
	
	uses_item_via_attr(Item, Attr) :-
		::geometric_representation_item_uses_item_via_attr(Item, Attr).
	uses_item_via_attr(Item, Attr) :-
		::functionally_defined_transformation_uses_item_via_attr(Item, Attr).

	% derived scl:REAL := NVL(scale,1)
	scl(Value) :-
		(	::scale(Value) ->
			true
		;	Value = 1.0
		).

	% rule wr1:scl > 0
	domain_rule(wr1) :-
		scl(Value),
		Value > 0.

:- end_object.


:- object(parametric_representation_context,
	instantiates(express_entity),
	specializes(representation_context)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

:- end_object.


:- object(product_concept_context,
	instantiates(express_entity),
	specializes(application_context_element)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(market_segment_type/1).
	:- mode(market_segment_type(?label), one, explicit).

:- end_object.


:- object(product_definition_context,
	instantiates(express_entity),
	specializes(application_context_element)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(life_cycle_stage/1).
	:- mode(life_cycle_stage(?label), one, explicit).

:- end_object.


:- object(surface_curve,
	instantiates(express_entity),
	specializes(curve)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(curve_3d/1).
	:- mode(curve_3d(?curve), one, explicit).

	:- public(associated_geometry/1).
	:- mode(associated_geometry(?express_list(pcurve_or_surface,1,2)), one, explicit).

	:- public(master_representation/1).
	:- mode(master_representation(?preferred_surface_curve_representation), one, explicit).

	:- public(basis_surface/1).
	:- mode(basis_surface(?express_set(surface,1,2)), one, derived).

	domain_rules([wr1, wr2, wr3, wr4]).

	% derived basis_surface:SET [1:2] OF surface := get_basis_surface(SELF)
	basis_surface(Surfaces) :-
		self(Self),
		get_basis_surface::eval(Self, Surfaces).

	% rule wr1:curve_3d.dim = 3
	domain_rule(wr1) :-
		::curve_3d(Curve),
		Curve::dim(3).

	% rule wr2:('CONFIG_CONTROL_DESIGN.PCURVE' IN TYPEOF(associated_geometry[1])) OR (master_representation <> pcurve_s1)
	domain_rule(wr2) :-
		::associated_geometry([Geometry| _]),
		Geometry::ancestor(pcurve), !.
	domain_rule(wr2) :-
		\+ ::master_representation(pcurve_s1).

	% rule wr3:('CONFIG_CONTROL_DESIGN.PCURVE' IN TYPEOF(associated_geometry[2])) OR (master_representation <> pcurve_s2)
	domain_rule(wr3) :-
		::associated_geometry([_, Geometry| _]),
		Geometry::ancestor(pcurve), !.
	domain_rule(wr3) :-
		\+ ::master_representation(pcurve_s2).

	% rule wr4:NOT ('CONFIG_CONTROL_DESIGN.PCURVE' IN TYPEOF(curve_3d))
	domain_rule(wr4) :-
		::curve_3d(Curve),
		\+ Curve::ancestor(pcurve).

:- end_object.


:- object(area_unit,
	instantiates(express_entity),
	specializes(named_unit)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	domain_rules([wr1]).

	% rule wr1:(SELF\named_unit.dimensions.length_exponent = 2) AND (SELF\named_unit.dimensions.mass_exponent = 0) AND (SELF\named_unit.dimensions.time_exponent = 0) AND (SELF\named_unit.dimensions.electric_current_exponent = 0) AND (SELF\named_unit.dimensions. thermodynamic_temperature_exponent = 0) AND (SELF\named_unit.dimensions.amount_of_substance_exponent = 0) AND (SELF\named_unit.dimensions.luminous_intensity_exponent = 0)
	domain_rule(wr1) :- 
		::dimensions(Dims),
		Dims::length_exponent(2.0),
		Dims::mass_exponent(0.0),
		Dims::time_exponent(0.0),
		Dims::electric_current_exponent(0.0),
		Dims::thermodynamic_temperature_exponent(0.0),
		Dims::amount_of_substance_exponent(0.0),
		Dims::luminous_intensity_exponent(0.0).

:- end_object.


:- object(representation_relationship_with_transformation,
	instantiates(express_entity),
	specializes(representation_relationship)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(transformation_operator/1).
	:- mode(transformation_operator(?transformation), one, explicit).

	domain_rules([wr1]).

	% rule wr1:SELF\representation_relationship.rep_1.context_of_items :<>: SELF\representation_relationship.rep_2.context_of_items
	domain_rule(wr1) :-
		::rep_1(Rep1),
		::rep_2(Rep2),
		Rep1::context_of_items(Co1),
		Rep2::context_of_items(Co2),
		Co1 \== Co2.

:- end_object.


:- object(volume_unit,
	instantiates(express_entity),
	specializes(named_unit)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	domain_rules([wr1]).

	% rule wr1:(SELF\named_unit.dimensions.length_exponent = 3) AND (SELF\named_unit.dimensions.mass_exponent = 0) AND (SELF\named_unit.dimensions.time_exponent = 0) AND (SELF\named_unit.dimensions.electric_current_exponent = 0) AND (SELF\named_unit.dimensions.thermodynamic_temperature_exponent = 0) AND (SELF\named_unit.dimensions.amount_of_substance_exponent = 0) AND (SELF\named_unit.dimensions.luminous_intensity_exponent = 0)
	domain_rule(wr1) :- 
		::dimensions(Dims),
		Dims::length_exponent(3.0),
		Dims::mass_exponent(0.0),
		Dims::time_exponent(0.0),
		Dims::electric_current_exponent(0.0),
		Dims::thermodynamic_temperature_exponent(0.0),
		Dims::amount_of_substance_exponent(0.0),
		Dims::luminous_intensity_exponent(0.0).

:- end_object.


:- object(geometrically_bounded_wireframe_shape_representation,
	instantiates(express_entity),
	specializes(shape_representation)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	domain_rules([wr1, wr2, wr3, wr4, wr5, wr6, wr7]).

	% rule wr1:SIZEOF (QUERY (it <* SELF\representation.items | NOT (SIZEOF (['CONFIG_CONTROL_DESIGN.GEOMETRIC_CURVE_SET', 'CONFIG_CONTROL_DESIGN.MAPPED_ITEM', 'CONFIG_CONTROL_DESIGN.AXIS2_PLACEMENT_3D'] * TYPEOF(it)) = 1))) = 0
	domain_rule(wr1) :- 
		::items(Items),
		\+ (list::member(Item, Items),
			\+ findall( Cls,
						(list::member(Cls,[geometric_curve_set, mapped_item, axis2_placement_3d]), Item::ancestor(Cls)),
						[_])).

	% rule wr2:SIZEOF (QUERY (it <* SELF\representation.items | SIZEOF(['CONFIG_CONTROL_DESIGN.GEOMETRIC_CURVE_SET', 'CONFIG_CONTROL_DESIGN.MAPPED_ITEM'] * TYPEOF (it)) = 1 )) >= 1
	domain_rule(wr2) :- 
		::items(Items),
		list::member(Item, Items),
		Item::(ancestor(geometric_curve_set);ancestor(mapped_item)), !.
		
	% rule wr3:SIZEOF (QUERY (gcs <* QUERY (it <* SELF\representation.items | 'CONFIG_CONTROL_DESIGN.GEOMETRIC_CURVE_SET' IN TYPEOF (it)) | NOT (SIZEOF (QUERY (elem <* gcs\geometric_set.elements | NOT (valid_geometrically_bounded_wf_curve (elem, 'CONFIG_CONTROL_DESIGN')))) = 0))) = 0
	domain_rule(wr3) :- 
		::items(Items),
		\+ (	list::member(Item, Items),
				Item::ancestor(geometric_curve_set),
				Item::elements(Elements),
				list::member(Curve,Elements),
				\+ valid_geometrically_bounded_wf_curve::true(Curve)
			).

	% rule wr4:SIZEOF (QUERY (gcs <* QUERY (it <* SELF\representation.items | 'CONFIG_CONTROL_DESIGN.GEOMETRIC_CURVE_SET' IN TYPEOF (it)) | NOT (SIZEOF (QUERY (pnts <* QUERY (elem <* gcs\geometric_set.elements | 'CONFIG_CONTROL_DESIGN.POINT' IN TYPEOF (elem)) | NOT (valid_geometrically_bounded_wf_point (pnts, 'CONFIG_CONTROL_DESIGN')))) = 0))) = 0
	domain_rule(wr4) :- 
		::items(Items),
		\+ (	list::member(Item, Items),
				Item::ancestor(geometric_curve_set),
				Item::elements(Elements),
				list::member(Point,Elements),
				Point::ancestor(point),
				\+ valid_geometrically_bounded_wf_point::true(Point)
			).

	% rule wr5:SIZEOF (QUERY (gcs <* QUERY (it <* SELF\representation.items | 'CONFIG_CONTROL_DESIGN.GEOMETRIC_CURVE_SET' IN TYPEOF (it)) | NOT (SIZEOF (QUERY (cnc <* QUERY (elem <* gcs\geometric_set.elements | 'CONFIG_CONTROL_DESIGN.CONIC' IN TYPEOF (elem)) | NOT ('CONFIG_CONTROL_DESIGN.AXIS2_PLACEMENT_3D' IN TYPEOF (cnc\conic.position)))) = 0))) = 0
	domain_rule(wr5) :- 
		::items(Items),
		\+ (	list::member(Item, Items),
				Item::ancestor(geometric_curve_set),
				Item::elements(Elements),
				list::member(Conic,Elements),
				Conic::ancestor(conic),
				Conic::position(Pos),
				\+ Pos::ancestor(axis2_placement_3d)
			).

	% rule wr6:SIZEOF (QUERY (gcs <* QUERY (it <* SELF\representation.items | 'CONFIG_CONTROL_DESIGN.GEOMETRIC_CURVE_SET' IN TYPEOF (it)) | NOT (SIZEOF (QUERY (pline <* QUERY (elem <* gcs\geometric_set.elements | 'CONFIG_CONTROL_DESIGN.POLYLINE' IN TYPEOF(elem)) | NOT (SIZEOF (pline\polyline.points) > 2))) = 0))) = 0
	domain_rule(wr6) :- 
		::items(Items),
		\+ (	list::member(Item, Items),
				Item::ancestor(geometric_curve_set),
				Item::elements(Elements),
				list::member(Poly,Elements),
				Poly::ancestor(polyline),
				\+ Poly::points([_,_,_| _])
			).

	% rule wr7:SIZEOF (QUERY (mi <* QUERY (item <* SELF\representation.items | 'CONFIG_CONTROL_DESIGN.MAPPED_ITEM' IN TYPEOF (item)) | NOT ('CONFIG_CONTROL_DESIGN.' + 'GEOMETRICALLY_BOUNDED_WIREFRAME_REPRESENTATION' IN TYPEOF (mi\mapped_item.mapping_source.mapped_representation)))) = 0
	domain_rule(wr7) :- 
		::items(Items),
		\+ (	list::member(Item, Items),
				Item::ancestor(mapped_item),
				Item::mapping_source(MapSource),
				MapSource::mapped_representation(MapRep),
				\+ MapRep::ancestor(geometrically_bounded_wireframe_representation)
			).

:- end_object.


:- object(product_definition_effectivity,
	instantiates(express_entity),
	specializes(effectivity)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(usage/1).
	:- mode(usage(?product_definition_relationship), one, explicit).

	unique_rule(ur1, [usage, id]).

:- end_object.


:- object(solid_angle_unit,
	instantiates(express_entity),
	specializes(named_unit)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	domain_rules([wr1]).

	% rule wr1:(SELF\named_unit.dimensions.length_exponent = 0) AND (SELF\named_unit.dimensions.mass_exponent = 0) AND (SELF\named_unit.dimensions.time_exponent = 0) AND (SELF\named_unit.dimensions.electric_current_exponent = 0) AND (SELF\named_unit.dimensions.thermodynamic_temperature_exponent = 0) AND (SELF\named_unit.dimensions.amount_of_substance_exponent = 0) AND (SELF\named_unit.dimensions.luminous_intensity_exponent = 0)
	domain_rule(wr1) :- 
		::dimensions(Dims),
		Dims::length_exponent(0.0),
		Dims::mass_exponent(0.0),
		Dims::time_exponent(0.0),
		Dims::electric_current_exponent(0.0),
		Dims::thermodynamic_temperature_exponent(0.0),
		Dims::amount_of_substance_exponent(0.0),
		Dims::luminous_intensity_exponent(0.0).

:- end_object.


:- object(open_shell,
	instantiates(express_entity),
	specializes(connected_face_set)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

:- end_object.


:- object(bezier_surface,
	instantiates(express_entity),
	specializes(b_spline_surface)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

:- end_object.


:- object(quasi_uniform_surface,
	instantiates(express_entity),
	specializes(b_spline_surface)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

:- end_object.


:- object(context_dependent_unit,
	instantiates(express_entity),
	specializes(named_unit)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(name/1).
	:- mode(name(?label), one, explicit).

:- end_object.


:- object(vertex_point,
	instantiates(express_entity),
	specializes(vertex,geometric_representation_item)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(vertex_geometry/1).
	:- mode(vertex_geometry(?point), one, explicit).

	uses_item(X) :-
		::vertex_geometry(X).

	:- alias(vertex, uses_item_via_attr/2, vertex_uses_item_via_attr/2).
	:- alias(geometric_representation_item, uses_item_via_attr/2, geometric_representation_item_uses_item_via_attr/2).
	
	uses_item_via_attr(Item, Attr) :-
		::vertex_uses_item_via_attr(Item, Attr).
	uses_item_via_attr(Item, Attr) :-
		::geometric_representation_item_uses_item_via_attr(Item, Attr).

:- end_object.


:- object(geometric_curve_set,
	instantiates(express_entity),
	specializes(geometric_set)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	domain_rules([wr1]).

	% rule wr1:SIZEOF (QUERY (temp <* SELF\geometric_set.elements | 'CONFIG_CONTROL_DESIGN.SURFACE' IN TYPEOF(temp))) = 0
	domain_rule(wr1) :-
		::elements(Elements),
		forall(list::member(Element, Elements), \+ Element::ancestor(surface)).

:- end_object.


:- object(plane_angle_unit,
	instantiates(express_entity),
	specializes(named_unit)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	domain_rules([wr1]).

	% rule wr1:(SELF\named_unit.dimensions.length_exponent = 0) AND (SELF\named_unit.dimensions.mass_exponent = 0) AND (SELF\named_unit.dimensions.time_exponent = 0) AND (SELF\named_unit.dimensions.electric_current_exponent = 0) AND (SELF\named_unit.dimensions.thermodynamic_temperature_exponent = 0) AND (SELF\named_unit.dimensions.amount_of_substance_exponent = 0) AND (SELF\named_unit.dimensions.luminous_intensity_exponent = 0)
	domain_rule(wr1) :- 
		::dimensions(Dims),
		Dims::length_exponent(0.0),
		Dims::mass_exponent(0.0),
		Dims::time_exponent(0.0),
		Dims::electric_current_exponent(0.0),
		Dims::thermodynamic_temperature_exponent(0.0),
		Dims::amount_of_substance_exponent(0.0),
		Dims::luminous_intensity_exponent(0.0).

:- end_object.


:- object(face_outer_bound,
	instantiates(express_entity),
	specializes(face_bound)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

:- end_object.


:- object(point,
	instantiates(express_entity),
	specializes(geometric_representation_item)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

:- end_object.


:- object(product_definition_usage,
	instantiates(express_entity),
	specializes(product_definition_relationship)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	unique_rule(ur1, [id, relating_product_definition, related_product_definition]).

	domain_rules([wr1]).

	% rule wr1:acyclic_product_definition_relationship (SELF, [SELF\product_definition_relationship.related_product_definition], 'CONFIG_CONTROL_DESIGN.PRODUCT_DEFINITION_USAGE.' + 'RELATED_PRODUCT_DEFINITION')
	domain_rule(wr1) :-
		self(Self),
		acyclic_product_definition_relationship::true(Self).

:- end_object.


:- object(curve_bounded_surface,
	instantiates(express_entity),
	specializes(bounded_surface)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(basis_surface/1).
	:- mode(basis_surface(?surface), one, explicit).

	:- public(boundaries/1).
	:- mode(boundaries(?express_set(boundary_curve,1,unbounded)), one, explicit).

	:- public(implicit_outer/1).
	:- mode(implicit_outer(?express_boolean), one, explicit).

	domain_rules([wr1, wr2, wr3, wr4]).

	% rule wr1:NOT (implicit_outer AND ('CONFIG_CONTROL_DESIGN.OUTER_BOUNDARY_CURVE' IN TYPEOF(boundaries)))
	domain_rule(wr1) :-
		\+ (	::implicit_outer(true),
				::boundaries(BoundList),
				list::member(Bound, BoundList),
				Bound::ancestor(outer_boundary_curve)
			).

	% rule wr2:(NOT implicit_outer) OR ('CONFIG_CONTROL_DESIGN.BOUNDED_SURFACE' IN TYPEOF(basis_surface))
	domain_rule(wr2) :-
		(	::implicit_outer(true) ->
			::basis_surface(Surf),
			Surf::ancestor(bounded_surface), !
		;	true
		).

	% rule wr3:SIZEOF (QUERY (temp <* boundaries | 'CONFIG_CONTROL_DESIGN.OUTER_BOUNDARY_CURVE' IN TYPEOF(temp))) <= 1
	domain_rule(wr3) :- 
		::boundaries(Bounds),
		(	setof(Bound, (list::member(Bound, Bounds), Bound::ancestor(outer_boundary_curve)), List) ->
			List = [_]
		;	true
		).

	% rule wr4:SIZEOF (QUERY (temp <* boundaries | temp\composite_curve_on_surface.basis_surface[1] :<>: SELF.basis_surface)) = 0
	domain_rule(wr4) :-
		::basis_surface(Basis),
		::boundaries(Bounds),
		forall(list::member(Bound, Bounds), Bound::basis_surface([Basis| _])).

:- end_object.


:- object(manifold_solid_brep,
	instantiates(express_entity),
	specializes(solid_model)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(outer/1).
	:- mode(outer(?closed_shell), one, explicit).

:- end_object.


:- object(ellipse,
	instantiates(express_entity),
	specializes(conic)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(semi_axis_1/1).
	:- mode(semi_axis_1(?positive_length_measure), one, explicit).

	:- public(semi_axis_2/1).
	:- mode(semi_axis_2(?positive_length_measure), one, explicit).

:- end_object.


:- object(vertex_loop,
	instantiates(express_entity),
	specializes(loop)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(loop_vertex/1).
	:- mode(loop_vertex(?vertex), one, explicit).

:- end_object.


:- object(edge_based_wireframe_shape_representation,
	instantiates(express_entity),
	specializes(shape_representation)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	domain_rules([wr1, wr2, wr3, wr4, wr5, wr6, wr7, wr8, wr9]).

	% rule wr1:SIZEOF (QUERY (it <* SELF\representation.items | NOT (SIZEOF(['CONFIG_CONTROL_DESIGN.EDGE_BASED_WIREFRAME_MODEL', 'CONFIG_CONTROL_DESIGN.MAPPED_ITEM', 'CONFIG_CONTROL_DESIGN.AXIS2_PLACEMENT_3D'] * TYPEOF (it)) = 1 ))) = 0
	domain_rule(wr1) :- 
		::items(Items),
		\+ (	list::member(Item, Items),
				\+ findall(C,
					   (list::member(C,[edge_based_wireframe_model,mapped_item,axis2_placement_3d]),Item::ancestor(C)),
					   [_])
			).

	% rule wr2:SIZEOF (QUERY (it <* SELF\representation.items | SIZEOF(['CONFIG_CONTROL_DESIGN.EDGE_BASED_WIREFRAME_MODEL', 'CONFIG_CONTROL_DESIGN.MAPPED_ITEM'] * TYPEOF (it)) = 1 )) >= 1
	domain_rule(wr2) :- 
		::items(Items),
		list::member(Item, Items),
		Item::(ancestor(edge_based_wireframe_model); ::ancestor(mapped_item)), !.
		
	% rule wr3:SIZEOF (QUERY (ebwm <* QUERY (it <* SELF\representation.items | 'CONFIG_CONTROL_DESIGN.EDGE_BASED_WIREFRAME_MODEL' IN TYPEOF (it)) | NOT (SIZEOF (QUERY (eb <* ebwm\edge_based_wireframe_model.ebwm_boundary | NOT (SIZEOF (QUERY (edges <* eb.ces_edges | NOT ('CONFIG_CONTROL_DESIGN.EDGE_CURVE' IN TYPEOF (edges)))) = 0 ))) = 0))) = 0
	domain_rule(wr3) :- 
		::items(Items),
		\+ (	list::member(Item, Items),
				Item::ancestor(edge_based_wireframe_model),
				Item::ebwm_boundary(EdgeSet),
				list::member(Eb, EdgeSet),
				Eb::ces_edges(Edges),
				list::member(Edge, Edges),
				\+ Edge::ancestor(edge_curve)
			).

	% rule wr4:SIZEOF (QUERY (ebwm <* QUERY (it <* SELF\representation.items | 'CONFIG_CONTROL_DESIGN.EDGE_BASED_WIREFRAME_MODEL' IN TYPEOF (it)) | NOT (SIZEOF (QUERY (eb <* ebwm\edge_based_wireframe_model.ebwm_boundary | NOT (SIZEOF (QUERY (pline_edges <* QUERY (edges <* eb.ces_edges | 'CONFIG_CONTROL_DESIGN.POLYLINE' IN TYPEOF (edges\edge_curve.edge_geometry)) | NOT (SIZEOF (pline_edges\edge_curve.edge_geometry\polyline.points) > 2))) = 0))) = 0))) = 0
	domain_rule(wr4) :- 
	::items(Items),
	\+ (	list::member(Item, Items),
			Item::ancestor(edge_based_wireframe_model),
			Item::ebwm_boundary(EdgeSet),
			list::member(Eb, EdgeSet),
			Eb::ces_edges(Edges),
			list::member(Edge,Edges),
			Edge::edge_geometry(Curve),
			Curve::ancestor(polyline),
			\+ Curve::points([_,_,_|_])
		).

	% rule wr5:SIZEOF (QUERY (ebwm <* QUERY (it <* SELF\representation.items | 'CONFIG_CONTROL_DESIGN.EDGE_BASED_WIREFRAME_MODEL' IN TYPEOF (it)) | NOT (SIZEOF (QUERY (eb <* ebwm\edge_based_wireframe_model.ebwm_boundary | NOT (SIZEOF (QUERY (edges <* eb.ces_edges | NOT (('CONFIG_CONTROL_DESIGN.VERTEX_POINT' IN TYPEOF (edges.edge_start)) AND ('CONFIG_CONTROL_DESIGN.VERTEX_POINT' IN TYPEOF (edges.edge_end))))) = 0))) = 0))) = 0
	domain_rule(wr5) :- 
	::items(Items),
		\+ (	list::member(Item, Items),
				Item::ancestor(edge_based_wireframe_model),
				Item::ebwm_boundary(EdgeSet),
				list::member(Eb, EdgeSet),
				Eb::ces_edges(Edges),
				list::member(Edge,Edges),
				Edge::edge_start(P1),
				Edge::edge_end(P2),
				\+ (	P1::ancestor(vertex_point),
						P2::ancestor(vertex_point)
					)
			).

	% rule wr6:SIZEOF (QUERY (ebwm <* QUERY (it <* SELF\representation.items | 'CONFIG_CONTROL_DESIGN.EDGE_BASED_WIREFRAME_MODEL' IN TYPEOF (it)) | NOT (SIZEOF (QUERY (eb <* ebwm\edge_based_wireframe_model.ebwm_boundary | NOT (SIZEOF (QUERY (edges <* eb.ces_edges | NOT (valid_wireframe_edge_curve (edges\edge_curve.edge_geometry, 'CONFIG_CONTROL_DESIGN')))) = 0))) = 0))) = 0
	domain_rule(wr6) :- 
		::items(Items),
		\+ (	list::member(Item, Items),
				Item::ancestor(edge_based_wireframe_model),
				Item::ebwm_boundary(EdgeSet),
				list::member(Eb, EdgeSet),
				Eb::ces_edges(Edges),
				list::member(Edge, Edges),
				Edge::edge_geometry(Curve),
				\+ valid_wireframe_edge_curve::true(Curve)
			).

	% rule wr7:SIZEOF (QUERY (ebwm <* QUERY (it <* SELF\representation.items | 'CONFIG_CONTROL_DESIGN.EDGE_BASED_WIREFRAME_MODEL' IN TYPEOF (it)) | NOT (SIZEOF (QUERY (eb <* ebwm\edge_based_wireframe_model.ebwm_boundary | NOT (SIZEOF (QUERY (edges <* eb.ces_edges | NOT((valid_wireframe_vertex_point (edges.edge_start\vertex_point.vertex_geometry, 'CONFIG_CONTROL_DESIGN')) AND (valid_wireframe_vertex_point (edges.edge_end\vertex_point.vertex_geometry, 'CONFIG_CONTROL_DESIGN'))))) = 0))) = 0))) = 0
	domain_rule(wr7) :- 
		::items(Items),
		\+ (	list::member(Item, Items),
				Item::ancestor(edge_based_wireframe_model),
				Item::ebwm_boundary(EdgeSet),
				list::member(Eb, EdgeSet),
				Eb::ces_edges(Edges),
				list::member(Edge, Edges),
				Edge::edge_start(P1),
				P1::edge_geometry(CP1),
				Edge::edge_end(P2),
				P2::edge_geometry(CP2),
				\+ (	valid_wireframe_vertex_point::true(CP1),
						valid_wireframe_vertex_point::true(CP2)
					)
			).

	% rule wr8:SIZEOF (QUERY (ebwm <* QUERY (it <* SELF\representation.items | 'CONFIG_CONTROL_DESIGN.EDGE_BASED_WIREFRAME_MODEL' IN TYPEOF (it)) | NOT (SIZEOF (QUERY (eb <* ebwm\edge_based_wireframe_model.ebwm_boundary | NOT (SIZEOF (QUERY (con_edges <* QUERY (edges <* eb.ces_edges | 'CONFIG_CONTROL_DESIGN.CONIC' IN TYPEOF (edges\edge_curve.edge_geometry)) | NOT ('CONFIG_CONTROL_DESIGN.AXIS2_PLACEMENT_3D' IN TYPEOF (con_edges\edge_curve.edge_geometry\conic.position)))) = 0 ))) = 0))) = 0
	domain_rule(wr8) :- 
		::items(Items),
		\+ (	list::member(Item, Items),
				Item::ancestor(edge_based_wireframe_model),
				Item::ebwm_boundary(EdgeSet),
				list::member(Eb, EdgeSet),
				Eb::ces_edges(Edges),
				list::member(Edge,Edges),
				Edge::edge_geometry(Geom),
				Geom::ancestor(conic),
				Geom::position(Pos),
				\+ Pos::ancestor(axis2_placement_3d)
			).

	% rule wr9:SIZEOF (QUERY (mi <* QUERY (item <* SELF\representation.items | 'CONFIG_CONTROL_DESIGN.MAPPED_ITEM' IN TYPEOF (item)) | NOT ('CONFIG_CONTROL_DESIGN.' + 'EDGE_BASED_WIREFRAME_SHAPE_REPRESENTATION' IN TYPEOF (mi\mapped_item.mapping_source.mapped_representation)))) = 0
	domain_rule(wr9) :- 
		::items(Items),
		\+ (	list::member(Item, Items),
				Item::ancestor(mapped_item),
				Item::mapping_source(MapSource),
				MapSource::mapped_representation(MapRep),
				\+ MapRep::ancestor(edge_based_wireframe_shape_representation)
			).

:- end_object.


:- object(bounded_curve,
	instantiates(express_entity),
	specializes(curve)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

:- end_object.


:- object(definitional_representation,
	instantiates(express_entity),
	specializes(representation)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	domain_rules([wr1]).

	% rule wr1:'CONFIG_CONTROL_DESIGN.PARAMETRIC_REPRESENTATION_CONTEXT' IN TYPEOF (SELF\representation.context_of_items)
	domain_rule(wr1) :-
		::context_of_items(Context),
		Context::ancestor(parametric_representation_context), !.

:- end_object.


:- object(cartesian_transformation_operator_3d,
	instantiates(express_entity),
	specializes(cartesian_transformation_operator)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(axis3/1).
	:- mode(axis3(?direction), zero_or_one, explicit).

	:- public(u/1).
	:- mode(u(?express_list(direction,3,3)), one, derived).

	domain_rules([wr1]).

	% derived u:LIST [3:3] OF direction := base_axis(3, SELF\cartesian_transformation_operator.axis1, SELF\cartesian_transformation_operator.axis2, axis3)
	u(Directions) :-
		::axis1(Axis1),
		::axis2(Axis2),
		::axis3(Axis3),
		base_axis::eval(Axis1, Axis2, Axis3, Directions).
	% rule wr1:SELF\cartesian_transformation_operator.dim = 3
	domain_rule(wr1) :-
		::dim(3).

:- end_object.


:- object(rectangular_composite_surface,
	instantiates(express_entity),
	specializes(bounded_surface)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(segments/1).
	:- mode(segments(?express_list(express_list(surface_patch,1,unbounded),1,unbounded)), one, explicit).

	:- public(n_u/1).
	:- mode(n_u(?integer), one, derived).

	:- public(n_v/1).
	:- mode(n_v(?integer), one, derived).

	domain_rules([wr1, wr2]).

	% derived n_u:INTEGER := SIZEOF(segments)
	n_u(Value) :-
		::segments(X),
		list::length(X, Value).
	% derived n_v:INTEGER := SIZEOF(segments[1])
	n_v(Value) :-
		::segments([Hd | _]),
		list::length(Hd, Value).
	% rule wr1: ([] = QUERY ( s <* segments | (n_v <> SIZEOF(s)) ));
	% asserts that all elements of the segments list have the same length (number of elements)
	domain_rule(wr1) :-
		::n_v(Nv),
		::segments(Segments),
		\+ (list::member(Seg,Segments), \+list::length(Seg,Nv)).
		
	% rule wr2:constraints_rectangular_composite_surface(SELF)
	domain_rule(wr2) :-
		self(Self),
		constraints_rectangular_composite_surface::true(Self).

:- end_object.


:- object(edge_based_wireframe_model,
	instantiates(express_entity),
	specializes(geometric_representation_item)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(ebwm_boundary/1).
	:- mode(ebwm_boundary(?express_set(connected_edge_set,1,unbounded)), one, explicit).

:- end_object.


:- object(b_spline_surface_with_knots,
	instantiates(express_entity),
	specializes(b_spline_surface)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(u_multiplicities/1).
	:- mode(u_multiplicities(?express_list(integer,2,unbounded)), one, explicit).

	:- public(v_multiplicities/1).
	:- mode(v_multiplicities(?express_list(integer,2,unbounded)), one, explicit).

	:- public(u_knots/1).
	:- mode(u_knots(?express_list(parameter_value,2,unbounded)), one, explicit).

	:- public(v_knots/1).
	:- mode(v_knots(?express_list(parameter_value,2,unbounded)), one, explicit).

	:- public(knot_spec/1).
	:- mode(knot_spec(?knot_type), one, explicit).

	:- public(knot_u_upper/1).
	:- mode(knot_u_upper(?integer), one, derived).

	:- public(knot_v_upper/1).
	:- mode(knot_v_upper(?integer), one, derived).

	domain_rules([wr1, wr2, wr3, wr4]).

	% derived knot_u_upper:INTEGER := SIZEOF(u_knots)
	knot_u_upper(Value) :-
		::u_knots(X),
		list::length(X,Value).
	% derived knot_v_upper:INTEGER := SIZEOF(v_knots)
	knot_v_upper(Value) :-
		::v_knots(X),
		list::length(X,Value).
	% rule wr1:constraints_param_b_spline(SELF\b_spline_surface.u_degree, knot_u_upper,SELF\b_spline_surface.u_upper,u_multiplicities, u_knots)
	domain_rule(wr1) :-
		::u_degree(UD),
		::knot_u_upper(Knot),
		::u_upper(UU),
		::u_multiplicities(Multiplicities),
		::u_knots(UK),
		constraints_param_b_spline::true(UD,Knot,UU,Multiplicities,UK).

	% rule wr2:constraints_param_b_spline(SELF\b_spline_surface.v_degree, knot_v_upper,SELF\b_spline_surface.v_upper,v_multiplicities, v_knots)
	domain_rule(wr2) :-
		::v_degree(VD),
		::knot_v_upper(Knot),
		::v_upper(VU),
		::v_multiplicities(Multiplicities),
		::v_knots(VK),
		constraints_param_b_spline::true(VD,Knot,VU,Multiplicities,VK).
		
	% rule wr3:SIZEOF(u_multiplicities) = knot_u_upper
	domain_rule(wr3) :-
		::u_multiplicities(Multiplicities),
		::knot_u_upper(Knot),
		list::length(Multiplicities, Knot).
	% rule wr4:SIZEOF(v_multiplicities) = knot_v_upper
	domain_rule(wr4) :-
		::v_multiplicities(Multiplicities),
		::knot_v_upper(Knot),
		list::length(Multiplicities, Knot).

:- end_object.


:- object(edge_curve,
	instantiates(express_entity),
	specializes(edge, geometric_representation_item)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(edge_geometry/1).
	:- mode(edge_geometry(?curve), one, explicit).

	:- public(same_sense/1).
	:- mode(same_sense(?express_boolean), one, explicit).

	:- alias(edge, uses_item_via_attr/2, edge_uses_item_via_attr/2).
	:- alias(geometric_representation_item, uses_item_via_attr/2, geometric_representation_item_uses_item_via_attr/2).

	uses_item_via_attr(Item, Attr) :-
		::edge_uses_item_via_attr(Item, Attr).
	uses_item_via_attr(Item, Attr) :-
		::geometric_representation_item_uses_item_via_attr(Item, Attr).

:- end_object.


:- object(direction,
	instantiates(express_entity),
	specializes(geometric_representation_item)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(direction_ratios/1).
	:- mode(direction_ratios(?express_list(float,2,3)), one, explicit).

	domain_rules([wr1]).

	% rule wr1:SIZEOF (QUERY (tmp <* direction_ratios | tmp <> 0)) > 0
	domain_rule(wr1) :-
		::direction_ratios(Ratios),
		list::length(Ratios, Length),
		Length > 0.

:- end_object.


:- object(uniform_surface,
	instantiates(express_entity),
	specializes(b_spline_surface)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

:- end_object.


:- object(mechanical_context,
	instantiates(express_entity),
	specializes(product_context)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	domain_rules([wr1]).

	% rule wr1:SELF.discipline_type = 'mechanical'
	domain_rule(wr1) :-
		::discipline_type(mechanical).

:- end_object.


:- object(placement,
	instantiates(express_entity),
	specializes(geometric_representation_item)).

	:- public(location/1).
	:- mode(location(?cartesian_point), one, explicit).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

:- end_object.


:- object(line,
	instantiates(express_entity),
	specializes(curve)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(pnt/1).
	:- mode(pnt(?cartesian_point), one, explicit).

	:- public(dir/1).
	:- mode(dir(?vector), one, explicit).

	domain_rules([wr1]).

	% rule wr1:dir.dim = pnt.dim
	domain_rule(wr1) :- ::dir(Dir), ::pnt(Pnt), Dir::dim(Dim), Pnt::dim(Dim).

:- end_object.


:- object(face_surface,
	instantiates(express_entity),
	specializes(face, geometric_representation_item)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(face_geometry/1).
	:- mode(face_geometry(?surface), one, explicit).

	:- public(same_sense/1).
	:- mode(same_sense(?express_boolean), one, explicit).

	:- alias(face, uses_item_via_attr/2, face_uses_item_via_attr/2).
	:- alias(geometric_representation_item, uses_item_via_attr/2, geometric_representation_item_uses_item_via_attr/2).

	uses_item_via_attr(Item, Attr) :-
		::face_uses_item_via_attr(Item, Attr).
	uses_item_via_attr(Item, Attr) :-
		::geometric_representation_item_uses_item_via_attr(Item, Attr).

:- end_object.


:- object(circle,
	instantiates(express_entity),
	specializes(conic)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(radius/1).
	:- mode(radius(?positive_length_measure), one, explicit).

:- end_object.


:- object(trimmed_curve,
	instantiates(express_entity),
	specializes(bounded_curve)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(basis_curve/1).
	:- mode(basis_curve(?curve), one, explicit).

	:- public(trim_1/1).
	:- mode(trim_1(?express_set(trimming_select,1,2)), one, explicit).

	:- public(trim_2/1).
	:- mode(trim_2(?express_set(trimming_select,1,2)), one, explicit).

	:- public(sense_agreement/1).
	:- mode(sense_agreement(?express_boolean), one, explicit).

	:- public(master_representation/1).
	:- mode(master_representation(?trimming_preference), one, explicit).

	domain_rules([wr1, wr2]).

	% rule wr1:((HIINDEX(trim_1) = 1) OR (TYPEOF(trim_1[1]) <> TYPEOF(trim_1[2])))
	domain_rule(wr1) :-
		(	::trim_1([T1, T2| _]) ->
			(	parameter_value::valid(T1) ->
				T2::ancestor(cartesian_point)
			;	parameter_value::valid(T2)
			)
		;	true
		).
	% rule wr2:((HIINDEX(trim_2) = 1) OR (TYPEOF(trim_2[1]) <> TYPEOF(trim_2[2])))
	domain_rule(wr2) :-
		(	::trim_2([T1, T2| _]) ->
			(	parameter_value::valid(T1) ->
				T2::ancestor(cartesian_point)
			;	parameter_value::valid(T2)
			)
		;	true
		).

:- end_object.


:- object(offset_curve_3d,
	instantiates(express_entity),
	specializes(curve)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(basis_curve/1).
	:- mode(basis_curve(?curve), one, explicit).

	:- public(distance/1).
	:- mode(distance(?length_measure), one, explicit).

	:- public(self_intersect/1).
	:- mode(self_intersect(?express_logical), one, explicit).

	:- public(ref_direction/1).
	:- mode(ref_direction(?direction), one, explicit).

	domain_rules([wr1]).

	% rule wr1:(basis_curve.dim = 3) AND (ref_direction.dim = 3)
	domain_rule(wr1) :-
		::basis_curve(Basis), Basis::dim(3),
		::ref_direction(Ref), Ref::dim(3).

:- end_object.


:- object(document_with_class,
	instantiates(express_entity),
	specializes(document)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(class/1).
	:- mode(class(?identifier), one, explicit).

:- end_object.


:- object(swept_surface,
	instantiates(express_entity),
	specializes(surface)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(swept_curve/1).
	:- mode(swept_curve(?curve), one, explicit).

:- end_object.


:- object(calendar_date,
	instantiates(express_entity),
	specializes(date)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(day_component/1).
	:- mode(day_component(?day_in_month_number), one, explicit).

	:- public(month_component/1).
	:- mode(month_component(?month_in_year_number), one, explicit).

	domain_rules([wr1]).

	% rule wr1:valid_calendar_date(SELF)
	domain_rule(wr1) :- 
		self(Self),
		valid_calendar_date::true(Self).

:- end_object.


:- object(bounded_pcurve,
	instantiates(express_entity),
	specializes(pcurve,bounded_curve)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/03/30,
		comment is '.']).
	
	domain_rules([wr1]).

	% rule wr1:('CONFIG_CONTROL_DESIGN.BOUNDED_CURVE' IN TYPEOF(SELF\pcurve. reference_to_curve.items[1]))
	domain_rule(wr1) :- 
		::reference_to_curve(RefCurve),
		RefCurve::items([Curve1| _]),
		Curve1::ancestor(bounded_curve).

:- end_object.


:- object(rational_b_spline_surface,
	instantiates(express_entity),
	specializes(b_spline_surface)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(weights_data/1).
	:- mode(weights_data(?express_list(express_list(float,2,unbounded),2,unbounded)), one, explicit).

	:- public(weights/1).
	:- mode(weights(?express_array(express_array(float,0,unbounded),0,unbounded)), one, derived).

	domain_rules([wr1, wr2]).

	% derived weights:ARRAY [0:?] OF ARRAY [0:?] OF REAL := make_array_of_array(weights_data, 0, u_upper, 0, v_upper)
	weights(Weights) :-
		::weights_data(Data),
		::u_upper(UU),
		::v_upper(VU),
		make_array_of_array::eval(Data, 0, UU, 0, VU, Weights).

	% rule wr1:(SIZEOF(weights_data) = SIZEOF(SELF\b_spline_surface.control_points_list)) AND (SIZEOF(weights_data[1]) = SIZEOF(SELF\b_spline_surface.control_points_list[1]))
	domain_rule(wr1) :-
		::weights_data(WeightsData),
		::control_points_list(CPList),
		list::same_length(WeightsData, CPList),
		WeightsData = [WD1| _],
		CPList = [CP1| _],
		list::same_length(WD1, CP1).
			
	% rule wr2:surface_weights_positive (SELF)
	domain_rule(wr2) :-
		self(Self),
		surface_weights_positive::true(Self).

:- end_object.


:- object(cartesian_point,
	instantiates(express_entity),
	specializes(point)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(coordinates/1).
	:- mode(coordinates(?express_list(length_measure,1,3)), one, explicit).

	uses_item(_) :-
		fail.

:- end_object.


:- object(intersection_curve,
	instantiates(express_entity),
	specializes(surface_curve)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	domain_rules([wr1, wr2]).

	% rule wr1:SIZEOF(SELF\surface_curve.associated_geometry) = 2
	domain_rule(wr1) :-
		::associated_geometry([_, _]).

	% rule wr2:associated_surface(SELF\surface_curve.associated_geometry[1]) <> associated_surface(SELF\surface_curve.associated_geometry[2])
	domain_rule(wr2) :-
		::associated_geometry([X, Y]),
		X \== Y.

:- end_object.


:- object(elementary_surface,
	instantiates(express_entity),
	specializes(surface)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(position/1).
	:- mode(position(?axis2_placement_3d), one, explicit).

:- end_object.


:- object(geometric_representation_context,
	instantiates(express_entity),
	specializes(representation_context)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(coordinate_space_dimension/1).
	:- mode(coordinate_space_dimension(?dimension_count), one, explicit).

:- end_object.


:- object(hyperbola,
	instantiates(express_entity),
	specializes(conic)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(semi_axis/1).
	:- mode(semi_axis(?positive_length_measure), one, explicit).

	:- public(semi_imag_axis/1).
	:- mode(semi_imag_axis(?positive_length_measure), one, explicit).

:- end_object.


:- object(ordinal_date,
	instantiates(express_entity),
	specializes(date)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(day_component/1).
	:- mode(day_component(?day_in_year_number), one, explicit).

	domain_rules([wr1]).

	% rule wr1:(NOT leap_year(SELF.year_component) AND {1 <= day_component <= 365}) OR (leap_year(SELF.year_component) AND {1 <= day_component <= 366})
	domain_rule(wr1) :-
		::year_component(Year),
		::day_component(Day), 
		(	leap_year::true(Year) ->
			1 =< Day, Day =< 366
		;	1 =< Day, Day =< 365
		).

:- end_object.


:- object(surface_of_linear_extrusion,
	instantiates(express_entity),
	specializes(swept_surface)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(extrusion_axis/1).
	:- mode(extrusion_axis(?vector), one, explicit).

:- end_object.


:- object(shell_based_wireframe_shape_representation,
	instantiates(express_entity),
	specializes(shape_representation)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	domain_rules([wr1,wr2,wr3,wr4,wr5,wr6,wr7,wr8,wr9,wr10,wr11,wr12,wr13]).

	% rule wr1:(SIZEOF(QUERY ( it <* SELF.items | (NOT (SIZEOF([ 'CONFIG_CONTROL_DESIGN.SHELL_BASED_WIREFRAME_MODEL', 'CONFIG_CONTROL_DESIGN.MAPPED_ITEM', 'CONFIG_CONTROL_DESIGN.AXIS2_PLACEMENT_3D'] * TYPEOF(it)) = 1)) )) = 0)
	domain_rule(wr1) :- 
		::items(Items),
		\+ (	list::member(Item, Items),
				\+  findall(Cls,
						(list::member(Cls,[shell_based_wireframe_model,mapped_item,axis2_placement_3d]),Item::ancestor(Cls)),
						[_])
			).

	% rule wr2:(SIZEOF(QUERY ( it <* SELF.items | (SIZEOF([ 'CONFIG_CONTROL_DESIGN.SHELL_BASED_WIREFRAME_MODEL', 'CONFIG_CONTROL_DESIGN.MAPPED_ITEM'] * TYPEOF(it)) = 1) )) >= 1)
	domain_rule(wr2) :- 
		::items(Items),
		list::member(Item, Items),
		Item::(ancestor(shell_based_wireframe_model); ancestor(mapped_item)), !.

	% rule wr3:(SIZEOF(QUERY ( sbwm <* QUERY ( it <* SELF.items | ( 'CONFIG_CONTROL_DESIGN.SHELL_BASED_WIREFRAME_MODEL' IN TYPEOF(it)) ) | (NOT (SIZEOF(QUERY ( ws <* QUERY ( sb <* sbwm\shell_based_wireframe_model.sbwm_boundary | ( 'CONFIG_CONTROL_DESIGN.WIRE_SHELL' IN TYPEOF(sb)) ) | (NOT (SIZEOF(QUERY ( eloop <* QUERY ( wsb <* ws\wire_shell. wire_shell_extent | ('CONFIG_CONTROL_DESIGN.EDGE_LOOP' IN TYPEOF(wsb)) ) | (NOT (SIZEOF(QUERY ( el <* eloop\path. edge_list | (NOT ('CONFIG_CONTROL_DESIGN.EDGE_CURVE' IN TYPEOF(el.edge_element))) )) = 0)) )) = 0)) )) = 0)) )) = 0)
	domain_rule(wr3) :- 
		::items(Items),
		\+ (	list::member(Item, Items),
				Item::ancestor(shell_based_wireframe_model),
				Item::sbwm_boundary(Shells),
				list::member(Shell, Shells),
				Shell::ancestor(wire_shell),
				Shell::wire_shell_extent(Loops),
				list::member(Wsb, Loops),
				Wsb::ancestor(edge_loop),
				Wsb::edge_loop(Edges),
				list::member(Edge, Edges),
				\+ Edge::ancestor(edge_curve)
			).

	% rule wr4:(SIZEOF(QUERY ( sbwm <* QUERY ( it <* SELF.items | ( 'CONFIG_CONTROL_DESIGN.SHELL_BASED_WIREFRAME_MODEL' IN TYPEOF(it)) ) | (NOT (SIZEOF(QUERY ( ws <* QUERY ( sb <* sbwm\shell_based_wireframe_model.sbwm_boundary | ( 'CONFIG_CONTROL_DESIGN.WIRE_SHELL' IN TYPEOF(sb)) ) | (NOT (SIZEOF(QUERY ( eloop <* QUERY ( wsb <* ws\wire_shell. wire_shell_extent | ('CONFIG_CONTROL_DESIGN.EDGE_LOOP' IN TYPEOF(wsb)) ) | (NOT (SIZEOF(QUERY ( pline_el <* QUERY ( el <* eloop\path.edge_list | ( 'CONFIG_CONTROL_DESIGN.POLYLINE' IN TYPEOF(el.edge_element\ edge_curve.edge_geometry)) ) | (NOT (SIZEOF(pline_el. edge_element\edge_curve.edge_geometry\polyline.points) > 2)) )) = 0)) )) = 0)) )) = 0)) )) = 0)
	domain_rule(wr4) :- 
		::items(Items),
		\+ (	list::member(Item, Items),
				Item::ancestor(shell_based_wireframe_model),
				Item::sbwm_boundary(Shells),
				list::member(Shell, Shells),
				Shell::ancestor(wire_shell),
				Shell::wire_shell_extent(Loops),
				list::member(Wsb, Loops),
				Wsb::ancestor(edge_loop),
				Wsb::edge_loop(Edges),
				list::member(Edge, Edges),
				Edge::ancestor(edge_curve),
				Edge::edge_geometry(Curve),
				Curve::ancestor(polyline),
				\+ Curve::points([_,_,_|_])
			).

	% rule wr5:(SIZEOF(QUERY ( sbwm <* QUERY ( it <* SELF.items | ( 'CONFIG_CONTROL_DESIGN.SHELL_BASED_WIREFRAME_MODEL' IN TYPEOF(it)) ) | (NOT (SIZEOF(QUERY ( ws <* QUERY ( sb <* sbwm\shell_based_wireframe_model.sbwm_boundary | ( 'CONFIG_CONTROL_DESIGN.WIRE_SHELL' IN TYPEOF(sb)) ) | (NOT (SIZEOF(QUERY ( eloop <* QUERY ( wsb <* ws\wire_shell. wire_shell_extent | ('CONFIG_CONTROL_DESIGN.EDGE_LOOP' IN TYPEOF(wsb)) ) | (NOT (SIZEOF(QUERY ( el <* eloop\path. edge_list | (NOT valid_wireframe_edge_curve(el.edge_element \edge_curve.edge_geometry)) )) = 0)) )) = 0)) )) = 0)) )) = 0)
	domain_rule(wr5) :- 
		::items(Items),
		\+ (	list::member(Item, Items),
				Item::ancestor(shell_based_wireframe_model),
				Item::sbwm_boundary(Shells),
				list::member(Shell, Shells),
				Shell::ancestor(wire_shell),
				Shell::wire_shell_extent(Loops),
				list::member(Wsb, Loops),
				Wsb::ancestor(edge_loop),
				Wsb::edge_loop(Edges),
				list::member(Edge, Edges),
				Edge::ancestor(edge_curve),
				Edge::edge_geometry(Curve),
				\+ valid_wireframe_edge_curve::true(Curve)
			).

	% rule wr6:(SIZEOF(QUERY ( sbwm <* QUERY ( it <* SELF.items | ( 'CONFIG_CONTROL_DESIGN.SHELL_BASED_WIREFRAME_MODEL' IN TYPEOF(it)) ) | (NOT (SIZEOF(QUERY ( ws <* QUERY ( sb <* sbwm\shell_based_wireframe_model.sbwm_boundary | ( 'CONFIG_CONTROL_DESIGN.WIRE_SHELL' IN TYPEOF(sb)) ) | (NOT (SIZEOF(QUERY ( eloop <* QUERY ( wsb <* ws\wire_shell. wire_shell_extent | ('CONFIG_CONTROL_DESIGN.EDGE_LOOP' IN TYPEOF(wsb)) ) | (NOT (SIZEOF(QUERY ( el <* eloop\path. edge_list | (NOT (('CONFIG_CONTROL_DESIGN.VERTEX_POINT' IN TYPEOF(el.edge_element.edge_start)) AND ( 'CONFIG_CONTROL_DESIGN.VERTEX_POINT' IN TYPEOF(el. edge_element.edge_end)))) )) = 0)) )) = 0)) )) = 0)) )) = 0)
	domain_rule(wr6) :- 
		::items(Items),
		\+ (	list::member(Item, Items),
				Item::ancestor(shell_based_wireframe_model),
				Item::sbwm_boundary(Shells),
				list::member(Shell,Shells),
				Shell::ancestor(wire_shell),
				Shell::wire_shell_extent(Loops),
				list::member(Wsb,Loops),
				Wsb::ancestor(edge_loop),
				Wsb::edge_loop(Edges),
				list::member(Edge,Edges),
				Edge::edge_start(V1),
				Edge::edge_end(V2),
				\+ (	V1::ancestor(vertex_point),
						V2::ancestor(vertex_point)
					)
			).

	% rule wr7:(SIZEOF(QUERY ( sbwm <* QUERY ( it <* SELF.items | ( 'CONFIG_CONTROL_DESIGN.SHELL_BASED_WIREFRAME_MODEL' IN TYPEOF(it)) ) | (NOT (SIZEOF(QUERY ( ws <* QUERY ( sb <* sbwm\shell_based_wireframe_model.sbwm_boundary | ( 'CONFIG_CONTROL_DESIGN.WIRE_SHELL' IN TYPEOF(sb)) ) | (NOT (SIZEOF(QUERY ( eloop <* QUERY ( wsb <* ws\wire_shell. wire_shell_extent | ('CONFIG_CONTROL_DESIGN.EDGE_LOOP' IN TYPEOF(wsb)) ) | (NOT (SIZEOF(QUERY ( el <* eloop\path. edge_list | (NOT (valid_wireframe_vertex_point(el. edge_element.edge_start\vertex_point.vertex_geometry) AND valid_wireframe_vertex_point(el.edge_element.edge_end\ vertex_point.vertex_geometry))) )) = 0)) )) = 0)) )) = 0)) )) = 0)
	domain_rule(wr7) :- 
		::items(Items),
		\+ (	list::member(Item, Items),
				Item::ancestor(shell_based_wireframe_model),
				Item::sbwm_boundary(Shells),
				list::member(Shell, Shells),
				Shell::ancestor(wire_shell),
				Shell::wire_shell_extent(Loops),
				list::member(Wsb,Loops),
				Wsb::ancestor(edge_loop),
				Wsb::edge_loop(Edges),
				list::member(Edge, Edges),
				Edge::edge_start(V1),
				V1::vertex_geometry(P1),
				Edge::edge_end(V2),
				V2::vertex_geometry(P2),
				\+ (	valid_wireframe_vertex_point::true(P1),
						valid_wireframe_vertex_point::true(P2)
					)
			).

	% rule wr8:(SIZEOF(QUERY ( sbwm <* QUERY ( it <* SELF.items | ( 'CONFIG_CONTROL_DESIGN.SHELL_BASED_WIREFRAME_MODEL' IN TYPEOF(it)) ) | (NOT (SIZEOF(QUERY ( ws <* QUERY ( sb <* sbwm\shell_based_wireframe_model.sbwm_boundary | ( 'CONFIG_CONTROL_DESIGN.WIRE_SHELL' IN TYPEOF(sb)) ) | (NOT (SIZEOF(QUERY ( vloop <* QUERY ( wsb <* ws\wire_shell. wire_shell_extent | ('CONFIG_CONTROL_DESIGN.VERTEX_LOOP' IN TYPEOF(wsb)) ) | (NOT ( 'CONFIG_CONTROL_DESIGN.VERTEX_POINT' IN TYPEOF(vloop\ vertex_loop.loop_vertex))) )) = 0)) )) = 0)) )) = 0)
	domain_rule(wr8) :- 
		::items(Items),
		\+ (	list::member(Item, Items),
				Item::ancestor(shell_based_wireframe_model),
				Item::sbwm_boundary(Shells),
				list::member(Shell, Shells),
				Shell::ancestor(wire_shell),
				Shell::wire_shell_extent(Loops),
				list::member(Wsb,Loops),
				Wsb::ancestor(vertex_loop),
				Wsb::loop_vertex(VP),
				\+ VP::ancestor(vertex_point)
			).

	% rule wr9:(SIZEOF(QUERY ( sbwm <* QUERY ( it <* SELF.items | ( 'CONFIG_CONTROL_DESIGN.SHELL_BASED_WIREFRAME_MODEL' IN TYPEOF(it)) ) | (NOT (SIZEOF(QUERY ( ws <* QUERY ( sb <* sbwm\shell_based_wireframe_model.sbwm_boundary | ( 'CONFIG_CONTROL_DESIGN.WIRE_SHELL' IN TYPEOF(sb)) ) | (NOT (SIZEOF(QUERY ( vloop <* QUERY ( wsb <* ws\wire_shell. wire_shell_extent | ('CONFIG_CONTROL_DESIGN.VERTEX_LOOP' IN TYPEOF(wsb)) ) | (NOT valid_wireframe_vertex_point(vloop\ vertex_loop.loop_vertex\vertex_point.vertex_geometry)) )) = 0)) )) = 0)) )) = 0)
	domain_rule(wr9) :- 
		::items(Items),
		\+ (	list::member(Item, Items),
				Item::ancestor(shell_based_wireframe_model),
				Item::sbwm_boundary(Shells),
				list::member(Shell, Shells),
				Shell::ancestor(wire_shell),
				Shell::wire_shell_extent(Loops),
				list::member(Wsb,Loops),
				Wsb::ancestor(vertex_loop),
				Wsb::loop_vertex(VP),
				VP::vertex_geometry(Pnt),
				\+ valid_wireframe_vertex_point::true(Pnt)
			).

	% rule wr10:(SIZEOF(QUERY ( sbwm <* QUERY ( it <* SELF.items | ( 'CONFIG_CONTROL_DESIGN.SHELL_BASED_WIREFRAME_MODEL' IN TYPEOF(it)) ) | (NOT (SIZEOF(QUERY ( vs <* QUERY ( sb <* sbwm\shell_based_wireframe_model.sbwm_boundary | ( 'CONFIG_CONTROL_DESIGN.VERTEX_SHELL' IN TYPEOF(sb)) ) | ( NOT ('CONFIG_CONTROL_DESIGN.VERTEX_POINT' IN TYPEOF(vs\ vertex_shell.vertex_shell_extent.loop_vertex))) )) = 0)) )) = 0)
	domain_rule(wr10) :- 
		::items(Items),
		\+ (	list::member(Item, Items),
				Item::ancestor(shell_based_wireframe_model),
				Item::sbwm_boundary(Shells),
				list::member(Shell, Shells),
				Shell::ancestor(vertex_shell),
				Shell::vertex_shell_extent(Ext),
				Ext::loop_vertex(VP),
				\+ VP::ancestor(vertex_point)
			).

	% rule wr11:(SIZEOF(QUERY ( sbwm <* QUERY ( it <* SELF.items | ( 'CONFIG_CONTROL_DESIGN.SHELL_BASED_WIREFRAME_MODEL' IN TYPEOF(it)) ) | (NOT (SIZEOF(QUERY ( vs <* QUERY ( sb <* sbwm\shell_based_wireframe_model.sbwm_boundary | ( 'CONFIG_CONTROL_DESIGN.VERTEX_SHELL' IN TYPEOF(sb)) ) | ( NOT valid_wireframe_vertex_point(vs\vertex_shell. vertex_shell_extent.loop_vertex\vertex_point. vertex_geometry)) )) = 0)) )) = 0)
	domain_rule(wr11) :- 
		::items(Items),
		\+ (	list::member(Item, Items),
				Item::ancestor(shell_based_wireframe_model),
				Item::sbwm_boundary(Shells),
				list::member(Shell, Shells),
				Shell::ancestor(vertex_shell),
				Shell::vertex_shell_extent(Ext),
				Ext::loop_vertex(VP),
				VP::vertex_geometry(Pnt),
				\+ valid_wireframe_vertex_point::true(Pnt)
			).

	% rule wr12:(SIZEOF(QUERY ( mi <* QUERY ( it <* SELF.items | ( 'CONFIG_CONTROL_DESIGN.MAPPED_ITEM' IN TYPEOF(it)) ) | ( NOT (('CONFIG_CONTROL_DESIGN.' + 'SHELL_BASED_WIREFRAME_SHAPE_REPRESENTATION') IN TYPEOF(mi\ mapped_item.mapping_source.mapped_representation))) )) = 0)
	domain_rule(wr12) :- 
		::items(Items),
		\+ (	list::member(Item, Items),
				Item::ancestor(mapped_item),
				Item::mapping_source(MapSource),
				MapSource::mapped_representation(MapRep),
				\+ MapRep::ancestor(shell_based_wireframe_shape_representation)
			).

	% rule wr13:(SELF.context_of_items\geometric_representation_context. coordinate_space_dimension = 3)
	domain_rule(wr13) :- 
		::context_of_items(Context),
		Context::coordinate_space_dimension(3).

:- end_object.


:- object(conical_surface,
	instantiates(express_entity),
	specializes(elementary_surface)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(radius/1).
	:- mode(radius(?length_measure), one, explicit).

	:- public(semi_angle/1).
	:- mode(semi_angle(?plane_angle_measure), one, explicit).

	domain_rules([wr1]).

	% rule wr1:radius >= 0
	domain_rule(wr1) :-
		::radius(Radius),
		Radius >= 0.

:- end_object.


:- object(axis2_placement_3d,
	instantiates(express_entity),
	specializes(placement)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(axis/1).
	:- mode(axis(?direction), zero_or_one, explicit).

	:- public(ref_direction/1).
	:- mode(ref_direction(?direction), zero_or_one, explicit).

	:- public(p/1).
	:- mode(p(?express_list(direction,3,3)), one, derived).

	domain_rules([wr1, wr2, wr3, wr4]).

	% derived p:LIST [3:3] OF direction := build_axes(axis,ref_direction)
	p(Directions) :-
		::axis(Axis),
		::ref_direction(RefDirection),
		build_axes::eval(Axis, RefDirection, Directions).

	% rule wr1:SELF\placement.location.dim = 3
	domain_rule(wr1) :-
		::location(Location),
		Location::dim(3).

	% rule wr2:(NOT EXISTS(axis)) OR (axis.dim = 3)
	domain_rule(wr2) :-
		(	::axis(Axis) ->
			Axis::dim(3)
		;	true
		).

	% rule wr3:(NOT EXISTS(ref_direction)) OR (ref_direction.dim = 3)
	domain_rule(wr3) :-
		(	::ref_direction(Ref) ->
			Ref::dim(3)
		;	true
		).

	% rule wr4:((NOT EXISTS(axis)) OR (NOT EXISTS(ref_direction))) OR ( cross_product(axis,ref_direction).magnitude > 0)
	domain_rule(wr4) :-
		(	::axis(Axis), ::ref_direction(RefDirection) ->
			cross_product::eval(Axis, RefDirection, Z),
			Z::magnitude(Magnitude),
			Magnitude > 0.0
		;	true
		).

:- end_object.


:- object(design_context,
	instantiates(express_entity),
	specializes(product_definition_context)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	domain_rules([wr1]).

	% rule wr1:SELF.life_cycle_stage = 'design'
	domain_rule(wr1) :-
		::life_cycle_stage(design).

:- end_object.


:- object(manifold_surface_shape_representation,
	instantiates(express_entity),
	specializes(shape_representation)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	domain_rules([wr1,wr2,wr3,wr4,wr5,wr6,wr7,wr8,wr9,wr10,wr11,wr12,wr13,wr14,wr15]).

	% rule wr1:(SIZEOF(QUERY ( it <* SELF.items | (NOT (SIZEOF([ 'CONFIG_CONTROL_DESIGN.SHELL_BASED_SURFACE_MODEL', 'CONFIG_CONTROL_DESIGN.MAPPED_ITEM', 'CONFIG_CONTROL_DESIGN.AXIS2_PLACEMENT_3D'] * TYPEOF(it)) = 1)) )) = 0)
	domain_rule(wr1) :- 
		::items(Items),
		\+ (	list::member(Item, Items),
				\+  findall(Cls,
					  (list::member(Cls,[shell_based_surface_model,mapped_item,axis2_placement_3d]),Item::ancestor(Cls)),
						[_])
			).

	% rule wr2:(SIZEOF(QUERY ( it <* SELF.items | (SIZEOF([ 'CONFIG_CONTROL_DESIGN.SHELL_BASED_SURFACE_MODEL', 'CONFIG_CONTROL_DESIGN.MAPPED_ITEM'] * TYPEOF(it)) = 1) )) > 0)
	domain_rule(wr2) :- 
		::items(Items),
		list::member(Item, Items),
		Item::(ancestor(shell_based_surface_model); ancestor(mapped_item)), !.

	% rule wr3:(SIZEOF(QUERY ( mi <* QUERY ( it <* SELF.items | ( 'CONFIG_CONTROL_DESIGN.MAPPED_ITEM' IN TYPEOF(it)) ) | ( NOT (('CONFIG_CONTROL_DESIGN.'+ 'MANIFOLD_SURFACE_SHAPE_REPRESENTATION' IN TYPEOF(mi\mapped_item.mapping_source. mapped_representation)) AND (SIZEOF(QUERY ( mr_it <* mi\ mapped_item.mapping_source.mapped_representation.items | ( 'CONFIG_CONTROL_DESIGN.SHELL_BASED_SURFACE_MODEL' IN TYPEOF(mr_it)) )) > 0))) )) = 0)
	domain_rule(wr3) :- 
		::items(Items),
		\+ (	list::member(Item, Items),
				Item::ancestor(mapped_item),
				Item::mapping_source(MapSource),
				MapSource::mapped_representation(MapRep),
				\+ (	MapRep::ancestor(manifold_surface_shape_representation),
						MapRep::items(MapItems),
						list::member(Mr_it,MapItems),
						Mr_it::ancestor(shell_based_surface_model)
					)
			).

	% rule wr4:(SIZEOF(QUERY ( sbsm <* QUERY ( it <* SELF.items | ( 'CONFIG_CONTROL_DESIGN.SHELL_BASED_SURFACE_MODEL' IN TYPEOF(it)) ) | (NOT (SIZEOF(QUERY ( sh <* sbsm\ shell_based_surface_model.sbsm_boundary | (NOT (SIZEOF([ 'CONFIG_CONTROL_DESIGN.OPEN_SHELL', 'CONFIG_CONTROL_DESIGN.ORIENTED_CLOSED_SHELL', 'CONFIG_CONTROL_DESIGN.CLOSED_SHELL'] * TYPEOF(sh)) = 1)) )) = 0)) )) = 0)
	domain_rule(wr4) :- 
		::items(Items),
		\+ (	list::member(Item, Items),
				Item::ancestor(shell_based_surface_model),
				Item::sbsm_boundary(Boundary),
				list::member(Shell, Boundary),
				\+ findall( Cls,
						(list::member(Cls,[open_shell,oriented_closed_shell,closed_shell]), Shell::ancestor(Cls)),
						[_])
			).
		
	% rule wr5:(SIZEOF(QUERY ( sbsm <* QUERY ( it <* SELF.items | ( 'CONFIG_CONTROL_DESIGN.SHELL_BASED_SURFACE_MODEL' IN TYPEOF(it)) ) | (NOT (SIZEOF(QUERY ( cfs <* sbsm\ shell_based_surface_model.sbsm_boundary | (NOT (SIZEOF( QUERY ( fa <* cfs\connected_face_set.cfs_faces | (NOT ( SIZEOF(['CONFIG_CONTROL_DESIGN.FACE_SURFACE', 'CONFIG_CONTROL_DESIGN.ORIENTED_FACE'] * TYPEOF(fa)) = 1)) )) = 0)) )) = 0)) )) = 0)
	domain_rule(wr5) :- 
		::items(Items),
		\+ (	list::member(Item, Items),
				Item::ancestor(shell_based_surface_model),
				Item::sbsm_boundary(Boundary),
				list::member(Shell, Boundary),
				Shell::cfs_faces(Faces),
				list::member(Face, Faces),
				\+ Face::(ancestor(face_surface); ancestor(oriented_face))
			).

	% rule wr6:(SIZEOF(QUERY ( sbsm <* QUERY ( it <* SELF.items | ( 'CONFIG_CONTROL_DESIGN.SHELL_BASED_SURFACE_MODEL' IN TYPEOF(it)) ) | (NOT (SIZEOF(QUERY ( cfs <* sbsm\ shell_based_surface_model.sbsm_boundary | (NOT (SIZEOF( QUERY ( f_sf <* QUERY ( fa <* cfs\connected_face_set. cfs_faces | ('CONFIG_CONTROL_DESIGN.FACE_SURFACE' IN TYPEOF(fa)) ) | (NOT (( 'CONFIG_CONTROL_DESIGN.ADVANCED_FACE' IN TYPEOF(f_sf)) OR ( SIZEOF(['CONFIG_CONTROL_DESIGN.B_SPLINE_SURFACE', 'CONFIG_CONTROL_DESIGN.ELEMENTARY_SURFACE', 'CONFIG_CONTROL_DESIGN.OFFSET_SURFACE', 'CONFIG_CONTROL_DESIGN.SURFACE_REPLICA', 'CONFIG_CONTROL_DESIGN.SWEPT_SURFACE'] * TYPEOF(f_sf\ face_surface.face_geometry)) = 1))) )) = 0)) )) = 0)) )) = 0)
	domain_rule(wr6) :- 
		::items(Items),
		\+ (list::member(Item, Items),
			Item::ancestor(shell_based_surface_model),
			Item::sbsm_boundary(Boundary),
			list::member(Shell,  Boundary),
			Shell::cfs_faces(Faces),
			list::member(Face,Faces),
			Face::ancestor(face_surface),
			\+ (Face::ancestor(advanced_face);
				findall(Cls,
						(list::member(Cls, [b_spline_surface,
											elementary_surface,
											offset_surface,
											surface_replica,
											swept_surface]),Face::ancestor(Cls)),
						[_]))).

	% rule wr7:(SIZEOF(QUERY ( sbsm <* QUERY ( it <* SELF.items | ( 'CONFIG_CONTROL_DESIGN.SHELL_BASED_SURFACE_MODEL' IN TYPEOF(it)) ) | (NOT (SIZEOF(QUERY ( cfs <* sbsm\ shell_based_surface_model.sbsm_boundary | (NOT (SIZEOF( QUERY ( fa <* cfs\connected_face_set.cfs_faces | (NOT (( 'CONFIG_CONTROL_DESIGN.ADVANCED_FACE' IN TYPEOF(fa)) OR msf_surface_check(fa\face_surface.face_geometry))) )) = 0)) )) = 0)) )) = 0)
	domain_rule(wr7) :- 
		::items(Items),
		\+ (	list::member(Item, Items),
				Item::ancestor(shell_based_surface_model),
				Item::sbsm_boundary(Boundary),
				list::member(Shell,  Boundary),
				Shell::cfs_faces(Faces),
				list::member(Face,Faces),
				\+ (	Face::ancestor(advanced_face)
					;	Face::ancestor(face_surface),
						Face::face_geometry(Surface),
						msf_surface_check::true(Surface)
					)
			).

	% rule wr8:(SIZEOF(QUERY ( sbsm <* QUERY ( it <* SELF.items | ( 'CONFIG_CONTROL_DESIGN.SHELL_BASED_SURFACE_MODEL' IN TYPEOF(it)) ) | (NOT (SIZEOF(QUERY ( cfs <* sbsm\ shell_based_surface_model.sbsm_boundary | (NOT (SIZEOF( QUERY ( fa <* cfs\connected_face_set.cfs_faces | (NOT (( 'CONFIG_CONTROL_DESIGN.ADVANCED_FACE' IN TYPEOF(fa)) OR ( SIZEOF(QUERY ( bnds <* fa.bounds | (NOT (SIZEOF([ 'CONFIG_CONTROL_DESIGN.EDGE_LOOP', 'CONFIG_CONTROL_DESIGN.VERTEX_LOOP'] * TYPEOF(bnds.bound)) = 1)) )) = 0))) )) = 0)) )) = 0)) )) = 0)
	domain_rule(wr8) :- 
		::items(Items),
		\+ (list::member(Item, Items),
			Item::ancestor(shell_based_surface_model),
			Item::sbsm_boundary(Boundary),
			list::member(Shell,  Boundary),
			Shell::cfs_faces(Faces),
			list::member(Face,Faces),
			\+ (Face::ancestor(advanced_face);
				Face::bounds(Bounds),
				\+ (list::member(Boundary,Bounds),
					Boundary::bound(Bound),
					\+ Bound::(ancestor(edge_loop);ancestor(vertex_loop))))).

	% rule wr9:(SIZEOF(QUERY ( sbsm <* QUERY ( it <* SELF.items | ( 'CONFIG_CONTROL_DESIGN.SHELL_BASED_SURFACE_MODEL' IN TYPEOF(it)) ) | (NOT (SIZEOF(QUERY ( cfs <* sbsm\ shell_based_surface_model.sbsm_boundary | (NOT (SIZEOF( QUERY ( fa <* cfs\connected_face_set.cfs_faces | (NOT (( 'CONFIG_CONTROL_DESIGN.ADVANCED_FACE' IN TYPEOF(fa)) OR ( SIZEOF(QUERY ( elp_fbnds <* QUERY ( bnds <* fa.bounds | ( 'CONFIG_CONTROL_DESIGN.EDGE_LOOP' IN TYPEOF(bnds.bound)) ) | (NOT (SIZEOF(QUERY ( oe <* elp_fbnds\path.edge_list | ( NOT ('CONFIG_CONTROL_DESIGN.EDGE_CURVE' IN TYPEOF(oe. edge_element))))) = 0)))) = 0))))) = 0)) )) = 0)) )) = 0)
	domain_rule(wr9) :- 
		::items(Items),
		\+ (list::member(Item, Items),
			Item::ancestor(shell_based_surface_model),
			Item::sbsm_boundary(Boundary),
			list::member(Shell,  Boundary),
			Shell::cfs_faces(Faces),
			list::member(Face,Faces),
			\+ (Face::ancestor(advanced_face);
				Face::bounds(Bounds),
				\+ (list::member(Boundary,Bounds),
					Boundary::bound(Bound),
					Bound::ancestor(edge_loop),
					Bound::edge_list(Edges),
					list::member(OrientedEdge,Edges),
					OrientedEdge::edge_element(Edge),
					\+ Edge::ancestor(edge_curve)))).

	% rule wr10:(SIZEOF(QUERY ( sbsm <* QUERY ( it <* SELF.items | ( 'CONFIG_CONTROL_DESIGN.SHELL_BASED_SURFACE_MODEL' IN TYPEOF(it)) ) | (NOT (SIZEOF(QUERY ( cfs <* sbsm\ shell_based_surface_model.sbsm_boundary | (NOT (SIZEOF( QUERY ( fa <* cfs\connected_face_set.cfs_faces | (NOT (( 'CONFIG_CONTROL_DESIGN.ADVANCED_FACE' IN TYPEOF(fa)) OR ( SIZEOF(QUERY ( elp_fbnds <* QUERY ( bnds <* fa.bounds | ( 'CONFIG_CONTROL_DESIGN.EDGE_LOOP' IN TYPEOF(bnds.bound)) ) | (NOT (SIZEOF(QUERY ( oe_cv <* QUERY ( oe <* elp_fbnds\ path.edge_list | ('CONFIG_CONTROL_DESIGN.EDGE_CURVE' IN TYPEOF(oe.edge_element)) ) | (NOT (SIZEOF([ 'CONFIG_CONTROL_DESIGN.B_SPLINE_CURVE', 'CONFIG_CONTROL_DESIGN.CONIC', 'CONFIG_CONTROL_DESIGN.CURVE_REPLICA', 'CONFIG_CONTROL_DESIGN.LINE', 'CONFIG_CONTROL_DESIGN.OFFSET_CURVE_3D', 'CONFIG_CONTROL_DESIGN.PCURVE', 'CONFIG_CONTROL_DESIGN.POLYLINE', 'CONFIG_CONTROL_DESIGN.SURFACE_CURVE'] * TYPEOF(oe_cv. edge_element\edge_curve.edge_geometry)) = 1)) )) = 0)) )) = 0))) )) = 0)) )) = 0)) )) = 0)
	domain_rule(wr10) :- 
		::items(Items),
		\+ (list::member(Item, Items),
			Item::ancestor(shell_based_surface_model),
			Item::sbsm_boundary(Boundary),
			list::member(Shell,  Boundary),
			Shell::cfs_faces(Faces),
			list::member(Face,Faces),
			\+ (Face::ancestor(advanced_face);
				Face::bounds(Bounds),
				\+ (list::member(Boundary,Bounds),
					Boundary::bound(Bound),
					Bound::ancestor(edge_loop),
					Bound::edge_list(Edges),
					list::member(OrientedEdge,Edges),
					OrientedEdge::edge_element(Edge),
					Edge::ancestor(edge_curve),
					Edge::edge_geometry(Curve),
					\+  Curve::(ancestor(b_spline_curve),
								ancestor(conic),
								ancestor(curve_replica),
								ancestor(line),
								ancestor(offset_curve_3d),
								ancestor(pcurve),
								ancestor(polyline),
								ancestor(surface_curve))))).

	% rule wr11:(SIZEOF(QUERY ( sbsm <* QUERY ( it <* SELF.items | ( 'CONFIG_CONTROL_DESIGN.SHELL_BASED_SURFACE_MODEL' IN TYPEOF(it)) ) | (NOT (SIZEOF(QUERY ( cfs <* sbsm\ shell_based_surface_model.sbsm_boundary | (NOT (SIZEOF( QUERY ( fa <* cfs\connected_face_set.cfs_faces | (NOT (( 'CONFIG_CONTROL_DESIGN.ADVANCED_FACE' IN TYPEOF(fa)) OR ( SIZEOF(QUERY ( elp_fbnds <* QUERY ( bnds <* fa.bounds | ( 'CONFIG_CONTROL_DESIGN.EDGE_LOOP' IN TYPEOF(bnds.bound)) ) | (NOT (SIZEOF(QUERY ( oe <* elp_fbnds\path.edge_list | ( NOT msf_curve_check(oe.edge_element\edge_curve. edge_geometry)) )) = 0)) )) = 0))) )) = 0)) )) = 0)) )) = 0)
	domain_rule(wr11) :- 
		::items(Items),
		\+ (list::member(Item, Items),
			Item::ancestor(shell_based_surface_model),
			Item::sbsm_boundary(Boundary),
			list::member(Shell,  Boundary),
			Shell::cfs_faces(Faces),
			list::member(Face,Faces),
			\+ (Face::ancestor(advanced_face);
				Face::bounds(Bounds),
				\+ (list::member(Boundary,Bounds),
					Boundary::bound(Bound),
					Bound::ancestor(edge_loop),
					Bound::edge_list(Edges),
					list::member(OrientedEdge,Edges),
					OrientedEdge::edge_element(Edge),
					Edge::ancestor(edge_curve),
					Edge::edge_geometry(Curve),
					\+ msf_curve_check::true(Curve)))).

	% rule wr12:(SIZEOF(QUERY ( sbsm <* QUERY ( it <* SELF.items | ( 'CONFIG_CONTROL_DESIGN.SHELL_BASED_SURFACE_MODEL' IN TYPEOF(it)) ) | (NOT (SIZEOF(QUERY ( cfs <* sbsm\ shell_based_surface_model.sbsm_boundary | (NOT (SIZEOF( QUERY ( fa <* cfs\connected_face_set.cfs_faces | (NOT (( 'CONFIG_CONTROL_DESIGN.ADVANCED_FACE' IN TYPEOF(fa)) OR ( SIZEOF(QUERY ( elp_fbnds <* QUERY ( bnds <* fa.bounds | ( 'CONFIG_CONTROL_DESIGN.EDGE_LOOP' IN TYPEOF(bnds.bound)) ) | (NOT (SIZEOF(QUERY ( oe <* elp_fbnds\path.edge_list | ( NOT (('CONFIG_CONTROL_DESIGN.VERTEX_POINT' IN TYPEOF(oe. edge_element.edge_start)) AND ( 'CONFIG_CONTROL_DESIGN.VERTEX_POINT' IN TYPEOF(oe. edge_element.edge_end)))) )) = 0)) )) = 0))) )) = 0)) )) = 0)) )) = 0)
	domain_rule(wr12) :- 
		::items(Items),
		\+ (list::member(Item, Items),
			Item::ancestor(shell_based_surface_model),
			Item::sbsm_boundary(Boundary),
			list::member(Shell,  Boundary),
			Shell::cfs_faces(Faces),
			list::member(Face,Faces),
			\+ (Face::ancestor(advanced_face);
				Face::bounds(Bounds),
				\+ (list::member(Boundary,Bounds),
					Boundary::bound(Bound),
					Bound::ancestor(edge_loop),
					Bound::edge_list(Edges),
					list::member(OrientedEdge,Edges),
					OrientedEdge::edge_element(Edge),
					Edge::edge_start(V1),
					Edge::edge_end(V2),
					\+ (V1::ancestor(vertex_point),V2::ancestor(vertex_point))))).

 	% rule wr13:(SIZEOF(QUERY ( sbsm <* QUERY ( it <* SELF.items | ( 'CONFIG_CONTROL_DESIGN.SHELL_BASED_SURFACE_MODEL' IN TYPEOF(it)) ) | (NOT (SIZEOF(QUERY ( cfs <* sbsm\ shell_based_surface_model.sbsm_boundary | (NOT (SIZEOF( QUERY ( fa <* cfs\connected_face_set.cfs_faces | (NOT (( 'CONFIG_CONTROL_DESIGN.ADVANCED_FACE' IN TYPEOF(fa)) OR ( SIZEOF(QUERY ( elp_fbnds <* QUERY ( bnds <* fa.bounds | ( 'CONFIG_CONTROL_DESIGN.EDGE_LOOP' IN TYPEOF(bnds.bound)) ) | (NOT (SIZEOF(QUERY ( oe <* elp_fbnds\path.edge_list | ( NOT ((SIZEOF(['CONFIG_CONTROL_DESIGN.CARTESIAN_POINT', 'CONFIG_CONTROL_DESIGN.DEGENERATE_PCURVE', 'CONFIG_CONTROL_DESIGN.POINT_ON_CURVE', 'CONFIG_CONTROL_DESIGN.POINT_ON_SURFACE'] * TYPEOF(oe. edge_element.edge_start\vertex_point.vertex_geometry)) = 1) AND (SIZEOF(['CONFIG_CONTROL_DESIGN.CARTESIAN_POINT', 'CONFIG_CONTROL_DESIGN.DEGENERATE_PCURVE', 'CONFIG_CONTROL_DESIGN.POINT_ON_CURVE', 'CONFIG_CONTROL_DESIGN.POINT_ON_SURFACE'] * TYPEOF(oe. edge_element.edge_end\vertex_point.vertex_geometry)) = 1))) )) = 0)) )) = 0))) )) = 0)) )) = 0)) )) = 0)
	domain_rule(wr13) :- 
		::items(Items),
		\+ (list::member(Item, Items),
			Item::ancestor(shell_based_surface_model),
			Item::sbsm_boundary(Boundary),
			list::member(Shell,  Boundary),
			Shell::cfs_faces(Faces),
			list::member(Face,Faces),
			\+ (Face::ancestor(advanced_face);
				Face::bounds(Bounds),
				\+ (list::member(Boundary,Bounds),
					Boundary::bound(Bound),
					Bound::ancestor(edge_loop),
					Bound::edge_list(Edges),
					list::member(OrientedEdge,Edges),
					OrientedEdge::edge_element(Edge),
					Edge::edge_start(V1),
					Edge::edge_end(V2),
					V1::vertex_geometry(P1),
					V2::vertex_geometry(P2),
					\+ (P1::(   ancestor(cartesian_point);
								ancestor(degenerate_pcurve);
								ancestor(point_on_curve);
								ancestor(point_on_surface)),
						P2::(  ancestor(cartesian_point);
								ancestor(degenerate_pcurve);
								ancestor(point_on_curve);
								ancestor(point_on_surface)))))).
								
	% rule wr14:(SIZEOF(QUERY ( sbsm <* QUERY ( it <* SELF.items | ( 'CONFIG_CONTROL_DESIGN.SHELL_BASED_SURFACE_MODEL' IN TYPEOF(it)) ) | (NOT (SIZEOF(QUERY ( cfs <* sbsm\ shell_based_surface_model.sbsm_boundary | (NOT (SIZEOF( QUERY ( fa <* cfs\connected_face_set.cfs_faces | (NOT (( 'CONFIG_CONTROL_DESIGN.ADVANCED_FACE' IN TYPEOF(fa)) OR ( SIZEOF(QUERY ( vlp_fbnds <* QUERY ( bnds <* fa.bounds | ( 'CONFIG_CONTROL_DESIGN.VERTEX_LOOP' IN TYPEOF(bnds.bound)) ) | (NOT ('CONFIG_CONTROL_DESIGN.VERTEX_POINT' IN TYPEOF( vlp_fbnds\vertex_loop.loop_vertex))) )) = 0))) )) = 0)) )) = 0)) )) = 0)
	domain_rule(wr14) :- 
		::items(Items),
		\+ (	list::member(Item, Items),
				Item::ancestor(shell_based_surface_model),
				Item::sbsm_boundary(Boundary),
				list::member(Shell,  Boundary),
				Shell::cfs_faces(Faces),
				list::member(Face,Faces),
				\+ (	Face::ancestor(advanced_face)
					;	Face::bounds(Bounds),
						\+ (	list::member(Boundary,Bounds),
								Boundary::bound(Bound),
								Bound::ancestor(vertex_loop),
								Bound::loop_vertex(VP),
								\+ VP::ancestor(vertex_point)
							)
					)
			).

	% rule wr15:(SIZEOF(QUERY ( sbsm <* QUERY ( it <* SELF.items | ( 'CONFIG_CONTROL_DESIGN.SHELL_BASED_SURFACE_MODEL' IN TYPEOF(it)) ) | (NOT (SIZEOF(QUERY ( cfs <* sbsm\ shell_based_surface_model.sbsm_boundary | (NOT (SIZEOF( QUERY ( fa <* cfs\connected_face_set.cfs_faces | (NOT (( 'CONFIG_CONTROL_DESIGN.ADVANCED_FACE' IN TYPEOF(fa)) OR ( SIZEOF(QUERY ( vlp_fbnds <* QUERY ( bnds <* fa.bounds | ( 'CONFIG_CONTROL_DESIGN.VERTEX_LOOP' IN TYPEOF(bnds.bound)) ) | (NOT (SIZEOF(['CONFIG_CONTROL_DESIGN.CARTESIAN_POINT', 'CONFIG_CONTROL_DESIGN.DEGENERATE_PCURVE', 'CONFIG_CONTROL_DESIGN.POINT_ON_CURVE', 'CONFIG_CONTROL_DESIGN.POINT_ON_SURFACE'] * TYPEOF( vlp_fbnds\vertex_loop.loop_vertex\vertex_point. vertex_geometry)) = 1)) )) = 0))) )) = 0)) )) = 0)) )) = 0)
	domain_rule(wr15) :- 
		::items(Items),
		\+ (	list::member(Item, Items),
				Item::ancestor(shell_based_surface_model),
				Item::sbsm_boundary(Boundary),
				list::member(Shell, Boundary),
				Shell::cfs_faces(Faces),
				list::member(Face, Faces),
				\+ (	Face::ancestor(advanced_face)
						;
						Face::bounds(Bounds),
						\+ (	list::member(Boundary,Bounds),
								Boundary::bound(Bound),
								Bound::ancestor(vertex_loop),
								Bound::loop_vertex(VP),
								VP::vertex_geometry(Pnt),
								\+ (	Pnt::(	ancestor(cartesian_point)
											;	ancestor(degenerate_pcurve)
											;	ancestor(point_on_curve)
											;	ancestor(point_on_surface)
											)
									)
							)
					)
			).

:- end_object.


:- object(bounded_surface_curve,
	instantiates(express_entity),
	specializes(surface_curve,bounded_curve)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/03/30,
		comment is '.']).

	domain_rules([wr1]).

	% rule wr1:('CONFIG_CONTROL_DESIGN.BOUNDED_CURVE' IN TYPEOF(SELF\ surface_curve.curve_3d))
	domain_rule(wr1) :- 
		::curve_3d(Curve3D),
		Curve3D::ancestor(bounded_curve).

:- end_object.


:- object(rectangular_trimmed_surface,
	instantiates(express_entity),
	specializes(bounded_surface)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(basis_surface/1).
	:- mode(basis_surface(?surface), one, explicit).

	:- public(u1/1).
	:- mode(u1(?parameter_value), one, explicit).

	:- public(u2/1).
	:- mode(u2(?parameter_value), one, explicit).

	:- public(v1/1).
	:- mode(v1(?parameter_value), one, explicit).

	:- public(v2/1).
	:- mode(v2(?parameter_value), one, explicit).

	:- public(usense/1).
	:- mode(usense(?express_boolean), one, explicit).

	:- public(vsense/1).
	:- mode(vsense(?express_boolean), one, explicit).

	domain_rules([wr1, wr2, wr3, wr4]).

	% rule wr1:u1 <> u2
	domain_rule(wr1) :- ::u1(U1), ::u2(U2), U1 \= U2.

	% rule wr2:v1 <> v2
	domain_rule(wr2) :- ::v1(V1), ::v2(V2), V1 \= V2.

	% rule wr3:((('CONFIG_CONTROL_DESIGN.ELEMENTARY_SURFACE' IN TYPEOF (basis_surface)) AND (NOT ('CONFIG_CONTROL_DESIGN.PLANE' IN TYPEOF (basis_surface)))) OR ('CONFIG_CONTROL_DESIGN.SURFACE_OF_REVOLUTION' IN TYPEOF (basis_surface))) OR (usense = (u2 > u1))
	domain_rule(wr3) :-
		::basis_surface(Surface),
		(	Surface::ancestor(elementary_surface),
			\+ Surface::ancestor(plane)
		;	Surface::ancestor(surface_of_revolution)
		), !.
	domain_rule(wr3) :-
		::usense(Usense), ::u1(U1), ::u2(U2),
		(	U2 > U1 ->
			Usense == true
		;	Usense == false
		).

	% rule wr4:(('CONFIG_CONTROL_DESIGN.SPHERICAL_SURFACE' IN TYPEOF (basis_surface)) OR ('CONFIG_CONTROL_DESIGN.TOROIDAL_SURFACE' IN TYPEOF (basis_surface))) OR (vsense = (v2 > v1))
	domain_rule(wr4) :-
		::basis_surface(Surface),
		(	Surface::ancestor(spherical_surface)
		;	Surface::ancestor(toroidal_surface)
		), !.
	domain_rule(wr4) :-
		::vsense(Vsense), ::v1(V1), ::v2(V2),
		(	V2 > V1 ->
			Vsense == true
		;	Vsense == false
		).

:- end_object.


:- object(plane,
	instantiates(express_entity),
	specializes(elementary_surface)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

:- end_object.


:- object(geometrically_bounded_surface_shape_representation,
	instantiates(express_entity),
	specializes(shape_representation)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	domain_rules([wr1, wr2, wr3, wr4, wr5, wr6, wr7]).

	% rule wr1:SIZEOF (QUERY (it <* items | NOT (SIZEOF (['CONFIG_CONTROL_DESIGN.GEOMETRIC_SET', 'CONFIG_CONTROL_DESIGN.MAPPED_ITEM', 'CONFIG_CONTROL_DESIGN.AXIS2_PLACEMENT_3D'] * TYPEOF (it)) = 1))) = 0
	domain_rule(wr1) :- 
		::items(Items),
		\+ (	list::member(Item, Items),
				\+  findall(Cls,
						(list::member(Cls,[geometric_set,mapped_item,axis2_placement_3d]), Item::ancestor(Cls)),
						[_])
			).

	% rule wr2:SIZEOF (QUERY (it <* items | SIZEOF (['CONFIG_CONTROL_DESIGN.GEOMETRIC_SET', 'CONFIG_CONTROL_DESIGN.MAPPED_ITEM'] * TYPEOF (it)) = 1)) > 0
	domain_rule(wr2) :- 
		::items(Items),
		list::member(Item, Items),
		Item::(ancestor(geometric_set); ancestor(mapped_item)), !.
		
	% rule wr3:SIZEOF (QUERY (mi <* QUERY (it <* items | 'CONFIG_CONTROL_DESIGN.MAPPED_ITEM' IN TYPEOF (it)) | NOT ('CONFIG_CONTROL_DESIGN.' + 'GEOMETRICALLY_BOUNDED_SURFACE_SHAPE_REPRESENTATION' IN TYPEOF (mi\mapped_item.mapping_source.mapped_representation)))) = 0
	domain_rule(wr3) :- 
		::items(Items),
		\+ (	list::member(Item, Items),
				Item::ancestor(mapped_item),
				Item::mapping_source(MapSource),
				MapSource::mapped_representation(MapRep),
				\+ MapRep::ancestor(geometrically_bounded_surface_shape_representation)
			).

	% rule wr4:SIZEOF (QUERY (gs <* QUERY (it <* items | 'CONFIG_CONTROL_DESIGN.GEOMETRIC_SET' IN TYPEOF (it)) | NOT (SIZEOF (QUERY (pnt <* QUERY (gsel <* gs\geometric_set.elements | 'CONFIG_CONTROL_DESIGN.POINT' IN TYPEOF (gsel)) | NOT (gbsf_check_point(pnt, 'CONFIG_CONTROL_DESIGN')))) = 0))) = 0
	domain_rule(wr4) :- 
		::items(Items),
		\+ (	list::member(Item, Items),
				Item::ancestor(geometric_set),
				Item::elements(Elements),
				list::member(Pnt, Elements),
				Pnt::ancestor(point),
				\+ gbsf_check_point::true(Pnt)
			).

	% rule wr5:SIZEOF (QUERY (gs <* QUERY (it <* items | 'CONFIG_CONTROL_DESIGN.GEOMETRIC_SET' IN TYPEOF (it)) | NOT (SIZEOF (QUERY (cv <* QUERY (gsel <* gs\geometric_set.elements | 'CONFIG_CONTROL_DESIGN.CURVE' IN TYPEOF (gsel)) | NOT (gbsf_check_curve(cv, 'CONFIG_CONTROL_DESIGN')))) = 0))) = 0
	domain_rule(wr5) :-
		::items(Items),
		\+ (	list::member(Item, Items),
				Item::ancestor(geometric_set),
				Item::elements(Elements),
				list::member(Curve, Elements),
				Curve::ancestor(curve),
				\+ gbsf_check_curve::true(Curve)
			).

	% rule wr6:SIZEOF (QUERY (gs <* QUERY (it <* items | 'CONFIG_CONTROL_DESIGN.GEOMETRIC_SET' IN TYPEOF (it)) | NOT (SIZEOF (QUERY (sf <* QUERY (gsel <* gs\geometric_set.elements | 'CONFIG_CONTROL_DESIGN.SURFACE' IN TYPEOF (gsel)) | NOT (gbsf_check_surface(sf, 'CONFIG_CONTROL_DESIGN')))) = 0))) = 0
	domain_rule(wr6) :- 
		::items(Items),
		\+ (	list::member(Item, Items),
				Item::ancestor(geometric_set),
				Item::elements(Elements),
				list::member(Surface,Elements),
				Surface::ancestor(surface),
				\+ gbsf_check_surface::true(Surface)
			).

	 % wr7: (SIZEOF(QUERY ( gs <* QUERY ( it <* SELF.items | ('CONFIG_CONTROL_DESIGN.GEOMETRIC_SET' IN TYPEOF(it)) ) | (SIZEOF(QUERY ( gsel <* gs\geometric_set.elements | ('CONFIG_CONTROL_DESIGN.SURFACE' IN TYPEOF(gsel)) )) > 0) )) > 0);
	domain_rule(wr7) :-
		::items(Items),
		list::member(Item, Items),
		Item::ancestor(geometric_set),
		Item::elements(Elements),
		list::member(Surface,Elements),
		Surface::ancestor(surface), !.


:- end_object.


:- object(curve_replica,
	instantiates(express_entity),
	specializes(curve)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(parent_curve/1).
	:- mode(parent_curve(?curve), one, explicit).

	:- public(transformation/1).
	:- mode(transformation(?cartesian_transformation_operator), one, explicit).

	domain_rules([wr1, wr2]).

	% rule wr1:transformation.dim = parent_curve.dim
	domain_rule(wr1) :-
		::transformation(Transformation), Transformation::dim(Dim),
		::parent_curve(ParentCurve), ParentCurve::dim(Dim).

	% rule wr2:acyclic_curve_replica(SELF,parent_curve)
	domain_rule(wr2) :-
		::parent_curve(ParentCurve),
		self(Self),
		acyclic_curve_replica::true(Self, ParentCurve).

:- end_object.


:- object(lot_effectivity,
	instantiates(express_entity),
	specializes(effectivity)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(effectivity_lot_id/1).
	:- mode(effectivity_lot_id(?identifier), one, explicit).

	:- public(effectivity_lot_size/1).
	:- mode(effectivity_lot_size(?measure_with_unit), one, explicit).

:- end_object.


:- object(degenerate_pcurve,
	instantiates(express_entity),
	specializes(point)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(basis_surface/1).
	:- mode(basis_surface(?surface), one, explicit).

	:- public(reference_to_curve/1).
	:- mode(reference_to_curve(?definitional_representation), one, explicit).

	domain_rules([wr1, wr2, wr3]).

	% rule wr1:SIZEOF(reference_to_curve\representation.items) = 1
	domain_rule(wr1) :-
		::reference_to_curve(Reference),
		Reference::items([_]).

	% rule wr2:'CONFIG_CONTROL_DESIGN.CURVE' IN TYPEOF (reference_to_curve\representation.items[1])
	domain_rule(wr2) :-
		::reference_to_curve(Representation),
		Representation::items([Curve| _]),
		Curve::ancestor(Curve), !.

	% rule wr3:reference_to_curve\representation.items[1]\ geometric_representation_item.dim = 2
	domain_rule(wr3) :- 
		::reference_to_curve(Rep),
		Rep::items([X|_]),
		X::dim(2).

:- end_object.


:- object(seam_curve,
	instantiates(express_entity),
	specializes(surface_curve)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	domain_rules([wr1, wr2, wr3, wr4]).

	% rule wr1:SIZEOF(SELF\surface_curve.associated_geometry) = 2
	domain_rule(wr1) :-
		::surface_curve(Curve),
		Curve::associated_geometry([_, _]).

	% rule wr2:associated_surface(SELF\surface_curve.associated_geometry[1]) = associated_surface(SELF\surface_curve.associated_geometry[2])
	domain_rule(wr2) :-
		::surface_curve(Curve),
		Curve::associated_geometry([X, X]).

	% rule wr3:'CONFIG_CONTROL_DESIGN.PCURVE' IN TYPEOF (SELF\surface_curve.associated_geometry[1])
	domain_rule(wr3) :- 
		::surface_curve(Curve),
		Curve::associated_geometry([Geometry| _]),
		Geometry::ancestor(pcurve), !.

	% rule wr4:'CONFIG_CONTROL_DESIGN.PCURVE' IN TYPEOF (SELF\surface_curve.associated_geometry[2])
	domain_rule(wr4) :- 
		::surface_curve(Curve),
		Curve::associated_geometry([_, Geometry| _]),
		Geometry::ancestor(pcurve), !.

:- end_object.


:- object(point_replica,
	instantiates(express_entity),
	specializes(point)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(parent_pt/1).
	:- mode(parent_pt(?point), one, explicit).

	:- public(transformation/1).
	:- mode(transformation(?cartesian_transformation_operator), one, explicit).

	domain_rules([wr1, wr2]).

	% rule wr1:transformation.dim = parent_pt.dim
	domain_rule(wr1) :-
		::transformation(Transformation), Transformation::dim(Dim),
		::parent_pt(Parent), Parent::dim(Dim).

	% rule wr2:acyclic_point_replica(SELF,parent_pt)
	domain_rule(wr2) :-
		self(Self),
		acyclic_point_replica::true(Self).

:- end_object.


:- object(brep_with_voids,
	instantiates(express_entity),
	specializes(manifold_solid_brep)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(voids/1).
	:- mode(voids(?express_set(oriented_closed_shell,1,unbounded)), one, explicit).

:- end_object.


:- object(configuration_effectivity,
	instantiates(express_entity),
	specializes(product_definition_effectivity)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(configuration/1).
	:- mode(configuration(?configuration_design), one, explicit).

	unique_rule(ur1, [configuration, usage, id]).

	domain_rules([wr1]).

	% rule	   wr1: ('CONFIG_CONTROL_DESIGN.PRODUCT_DEFINITION_USAGE' IN TYPEOF(
	%		  SELF\product_definition_effectivity.usage));
	domain_rule(wr1) :- 
		::usage(PDU),
		PDU::ancestor(product_definition_usage), !.

:- end_object.


:- object(surface_of_revolution,
	instantiates(express_entity),
	specializes(swept_surface)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(axis_position/1).
	:- mode(axis_position(?axis1_placement), one, explicit).

	:- public(axis_line/1).
	:- mode(axis_line(?line), one, derived).

	% derived axis_line:line := line(axis_position.location, vector (axis_position.z, 1.0))
	axis_line(line('', Location, vector('', Z, 1.0))) :-
		::axis_position(Position),
		Position::location(Location),
		Position::z(Z).

:- end_object.


:- object(point_on_curve,
	instantiates(express_entity),
	specializes(point)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(basis_curve/1).
	:- mode(basis_curve(?curve), one, explicit).

	:- public(point_parameter/1).
	:- mode(point_parameter(?parameter_value), one, explicit).

:- end_object.


:- object(composite_curve,
	instantiates(express_entity),
	specializes(bounded_curve)).

	:- public(segments/1).
	:- mode(segments(?express_list(composite_curve_segment,1,unbounded)), one, explicit).

	:- public(self_intersect/1).
	:- mode(self_intersect(?express_logical), one, explicit).

	:- public(n_segments/1).
	:- mode(n_segments(?integer), one, derived).

	:- public(closed_curve/1).
	:- mode(closed_curve(?express_logical), one, derived).

	domain_rules([wr1]).

	% derived n_segments:INTEGER := SIZEOF(segments)
	n_segments(Size) :-
		::segments(Segments),
		list::length(Segments, Size).

	% derived closed_curve:LOGICAL := segments[n_segments].transition <> discontinuous
	closed_curve(Value) :-
		::n_segments(N),
		::segments(Segments),
		list::nth1(N, Segments, Segment),
		(	Segment::transition(Transition) ->
			(	Transition == discontinuous ->
				Value = false
			;	Value = true
			)
		;	Value = unknown
		).

	% rule wr1:((NOT closed_curve) AND (SIZEOF (QUERY (temp <* segments | temp.transition = discontinuous)) = 1)) OR ((closed_curve) AND (SIZEOF (QUERY (temp <* segments | temp.transition = discontinuous)) = 0))
	domain_rule(wr1) :-
		(	::segments(Segments),
			findall(Temp, (list::member(Temp,Segments), Temp::transition(discontinuous)), DiscList),
			::closed_curve(false) ->
			DiscList = [_]
		;	(	::closed_curve(true) ->
				DiscList = []
			;	fail
			)
		).

:- end_object.


:- object(b_spline_curve,
	instantiates(express_entity),
	specializes(bounded_curve)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(degree/1).
	:- mode(degree(?integer), one, explicit).

	:- public(control_points_list/1).
	:- mode(control_points_list(?express_list(cartesian_point,2,unbounded)), one, explicit).

	:- public(curve_form/1).
	:- mode(curve_form(?b_spline_curve_form), one, explicit).

	:- public(closed_curve/1).
	:- mode(closed_curve(?express_logical), one, explicit).

	:- public(self_intersect/1).
	:- mode(self_intersect(?express_logical), one, explicit).

	:- public(upper_index_on_control_points/1).
	:- mode(upper_index_on_control_points(?integer), one, derived).

	:- public(control_points/1).
	:- mode(control_points(?express_array(cartesian_point,0,unbounded)), one, derived).

	domain_rules([wr1]).

	% derived upper_index_on_control_points:INTEGER := SIZEOF( control_points_list) - 1
	upper_index_on_control_points(Value) :-
		::control_points_list(CPList),
		list::length(CPList, N),
		Value is N - 1.

	% derived control_points:ARRAY [0: ?] OF cartesian_point := list_to_array( control_points_list,0, upper_index_on_control_points)
	control_points(CPArray) :-
		::control_points_list(CPList),
		upper_index_on_control_points(UpperIndex),
		list_to_array::eval(CPList, 0, UpperIndex, CPArray).

	% rule wr1:('CONFIG_CONTROL_DESIGN.UNIFORM_CURVE' IN TYPEOF(SELF)) OR ('CONFIG_CONTROL_DESIGN.QUASI_UNIFORM_CURVE' IN TYPEOF(SELF)) OR ('CONFIG_CONTROL_DESIGN.BEZIER_CURVE' IN TYPEOF(SELF)) OR ('CONFIG_CONTROL_DESIGN.B_SPLINE_CURVE_WITH_KNOTS' IN TYPEOF(SELF))
	domain_rule(wr1) :-
		(	::ancestor(uniform_curve)
		;	::ancestor(quasi_uniform_curve)
		;	::ancestor(bezier_curve)
		;	::ancestor(b_spline_curve_with_knots)
		), !.

:- end_object.


:- object(parabola,
	instantiates(express_entity),
	specializes(conic)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(focal_dist/1).
	:- mode(focal_dist(?length_measure), one, explicit).

	domain_rules([wr1]).

	% rule wr1:focal_dist <> 0
	domain_rule(wr1) :-
		::focal_dist(FD),
		FD =\= 0.

:- end_object.


:- object(cylindrical_surface,
	instantiates(express_entity),
	specializes(elementary_surface)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(radius/1).
	:- mode(radius(?positive_length_measure), one, explicit).

:- end_object.


:- object(assembly_component_usage,
	instantiates(express_entity),
	specializes(product_definition_usage)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(reference_designator/1).
	:- mode(reference_designator(?identifier), zero_or_one, explicit).

:- end_object.


:- object(quasi_uniform_curve,
	instantiates(express_entity),
	specializes(b_spline_curve)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

:- end_object.


:- object(promissory_usage_occurrence,
	instantiates(express_entity),
	specializes(assembly_component_usage)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

:- end_object.


:- object(point_on_surface,
	instantiates(express_entity),
	specializes(point)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(basis_surface/1).
	:- mode(basis_surface(?surface), one, explicit).

	:- public(point_parameter_u/1).
	:- mode(point_parameter_u(?parameter_value), one, explicit).

	:- public(point_parameter_v/1).
	:- mode(point_parameter_v(?parameter_value), one, explicit).

:- end_object.


:- object(polyline,
	instantiates(express_entity),
	specializes(bounded_curve)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(points/1).
	:- mode(points(?express_list(cartesian_point,2,unbounded)), one, explicit).

:- end_object.


:- object(spherical_surface,
	instantiates(express_entity),
	specializes(elementary_surface)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(radius/1).
	:- mode(radius(?positive_length_measure), one, explicit).

:- end_object.


:- object(oriented_open_shell,
	instantiates(express_entity),
	specializes(open_shell)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(open_shell_element/1).
	:- mode(open_shell_element(?open_shell), one, explicit).

	:- public(orientation/1).
	:- mode(orientation(?express_boolean), one, explicit).

	:- public(cfs_faces/1).
	:- mode(cfs_faces(?express_set(face,1,unbounded)), one, derived).

	domain_rules([wr1]).

	% derived cfs_faces:SET [1:?] OF face := conditional_reverse(SELF.orientation, SELF.open_shell_element.cfs_faces)
	cfs_faces(Faces) :-
		::orientation(Orientation),
		::open_shell_element(Element),
		Element::cfs_faces(List),
		conditional_reverse::eval(Orientation, List, Faces).

	% rule wr1:NOT ('CONFIG_CONTROL_DESIGN.ORIENTED_OPEN_SHELL' IN TYPEOF (SELF.open_shell_element))
	domain_rule(wr1) :-
		::open_shell_element(Element),
		\+ Element::ancestor(oriented_open_shell).

:- end_object.


:- object(toroidal_surface,
	instantiates(express_entity),
	specializes(elementary_surface)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(major_radius/1).
	:- mode(major_radius(?positive_length_measure), one, explicit).

	:- public(minor_radius/1).
	:- mode(minor_radius(?positive_length_measure), one, explicit).

:- end_object.


:- object(b_spline_curve_with_knots,
	instantiates(express_entity),
	specializes(b_spline_curve)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(knot_multiplicities/1).
	:- mode(knot_multiplicities(?express_list(integer,2,unbounded)), one, explicit).

	:- public(knots/1).
	:- mode(knots(?express_list(parameter_value,2,unbounded)), one, explicit).

	:- public(knot_spec/1).
	:- mode(knot_spec(?knot_type), one, explicit).

	:- public(upper_index_on_knots/1).
	:- mode(upper_index_on_knots(?integer), one, derived).

	domain_rules([wr1, wr2]).

	% derived upper_index_on_knots:INTEGER := SIZEOF(knots)
	upper_index_on_knots(Value) :-
		::knots(Knots),
		list::length(Knots, Value).

	% rule wr1:constraints_param_b_spline(degree,upper_index_on_knots, upper_index_on_control_points,knot_multiplicities,knots)
	domain_rule(wr1) :-
		::degree(Degree),
		::upper_index_on_knots(UIK),
		::upper_index_on_control_points(UICP),
		::knot_multiplicities(KM),
		::knots(Knots),
		constraints_param_b_spline::true(Degree, UIK, UICP, KM, Knots).
		
	% rule wr2:SIZEOF(knot_multiplicities) = upper_index_on_knots
	domain_rule(wr2) :-
		::upper_index_on_knots(N),
		::knot_multiplicities(Multiplicities),
		list::length(Multiplicities, N).

:- end_object.


:- object(faceted_brep,
	instantiates(express_entity),
	specializes(manifold_solid_brep)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

:- end_object.


:- object(advanced_face,
	instantiates(express_entity),
	specializes(face_surface)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	domain_rules([wr1, wr2, wr3, wr4, wr5, wr6, wr7, wr8, wr9, wr10]).

	% rule	   wr1 : (SIZEOF(['CONFIG_CONTROL_DESIGN.ELEMENTARY_SURFACE',
	%		   'CONFIG_CONTROL_DESIGN.B_SPLINE_SURFACE',
	%			'CONFIG_CONTROL_DESIGN.SWEPT_SURFACE'] * TYPEOF(
	%			face_geometry)) = 1);
	% the geometry (Surface) of this face is elementary, swept, or a b_spline
	domain_rule(wr1) :-
		::face_geometry(Surface),
		(	Surface::ancestor(elementary_surface)
		;	Surface::ancestor(b_spline_surface)
		;	Surface::ancestor(swept_surface)
		), !.

	% rule	   wr2 : (SIZEOF(QUERY ( elp_fbnds <* QUERY ( bnds <* bounds | (
	%			'CONFIG_CONTROL_DESIGN.EDGE_LOOP' IN TYPEOF(bnds.bound)) )
	%			 | (NOT (SIZEOF(QUERY ( oe <* elp_fbnds.bound\path.
	%			edge_list | (NOT ('CONFIG_CONTROL_DESIGN.EDGE_CURVE' IN
	%			TYPEOF(oe\oriented_edge.edge_element))) )) = 0)) )) = 0);
	% for any of the Bounds which are edge_loop, the edges in the loop are all edge_curve
	domain_rule(wr2) :-
		::bounds(Bounds),
		forall( (list::member(Boundary, Bounds),
				 Boundary::bound(BoundaryLoop),
				 BoundaryLoop::ancestor(edge_loop),				 
				 BoundaryLoop::edge_list(EdgeList),
				 list::member(OrientedEdge,EdgeList)),
				(OrientedEdge::edge_element(Edge), Edge::ancestor(edge_curve))).
				
	% rule	   wr3 : (SIZEOF(QUERY ( elp_fbnds <* QUERY ( bnds <* bounds | (
	%			'CONFIG_CONTROL_DESIGN.EDGE_LOOP' IN TYPEOF(bnds.bound)) )
	%			| (NOT (SIZEOF(QUERY ( oe <* elp_fbnds.bound\path.
	%		   edge_list | (NOT (SIZEOF(['CONFIG_CONTROL_DESIGN.LINE',
	%			'CONFIG_CONTROL_DESIGN.CONIC',
	%			'CONFIG_CONTROL_DESIGN.POLYLINE',
	%			'CONFIG_CONTROL_DESIGN.SURFACE_CURVE',
	%			'CONFIG_CONTROL_DESIGN.B_SPLINE_CURVE'] * TYPEOF(oe.
	%			edge_element\edge_curve.edge_geometry)) = 1)) )) = 0)) )) =
	%			 0);
	% for all edge_loop Bounds, the edge geometry are line, conic, polyline, pcurve, or b_spline_curve
	domain_rule(wr3) :-
		::bounds(Bounds),
		forall(
			(list::member(Boundary, Bounds),
			 Boundary::bound(BoundaryLoop),
			 BoundaryLoop::ancestor(edge_loop),	
			 BoundaryLoop::edge_list(EdgeList),
			 list::member(OrientedEdge, EdgeList),
			 OrientedEdge::edge_element(Edge),
			 Edge::edge_geometry(Curve)),
			(	Curve::ancestor(line)
			;	Curve::ancestor(conic)
			;	Curve::ancestor(polyline)
			;	Curve::ancestor(surface_curve)
			;	Curve::ancestor(b_spline_curve)
			)).
	
	% rule	   wr4 : (SIZEOF(QUERY ( elp_fbnds <* QUERY ( bnds <* bounds | (
	%			'CONFIG_CONTROL_DESIGN.EDGE_LOOP' IN TYPEOF(bnds.bound)) )
	%			 | (NOT (SIZEOF(QUERY ( oe <* elp_fbnds.bound\path.
	%			edge_list | (NOT (('CONFIG_CONTROL_DESIGN.VERTEX_POINT' IN
	%			TYPEOF(oe\edge.edge_start)) AND (
	%			'CONFIG_CONTROL_DESIGN.CARTESIAN_POINT' IN TYPEOF(oe\edge.
	%			edge_start\vertex_point.vertex_geometry)) AND (
	%			'CONFIG_CONTROL_DESIGN.VERTEX_POINT' IN TYPEOF(oe\edge.
	%			edge_end)) AND ('CONFIG_CONTROL_DESIGN.CARTESIAN_POINT' IN
	%			TYPEOF(oe\edge.edge_end\vertex_point.vertex_geometry)))) ))
	%			= 0)) )) = 0);
	% for all Bounds which are edge_loops, start and stop of the edges are vertex_point s
	domain_rule(wr4) :-
		::bounds(Bounds),
		forall( (list::member(Boundary, Bounds),
				 Boundary::bound(BoundaryLoop),
				 BoundaryLoop::ancestor(edge_loop),	
				 BoundaryLoop::edge_list(EdgeList),
				 list::member(OrientedEdge,EdgeList),
				 OrientedEdge::edge_element(Edge)), 
				(Edge::edge_start(P1),  P1::ancestor(vertex_point), P1::vertex_geometry(C1), C1::ancestor(cartesian_point),
				 Edge::edge_end(P2),	P2::ancestor(vertex_point), P2::vertex_geometry(C2), C2::ancestor(cartesian_point))).
				 
	% rule	   wr5 : (SIZEOF(QUERY ( elp_fbnds <* QUERY ( bnds <* bounds | (
	%			'CONFIG_CONTROL_DESIGN.EDGE_LOOP' IN TYPEOF(bnds.bound)) )
	%			 | ('CONFIG_CONTROL_DESIGN.ORIENTED_PATH' IN TYPEOF(
	%			elp_fbnds.bound)) )) = 0);
	% for every edge_loop in Bounds, the edge_loop is NOT an oriented_path
	domain_rule(wr5) :-
		::bounds(Bounds), 
		forall(
			(list::member(Boundary, Bounds), Boundary::bound(BoundaryLoop), BoundaryLoop::ancestor(edge_loop)),
			\+ BoundaryLoop::ancestor(oriented_path)).

	% rule	   wr6 : ((NOT ('CONFIG_CONTROL_DESIGN.SWEPT_SURFACE' IN TYPEOF(
	%			face_geometry))) OR (SIZEOF(['CONFIG_CONTROL_DESIGN.LINE',
	%			'CONFIG_CONTROL_DESIGN.CONIC',
	%			'CONFIG_CONTROL_DESIGN.POLYLINE',
	%			'CONFIG_CONTROL_DESIGN.B_SPLINE_CURVE'] * TYPEOF(
	%			face_geometry\swept_surface.swept_curve)) = 1));
	% if the face_geometry is a swept surface, then its swept curve is a line, conic, polyline, or bspline	
	domain_rule(wr6) :- 
		::face_geometry(Surface),
		(	Surface::ancestor(swept_surface) ->
			Surface::swept_curve(Curve),
			(	Curve::ancestor(line)
			;	Curve::ancestor(poly_line)
			;	Curve::ancestor(conic)
			;	Curve::ancestor(b_spline_curve)
			), !
		;	true
		).


	% rule	   wr7 : (SIZEOF(QUERY ( vlp_fbnds <* QUERY ( bnds <* bounds | (
	%			'CONFIG_CONTROL_DESIGN.VERTEX_LOOP'
	%			IN TYPEOF(bnds.bound)) )
	%			 | (NOT (('CONFIG_CONTROL_DESIGN.VERTEX_POINT' IN TYPEOF(
	%			vlp_fbnds\face_bound.bound\vertex_loop.loop_vertex)) AND (
	%			'CONFIG_CONTROL_DESIGN.CARTESIAN_POINT' IN TYPEOF(vlp_fbnds
	%			\face_bound.bound\vertex_loop.loop_vertex\vertex_point.
	%			vertex_geometry)))) )) = 0);
	% for any Boundary which is a vertex_loop, the vertex of that boundary is a vertex_point which references a cartesian_point
	domain_rule(wr7) :-
		::bounds(Bounds),
		forall( (list::member(Boundary, Bounds),
				 Boundary::bound(BoundaryLoop),
				 BoundaryLoop::ancestor(vertex_loop),
				 Boundary::loop_vertex(Vertex)),
				(Vertex::ancestor(vertex_point),
				 Vertex::vertex_geometry(Point),
				 Point::ancestor(cartesian_point))).

	% rule	   wr8 : (SIZEOF(QUERY ( bnd <* bounds | (NOT (SIZEOF([
	%			'CONFIG_CONTROL_DESIGN.EDGE_LOOP',
	%			'CONFIG_CONTROL_DESIGN.VERTEX_LOOP'] * TYPEOF(bnd.bound)) =
	%			 1)) )) = 0);
	% all of the bounds are edge_loop or vertex_loop
	domain_rule(wr8) :-
		::bounds(Bounds),
		forall(
			(list::member(Boundary, Bounds), Boundary::bound(BoundaryLoop)),
			(BoundaryLoop::ancestor(edge_loop); Boundary::ancestor(vertex_loop))).
			
	%	  wr9 : (SIZEOF(QUERY ( elp_fbnds <* QUERY ( bnds <* bounds | (
	%			'CONFIG_CONTROL_DESIGN.EDGE_LOOP' IN TYPEOF(bnds.bound)) )
	%			 | (NOT (SIZEOF(QUERY ( oe <* elp_fbnds.bound\path.
	%			edge_list | (('CONFIG_CONTROL_DESIGN.SURFACE_CURVE' IN
	%			TYPEOF(oe\oriented_edge.edge_element\edge_curve.
	%			edge_geometry)) AND (NOT (SIZEOF(QUERY ( sc_ag <* oe.
	%			edge_element\edge_curve.edge_geometry\surface_curve.
	%			associated_geometry | (NOT ('CONFIG_CONTROL_DESIGN.PCURVE'
	%			IN TYPEOF(sc_ag))) )) = 0))) )) = 0)) )) = 0);
	% For all bounds which are edge_loops:
	domain_rule(wr9) :-
		::bounds(Bounds),
		\+ (	list::member(Boundary, Bounds),
				Boundary::bound(BoundaryLoop),
				BoundaryLoop::ancestor(edge_loop),
				BoundaryLoop::edge_list(EdgeList),
				list::member(OrientedEdge, EdgeList),
				OrientedEdge::edge_element(Edge),
				Edge::edge_geometry(Curve),
				Curve::ancestor(surface_curve),
				Curve::associated_geometry(AssociatedGeometry),
				list::member(Scag,AssociatedGeometry),
				\+ Scag::ancestor(pcurve)
			).

	  %wr10: (((NOT ('CONFIG_CONTROL_DESIGN.SWEPT_SURFACE' IN TYPEOF(
	  %		  face_geometry))) OR (NOT ('CONFIG_CONTROL_DESIGN.POLYLINE'
	  %		  IN TYPEOF(face_geometry\swept_surface.swept_curve))) OR (
	  %		  SIZEOF(face_geometry\swept_surface.swept_curve\polyline.
	  %		  points) >= 3)) AND (SIZEOF(QUERY ( elp_fbnds <*
	  %		  QUERY ( bnds <* bounds | ('CONFIG_CONTROL_DESIGN.EDGE_LOOP'
	  %		  IN TYPEOF(bnds.bound)) ) | (NOT (SIZEOF(QUERY ( oe <*
	  %		  elp_fbnds.bound\path.edge_list | ((
	  %		  'CONFIG_CONTROL_DESIGN.POLYLINE' IN TYPEOF(oe\oriented_edge
	  %		  .edge_element\edge_curve.edge_geometry)) AND (NOT (SIZEOF(
	  %		  oe\oriented_edge.edge_element\edge_curve.edge_geometry\
	  %		  polyline.points) >= 3))) )) = 0)) )) = 0));
	domain_rule(wr10) :-
		(	::face_geometry(FaceGeometry),
			FaceGeometry::ancestor(swept_surface) ->
			(	FaceGeometry::swept_curve(SweptCurve),
				SweptCurve::ancestor(polyline) ->
				SweptCurve::points([_,_,_| _])
			;	true
			)
		;	true
		),
		::bounds(Bounds),
		\+ (	list::member(X, Bounds),
				X::bound(Bound),
				Bound::ancestor(edge_loop),
				Bound::edge_list(EdgeList),
				list::member(OrientedEdge, EdgeList),
				OrientedEdge::edge_element(Edge),
				Edge::edge_geometry(Curve),
				Curve::ancestor(polyline),
				\+ Curve::points([_,_,_|_])
			).
				

:- end_object.


:- object(axis2_placement_2d,
	instantiates(express_entity),
	specializes(placement)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(ref_direction/1).
	:- mode(ref_direction(?direction), zero_or_one, explicit).

	:- public(p/1).
	:- mode(p(?express_list(direction,2,2)), one, derived).

	domain_rules([wr1]).

	% derived p:LIST [2:2] OF direction := build_2axes(ref_direction)
	p(Directions) :- 
		::ref_direction(Direction),
		build_2axes::eval(Direction, Directions).

	% rule wr1:SELF\geometric_representation_item.dim = 2
	domain_rule(wr1) :-
		::dim(2).

:- end_object.


:- object(composite_curve_on_surface,
	instantiates(express_entity),
	specializes(composite_curve)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(basis_surface/1).
	:- mode(basis_surface(?express_set(surface,0,2)), one, derived).

	domain_rules([wr1, wr2]).

	% derived basis_surface:SET [0:2] OF surface := get_basis_surface(SELF)
	basis_surface(Surfaces) :-
		self(Self),
		get_basis_surface::eval(Self, Surfaces).

	% rule wr1:SIZEOF(basis_surface) > 0
	domain_rule(wr1) :-
		::basis_surface([_| _]).

	% rule wr2:constraints_composite_curve_on_surface(SELF)
	domain_rule(wr2) :-
		self(Self),
		constraints_composite_curve_on_surface::true(Self).

:- end_object.


:- object(evaluated_degenerate_pcurve,
	instantiates(express_entity),
	specializes(degenerate_pcurve)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(equivalent_point/1).
	:- mode(equivalent_point(?cartesian_point), one, explicit).

:- end_object.


:- object(axis1_placement,
	instantiates(express_entity),
	specializes(placement)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(axis/1).
	:- mode(axis(?direction), zero_or_one, explicit).

	:- public(z/1).
	:- mode(z(?direction), one, derived).

	domain_rules([wr1]).

	% derived z:direction := NVL(normalise(axis),direction([0,0,1]))
	z(Value) :-
		(	::axis(Axis) ->
			normalise::eval(Axis,Value)
		;	Value=direction('',[0.0, 0.0, 1.0])
		).

	% rule wr1:SELF\geometric_representation_item.dim = 3
	domain_rule(wr1) :-
		::dim(3).

:- end_object.


:- object(bezier_curve,
	instantiates(express_entity),
	specializes(b_spline_curve)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

:- end_object.


:- object(quantified_assembly_component_usage,
	instantiates(express_entity),
	specializes(assembly_component_usage)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(quantity/1).
	:- mode(quantity(?measure_with_unit), one, explicit).

:- end_object.


:- object(uniform_curve,
	instantiates(express_entity),
	specializes(b_spline_curve)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

:- end_object.


:- object(degenerate_toroidal_surface,
	instantiates(express_entity),
	specializes(toroidal_surface)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(select_outer/1).
	:- mode(select_outer(?express_boolean), one, explicit).

	domain_rules([wr1]).

	% rule wr1:(major_radius < minor_radius)
	domain_rule(wr1) :- 
		::major_radius(Maj),
		::minor_radius(Min),
		Maj < Min.

:- end_object.


:- object(boundary_curve,
	instantiates(express_entity),
	specializes(composite_curve_on_surface)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	domain_rules([wr1]).

	% rule wr1:SELF\composite_curve.closed_curve
	domain_rule(wr1) :-
		::composite_curve(Curve),
		Curve::closed_curve.

:- end_object.


:- object(rational_b_spline_curve,
	instantiates(express_entity),
	specializes(b_spline_curve)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(weights_data/1).
	:- mode(weights_data(?express_list(float,2,unbounded)), one, explicit).

	:- public(weights/1).
	:- mode(weights(?express_array(float,0,unbounded)), one, derived).

	domain_rules([wr1, wr2]).

	% derived weights:ARRAY [0:?] OF REAL := list_to_array(weights_data, 0, upper_index_on_control_points)
	weights(Weights) :-
		::weights_data(Data),
		::upper_index_on_control_points(Index),
		list_to_array::eval(Data, 0, Index, Weights).

	% rule wr1:SIZEOF(weights_data) = SIZEOF (SELF\b_spline_curve.control_points_list)
	domain_rule(wr1) :-
		::weights_data(Weights),
		::control_points_list(Points),
		list::same_length(Weights, Points).

	% rule wr2:curve_weights_positive (SELF)
	domain_rule(wr2) :-
		self(Self),
		curve_weights_positive::true(Self).

:- end_object.


:- object(next_assembly_usage_occurrence,
	instantiates(express_entity),
	specializes(assembly_component_usage)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

:- end_object.


:- object(specified_higher_usage_occurrence,
	instantiates(express_entity),
	specializes(assembly_component_usage)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(upper_usage/1).
	:- mode(upper_usage(?assembly_component_usage), one, explicit).

	:- public(next_usage/1).
	:- mode(next_usage(?next_assembly_usage_occurrence), one, explicit).

	unique_rule(ur1, [upper_usage, next_usage]).

	domain_rules([wr1, wr2, wr3, wr4, wr5]).

	% rule wr1:SELF :<>: upper_usage
	domain_rule(wr1) :-
		self(Self),
		\+ ::upper_usage(Self).

	% rule wr2:SELF\product_definition_relationship.relating_product_definition :=: upper_usage.relating_product_definition
	domain_rule(wr2) :-
		::relating_product_definition(Definition),
		::upper_usage(Upper),
		Upper::related_product_definition(Definition).

	% rule wr3:SELF\product_definition_relationship.related_product_definition :=: next_usage.related_product_definition
	domain_rule(wr3) :-
		::relating_product_definition(Definition),
		::next_usage(Next),
		Next::related_product_definition(Definition).

	% rule wr4:upper_usage.related_product_definition :=: next_usage.relating_product_definition
	domain_rule(wr4) :-
		::upper_usage(Upper),
		Upper::related_product_definition(Definition),
		::next_usage(Next),
		Next::related_product_definition(Definition).

	% rule wr5:NOT ('CONFIG_CONTROL_DESIGN.PROMISSORY_USAGE_OCCURRENCE' IN TYPEOF(upper_usage))
	domain_rule(wr5) :-
		::upper_usage(Usage),
		\+ Usage::ancestor(promissory_usage_occurrence).

:- end_object.


:- object(outer_boundary_curve,
	instantiates(express_entity),
	specializes(boundary_curve)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

:- end_object.
