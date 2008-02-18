
:- object(data_model).

	:- info([
		version is 1.2,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2007/9/23,
		comment is 'Predicates for validation of a data model.']).

	:- threaded.

	:- public(validate/1).
	:- mode(validate(-compound), one).
	:- info(validate/1, [
		comment is 'Validates a data model using default options.',
		argnames is ['Result']]).

	:- public(validate/2).
	:- mode(validate(+list, -compound), one).
	:- info(validate/2, [
		comment is 'Validates a data model accordingly to a list of options.',
		argnames is ['Options', 'Result']]).

	:- uses(list, [member/2, memberchk/2]).

	default_options([
		validate(all),			% validate both data model objects and global rules	
		rules(all, verbose),	% validate all global rules; do a verbose report of validation results
		instances(all, verbose)	% validate both instance attributes and domain rules; do a verbose report of validation results
		]).

	validate(Result) :-
		default_options(Options),
		validate(Options, Result).

	validate(Options, data_model(InstanceFailures, RuleFailures)) :-
		memberchk(validate(Validate), Options),
		(	Validate == threaded ->
			threaded((
				express_objects::validate([validate(attributes), print(none)], InstanceAttributeFailures),
				express_objects::validate([validate(domain_rules), print(none)], InstanceDomainRuleFailures),
				express_global_rules::validate([validate(all), print(none)], RuleFailures)
			)),
			InstanceFailures = [InstanceAttributeFailures, InstanceDomainRuleFailures]
		;	Validate == all ->
			(	member(instances(IV, IP), Options) ->
				express_objects::validate([validate(IV), print(IP)], InstanceFailures)
			;	express_objects::validate(InstanceFailures)
			),
			(	member(rules(RV, RP), Options) ->
				express_global_rules::validate([validate(RV), print(RP)], RuleFailures)
			;	express_global_rules::validate(RuleFailures)
			)
		;	Validate == instances ->
			(	member(instances(IV, IP), Options) ->
				express_objects::validate([validate(IV), print(IP)], InstanceFailures)
			;	express_objects::validate(InstanceFailures)
			),
			RuleFailures = skipped	
		;	Validate == rules ->
			(	member(rules(RV, RP), Options) ->
				express_global_rules::validate([validate(RV), print(RP)], RuleFailures)
			;	express_global_rules::validate(RuleFailures)
			),
			InstanceFailures = skipped
		).

:- end_object.


