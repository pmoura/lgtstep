
/*
RULE application_context_requires_ap_definition FOR
  (application_context, application_protocol_definition);
WHERE
  WR1: SIZEOF (QUERY (ac <* application_context |
	   NOT (SIZEOF (QUERY (apd <* application_protocol_definition |
	   (ac :=: apd.application)
	   AND
	   (apd.application_interpreted_model_schema_name =
	   'config_control_design'))) = 1 ))) = 0;
END_RULE; --application_context_requires_ap_definition
*/

:- object(application_context_requires_ap_definition,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([application_context, application_protocol_definition]).

	global_rules([wr1]).

	global_rule(wr1) :-
		\+ (	application_context::descendant_instance(Ac),
				\+ setof(
					Apd,
					(application_protocol_definition::descendant_instance(Apd), Apd::application(Ac),
					 Apd::application_interpreted_model_schema_name(config_control_design)),
					[_])
			).

:- end_object.

/*
RULE approval_date_time_constraints FOR (approval_date_time);
  WHERE
	wr1: (SIZEOF(QUERY ( adt <* approval_date_time | (NOT (SIZEOF(TYPEOF(
			 adt.date_time) * ['CONFIG_CONTROL_DESIGN.DATE_AND_TIME'])
			 = 1)) )) = 0);
END_RULE;
*/

:- object(approval_date_time_constraints,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([approval_date_time]).

	global_rules([wr1]).

	global_rule(wr1) :-
		\+ (	approval_date_time::descendant_instance(Adt),
				Adt::date_time(Dt),
				\+ Dt::ancestor(date_and_time)
			).

:- end_object.

/*
RULE approval_person_organization_constraints FOR (
			 approval_person_organization);
  WHERE
	wr1: (SIZEOF(QUERY ( apo <* approval_person_organization | (NOT (
			 SIZEOF(TYPEOF(apo.person_organization) * [
			 'CONFIG_CONTROL_DESIGN.PERSON_AND_ORGANIZATION'])
			 = 1)) )) = 0);
  END_RULE;
*/

:- object(approval_person_organization_constraints,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([approval_person_organization]).

	global_rules([wr1]).

	global_rule(wr1) :-
		\+ (	approval_person_organization::descendant_instance(Apo),
				Apo::person_organization(PersonOrganization),
				\+ PersonOrganization::ancestor(person_and_organization)
			).

:- end_object.


/*
RULE approval_requires_approval_date_time FOR (approval,
		 approval_date_time);
WHERE
  WR1: SIZEOF (QUERY ( app <* approval |
	   NOT (SIZEOF (QUERY (adt <* approval_date_time |
	   app :=: adt.dated_approval)) = 1))) = 0;
END_RULE; -- approval_requires_approval_date_time
*/

:- object(approval_requires_approval_date_time,
	extends(express_global_rule)).
	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([approval, approval_date_time]).

	global_rules([wr1]).

	global_rule(wr1) :-
		\+ (	approval::descendant_instance(App),
				\+ setof(
					Adt,
					(approval_date_time::descendant_instance(Adt), Adt::dated_approval(App)),
					[_])
			).

:- end_object.



/*
RULE approval_requires_approval_person_organization FOR (approval,
		 approval_person_organization);
WHERE
  WR1: SIZEOF (QUERY (app <* approval |
	   NOT (SIZEOF (QUERY (apo <* approval_person_organization |
	   app :=: apo.authorized_approval)) >= 1))) = 0;
END_RULE; -- approval_requires_approval_person_organization
*/

:- object(approval_requires_approval_person_organization,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([approval, approval_person_organization]).

	global_rules([wr1]).

	global_rule(wr1) :-
		\+ (	approval::descendant_instance(App),
				\+ setof(
					Apo,
					(approval_person_organization::descendant_instance(Apo), Apo::authorized_approval(App)),
					[_| _])
			).

:- end_object.


/*
RULE approvals_are_assigned FOR
  (approval, approval_assignment);
WHERE
  WR1: SIZEOF (QUERY (app <* approval |
	   NOT (SIZEOF (QUERY (aa <* approval_assignment |
	   app :=: aa.assigned_approval )) >= 1 ))) = 0;
END_RULE; -- approvals_are_assigned
*/

:- object(approvals_are_assigned,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([approval, approval_assignment]).

	global_rules([wr1]).

	global_rule(wr1) :-
		\+ (	approval::descendant_instance(App),
				\+ setof(
					Aa,
					(approval_assignment::descendant_instance(Aa), Aa::assigned_approval(App)),
					[_| _])
			).

:- end_object.


/*
RULE as_required_quantity FOR (measure_with_unit);
WHERE
  WR1: SIZEOF (QUERY (m <* measure_with_unit |
	   ('CONFIG_CONTROL_DESIGN.DESCRIPTIVE_MEASURE' IN
	   TYPEOF (m.value_component)) AND
	   (NOT (m.value_component = 'as_required')))) = 0;
END_RULE; -- as_required_quantity
*/

:- object(as_required_quantity,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([measure_with_unit]).

	global_rules([wr1]).

	global_rule(wr1) :-		% IS THIS CORRECT?!?
		\+ (	measure_with_unit::descendant_instance(M),
				M::value_component(typed_value(descriptive_measure, Vc)),
				Vc =\= as_required
			).

:- end_object.


/*
RULE certification_requires_approval FOR (certification,
  cc_design_approval);
WHERE
  WR1: SIZEOF (QUERY (cert <* certification |
	   NOT (SIZEOF (QUERY (ccda <* cc_design_approval |
	   cert IN ccda.items )) = 1 ))) = 0;
END_RULE; -- certification_requires_approval
*/

:- object(certification_requires_approval,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([certification, cc_design_approval]).

	global_rules([wr1]).
	
	global_rule(wr1) :-
		\+ (	certification::descendant_instance(Cert),
				\+ setof(
					Ccda,
					(cc_design_approval::descendant_instance(Ccda), Ccda::items(Items), list::member(Cert, Items)),
					[_])
			).

:- end_object.


/*
RULE certification_requires_date_time FOR
  (certification, cc_design_date_and_time_assignment);
WHERE
  WR1: SIZEOF (QUERY (cert <* certification |
	   NOT (SIZEOF (QUERY (ccdta <* cc_design_date_and_time_assignment |
	   cert IN ccdta.items )) = 1 ))) = 0;
END_RULE; -- certification_requires_date_time
*/

:- object(certification_requires_date_time,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([certification, cc_design_date_and_time_assignment]).

	global_rules([wr1]).
	
	global_rule(wr1) :-
		\+ (	certification::descendant_instance(Cert),
				\+ setof(
					Ccdta,
					(cc_design_date_and_time_assignment::descendant_instance(Ccdta), Ccdta::items(Items), list::member(Cert, Items)),
					[_])
			).

:- end_object.


/*
RULE change_request_requires_approval FOR
  (change_request, cc_design_approval);
WHERE
  WR1: SIZEOF (QUERY (cr <* change_request |
	   NOT (SIZEOF (QUERY (ccda <* cc_design_approval |
	   cr IN ccda.items )) = 1 ))) = 0;
END_RULE; -- change_request_requires_approval
*/

:- object(change_request_requires_approval,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([change_request, cc_design_approval]).

	global_rules([wr1]).
	
	global_rule(wr1) :-
		\+ (	change_request::descendant_instance(Cr),
				\+ setof(
					Ccda,
					(cc_design_approval::descendant_instance(Ccda), Ccda::items(Items), list::member(Cr, Items)),
					[_])
			).

:- end_object.


/*
RULE change_request_requires_date_time FOR
  (change_request, cc_design_date_and_time_assignment);
WHERE
  WR1: SIZEOF (QUERY (cr <* change_request |
	   NOT (SIZEOF (QUERY (ccdta <* cc_design_date_and_time_assignment |
	   cr IN ccdta.items )) = 1 ))) = 0;
END_RULE; -- change_request_requires_date_time
*/

:- object(change_request_requires_date_time,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([change_request, cc_design_date_and_time_assignment]).

	global_rules([wr1]).
	
	global_rule(wr1) :-
		\+ (	change_request::descendant_instance(Cr),
				\+ setof(
					Ccdta,
					(cc_design_date_and_time_assignment::descendant_instance(Ccdta), Ccdta::items(Items), list::member(Cr, Items)),
					[_])
			).

:- end_object.


/*
RULE change_request_requires_person_organization FOR
  (change_request,
  cc_design_person_and_organization_assignment);
WHERE
  WR1: SIZEOF (QUERY (cr <* change_request |
	   NOT (SIZEOF (QUERY (ccpoa <*
	   cc_design_person_and_organization_assignment |
	   cr IN ccpoa.items )) >= 1 ))) = 0;
END_RULE; -- change_request_requires_person_organization
*/

:- object(change_request_requires_person_organization,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([change_request, cc_design_person_and_organization_assignment]).

	global_rules([wr1]).
	
	global_rule(wr1) :-
		\+ (	change_request::descendant_instance(Cr),
				\+ setof(
					Ccpoa,
					(cc_design_person_and_organization_assignment::descendant_instance(Ccpoa), Ccpoa::items(Items), list::member(Cr, Items)),
					[_| _])
			).

:- end_object.


/*
RULE change_requires_approval FOR
  (change, cc_design_approval);
WHERE
  WR1: SIZEOF (QUERY (chg <* change |
	   NOT (SIZEOF (QUERY (ccda <* cc_design_approval |
	   chg IN ccda.items )) = 1 ))) = 0;
END_RULE; -- change_requires_approval
*/

:- object(change_requires_approval,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([change, cc_design_approval]).

	global_rules([wr1]).
	
	global_rule(wr1) :-
		\+ (	change::descendant_instance(Chg),
				\+ setof(
					Ccda,
					(cc_design_approval::descendant_instance(Ccda), Ccda::items(Items), list::member(Chg, Items)),
					[_])
			).

:- end_object.


/*
RULE change_requires_date_time FOR
  (change, cc_design_date_and_time_assignment);
WHERE
  WR1: SIZEOF (QUERY (chg <* change |
	   NOT (SIZEOF (QUERY (ccdta <* cc_design_date_and_time_assignment |
	   (chg IN ccdta.items)
	   AND (ccdta.role.name = 'start_date'))) = 1 ))) = 0;
END_RULE; -- change_requires_date_time
*/

:- object(change_requires_date_time,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([change, cc_design_date_and_time_assignment]).

	global_rules([wr1]).
	
	global_rule(wr1) :-
		\+ (	change::descendant_instance(Chg),
				\+ setof(
					Ccdta,
					(cc_design_date_and_time_assignment::descendant_instance(Ccdta),
					 Ccdta::items(Items), list::member(Chg, Items),
					 Ccdta::role(Role), Role::name(start_date)),
					[_])
			).

:- end_object.


/*
RULE compatible_dimension FOR (cartesian_point, direction,
		 representation_context, geometric_representation_context);
WHERE
WR1: SIZEOF (QUERY (x <* cartesian_point |
	 SIZEOF (QUERY (y <* geometric_representation_context |
	 (item_in_context(x,y)) AND (HIINDEX (x.coordinates) <>
	 y.coordinate_space_dimension))) >  0)) = 0;
WR2: SIZEOF (QUERY (x <* direction |
	 SIZEOF (QUERY (y <* geometric_representation_context |
	 (item_in_context(x,y)) AND (HIINDEX (x.direction_ratios) <>
	 y.coordinate_space_dimension))) > 0)) = 0;
END_RULE; -- compatible_dimension
*/

:- object(compatible_dimension,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([cartesian_point, direction, representation_context, geometric_representation_context]).

	global_rules([wr1,wr2]).

	

	global_rule(wr1) :-
	    \+ (cartesian_point::descendant_instance(Point),
	        geometric_representation_context::descendant_instance(Context),
	        item_in_context::true(Point, Context),
	        Point::coordinates(Coords),
	        list::length(Coords, Nd),
	        \+ Context::coordinate_space_dimension(Nd)).

	global_rule(wr2) :-
	    \+ (direction::descendant_instance(Direction),
	        geometric_representation_context::descendant_instance(Context),
	        item_in_context::true(Direction, Context),	        
	        Direction::direction_ratios(Ratios),
	        list::length(Ratios, Nd),
	        \+ Context::coordinate_space_dimension(Nd)).

:- end_object.


/*
RULE configuration_item_requires_approval FOR
  (configuration_item, cc_design_approval);
WHERE
  WR1: SIZEOF (QUERY (ci <* configuration_item |
	   NOT (SIZEOF (QUERY (ccda <* cc_design_approval |
	   ci IN ccda.items )) = 1 ))) = 0;
END_RULE; -- configuration_item_requires_approval
*/

:- object(configuration_item_requires_approval,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([configuration_item, cc_design_approval]).

	global_rules([wr1]).
	
	global_rule(wr1) :-
		\+ (	configuration_item::descendant_instance(Ci),
				\+ setof(
					Ccda,
					(cc_design_approval::descendant_instance(Ccda), Ccda::items(Items), list::member(Ci, Items)),
					[_])
			).

:- end_object.


/*
RULE configuration_item_requires_person_organization FOR
  (configuration_item,
  cc_design_person_and_organization_assignment);
WHERE
  WR1: SIZEOF (QUERY (ci <* configuration_item |
	   NOT (SIZEOF (QUERY (ccdpoa <*
	   cc_design_person_and_organization_assignment |
	   ci IN ccdpoa.items )) = 1 ))) = 0;
END_RULE; -- configuration_item_requires_person_organization
*/

:- object(configuration_item_requires_person_organization,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([configuration_item, cc_design_person_and_organization_assignment]).

	global_rules([wr1]).
	
	global_rule(wr1) :-
		\+ (	configuration_item::descendant_instance(Ci),
				\+ setof(
					Ccdpoa,
					(cc_design_person_and_organization_assignment::descendant_instance(Ccdpoa), Ccdpoa::items(Items), list::member(Ci, Items)),
					[_])
			).

:- end_object.


/*
RULE contract_requires_approval FOR (contract, cc_design_approval);
WHERE
  WR1: SIZEOF (QUERY (c <* contract |
	   NOT (SIZEOF (QUERY (ccda <* cc_design_approval |
	   c IN ccda.items )) = 1 ))) = 0;
END_RULE; -- contract_requires_approval
*/

:- object(contract_requires_approval,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([contract, cc_design_approval]).

	global_rules([wr1]).
	
	global_rule(wr1) :-
		\+ (	contract::descendant_instance(C),
				\+ setof(
					Ccda,
					(cc_design_approval::descendant_instance(Ccda), Ccda::items(Items), list::member(C, Items)),
					[_])
			).

:- end_object.


/*
RULE contract_requires_person_organization FOR
  (contract, cc_design_person_and_organization_assignment);
WHERE
  WR1: SIZEOF (QUERY (c <* contract |
	   NOT (SIZEOF (QUERY (ccdpoa <*
	   cc_design_person_and_organization_assignment |
	   c IN ccdpoa.items )) = 1 ))) = 0;
END_RULE; -- contract_requires_person_organization
*/

:- object(contract_requires_person_organization,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([contract, cc_design_person_and_organization_assignment]).

	global_rules([wr1]).
	
	global_rule(wr1) :-
		\+ (	contract::descendant_instance(C),
				\+ setof(
					Ccdpoa,
					(cc_design_person_and_organization_assignment::descendant_instance(Ccdpoa), Ccdpoa::items(Items), list::member(C, Items)),
					[_])
			).

:- end_object.


/*
RULE coordinated_assembly_and_shape FOR (next_assembly_usage_occurrence);
WHERE
  WR1: SIZEOF (QUERY (nauo <* next_assembly_usage_occurrence |
	   NOT assembly_shape_is_defined(nauo))) = 0;
END_RULE; -- coordinated_assembly_and_shape
*/

:- object(coordinated_assembly_and_shape,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([next_assembly_usage_occurrence]).

	global_rules([wr1]).
	
	global_rule(wr1) :-
		\+ (	next_assembly_usage_occurrence::descendant_instance(Nauo),
				\+ assembly_shape_is_defined::true(Nauo)
			).

:- end_object.


/*
RULE dependent_instantiable_action_directive FOR (action_directive);
WHERE
  WR1: SIZEOF (QUERY (ad <* action_directive |
	   NOT (SIZEOF (USEDIN (ad, '')) >= 1))) = 0;
END_RULE; -- dependent_instantiable_action_directive
*/

:- object(dependent_instantiable_action_directive,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([action_directive]).

	global_rules([]).

:- end_object.


/*
RULE dependent_instantiable_approval_status FOR (approval_status);
WHERE
WR1: SIZEOF (QUERY (ast <* approval_status |
	 NOT (SIZEOF (USEDIN (ast, '')) >= 1))) = 0;
END_RULE; -- dependent_instantiable_approval_status
*/

:- object(dependent_instantiable_approval_status,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([approval_status]).

	global_rules([]).

:- end_object.


/*
RULE dependent_instantiable_certification_type FOR (certification_type);
WHERE
  WR1: SIZEOF (QUERY (ct <* certification_type |
	   NOT (SIZEOF (USEDIN (ct, '')) >= 1))) = 0;
END_RULE; -- dependent_instantiable_certification_type
*/

:- object(dependent_instantiable_certification_type,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([certification_type]).

	global_rules([]).

:- end_object.


/*
RULE dependent_instantiable_contract_type FOR (contract_type);
WHERE
  WR1: SIZEOF(QUERY ( ct <* contract_type |
	   NOT (SIZEOF (USEDIN (ct, '')) >= 1))) = 0;
END_RULE; -- dependent_instantiable_contract_type
*/

:- object(dependent_instantiable_contract_type,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([contract_type]).

	global_rules([]).

:- end_object.


/*
RULE dependent_instantiable_date FOR (date);
WHERE
  WR1: SIZEOF (QUERY (dt <* date |
	   NOT (SIZEOF(USEDIN (dt, '')) >= 1))) = 0;
END_RULE; -- dependent_instantiable_date
*/

:- object(dependent_instantiable_date,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([date]).

	global_rules([]).

:- end_object.


/*
RULE dependent_instantiable_date_time_role FOR (date_time_role);
WHERE
  WR1: SIZEOF (QUERY (dtr <* date_time_role |
	   NOT (SIZEOF (USEDIN (dtr, '')) >= 1))) = 0;
END_RULE; -- dependent_instantiable_date_time_role
*/

:- object(dependent_instantiable_date_time_role,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([date_time_role]).

	global_rules([]).

:- end_object.


/*
RULE dependent_instantiable_document_type FOR (document_type);
WHERE
  WR1: SIZEOF (QUERY (dt <* document_type |
	   NOT (SIZEOF (USEDIN (dt, '')) >= 1))) = 0;
END_RULE; -- dependent_instantiable_document_type
*/

:- object(dependent_instantiable_document_type,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([document_type]).

	global_rules([]).

:- end_object.


/*
RULE dependent_instantiable_named_unit FOR (named_unit);
WHERE
  WR1: SIZEOF (QUERY (nu <* named_unit |
	   NOT (SIZEOF (USEDIN (nu, '')) >= 1))) = 0;
END_RULE; -- dependent_instantiable_named_unit
*/

:- object(dependent_instantiable_named_unit,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([named_unit]).

	global_rules([]).

:- end_object.


/*
RULE dependent_instantiable_person_and_organization_role FOR (
		 person_and_organization_role);
WHERE
  WR1: SIZEOF (QUERY (poar <* person_and_organization_role |
	   NOT (SIZEOF (USEDIN (poar, '')) >= 1))) = 0;
END_RULE; -- dependent_instantiable_person_and_organization_role
*/

:- object(dependent_instantiable_person_and_organization_role,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([person_and_organization_role]).

	global_rules([]).

:- end_object.


/*
RULE dependent_instantiable_representation_item FOR (representation_item);
WHERE
  WR1: SIZEOF (QUERY (ri <* representation_item |
	   NOT (SIZEOF (USEDIN (ri, '')) >= 1))) = 0;
END_RULE; -- dependent_instantiable_representation_item
*/

:- object(dependent_instantiable_representation_item,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([representation_item]).

	global_rules([]).

:- end_object.


/*
RULE dependent_instantiable_security_classification_level FOR (
		 security_classification_level);
WHERE
  WR1: SIZEOF (QUERY (scl <* security_classification_level |
	   NOT (SIZEOF (USEDIN (scl, '')) >= 1))) = 0;
END_RULE; -- dependent_instantiable_security_classification_level
*/

:- object(dependent_instantiable_security_classification_level,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([security_classification_level]).

	global_rules([]).

:- end_object.


/*
RULE dependent_instantiable_shape_representation FOR (
		 shape_representation);
WHERE
  WR1: SIZEOF (QUERY (sr <* shape_representation |
	   NOT (SIZEOF(USEDIN(sr, '')) >= 1))) = 0;
END_RULE; -- dependent_instantiable_shape_representation
*/

:- object(dependent_instantiable_shape_representation,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([shape_representation]).

	global_rules([]).

:- end_object.


/*
RULE design_context_for_property FOR (product_definition);
WHERE
  WR1: SIZEOF (QUERY (pd <* product_definition |
	   (SIZEOF (USEDIN (pd, 'CONFIG_CONTROL_DESIGN.' +
	   'PROPERTY_DEFINITION.DEFINITION') +
	   QUERY (pdr <* USEDIN (pd, 'CONFIG_CONTROL_DESIGN.' +
	   'PRODUCT_DEFINITION_RELATIONSHIP.RELATED_PRODUCT_DEFINITION') |
	   SIZEOF (USEDIN (pdr, 'CONFIG_CONTROL_DESIGN.PROPERTY_DEFINITION.' +
	   'DEFINITION')) >= 1)) >= 1) AND
	   (NOT ('CONFIG_CONTROL_DESIGN.DESIGN_CONTEXT' IN
	   TYPEOF (pd.frame_of_reference))))) = 0;
END_RULE; -- design_context_for_property
*/

:- object(design_context_for_property,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([product_definition]).

	global_rules([]).

:- end_object.


/*
RULE document_to_product_definition FOR
  (cc_design_specification_reference, product_definition);
WHERE
  WR1: SIZEOF (QUERY (sp <* cc_design_specification_reference |
	   NOT (((('CONFIG_CONTROL_DESIGN.DOCUMENT_RELATIONSHIP.' +
	   'RELATING_DOCUMENT' IN
	   ROLESOF (sp\document_reference.assigned_document)) AND
	   (SIZEOF (QUERY (it <* sp.items |
	   NOT('CONFIG_CONTROL_DESIGN.PRODUCT_DEFINITION' IN
	   TYPEOF (it)))) = 0)))
	   OR
	   (NOT ('CONFIG_CONTROL_DESIGN.DOCUMENT_RELATIONSHIP.' +
	   'RELATING_DOCUMENT' IN
	   ROLESOF (sp\document_reference.assigned_document)))))) = 0;
END_RULE; -- document_to_product_definition
*/

:- object(document_to_product_definition,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([cc_design_specification_reference, product_definition]).

	global_rules([]).

:- end_object.


/*
RULE effectivity_requires_approval FOR
  (effectivity, cc_design_approval);
WHERE
  WR1: SIZEOF (QUERY (eff <* effectivity |
	   NOT (SIZEOF (QUERY (ccda <* cc_design_approval |
	   eff IN ccda.items )) = 1 ))) = 0;
END_RULE; -- effectivity_requires_approval
*/

:- object(effectivity_requires_approval,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([effectivity, cc_design_approval]).

	global_rules([wr1]).
	
	global_rule(wr1) :-
		\+ (	effectivity::descendant_instance(Eff),
				\+ setof(
					Ccda,
					(cc_design_approval::descendant_instance(Ccda), Ccda::items(Items), list::member(Eff, Items)),
					[_])
			).

:- end_object.


/*
RULE geometric_representation_item_3d FOR
  (geometric_representation_item);
WHERE
  WR1: SIZEOF (QUERY (gri <* geometric_representation_item |
	   NOT ((dimension_of (gri) = 3) OR
	   (SIZEOF (bag_to_set (USEDIN (gri, '')) - bag_to_set (USEDIN (gri,
	   'CONFIG_CONTROL_DESIGN.DEFINITIONAL_REPRESENTATION.ITEMS'))) = 0)
	   ))) = 0;
END_RULE; -- geometric_representation_item_3d
*/

:- object(geometric_representation_item_3d,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([geometric_representation_item]).

	global_rules([]).

:- end_object.


/*
RULE dependent_instantiable_parametric_representation_context FOR
  (parametric_representation_context);
WHERE
  WR1: SIZEOF (QUERY (prc <* parametric_representation_context |
	   NOT (SIZEOF (USEDIN (prc, '')) >= 1))) = 0;
END_RULE;
*/

:- object(dependent_instantiable_parametric_representation_context,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([parametric_representation_context]).

	global_rules([]).

:- end_object.


/*
RULE global_unit_assignment FOR (global_unit_assigned_context);
WHERE
  WR1: SIZEOF (QUERY (guac <* global_unit_assigned_context |
	   NOT (SIZEOF (guac.units) = 3))) = 0;
  WR2: SIZEOF (QUERY (guac <* global_unit_assigned_context |
	   NOT ((SIZEOF (QUERY (u <* guac.units |
	   'CONFIG_CONTROL_DESIGN.LENGTH_UNIT' IN TYPEOF (u))) = 1) AND
	   (SIZEOF (QUERY (u <* guac.units |
	   'CONFIG_CONTROL_DESIGN.PLANE_ANGLE_UNIT' IN TYPEOF (u))) = 1) AND
	   (SIZEOF (QUERY (u <* guac.units |
	   'CONFIG_CONTROL_DESIGN.SOLID_ANGLE_UNIT' IN TYPEOF (u))) = 1
	   )))) = 0;
END_RULE; -- global_unit_assignment
*/

:- object(global_unit_assignment,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([global_unit_assigned_context]).

	global_rules([wr1, wr2]).

	global_rule(wr1) :-
		\+ (	global_unit_assigned_context::descendant_instance(Guac),
				\+ Guac::units([_, _, _])
			).

	global_rule(wr2) :-
		\+ (	global_unit_assigned_context::descendant_instance(Guac),
				Guac::units(Units),
				\+ (	setof(Unit, (list::member(Unit, Units), Unit::ancestor(length_unit)), [_]),
						setof(Unit, (list::member(Unit, Units), Unit::ancestor(plane_angle_unit)), [_]),
						setof(Unit, (list::member(Unit, Units), Unit::ancestor(solid_angle_unit)), [_])
					)
			).

:- end_object.


/*
RULE no_shape_for_make_from FOR
  (design_make_from_relationship);
WHERE
  WR1: SIZEOF (QUERY (dmfr <* design_make_from_relationship |
	   NOT (SIZEOF (QUERY (pd <* USEDIN (dmfr, 'CONFIG_CONTROL_DESIGN.' +
	   'PROPERTY_DEFINITION.DEFINITION') |
	   'CONFIG_CONTROL_DESIGN.PRODUCT_DEFINITION_SHAPE' IN TYPEOF (pd))) =
	   0))) = 0;
END_RULE; -- no_shape_for_make_from
*/

:- object(no_shape_for_make_from,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([design_make_from_relationship]).

	global_rules([]).

:- end_object.


/*
RULE no_shape_for_supplied_part FOR
  (supplied_part_relationship);
WHERE
  WR1: SIZEOF (QUERY (spr <* supplied_part_relationship |
	   NOT (SIZEOF (QUERY (pd <* USEDIN (spr, 'CONFIG_CONTROL_DESIGN.' +
	   'PROPERTY_DEFINITION.DEFINITION') |
	   'CONFIG_CONTROL_DESIGN.PRODUCT_DEFINITION_SHAPE' IN TYPEOF (pd))) =
	   0))) = 0;
END_RULE; -- no_shape_for_supplied_part
*/

:- object(no_shape_for_supplied_part,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([supplied_part_relationship]).

	global_rules([]).

:- end_object.


/*
RULE acu_requires_security_classification FOR
  (assembly_component_usage,
   cc_design_security_classification);
WHERE
  WR1: SIZEOF (QUERY (acu <* assembly_component_usage |
	   NOT (SIZEOF (QUERY (ccdsc <* cc_design_security_classification |
	   acu IN ccdsc.items )) = 1 ))) = 0;
END_RULE; -- acu_requires_security_classification
*/

:- object(acu_requires_security_classification,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([assembly_component_usage, cc_design_security_classification]).

	global_rules([wr1]).
	
	global_rule(wr1) :-
		\+ (	assembly_component_usage::descendant_instance(Acu),
				\+ setof(
					Ccdsc,
					(cc_design_security_classification::descendant_instance(Ccdsc), Ccdsc::items(Items), list::member(Acu, Items)),
					[_])
			).

:- end_object.


/*
RULE product_concept_requires_configuration_item FOR
  (product_concept, configuration_item);
WHERE
  WR1: SIZEOF (QUERY (pc <* product_concept |
	   NOT (SIZEOF (QUERY (ci <* configuration_item |
	   pc :=: ci.item_concept)) >=1 ))) = 0;
END_RULE; -- product_concept_requires_configuration_item
*/

:- object(product_concept_requires_configuration_item,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([product_concept, configuration_item]).

	global_rules([wr1]).

	global_rule(wr1) :-
		\+ (	product_concept::descendant_instance(Pc),
				\+ setof(
					Ci,
					(configuration_item::descendant_instance(Ci), Ci::item_concept(Pc)),
					[_| _])
			).

:- end_object.


/*
RULE product_definition_requires_approval FOR
  (product_definition, cc_design_approval);
WHERE
  WR1: SIZEOF (QUERY (pd <* product_definition |
	   NOT (SIZEOF (QUERY (ccda <* cc_design_approval |
	   pd IN ccda.items )) = 1 ))) = 0;
END_RULE; -- product_definition_requires_approval
*/

:- object(product_definition_requires_approval,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([product_definition, cc_design_approval]).

	global_rules([wr1]).
	
	% every product_definition instance is included in the 
	% items list of one (and only one) cc_design_approval instance
	global_rule(wr1) :-
		\+ (	product_definition::descendant_instance(Pd),
				\+ setof(
					Ccda,
					(cc_design_approval::descendant_instance(Ccda), Ccda::items(Items), list::member(Pd, Items)),
					[_])
			).

:- end_object.



/*
RULE product_definition_requires_date_time FOR
  (product_definition, cc_design_date_and_time_assignment);
WHERE
  WR1: SIZEOF (QUERY (pd <* product_definition |
	   NOT (SIZEOF (QUERY (ccdta <* cc_design_date_and_time_assignment |
	   pd IN ccdta.items )) = 1 ))) = 0;
END_RULE; -- product_definition_requires_date_time
*/

:- object(product_definition_requires_date_time,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([product_definition, cc_design_date_and_time_assignment]).

	global_rules([wr1]).
	
	global_rule(wr1) :-
		\+ (	product_definition::descendant_instance(Pd),
				\+ setof(
					Ccdta,
					(cc_design_date_and_time_assignment::descendant_instance(Ccdta), Ccdta::items(Items), list::member(Pd, Items)),
					[_])
			).

:- end_object.


/*
RULE product_definition_requires_person_organization FOR
  (product_definition,
  cc_design_person_and_organization_assignment);
WHERE
  WR1: SIZEOF (QUERY (pd <* product_definition |
	   NOT (SIZEOF (QUERY (ccdpoa <*
	   cc_design_person_and_organization_assignment |
	   pd IN ccdpoa.items )) = 1 ))) = 0;
END_RULE; -- product_definition_requires_person_organization
*/

:- object(product_definition_requires_person_organization,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([product_definition, cc_design_person_and_organization_assignment]).

	global_rules([wr1]).
	
	global_rule(wr1) :-
		\+ (	product_definition::descendant_instance(Pd),
				\+ setof(
					Ccdpoa,
					(cc_design_person_and_organization_assignment::descendant_instance(Ccdpoa), Ccdpoa::items(Items), list::member(Pd, Items)),
					[_])
			).

:- end_object.


/*
RULE product_requires_person_organization FOR
  (product, cc_design_person_and_organization_assignment);
WHERE
  WR1: SIZEOF (QUERY (prod <* product |
	   NOT (SIZEOF (QUERY (ccdpoa <*
	   cc_design_person_and_organization_assignment |
	   prod IN ccdpoa.items )) = 1 ))) = 0;
END_RULE; -- product_requires_person_organization
*/

:- object(product_requires_person_organization,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([product, cc_design_person_and_organization_assignment]).

	global_rules([wr1]).
	
	global_rule(wr1) :-
		\+ (	product::descendant_instance(Prod),
				\+ setof(
					Ccdpoa,
					(cc_design_person_and_organization_assignment::descendant_instance(Ccdpoa), Ccdpoa::items(Items), list::member(Prod, Items)),
					[_])
			).

:- end_object.


/*
RULE product_requires_product_category FOR
  (product, product_related_product_category);
WHERE
  WR1: SIZEOF (QUERY (prod <* product |
	   NOT (SIZEOF (QUERY (prpc <* product_related_product_category |
	   (prod IN prpc.products) AND
	   (prpc.name IN ['assembly', 'inseparable_assembly', 'detail',
	   'customer_furnished_equipment']))) = 1))) = 0;
END_RULE; -- product_requires_product_category
*/

:- object(product_requires_product_category,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([product, product_related_product_category]).

	global_rules([wr1]).

	global_rule(wr1) :-
		\+ (	product::descendant_instance(Prod),
				\+ setof(
					Prpc,
					(product_related_product_category::descendant_instance(Prpc),
					 Prpc::products(Products), list::member(Prod, Products),
					 Prpc::name(Name), list::member(Name, [assembly, inseparable_assembly, detail, customer_furnished_equipment])
					),
					[_])
			).

:- end_object.


/*
RULE product_requires_version FOR (product, product_definition_formation);
WHERE
  WR1: SIZEOF (QUERY (prod <* product |
	   NOT (SIZEOF (QUERY (pdf <* product_definition_formation |
	   prod :=: pdf.of_product )) >= 1 ))) = 0;
END_RULE; -- product_requires_version
*/

:- object(product_requires_version,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([product, product_definition_formation]).

	global_rules([wr1]).

	global_rule(wr1) :-
		\+ (	product::descendant_instance(Prod),
				\+ setof(
					Pdf,
					(product_definition_formation::descendant_instance(Pdf), Pdf::of_product(Prod)),
					[_| _])
			).

:- end_object.


/*
RULE product_version_requires_approval FOR  (product_definition_formation,
  cc_design_approval);
WHERE
  WR1: SIZEOF (QUERY (pdf <* product_definition_formation |
	   NOT (SIZEOF (QUERY (ccda <* cc_design_approval |
	   pdf IN ccda.items )) = 1 ))) = 0;
END_RULE; -- product_version_requires_approval
*/

:- object(product_version_requires_approval,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([product_definition_formation, cc_design_approval]).

	global_rules([wr1]).
	
	global_rule(wr1) :-
		\+ (	product_definition_formation::descendant_instance(Pdf),
				\+ setof(
					Ccda,
					(cc_design_approval::descendant_instance(Ccda), Ccda::items(Items), list::member(Pdf, Items)),
					[_])
			).

:- end_object.


/*
RULE product_version_requires_person_organization FOR
  (product_definition_formation,
  cc_design_person_and_organization_assignment);
WHERE
  WR1: SIZEOF (QUERY (pdf <* product_definition_formation |
	   NOT (SIZEOF (QUERY (ccdpoa <*
	   cc_design_person_and_organization_assignment |
	   (pdf IN ccdpoa.items) AND (ccdpoa.role.name = 'creator'))) = 1 ))) = 0;
  WR2: SIZEOF (QUERY (pdf <* product_definition_formation |
	   NOT (SIZEOF (QUERY (ccdpoa <*
	   cc_design_person_and_organization_assignment |
	   (pdf IN ccdpoa.items) AND
	   (ccdpoa.role.name IN ['design_supplier', 'part_supplier']))) >= 1)))
	   = 0;
END_RULE; -- product_version_requires_person_organization
*/

:- object(product_version_requires_person_organization,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([product_definition_formation, cc_design_person_and_organization_assignment]).

	global_rules([wr1, wr2]).
	
	global_rule(wr1) :-
		\+ (	product_definition_formation::descendant_instance(Pdf),
				\+ setof(
					Ccdpoa,
					(cc_design_person_and_organization_assignment::descendant_instance(Ccdpoa),
					 Ccdpoa::items(Items), list::member(Pdf, Items),
					 Ccdpoa::role(Role), Role::name(creator)
					),
					[_])
			).

	global_rule(wr2) :-
		\+ (	product_definition_formation::descendant_instance(Pdf),
				\+ setof(
					Ccdpoa,
					(cc_design_person_and_organization_assignment::descendant_instance(Ccdpoa),
					 Ccdpoa::items(Items), list::member(Pdf, Items),
					 Ccdpoa::role(Role), Role::name(Name), list::member(Name, [design_supplier, part_supplier])
					),
					[_| _])
			).

:- end_object.


/*
RULE product_version_requires_security_classification FOR
  (product_definition_formation, cc_design_security_classification);
WHERE
  WR1: SIZEOF (QUERY (pdf <* product_definition_formation |
	   NOT (SIZEOF (QUERY (ccdsc <* cc_design_security_classification |
	   pdf IN ccdsc.items )) = 1 ))) = 0;
END_RULE; -- product_version_requires_security_classification
*/

:- object(product_version_requires_security_classification,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([product_definition_formation, cc_design_security_classification]).

	global_rules([wr1]).
	
	global_rule(wr1) :-
		\+ (	product_definition_formation::descendant_instance(Pdf),
				\+ setof(
					Ccdsc,
					(cc_design_security_classification::descendant_instance(Ccdsc), Ccdsc::items(Items), list::member(Pdf, Items)),
					[_])
			).

:- end_object.


/*
RULE restrict_action_request_status FOR (action_request_status);
WHERE
  WR1: SIZEOF (QUERY (ars <* action_request_status |
	   NOT (ars.status IN
	   ['proposed', 'in_work', 'issued', 'hold']))) = 0;
END_RULE; -- restrict_action_request_status
*/

:- object(restrict_action_request_status,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([action_request_status]).

	global_rules([wr1]).

	global_rule(wr1) :-
		\+ (	action_request_status::descendant_instance(ActionRequestStatus),
				ActionRequestStatus::status(Status),
				\+ list::member(Status, [proposed, in_work, issued, hold])
			).

:- end_object.


/*
RULE restrict_approval_status FOR (approval_status);
  WHERE
	wr1: (SIZEOF(QUERY ( ast <* approval_status | (NOT (ast.name IN [
			 'approved','not_yet_approved','disapproved','withdrawn'])) ))
			 = 0);
END_RULE;
*/
:- object(restrict_approval_status,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([approval_status]).

	global_rules([wr1]).

	global_rule(wr1) :-
		\+ (	approval_status::descendant_instance(Ast),
				Ast::name(Name),
				\+ list::member(Name, [approved, not_yet_approved, disapproved, withdrawn])
			).

:- end_object.


/*
RULE restrict_certification_type FOR (certification_type);
WHERE
  WR1: SIZEOF (QUERY (ct <* certification_type |
	   NOT (ct.description IN
	   ['design_supplier', 'part_supplier']))) = 0;
END_RULE; -- restrict_certification_type
*/

:- object(restrict_certification_type,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([certification_type]).

	global_rules([wr1]).

	global_rule(wr1) :-
		\+ (	certification_type::descendant_instance(Ct),
				Ct::description(Description),
				\+ list::member(Description, [design_supplier, part_supplier])
			).

:- end_object.


/*
RULE restrict_contract_type FOR (contract_type);
WHERE
  WR1: SIZEOF (QUERY (ct <* contract_type |
	   NOT (ct.description IN ['fixed_price', 'cost_plus']))) = 0;
END_RULE; -- restrict_contract_type
*/

:- object(restrict_contract_type,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([contract_type]).

	global_rules([wr1]).

	global_rule(wr1) :-
		\+ (	contract_type::descendant_instance(ContractType),
				ContractType::description(Description),
				\+ list::member(Description, [fixed_price, cost_plus])
			).

:- end_object.


/*
RULE restrict_date_time_role FOR (date_time_role);
WHERE
  WR1: SIZEOF (QUERY (dtr <* date_time_role |
	   NOT (dtr.name IN ['creation_date', 'request_date', 'release_date',
	   'start_date', 'contract_date', 'certification_date', 'sign_off_date',
	   'classification_date', 'declassification_date']))) = 0;
END_RULE; -- restrict_date_time_role
*/

:- object(restrict_date_time_role,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([date_time_role]).

	global_rules([wr1]).

	global_rule(wr1) :-
		\+ (	date_time_role::descendant_instance(Dtr),
				Dtr::name(Name),
				\+ list::member(Name, [creation_date, request_date, release_date, start_date, contract_date, certification_date, sign_off_date, classification_date, declassification_date])
			).

:- end_object.


/*
RULE restrict_document_type FOR (document_type);
WHERE
  WR1: SIZEOF (QUERY (dt <* document_type |
	   NOT (dt.product_data_type IN
	   ['material_specification', 'process_specification',
	   'design_specification', 'surface_finish_specification',
	   'cad_filename', 'drawing']))) = 0;
END_RULE; -- restrict_document_type
*/

:- object(restrict_document_type,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([document_type]).

	global_rules([wr1]).

	global_rule(wr1) :-
		\+ (	document_type::descendant_instance(Dt),
				Dt::product_data_type(Type),
				\+ list::member(Type, [material_specification, process_specification, design_specification, surface_finish_specification, cad_filename, drawing])
			).

:- end_object.


/*
RULE restrict_person_organization_role FOR (person_and_organization_role);
WHERE
  WR1: SIZEOF (QUERY (por <* person_and_organization_role |
	   NOT (por.name IN ['request_recipient', 'initiator', 'part_supplier',
	   'design_supplier', 'configuration_manager', 'contractor',
	   'classification_officer', 'creator', 'design_owner']))) = 0;
END_RULE; -- restrict_person_organization_role
*/

:- object(restrict_person_organization_role,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([person_and_organization_role]).

	global_rules([wr1]).

	global_rule(wr1) :-
		\+ (	person_and_organization_role::descendant_instance(Por),
				Por::name(Name),
				\+ list::member(Name, [request_recipient, initiator, part_supplier, design_supplier, configuration_manager, contractor, classification_officer, creator, design_owner])
			).

:- end_object.


/*
RULE restrict_product_category_value FOR (product_related_product_category);
WHERE
  WR1: SIZEOF (QUERY (prpc <* product_related_product_category |
	   NOT (prpc.name IN ['assembly', 'detail', 
	   'customer_furnished_equipment', 'inseparable_assembly', 'cast',
	   'coined', 'drawn', 'extruded', 'forged', 'formed', 'machined',
	   'molded', 'rolled', 'sheared'])))
	   = 0;
END_RULE; -- restrict_product_category_value
*/

:- object(restrict_product_category_value,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([product_related_product_category]).

	global_rules([wr1]).

	global_rule(wr1) :-
		\+ (	product_related_product_category::descendant_instance(Prpc),
				Prpc::name(Name),
				\+ list::member(Name, [assembly, detail, customer_furnished_equipment, inseparable_assembly, cast, coined, drawn, extruded, forged, formed, machined, molded, rolled, sheared])
			).

:- end_object.


/*
RULE restrict_security_classification_level FOR
  (security_classification_level);
WHERE
  WR1: SIZEOF (QUERY (scl <* security_classification_level |
	   NOT (scl.name IN ['unclassified', 'classified', 'proprietary',
	   'confidential', 'secret', 'top_secret']))) = 0;
END_RULE; -- restrict_security_classification_level
*/

:- object(restrict_security_classification_level,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([security_classification_level]).

	global_rules([wr1]).

	global_rule(wr1) :-
		\+ (	security_classification_level::descendant_instance(Scl),
				Scl::name(Name),
				\+ list::member(Name, [unclassified, classified, proprietary, confidential, secret, top_secret])
			).

:- end_object.


/*
RULE security_classification_optional_date_time FOR
  (security_classification, cc_design_date_and_time_assignment);
WHERE
  WR1: SIZEOF (QUERY (sc <* security_classification |
	   NOT (SIZEOF (QUERY (ccdta <* cc_design_date_and_time_assignment |
	   (sc IN ccdta.items) AND
	   ('declassification_date' = ccdta.role.name))) <= 1 ))) = 0;
END_RULE; -- security_classification_optional_date_time
*/

:- object(security_classification_optional_date_time,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([security_classification, cc_design_date_and_time_assignment]).

	global_rules([wr1]).
	
	global_rule(wr1) :-
		\+ (	security_classification::descendant_instance(Sc),
				setof(
					Ccdta,
					(cc_design_date_and_time_assignment::descendant_instance(Ccdta),
					 Ccdta::items(Items), list::member(Sc, Items),
					 Ccdta::role(Role), Role::name(declassification_date)
					),
					[_, _| _])
			).

:- end_object.


/*
RULE security_classification_requires_approval FOR
  (security_classification, cc_design_approval);
WHERE
  WR1: SIZEOF (QUERY (sc <* security_classification |
	   NOT (SIZEOF (QUERY (ccda <* cc_design_approval |
	   sc IN ccda.items )) = 1 ))) = 0;
END_RULE; -- security_classification_requires_approval
*/

:- object(security_classification_requires_approval,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([security_classification, cc_design_approval]).

	global_rules([wr1]).
	
	global_rule(wr1) :-
		\+ (	security_classification::descendant_instance(Sc),
				\+ setof(
					Ccda,
					(cc_design_approval::descendant_instance(Ccda), Ccda::items(Items), list::member(Sc, Items)),
					[_])
			).

:- end_object.


/*
RULE security_classification_requires_date_time FOR
  (security_classification, cc_design_date_and_time_assignment);
WHERE
  WR1: SIZEOF (QUERY (sc <* security_classification |
	   NOT (SIZEOF (QUERY (ccdta <* cc_design_date_and_time_assignment |
	   (sc IN ccdta.items) AND
	   ('classification_date' = ccdta.role.name))) = 1 ))) = 0;
END_RULE; -- security_classification_requires_date_time
*/


:- object(security_classification_requires_date_time,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([security_classification, cc_design_date_and_time_assignment]).

	global_rules([wr1]).
	
	global_rule(wr1) :-
		\+ (	security_classification::descendant_instance(Sc),
				\+ setof(
					Ccdta,
					(cc_design_date_and_time_assignment::descendant_instance(Ccdta),
					 Ccdta::items(Items), list::member(Sc, Items),
					 Ccdta::role(Role), Role::name(classification_date)),
					[_])
			).

:- end_object.


/*
RULE security_classification_requires_person_organization FOR
  (security_classification,
  cc_design_person_and_organization_assignment);
WHERE
  WR1: SIZEOF (QUERY (sc <* security_classification |
	   NOT (SIZEOF (QUERY (ccdpoa <*
	   cc_design_person_and_organization_assignment |
	   sc IN ccdpoa.items )) = 1 ))) = 0;
END_RULE; -- security_classification_requires_person_organization
*/

:- object(security_classification_requires_person_organization,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([security_classification, cc_design_person_and_organization_assignment]).

	global_rules([wr1]).
	
	global_rule(wr1) :-
		\+ (	start_request::descendant_instance(Sc),
				\+ setof(
					Ccdpoa,
					(cc_design_person_and_organization_assignment::descendant_instance(Ccdpoa), Ccdpoa::items(Items), list::member(Sc, Items)),
					[_])
			).

:- end_object.


/*
RULE start_request_requires_approval FOR
  (start_request, cc_design_approval);
WHERE
  WR1: SIZEOF (QUERY (sr <* start_request |
	   NOT (SIZEOF (QUERY (ccda <* cc_design_approval |
	   sr IN ccda.items )) = 1 ))) = 0;
END_RULE; -- start_request_requires_approval
*/

:- object(start_request_requires_approval,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([start_request, cc_design_approval]).

	global_rules([wr1]).
	
	global_rule(wr1) :-
		\+ (	start_request::descendant_instance(Sr),
				\+ setof(
					Ccda,
					(cc_design_approval::descendant_instance(Ccda), Ccda::items(Items), list::member(Sr, Items)),
					[_])
			).

:- end_object.


/*
RULE start_request_requires_date_time FOR
  (start_request, cc_design_date_and_time_assignment);
WHERE
  WR1: SIZEOF (QUERY (sr <* start_request |
	   NOT (SIZEOF (QUERY (ccdta <* cc_design_date_and_time_assignment |
	   sr IN ccdta.items )) = 1 ))) = 0;
END_RULE; -- start_request_requires_date_time
*/

:- object(start_request_requires_date_time,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([start_request, cc_design_date_and_time_assignment]).

	global_rules([wr1]).
	
	global_rule(wr1) :-
		\+ (	start_request::descendant_instance(Sr),
				\+ setof(
					Ccdta,
					(cc_design_date_and_time_assignment::descendant_instance(Ccdta), Ccdta::items(Items), list::member(Sr, Items)),
					[_])
			).

:- end_object.


/*
RULE start_request_requires_person_organization FOR (start_request,
  cc_design_person_and_organization_assignment);
WHERE
  WR1: SIZEOF (QUERY (sr <* start_request |
	   NOT (SIZEOF (QUERY (ccdpoa <*
	   cc_design_person_and_organization_assignment |
	   sr IN ccdpoa.items )) >= 1 ))) = 0;
END_RULE; -- start_request_requires_person_organization
*/

:- object(start_request_requires_person_organization,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([start_request, cc_design_person_and_organization_assignment]).

	global_rules([wr1]).
	
	global_rule(wr1) :-
		\+ (	start_request::descendant_instance(Sr),
				\+ setof(
					Ccdpoa,
					(cc_design_person_and_organization_assignment::descendant_instance(Ccdpoa), Ccdpoa::items(Items), list::member(Sr, Items)),
					[_| _])
			).

:- end_object.


/*
RULE start_work_requires_approval FOR
  (start_work, cc_design_approval);
WHERE
  WR1: SIZEOF (QUERY (sw <* start_work |
	   NOT (SIZEOF (QUERY (ccda <* cc_design_approval |
	   sw IN ccda.items )) = 1 ))) = 0;
END_RULE; -- start_work_requires_approval
*/

:- object(start_work_requires_approval,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([start_work, cc_design_approval]).

	global_rules([wr1]).
	
	global_rule(wr1) :-
		\+ (	start_work::descendant_instance(Sw),
				\+ setof(
					Ccda,
					(cc_design_approval::descendant_instance(Ccda), Ccda::items(Items), list::member(Sw, Items)),
					[_| _])
			).

:- end_object.


/*
RULE start_work_requires_date_time FOR
  (start_work, cc_design_date_and_time_assignment);
WHERE
  WR1: SIZEOF (QUERY (sw <* start_work |
	   NOT (SIZEOF (QUERY (ccdta <* cc_design_date_and_time_assignment |
	   (sw IN ccdta.items) 
	   AND (ccdta.role.name = 'start_date'))) = 1 ))) = 0;
END_RULE; -- start_work_requires_date_time
*/

:- object(start_work_requires_date_time,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([start_work, cc_design_date_and_time_assignment]).

	global_rules([wr1]).
	
	global_rule(wr1) :-
		\+ (	start_work::descendant_instance(Sw),
				\+ setof(
					Ccdta,
					(cc_design_date_and_time_assignment::descendant_instance(Ccdta),
					 Ccdta::items(Items), list::member(Sw, Items),
					 Ccdta::role(Role), Role::name(start_date)),
					[_])
			).

:- end_object.


/*
RULE subtype_mandatory_action FOR (action);
WHERE
  WR1: SIZEOF (QUERY (act <* action |
	   NOT ('CONFIG_CONTROL_DESIGN.DIRECTED_ACTION' IN TYPEOF(act)))) = 0;
END_RULE; -- subtype_mandatory_action
*/

:- object(subtype_mandatory_action,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([action]).

	global_rules([wr1]).

	global_rule(wr1) :-
		\+ (	action::descendant_instance(Act),
				\+ Act::ancestor(directed_action)
			).

:- end_object.


/*
RULE subtype_mandatory_effectivity FOR
  (effectivity);
WHERE
  WR1: SIZEOF (QUERY (eff <* effectivity |
	   NOT ((SIZEOF (['CONFIG_CONTROL_DESIGN.SERIAL_NUMBERED_EFFECTIVITY',
	   'CONFIG_CONTROL_DESIGN.LOT_EFFECTIVITY',
	   'CONFIG_CONTROL_DESIGN.DATED_EFFECTIVITY'] *
	   TYPEOF (eff)) = 1) AND
	   ('CONFIG_CONTROL_DESIGN.CONFIGURATION_EFFECTIVITY' IN TYPEOF(eff)))))
	   = 0;
END_RULE; -- subtype_mandatory_effectivity
*/

:- object(subtype_mandatory_effectivity,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([effectivity]).

	global_rules([wr1]).

	global_rule(wr1) :-
		\+ (	effectivity::descendant_instance(Eff),
				\+ (	Eff::(	ancestor(serial_numbered_effectivity)
							 ;	ancestor(lot_effectivity)
							 ;	ancestor(dated_effectivity)
							 ), !,
						Eff::ancestor(configuration_effectivity)
					)
			).

:- end_object.


/*
RULE subtype_mandatory_product_context FOR (product_context);
WHERE
  WR1: SIZEOF (QUERY (pc <* product_context |
	   NOT ('CONFIG_CONTROL_DESIGN.MECHANICAL_CONTEXT' IN TYPEOF(pc)))) = 0;
END_RULE; -- subtype_mandatory_product_context
*/

:- object(subtype_mandatory_product_context,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([product_context]).

	global_rules([wr1]).

	global_rule(wr1) :-
		\+ (	product_context::descendant_instance(Pc),
				\+ Pc::ancestor(mechanical_context)
			).

:- end_object.


/*
RULE subtype_mandatory_product_definition_formation FOR
  (product_definition_formation);
WHERE
  WR1: SIZEOF (QUERY (pdf <* product_definition_formation |
	   NOT ('CONFIG_CONTROL_DESIGN.' +
	   'PRODUCT_DEFINITION_FORMATION_WITH_SPECIFIED_SOURCE' IN
	   TYPEOF(pdf)))) = 0;
END_RULE; -- subtype_mandatory_product_definition_formation
*/

:- object(subtype_mandatory_product_definition_formation,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([product_definition_formation]).

	global_rules([wr1]).

	global_rule(wr1) :-
		\+ (	product_definition_formation::descendant_instance(Pdf),
				\+ Pdf::ancestor(product_definition_formation_with_specified_source)
			).

:- end_object.


/*
RULE subtype_mandatory_product_definition_usage FOR
  (product_definition_usage);
WHERE
  WR1: SIZEOF (QUERY (pdu <* product_definition_usage |
	   NOT ('CONFIG_CONTROL_DESIGN.' +
	   'ASSEMBLY_COMPONENT_USAGE' IN TYPEOF(pdu)))) = 0;
END_RULE; -- subtype_mandatory_product_definition_usage
*/

:- object(subtype_mandatory_product_definition_usage,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([product_definition_usage]).

	global_rules([wr1]).

	global_rule(wr1) :-
		\+ (	product_definition_usage::descendant_instance(Pdu),
				\+ Pdu::ancestor(assembly_component_usage)
			).

:- end_object.


/*
RULE subtype_mandatory_representation FOR (representation);
WHERE
  WR1: SIZEOF (QUERY (rep <* representation |
	   NOT ('CONFIG_CONTROL_DESIGN.SHAPE_REPRESENTATION' IN TYPEOF(rep))))
	   = 0;
END_RULE; -- subtype_mandatory_representation
*/

:- object(subtype_mandatory_representation,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([representation]).

	global_rules([wr1]).

	global_rule(wr1) :-
		\+ (	representation::descendant_instance(Rep),
				\+ Rep::ancestor(shape_representation)
			).

:- end_object.


/*
RULE subtype_mandatory_representation_context FOR
  (representation_context);
WHERE
  WR1: SIZEOF (QUERY (rep_cntxt <* representation_context |
	   NOT ('CONFIG_CONTROL_DESIGN.GEOMETRIC_REPRESENTATION_CONTEXT' IN
	   TYPEOF(rep_cntxt)))) = 0;
END_RULE; -- subtype_mandatory_representation_context
*/

:- object(subtype_mandatory_representation_context,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([representation_context]).

	global_rules([wr1]).

	global_rule(wr1) :-
		\+ (	representation_context::descendant_instance(RepCntxt),
				\+ RepCntxt::ancestor(geometric_representation_context)
			).

:- end_object.


/*
RULE subtype_mandatory_shape_representation FOR
  (shape_representation);
WHERE
  WR1: SIZEOF (QUERY (sr <* shape_representation |
	   NOT ((SIZEOF (['CONFIG_CONTROL_DESIGN.' +
	   'ADVANCED_BREP_SHAPE_REPRESENTATION',
	   'CONFIG_CONTROL_DESIGN.FACETED_BREP_SHAPE_REPRESENTATION',
	   'CONFIG_CONTROL_DESIGN.MANIFOLD_SURFACE_SHAPE_REPRESENTATION',
	   'CONFIG_CONTROL_DESIGN.EDGE_BASED_WIREFRAME_SHAPE_REPRESENTATION',
	   'CONFIG_CONTROL_DESIGN.SHELL_BASED_WIREFRAME_SHAPE_REPRESENTATION',
	   'CONFIG_CONTROL_DESIGN.' +
	   'GEOMETRICALLY_BOUNDED_SURFACE_SHAPE_REPRESENTATION',
	   'CONFIG_CONTROL_DESIGN.' +
	   'GEOMETRICALLY_BOUNDED_WIREFRAME_SHAPE_REPRESENTATION'] *
	   TYPEOF (sr)) = 1) OR
	   (SIZEOF (QUERY (it <* sr\representation.items |
	   NOT ('CONFIG_CONTROL_DESIGN.AXIS2_PLACEMENT_3D' IN TYPEOF (it))))
	   = 0) OR
	   (SIZEOF (QUERY (sdr <* QUERY (pdr <* USEDIN (sr,
	   'CONFIG_CONTROL_DESIGN.PROPERTY_DEFINITION_REPRESENTATION.' +
	   'USED_REPRESENTATION') |
	   'CONFIG_CONTROL_DESIGN.SHAPE_DEFINITION_REPRESENTATION' IN
	   TYPEOF (pdr)) | 
	   NOT (SIZEOF (['CONFIG_CONTROL_DESIGN.SHAPE_ASPECT',
	   'CONFIG_CONTROL_DESIGN.SHAPE_ASPECT_RELATIONSHIP'] * TYPEOF
	   (sdr.definition)) = 1))) = 0)))) = 0;
END_RULE; -- subtype_mandatory_shape_representation
*/

:- object(subtype_mandatory_shape_representation,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([shape_representation]).

	global_rules([wr1]).

	global_rule(wr1) :- \+ (shape_representation::descendant_instance(Sr), not_type(Sr) ).
	    
    not_type(X) :- 
        \+ (list::member(Entity,[   advanced_brep_shape_representation,
                                    faceted_brep_shape_representation,
                                    manifold_surface_shape_representation,
                                    edge_based_wireframe_shape_representation,
                                    shell_based_wireframe_shape_representation,
                                    geometrically_bounded_surface_shape_representation,
                                    geometrically_bounded_wireframe_shape_representation]),
            Entity::descendant_instance(X)).

            
    not_all_placements(_) :- 
        Sr::items(Items),
        list::member(Item,Items),
        \+ axis2_placement_3d::descendant_instance(Item),!.

        
    not_shape_aspect(_) :- 
        shape_definition_representation::descendant_instance(Sdr),
        Sdr::used_representation(Sr),
        Sdr::definition(Property),
        Property::definition(Cdr),
        \+ (Cdr::(ancestor(shape_aspect);ancestor(shape_aspect_relationship))).


:- end_object.


/*
RULE unique_version_change_order_rule
RULE FOR (change);
WHERE
  WR1: SIZEOF (QUERY (c <* change |
	   NOT (unique_version_change_order (c.assigned_action)))) = 0;
END_RULE; -- unique_version_change_order_rule
*/

:- object(unique_version_change_order_rule,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([change]).

	global_rules([wr1]).

	global_rule(wr1) :-
		\+ (	change::descendant_instance(C),
				C::assigned_action(Aa),
				\+ unique_version_change_order::true(Aa)
			).

:- end_object.


/*
RULE versioned_action_request_requires_solution FOR
  (versioned_action_request, action_request_solution);
WHERE
  WR1: SIZEOF (QUERY (ar <* versioned_action_request |
	   NOT (SIZEOF (QUERY (ars <* action_request_solution |
	   ar :=: ars.request)) >= 1))) = 0;
END_RULE; -- versioned_action_request_requires_solution
*/

:- object(versioned_action_request_requires_solution,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([versioned_action_request, action_request_solution]).

	global_rules([wr1]).

	global_rule(wr1) :-
		\+ (	versioned_action_request::descendant_instance(Ar),
				\+ setof(
					Ars,
					(action_request_solution::descendant_instance(Ars), Ars::request(Ar)),
					[_| _])
			).

:- end_object.


/*
RULE versioned_action_request_requires_status FOR
  (versioned_action_request, action_request_status);
WHERE
  WR1: SIZEOF (QUERY (ar <* versioned_action_request |
	   NOT (SIZEOF (QUERY (ars <* action_request_status |
	   ar :=: ars.assigned_request)) = 1))) = 0;
END_RULE; -- versioned_action_request_requires_status
*/

:- object(versioned_action_request_requires_status,
	extends(express_global_rule)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	scope([versioned_action_request, action_request_status]).

	global_rules([wr1]).

	global_rule(wr1) :-
		\+ (	versioned_action_request::descendant_instance(Ar),
				\+ setof(
					Ars,
					(action_request_status::descendant_instance(Ars), Ars::assigned_request(Ar)),
					[_])
			).

:- end_object.
