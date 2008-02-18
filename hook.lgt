
:- object(hook,
	implements(expanding)).

	:- info([
		version is 1.4,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2007/12/3,
		comment is 'Hook object for keeping attribute type information stored in mode/2 directives.']).

	:- private(attr_alias_functor/1).
	:- dynamic(attr_alias_functor/1).

	:- private(domain_alias_functor/1).
	:- dynamic(domain_alias_functor/1).

	:- private(attr_clause/1).
	:- dynamic(attr_clause/1).

	:- private(domain_clause/1).
	:- dynamic(domain_clause/1).

	:- private(local_domain_rules/0).
	:- dynamic(local_domain_rules/0).

	term_expansion((:- object(Object, Instantiation, Specialization)), [(:- object(Object, Instantiation, Specialization))| Directives]) :-
		Specialization =.. [specializes| Classes],
		(	Classes = [_, _| _] ->
			generate_alias_directives(Classes, Directives)	% multi-inheritance
		;	Directives = []									% single-inheritance
		).

	term_expansion((:- mode(Template, NumberOfSolutions, Kind)), [(:- mode(Template, NumberOfSolutions))]) :-
		Template =.. [Name, Mode],
		Mode =.. [_, Type],
		asserta(attr_clause(attr_spec(Name, Type, NumberOfSolutions, Kind))).

	term_expansion(domain_rules([Rule| Rules]), [domain_rules([Rule| Rules])]) :-
		assertz(local_domain_rules).

	term_expansion((:- end_object), Terms) :-
		generate_attr_clauses,
		generate_domain_clauses,
		collect_attr_clauses([(:- end_object)], Acc),
		collect_domain_clauses(Acc, Terms),
		retractall(local_domain_rules).

	generate_alias_directives([], []).
	generate_alias_directives([Class| Classes], [(:- alias(Class, attr_spec/4, AttrAlias/4)), (:- alias(Class, domain_rule/2, DomainAlias/2))| Directives]) :-
		atom_concat(Class, '_', Prefix),
		atom_concat(Prefix, attr_spec, AttrAlias),
		asserta(attr_alias_functor(AttrAlias)),
		atom_concat(Prefix, domain_rule, DomainAlias),
		asserta(domain_alias_functor(DomainAlias)),
		generate_alias_directives(Classes, Directives).

	generate_attr_clauses :-
		(	attr_alias_functor(_) ->
			generate_mi_attr_clauses
		;	generate_si_attr_clauses
		).

	generate_mi_attr_clauses :-
		retract(attr_alias_functor(AttrAlias)),
		AttrCondition =.. [AttrAlias, Name, Type, NumberOfSolutions, Kind],
		asserta(attr_clause((attr_spec(Name, Type, NumberOfSolutions, Kind) :- ::AttrCondition))),
		fail.
	generate_mi_attr_clauses.

	generate_si_attr_clauses :-
		(	attr_clause(_) ->
			asserta(attr_clause((attr_spec(Name, Type, NumberOfSolutions, Kind) :- ^^attr_spec(Name, Type, NumberOfSolutions, Kind))))
		;	true
		).

	generate_domain_clauses :-
		(	domain_alias_functor(_) ->
			generate_mi_domain_clauses
		;	generate_si_domain_clauses
		).

	generate_mi_domain_clauses :-
		retract(domain_alias_functor(DomainAlias)),
		DomainCondition =.. [DomainAlias, Rule, Super],
		asserta(domain_clause((domain_rule(Rule, Super) :- ::DomainCondition))),
		fail.
	generate_mi_domain_clauses :-
		(	local_domain_rules ->
			assertz(domain_clause((domain_rule(Rule, This) :- this(This), !, domain_rule(Rule))))
		;	true
		).

	generate_si_domain_clauses :-
		(	local_domain_rules ->
			asserta(domain_clause((domain_rule(Rule, This) :- this(This), !, domain_rule(Rule)))),
			asserta(domain_clause((domain_rule(Rule, Class) :- ^^domain_rule(Rule, Class))))
		;	true
		).

	collect_attr_clauses(Acc, Terms) :-
		retract(attr_clause(Clause)),
		collect_attr_clauses([Clause| Acc], Terms).
	collect_attr_clauses(Terms, Terms).

	collect_domain_clauses(Acc, Terms) :-
		retract(domain_clause(Clause)),
		collect_domain_clauses([Clause| Acc], Terms).
	collect_domain_clauses(Terms, Terms).

:- end_object.