:- object(express_objects).

	:- info([
		version is 1.0,
		author is 'Paulo Moura',
		date is 2007/09/24,
		comment is 'Description']).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2007/09/24,
		comment is 'Predicates for validation of data objects.']).

	:- public(validate_attributes/1).
	:- mode(validate_attributes(+list), zero_or_one).
	:- info(validate_attributes/1, [
		comment is 'Validates all attributes of descendant instances of self accordingly to a list of options.']).

	:- public(validate_attributes/2).
	:- mode(validate_attributes(+list, -list), zero_or_one).
	:- info(validate_attributes/2, [
		comment is 'Validates all attributes of descendant instances of self accordingly to a list of options.']).

	:- public(validate_domain_rules/1).
	:- mode(validate_domain_rules(+list), zero_or_one).
	:- info(validate_domain_rules/1, [
		comment is 'Validates all domain rules of descendant instances of self accordingly to a list of options.']).

	:- public(validate_domain_rules/2).
	:- mode(validate_domain_rules(+list, -list), zero_or_one).
	:- info(validate_domain_rules/2, [
		comment is 'Validates all domain rules of descendant instances of self accordingly to a list of options.']).

	:- public(validate/1).
	:- mode(validate(+list), zero_or_one).
	:- info(validate/1, [
		comment is 'Validates all descendant instances of self accordingly to a list of options.']).

	:- public(validate/2).
	:- mode(validate(+list, -list), zero_or_one).
	:- info(validate/2, [
		comment is 'Validates all descendant instances of self accordingly to a list of options.']).

	validate_attributes(Failures) :-
		default_options(Options),
		validate_attributes(Options, Failures).

	validate_attributes(Options, Failures) :-
		(	express_object::leaf_instances(Instances) ->
			validate_attributes(Instances, Options, [], Failures)
		;	Failures = []
		).

	validate_domain_rules(Failures) :-
		default_options(Options),
		validate_domain_rules(Options, Failures).

	validate_domain_rules(Options, Failures) :-
		(	express_object::leaf_instances(Instances) ->
			validate_domain_rules(Instances, Options, [], Failures)
		;	Failures = []
		).

	validate(Failures) :-
		default_options(Options),
		validate(Options, Failures).

	validate(Options, Failures) :-
		(	express_object::leaf_instances(Instances) ->
			validate(Instances, Options, [], Failures)
		;	Failures = []
		).

	validate_attributes([], _, Failures, Failures).
	validate_attributes([Instance| Instances], Options, Acc, Failures) :-
		Instance::validate_attributes(Options, Result),
		(	Result = instance(_, [_|_], _) ->
			Acc2 = [Result| Acc]
		;	Result = instance(_, _, [_|_]) ->
			Acc2 = [Result| Acc]
		;	Acc2 = Acc
		),
		validate_attributes(Instances, Options, Acc2, Failures).

	validate_domain_rules([], _, Failures, Failures).
	validate_domain_rules([Instance| Instances], Options, Acc, Failures) :-
		Instance::validate_domain_rules(Options, Result),
		(	Result = instance(_, [_|_], _) ->
			Acc2 = [Result| Acc]
		;	Result = instance(_, _, [_|_]) ->
			Acc2 = [Result| Acc]
		;	Acc2 = Acc
		),
		validate_domain_rules(Instances, Options, Acc2, Failures).

	validate([], _, Failures, Failures).
	validate([Instance| Instances], Options, Acc, Failures) :-
		Instance::validate(Options, Result),
		(	Result = instance(_, [_|_], _) ->
			Acc2 = [Result| Acc]
		;	Result = instance(_, _, [_|_]) ->
			Acc2 = [Result| Acc]
		;	Acc2 = Acc
		),
		validate(Instances, Options, Acc2, Failures).

	default_options([
		validate(all),	% validate both instance attributes and domain rules
		print(verbose)	% do a verbose report of validation results
		]).

:- end_object.


:- object(express_object,
	imports(class_hierarchy),
	instantiates(express_entity)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is 'Predicates common to all EXPRESS data objects.']).

	:- threaded.

	:- public(default_options/1).
	:- mode(default_options(-list), one).
	:- info(default_options/1, [
		comment is 'Default validation options.',
		argnames is ['Options']]).

	:- public(validate/1).
	:- mode(validate(-compound), one).
	:- info(validate/1, [
		comment is 'Validates an instance using default options.',
		argnames is ['Result']]).

	:- public(validate/2).
	:- mode(validate(+list, -compound), one).
	:- info(validate/2, [
		comment is 'Validates an instance accordingly to a list of options.',
		argnames is ['Options', 'Result']]).

	:- public(validate_attributes/1).
	:- mode(validate_attributes(-list), one).
	:- info(validate_attributes/1, [
		comment is 'Validates an instance attributes.',
		argnames is ['Failures']]).

	:- public(validate_attributes/2).
	:- mode(validate_attributes(+list, -list), one).
	:- info(validate_attributes/2, [
		comment is 'Validates an instance attributes accordingly to a list of options.',
		argnames is ['Options', 'Failures']]).

	:- public(attr_spec/4).
	:- mode(attr_spec(?atom, ?nonvar, ?atom, ?atom), zero_or_more).
	:- info(attr_spec/4, [
		comment is 'Table of atributes name, type, cardinality, and kind.',
		argnames is ['Name', 'Type', 'Cardinality', 'Kind']]).

	:- public(validate_domain_rules/1).
	:- mode(validate_domain_rules(-list), one).
	:- info(validate_domain_rules/1, [
		comment is 'Validates an instance accordingly to its ancestor domain rules.',
		argnames is ['Failures']]).

	:- public(validate_domain_rules/2).
	:- mode(validate_domain_rules(+list, -list), one).
	:- info(validate_domain_rules/2, [
		comment is 'Validates an instance accordingly to its ancestor domain rules and to a list of options.',
		argnames is ['Options', 'Failures']]).

	:- public(domain_rule/1).
	:- mode(domain_rule(+atom), zero_or_one).
	:- info(domain_rule/1, [
		comment is 'Local domain rule.',
		argnames is ['Rule']]).

	:- public(domain_rule/2).
	:- mode(domain_rule(+atom, +atom), zero_or_one).
	:- info(domain_rule/2, [
		comment is 'Linking clauses for local and ancestor domain rules.',
		argnames is ['Rule', 'Class']]).

	:- uses(list, [memberchk/2]).

	default_options([
		validate(all),	% validate both instance attributes and domain rules
		print(verbose)	% do a verbose report of validation results
		]).

	validate(Result) :-
		::default_options(Options),
		validate(Options, Result).

	validate(Options, instance(Self, AttributeFailures, DomainRuleFailures)) :-
		self(Self),
		memberchk(validate(Validate), Options),
		(	Validate == all ->
			validate_attributes(AttributeFailures),
			validate_domain_rules(DomainRuleFailures)
		;	Validate == attributes ->
			validate_attributes(AttributeFailures),
			DomainRuleFailures = skipped
		;	Validate == domain_rules ->
			validate_domain_rules(DomainRuleFailures),
			AttributeFailures = skipped
		),
		memberchk(print(Print), Options),
		print_instance_results(Print, AttributeFailures, DomainRuleFailures).

	print_instance_results(none, _, _).

	print_instance_results(verbose, AttributeFailures, DomainRuleFailures) :-
		self(Self),
		write('Object: '), write(Self), nl,
		(	AttributeFailures == [] ->
			write('  attributes:   passed'), nl
		;	AttributeFailures == skipped ->
			write('  attributes:   skipped'), nl
		;	write('  attributes:   failed'), nl,
			print_attribute_failures(AttributeFailures)
		),
		(	DomainRuleFailures == [] ->
			write('  domain rules: passed'), nl
		;	DomainRuleFailures == skipped ->
			write('  domain rules: skipped'), nl
		;	write('  domain rules: failed'), nl,
			print_domain_rule_failures(DomainRuleFailures)
		).

	print_instance_results(summary, AttributeFailures, DomainRuleFailures) :-
		self(Self),
		write('Object: '), write(Self), nl,
		(	AttributeFailures == [] ->
			write('  attributes:   passed'), nl
		;	AttributeFailures == skipped ->
			write('  attributes:   skipped'), nl
		;	write('  attributes:   failed'), nl
		),
		(	DomainRuleFailures == [] ->
			write('  domain rules: passed'), nl
		;	DomainRuleFailures == skipped ->
			write('  domain rules: skipped'), nl
		;	write('  domain rules: failed'), nl
		).

	print_instance_results(failures, AttributeFailures, DomainRuleFailures) :-
		(	(AttributeFailures = [_| _]; DomainRuleFailures = [_| _]) ->
			print_instance_results(verbose, AttributeFailures, DomainRuleFailures)
		;	true
		).

	print_attribute_failures([]).
	print_attribute_failures([Failure| Failures]) :-
		print_attribute_failure(Failure),
		print_attribute_failures(Failures).

	print_attribute_failure(invalid(Name, Type, Value)) :-
		write('    invalid attribute value: '), write((Name, Type, Value)), nl.
	print_attribute_failure(missing(Name, Type)) :-
		write('    mandatory attribute missing: '), write((Name, Type)), nl.

	print_domain_rule_failures([]).
	print_domain_rule_failures([Failure| Failures]) :-
		print_domain_rule_failure(Failure),
		print_domain_rule_failures(Failures).

	print_domain_rule_failure(domain_rule(Ancestor, Rule)) :-
		write('    domain rule failure: '), write((Ancestor, Rule)), nl.

	validate_attributes(Failures) :-
		(	setof((Name, Type, Cardinality), Kind^(::attr_spec(Name, Type, Cardinality, Kind), Kind \== derived), Attributes) ->
			validate_attributes(Attributes, [], Failures)
		;	Failures = []
		).

	validate_attributes(_, Failures) :-
		validate_attributes(Failures).

	validate_attributes([], Failures, Failures).
	validate_attributes([(Name, Type, Cardinality)| Attributes], Acc, Failures) :-	
		validate_attribute(Cardinality, Name, Type, Acc, Acc2),
		validate_attributes(Attributes, Acc2, Failures).

	validate_attribute(one, Name, Type, Acc, Acc2) :-
		Goal =.. [Name, Value],
		(	call(::Goal) ->
			(	catch(Type::valid(Value), Error, report_error(Type, Error)) ->
				Acc2 = Acc
			;	Acc2 = [invalid(Name, Type, Value)| Acc]
			)
		;	Acc2 = [missing(Name, Type)| Acc]
		).

	validate_attribute(zero_or_one, Name, Type, Acc, Acc2) :-
		Goal =.. [Name, Value],
		(	call(::Goal) ->
			(	catch(Type::valid(Value), Error, report_error(Type, Error)) ->
				Acc2 = Acc
			;	Acc2 = [invalid(Name, Type, Value)| Acc]
			)
		;	Acc2 = Acc
		).

	report_error(Type, Error) :-
		nl, write('    The type '), write(Type), write(' does not understand the message valid/1'), nl,
		throw(Error).

	validate_domain_rules(_, Failures) :-
		validate_domain_rules(Failures).

	validate_domain_rules(Failures) :-
		::ancestors(Ancestors),									% find list of instance ancestors,
		remove_duplicates(Ancestors, [], UniqueAncestors),		% convert list into a set, and
		validate_domain_rules(UniqueAncestors, [], Failures).	% validate all rules

	validate_domain_rules([], Failures, Failures).
	validate_domain_rules([Ancestor| Ancestors], Acc, Failures) :-
		Ancestor::enabled_domain_rules(Rules),					% this call will later be replaced 
		validate_domain_rules(Rules, Ancestor, Acc, Acc2),		% by a domain_rules/1 call
		validate_domain_rules(Ancestors, Acc2, Failures).

	validate_domain_rules([], _, Failures, Failures).
	validate_domain_rules([Rule| Rules], Ancestor, Acc, Failures) :-
		(	::domain_rule(Rule, Ancestor) ->
			Result = passed,
			Acc2 = Acc
		;	Result = failed,
			Acc2 = [domain_rule(Ancestor, Rule)| Acc]
		),
		validate_domain_rules(Rules, Ancestor, Acc2, Failures).

	remove_duplicates([], Ancestors, Ancestors).
	remove_duplicates([Ancestor| Ancestors], SoFar, UniqueAncestors) :-
		(	memberchk(Ancestor, SoFar) ->
			remove_duplicates(Ancestors, SoFar, UniqueAncestors)
		;	remove_duplicates(Ancestors, [Ancestor| SoFar], UniqueAncestors)
		).

:- end_object.


:- object(express_entity,
	instantiates(express_entity),
	specializes(express_abstract_entity)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is 'Predicates common to all EXPRESS entity instantiable classes.']).

    valid(Value) :-
		nonvar(Value),
		catch(current_object(Value), _, fail),	% fail for invalid object identifiers
		\+ \+ ::descendant_instance(Value).

:- end_object.


:- object(express_abstract_entity,
	implements(type_checking),
	imports(class_hierarchy),
	instantiates(express_entity)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is 'Predicates common to all EXPRESS entity classes.']).

	:- public(domain_rules/1).
	:- mode(domain_rules(+list(atom)), zero_or_one).
	:- info(domain_rules/1, [
		comment is 'List of defined domain rules.',
		argnames is ['Rules']]).

	:- public(enabled_domain_rules/1).
	:- mode(enabled_domain_rules(+list(atom)), zero_or_one).
	:- info(enabled_domain_rules/1, [
		comment is 'List of currently enabled domain rules.',
		argnames is ['Rules']]).

    valid(Value) :-		% catch-all clause
		self(Self),
		write('  Invalid attribute type: '), write(Self), nl,
		write('  '), write(Value), write(' instantiates an abstract entity!'), nl,
		fail.

	enabled_domain_rules(Rules) :-	% by default, all rules are enabled
		::domain_rules(Rules).

	domain_rules([]).				% by default, a class doesn't define any domain rules

:- end_object.


:- object(express_representation).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is 'Predicates for building a cache of representation items in order to avoid repeated computations.']).

	:- public(build_cache/0).
	:- mode(build_cache, one).
	:- info(build_cache/0, [
		comment is 'Buil cache of representation items.']).

	build_cache :-
		representation::descendant_instances(Instances),
		build_cache(Instances).

	build_cache([]).
	build_cache([Instance| Instances]) :-
		(	setof(Item, Instance::uses_item(Item), Items) ->
			build_cache(Items, Instance)
		;	true
		),
		build_cache(Instances).

	build_cache([], _).
	build_cache([Item| Items], Instance) :-
		Item::asserta(used_in_representation(Instance)),
		build_cache(Items, Instance).

:- end_object.




:- object(express_global_rules).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is 'Predicates for the validation of schema glabal rules.']).

	:- public(validate/1).
	:- mode(validate(-list), one).
	:- info(validate/1, [
		comment is 'Validates all rules using default options.',
		argnames is ['Failures']]).

	:- public(validate/2).
	:- mode(validate(+list, -list), one).
	:- info(validate/2, [
		comment is 'Validates all rules accordingly to a list of options.',
		argnames is ['Options', 'Failures']]).

	default_options([
		validate(all),	% validate all global rules
		print(verbose)	% do a verbose report of validation results
		]).

	validate(Failures) :-
		default_options(Options),
	    validate(Options, Failures).

    validate(Options, Failures) :-
		(	setof(Rule, extends_object(Rule, express_global_rule), Rules) ->
			validate(Rules, Options, [], Failures)
		;	Failures = []
		).

	validate([], _, Failures, Failures).
	validate([Rule| Rules], Options, Acc, Failures) :-
		Rule::validate(Options, RuleFailures),
		(	RuleFailures == [] ->
			Acc2 = Acc
		;	Acc2 = [global_rule(Rule, RuleFailures)| Acc]
		),
		validate(Rules, Options, Acc2, Failures).

:- end_object.


:- object(express_global_rule).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is 'Predicates common to all EXPRESS schema glabal rules.']).
    
	:- threaded.

	:- public(validate/1).
	:- mode(validate(-list), one).
	:- info(validate/1, [
		comment is 'Validates a rule using default options.',
		argnames is ['Failures']]).

	:- public(validate/2).
	:- mode(validate(+list, -list), one).
	:- info(validate/2, [
		comment is 'Validates a rule accordingly to a list of options.',
		argnames is ['Options', 'Failures']]).

    :- public(scope/1).
	:- mode(scope(+list), one).
	:- info(scope/1, [
		comment is 'List of EXPRESS entities within the scope of the global rule.',
		argnames is ['Entities']]).

    :- public(global_rules/1).
	:- mode(global_rules(+list), one).
	:- info(global_rules/1, [
		comment is 'List of global rule components.',
		argnames is ['Rules']]).

    :- public(global_rule/1).
	:- mode(global_rule(+atom), zero_or_one).
	:- info(global_rule/1, [
		comment is 'Global rule component.',
		argnames is ['Rule']]).

	:- uses(list, [memberchk/2]).

	default_options([
		print(verbose)	% do a verbose report of validation results
		]).

    validate(Failures) :-
		default_options(Options),
	    validate(Options, Failures).

    validate(Options, Failures) :-
        ::global_rules(GlobalRules),
        validate_global_rules(GlobalRules, [], Failures),
		memberchk(print(Print), Options),
		print_rule_results(Print, Failures).

    validate_global_rules([], Failures, Failures).
    validate_global_rules([GlobalRule| GlobalRules], Acc, Failures) :-
		(	::global_rule(GlobalRule) ->
        	Acc2 = Acc
		;	Acc2 = [GlobalRule| Acc]
		),
		validate_global_rules(GlobalRules, Acc2, Failures).

	print_rule_results(none, _).

	print_rule_results(verbose, Failures) :-
		self(Self),
		write('Rule: '), write(Self), nl,
		(	Failures == [] ->
			write('  passed'), nl
		;	write('  failed '), write(Failures), nl
		).

	print_rule_results(summary, Failures) :-
		self(Self),
		write('Rule: '), write(Self), nl,
		(	Failures == [] ->
			write('  passed'), nl
		;	write('  failed'), nl
		).

	print_rule_results(failures, Failures) :-
		(	Failures == [] ->
			true
		;	print_rule_results(verbose, Failures)
		).

	global_rules([]).

:- end_object.
