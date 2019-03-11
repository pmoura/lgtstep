/*
This file contains the EXPRESS declarations of the functions from
AP 203 Amendment 1 (2000) [ document ISO TC184/SC4/WG3 N916 ]
along with the Logtalk implementations. Also included are Logtalk objects supporting
the implementations
*/


/*
The object acyclic graph is a base object supporting the function-objects:
acyclic_curve_replica
acyclic_mapped_representation
acyclic_point_replica
acyclic_product_category_relationship
acyclic_product_definition_relationship
acyclic_surface_replica
from AP 203

 acyclic_graph is an object providing a public predicate true/1, meant as a
 template for testing that set of relations among instances is acyclic; that is that
 no instance can be an ancestor (or descendant) of itself. This prototype-object needs to
 be extended by objects that provide a graph_edge/2 predicate that defines the relation
 among instances
*/

:- object(acyclic_graph).

	:- info([
		version is 1.01,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2019/03/11,
		comment is '.']).

	:- public(true/1).
	:- mode(true(+atom), zero_or_one).
	:- info(true/1,
		[comment is '.',
		 argnames is ['Ancestor']]).

	:- protected(acyclic_path/1).
	:- mode(acyclic_path(+list(atom)), zero_or_one).
  	:- info(acyclic_path/1,
		[comment is '.',
		 argnames is ['Nodes']]).

	:- private(graph_edge/2).
	:- mode(graph_edge(+atom, -atom), zero_or_more).
  	:- info(graph_edge/2,
		[comment is '.',
		 argnames is ['Ancestor', 'Descendant']]).

	true(Ancestor) :-
		nonvar(Ancestor),
		::acyclic_path([Ancestor]).

	acyclic_path([X | Rest]) :-
		\+ list::member(X, Rest),
		forall(::graph_edge(X, Y), acyclic_path([Y, X| Rest])).

:- end_object.


% acyclic_item_uses is not defined in AP 203 schema, but it is included here
% as an example of the use of the acyclic_graph template
% Furthermore, if acyclic_item_uses::eval fails for any representation_item, then the
% call to the descendant_item predicate will enter an infinite loop.
 
:- object(acyclic_item_uses,
	extends(acyclic_graph)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	graph_edge(Item, UsedItem) :- 
		Item::uses_item(UsedItem).

:- end_object.


/*
The category reversing function supports the following
AP 203 functions which return topological representation items formed by
reversing the orientation of input objects:
closed_shell_reversed
edge_reversed
face_bound_reversed
face_reversed
open_shell_reversed
path_reversed
shell_reversed
*/

:- category(reversing_function).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is 'This category implements a predicate for reversing the orientation of topological entities such as faces, edges, paths, face_bounds, and shells.']).

	:- protected(reversed_orientation/2).
	:- mode(reversed_orientation(+topological_representation_item, -topological_representation_item), one).
  	:- info(reversed_orientation/2,
		[comment is '.',
		 argnames is ['Element', 'Reversed']]).

	reversed_orientation(Element, Reversed) :-
		Element::orientation(Orientation),
		reverse(Orientation, Reversed).
		
	reverse(false, true).
	reverse(true, false).

:- end_category.


:- category(geometry_functions).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is 'Category supporting geometric computations.']).

	:- protected(pythagorean_magnitude/2).
	:- mode(pythagorean_magnitude(+list(float), -float), one).
	:- info(pythagorean_magnitude/2,
		[comment is '.',
		 argnames is ['Coordinates', 'Magnitude']]).

	:- protected(scale_list/3).
	:- mode(scale_list(+list(float), +float, -list(float)), one).

	pythagorean_magnitude(Coordinates, Magnitude) :-
		sum_squares(Coordinates, 0.0, X),
		Magnitude is sqrt(X).
		
	sum_squares([], Sum, Sum).
	sum_squares([X| Tl], Acc, Sum) :-
		Acc2 is Acc + X*X,
		sum_squares(Tl, Acc2, Sum).
		
	scale_list([], _, []).
	scale_list([X| Tl], Scale, [Xs| TlS]) :-
		Xs is Scale * X,
		scale_list(Tl, Scale, TlS).

:- end_category.


/*
Following are the AP 203 functions and their implementations
*/

/*
FUNCTION acyclic_curve_replica(rep: curve_replica;
		   parent: curve): BOOLEAN;
IF NOT ('CONFIG_CONTROL_DESIGN.CURVE_REPLICA' IN TYPEOF(parent)) THEN
  RETURN(TRUE);
END_IF;
IF parent :=: rep THEN RETURN(FALSE);
ELSE
  RETURN(acyclic_curve_replica(rep,parent\curve_replica.parent_curve));
END_IF;
END_FUNCTION; -- acyclic_curve_replica
*/

:- object(acyclic_curve_replica,
	extends(acyclic_graph)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	graph_edge(Curve, Parent) :-
		Curve::parent_curve(Parent),
		Parent::ancestor(curve_replica), !.

:- end_object.


/*
FUNCTION acyclic_mapped_representation(parent_set: SET OF representation;
		   children_set: SET OF representation_item): BOOLEAN;
LOCAL
  i : INTEGER;
  x : SET OF representation_item;
  y : SET OF representation_item;
END_LOCAL;
x := QUERY ( z <* children_set | ('CONFIG_CONTROL_DESIGN.MAPPED_ITEM'
	IN TYPEOF(z)) );
IF SIZEOF(x) > 0 THEN
  REPEAT i := 1 TO HIINDEX(x) BY 1;
	IF x[i]\mapped_item.mapping_source.mapped_representation IN
		parent_set THEN RETURN(FALSE);
	END_IF;
	IF NOT acyclic_mapped_representation(parent_set + x[i]\mapped_item
		.mapping_source.mapped_representation,x[i]\mapped_item.
		mapping_source.mapped_representation.items) THEN
	  RETURN(FALSE);
	END_IF;
  END_REPEAT;
END_IF;
x := children_set - x;
IF SIZEOF(x) > 0 THEN
  REPEAT i := 1 TO HIINDEX(x) BY 1;
	y := QUERY ( z <* bag_to_set(USEDIN(x[i],'')) | (
		'CONFIG_CONTROL_DESIGN.REPRESENTATION_ITEM' IN TYPEOF(z)) );
	IF NOT acyclic_mapped_representation(parent_set,y) THEN
	  RETURN(FALSE);
	END_IF;
  END_REPEAT;
END_IF;
RETURN(TRUE);
END_FUNCTION; -- acyclic_mapped_representation
*/

:- object(acyclic_mapped_representation,
	extends(acyclic_graph)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	graph_edge(Representation, MappedRepresentation) :-
		mapped_item::descendant_instance(MappedItem),
		Representation::uses_item(MappedItem),
		MappedItem::mapping_source(MapSource),
		MapSource::mapped_representation(MappedRepresentation).
		
:- end_object.


/*
FUNCTION acyclic_point_replica(rep: point_replica;
		   parent: point): BOOLEAN;
IF NOT ('CONFIG_CONTROL_DESIGN.POINT_REPLICA' IN TYPEOF(parent)) THEN
  RETURN(TRUE);
END_IF;
IF parent :=: rep THEN RETURN(FALSE);
ELSE
  RETURN(acyclic_point_replica(rep,parent\point_replica.parent_pt));
END_IF;
END_FUNCTION; -- acyclic_point_replica
*/

:- object(acyclic_point_replica,
	extends(acyclic_graph)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	graph_edge(Replica, ParentReplica) :-
		Replica::parent_pt(ParentReplica),
		ParentReplica::ancestor(point_replica).

:- end_object.


/*
FUNCTION acyclic_product_category_relationship(
		   relation: product_category_relationship;
		   children: SET OF product_category): LOGICAL;
LOCAL
  i			  : INTEGER;
  x			  : SET OF product_category_relationship;
  local_children : SET OF product_category;
END_LOCAL;
REPEAT i := 1 TO HIINDEX(children) BY 1;
  IF relation.category :=: children[i] THEN RETURN(FALSE);
  END_IF;
END_REPEAT;
x := bag_to_set(USEDIN(relation.category,'CONFIG_CONTROL_DESIGN.' +
	'PRODUCT_CATEGORY_RELATIONSHIP.SUB_CATEGORY'));
local_children := children + relation.category;
IF SIZEOF(x) > 0 THEN
  REPEAT i := 1 TO HIINDEX(x) BY 1;
	IF NOT acyclic_product_category_relationship(x[i],local_children)
		 THEN RETURN(FALSE);
	END_IF;
  END_REPEAT;
END_IF;
RETURN(TRUE);
END_FUNCTION; -- acyclic_product_category_relationship
*/

:- object(acyclic_product_category_relationship,
	extends(acyclic_graph)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	 graph_edge(Ancestor, Descendant) :-  
		Ancestor::sub_category(SubCategory),
		product_category_relationship::descendant_instance(Descendant),
		Descendant::category(SubCategory).

:- end_object.


/*
FUNCTION acyclic_product_definition_relationship(
		   relation: product_definition_relationship;
		   relatives: SET [1:?] OF product_definition;
		   specific_relation: STRING): LOGICAL;
LOCAL
  x : SET OF product_definition_relationship;
END_LOCAL;
IF relation.relating_product_definition IN relatives THEN
  RETURN(FALSE);
END_IF;
x := QUERY ( pd <* bag_to_set(USEDIN(relation.
	relating_product_definition,'CONFIG_CONTROL_DESIGN.' +
	'PRODUCT_DEFINITION_RELATIONSHIP.' + 'RELATED_PRODUCT_DEFINITION'))
	 | (specific_relation IN TYPEOF(pd)) );
REPEAT i := 1 TO HIINDEX(x) BY 1;
  IF NOT acyclic_product_definition_relationship(x[i],relatives +
	  relation.relating_product_definition,specific_relation) THEN
	RETURN(FALSE);
  END_IF;
END_REPEAT;
RETURN(TRUE);
END_FUNCTION; -- acyclic_product_definition_relationship
*/

:- object(acyclic_product_definition_relationship,
	extends(acyclic_graph)).
% This function is being implemented for the one case which appears in AP 203, 
% that where "specific_relation" is
% related_product_definition

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	graph_edge(ProductDefinition, RelatedDefinition) :-
		product_definition_relationship::descendant_instance(Relationship),
		Relationship::related_product_definition(ProductDefinition),
		Relationship::relating_product_definition(RelatedDefinition).

:- end_object.


/*
FUNCTION acyclic_surface_replica(rep: surface_replica;
		   parent: surface): BOOLEAN;
IF NOT ('CONFIG_CONTROL_DESIGN.SURFACE_REPLICA' IN TYPEOF(parent))
	 THEN
  RETURN(TRUE);
END_IF;
IF parent :=: rep THEN RETURN(FALSE);
ELSE
  RETURN(acyclic_surface_replica(rep,parent\surface_replica.
	  parent_surface));
END_IF;
END_FUNCTION; -- acyclic_surface_replica
*/

:- object(acyclic_surface_replica,
	extends(acyclic_graph)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	graph_edge(Replica, ParentReplica) :-
		Replica::parent_surface(ParentReplica),
		ParentReplica::ancestor(surface_replica), !.

:- end_object.


/*
FUNCTION assembly_shape_is_defined(assy: next_assembly_usage_occurrence;
		   schma: STRING): BOOLEAN;
LOCAL
  srr_set   : SET OF shape_representation_relationship := [];
  i		 : INTEGER;
  j		 : INTEGER;
  sdr_set   : SET OF shape_definition_representation := [];
  pr1_set   : SET OF property_definition := [];
  pdrel_set : SET OF product_definition_relationship := [];
  pr2_set   : SET OF property_definition := [];
END_LOCAL;
pr1_set := bag_to_set(USEDIN(assy.related_product_definition,schma +
	'.PROPERTY_DEFINITION.DEFINITION'));
REPEAT i := 1 TO HIINDEX(pr1_set) BY 1;
  sdr_set := sdr_set + QUERY ( pdr <* USEDIN(pr1_set[i],schma +
	  '.PROPERTY_DEFINITION_REPRESENTATION.DEFINITION') | ((schma +
	  '.SHAPE_DEFINITION_REPRESENTATION') IN TYPEOF(pdr)) );
END_REPEAT;
pdrel_set := bag_to_set(USEDIN(assy.related_product_definition,schma +
	 '.PRODUCT_DEFINITION_RELATIONSHIP.' +
	 'RELATED_PRODUCT_DEFINITION'));
REPEAT j := 1 TO HIINDEX(pdrel_set) BY 1;
  pr2_set := pr2_set + USEDIN(pdrel_set[j],schma +
	  '.PROPERTY_DEFINITION.DEFINITION');
END_REPEAT;
REPEAT i := 1 TO HIINDEX(pr2_set) BY 1;
  sdr_set := sdr_set + QUERY ( pdr <* USEDIN(pr2_set[i],schma +
	  '.PROPERTY_DEFINITION_REPRESENTATION.DEFINITION') | ((schma +
	  '.SHAPE_DEFINITION_REPRESENTATION') IN TYPEOF(pdr)) );
END_REPEAT;
IF SIZEOF(sdr_set) > 0 THEN
  REPEAT i := 1 TO HIINDEX(sdr_set) BY 1;
	srr_set := QUERY ( rr <* bag_to_set(USEDIN(sdr_set[i]\
		property_definition_representation.used_representation,schma +
		'.REPRESENTATION_RELATIONSHIP.REP_2')) | ((schma +
		'.SHAPE_REPRESENTATION_RELATIONSHIP') IN TYPEOF(rr)) );
	IF SIZEOF(srr_set) > 0 THEN
	  REPEAT j := 1 TO HIINDEX(srr_set) BY 1;
		IF SIZEOF(QUERY ( pdr <* bag_to_set(USEDIN(srr_set[j]\
			representation_relationship.rep_1,schma +
			'.PROPERTY_DEFINITION_REPRESENTATION.USED_REPRESENTATION'))
			 | ((schma + '.SHAPE_DEFINITION_REPRESENTATION') IN TYPEOF(
			pdr)) ) * QUERY ( pdr <* bag_to_set(USEDIN(assy.
			relating_product_definition,schma +
			'.PROPERTY_DEFINITION_REPRESENTATION.DEFINITION')) | ((
			schma + '.SHAPE_DEFINITION_REPRESENTATION') IN
			TYPEOF(pdr)) )) >= 1 THEN
		  IF SIZEOF(QUERY ( cdsr <* USEDIN(srr_set[j],schma +
			  '.CONTEXT_DEPENDENT_SHAPE_REPRESENTATION.' +
			  'REPRESENTATION_RELATION') | (NOT (cdsr\
			  context_dependent_shape_representation.
			  represented_product_relation\property_definition.
			  definition :=: assy)) )) > 0 THEN
			RETURN(FALSE);
		  END_IF;
		END_IF;
	  END_REPEAT;
	END_IF;
  END_REPEAT;
END_IF;
RETURN(TRUE);
END_FUNCTION; -- assembly_shape_is_defined
*/

:- object(assembly_shape_is_defined).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(true/1).
	:- mode(true(+next_assembly_usage_occurrence), zero_or_one).
	:- info(true/1,
		[comment is '.',
		 argnames is ['Assembly']]).

	true(Assy) :-
		forall(
			(assembly_to_component(Xpd, Assy, Ypd),
			 definition_to_shape(Xpd, Xsr),
			 definition_to_shape_var(Ypd, Ysr),
			 assembly_shape_to_component_shape(Xsr, Arr, Ysr)),
			context_dependent_shape(Assy, Arr)).

	assembly_to_component(Xpd, Assy, Ypd) :-
		next_assembly_usage_occurrence::descendant_instance(Assy),
		Assy::related_product_definition(Ypd),
		Assy::relating_product_definition(Xpd).

	definition_to_shape(Xpd, Xsr) :-
		property_definition::descendant_instance(Xpr),
		Xpr::definition(Xpd),
		shape_definition_representation::descendant_instance(Xsd),
		Xsd::definition(Xpr),
		shape_representation::descendant_instance(Xsr),
		Xsd::used_representation(Xsr).

	definition_to_shape_var(Ypd, Ysr) :-
		property_definition::descendant_instance(Ypr),
		(	Ypr::definition(Ypd) ->
			true
		;	Ypr::definition(Yvar),
			product_definition_relationship::descendant_instance(Yvar),
			Yvar::related_product_definition(Ypd)
		),
		shape_definition_representation::descendant_instance(Ysd),
		Ysd::definition(Ypr),
		shape_representation::descendant_instance(Ysr),
		Ysd::used_representation(Ysr).

	assembly_shape_to_component_shape(Xsr, Arr, Ysr) :-
		shape_representation_relationship::descendant_instance(Arr),
		Arr::rep_2(Xsr),
		Arr::rep_1(Ysr).

	context_dependent_shape(Assy, Arr) :-
		context_dependent_shape_representation::descendant_instance(Acdsr),
		Acdsr::represented_product_relation(Apr),
		Apr::definition(Assy),
		Acdsr::representation_relation(Arr).

:- end_object.


/*
FUNCTION associated_surface(arg: pcurve_or_surface): surface;
LOCAL
  surf : surface;
END_LOCAL;
IF 'CONFIG_CONTROL_DESIGN.PCURVE' IN TYPEOF(arg) THEN
  surf := arg.basis_surface;
ELSE
  surf := arg;
END_IF;
RETURN(surf);
END_FUNCTION; -- associated_surface
*/

:- object(associated_surface).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(eval/2).
	:- mode(eval(+pcurve_or_surface, -surface), one).
	:- info(eval/2,
		[comment is '.',
		 argnames is ['Arg', 'Surface']]).

	eval(Arg, Surface) :-
		(	Arg::ancestor(pcurve) ->
			Arg::basis_surface(Surface)
		;	Arg = Surface
		).	

:- end_object.


/*
FUNCTION bag_to_set(the_bag: BAG OF GENERIC:intype
  ): SET OF GENERIC:intype;
LOCAL
  i	   : INTEGER;
  the_set : SET OF GENERIC:intype := [];
END_LOCAL;
IF SIZEOF(the_bag) > 0 THEN
  REPEAT i := 1 TO HIINDEX(the_bag) BY 1;
	the_set := the_set + the_bag[i];
  END_REPEAT;
END_IF;
RETURN(the_set);
END_FUNCTION; -- bag_to_set
*/

:- object(bag_to_set).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(eval/2).
	:- mode(eval(+bag, -set), one).
 	:- info(eval/2,
		[comment is '.',
		 argnames is ['Bag', 'Set']]).

	eval(Bag, Set) :-
		sort(Bag, Set).

:- end_object.


/*
FUNCTION base_axis(dim: INTEGER; axis1, axis2, axis3: direction
  ): LIST [2:3] OF direction;
LOCAL
  u	  : LIST [2:3] OF direction;
  d1	 : direction;
  d2	 : direction;
  factor : REAL;
END_LOCAL;
IF dim = 3 THEN
  d1 := NVL(normalise(axis3),dummy_gri || direction([0,0,1]));
  d2 := first_proj_axis(d1,axis1);
  u := [d2,second_proj_axis(d1,d2,axis2),d1];
ELSE
  IF EXISTS(axis1) THEN
	d1 := normalise(axis1);
	u := [d1,orthogonal_complement(d1)];
	IF EXISTS(axis2) THEN
	  factor := dot_product(axis2,u[2]);
	  IF factor < 0 THEN
		u[2].direction_ratios[1] := -u[2].direction_ratios[1];
		u[2].direction_ratios[2] := -u[2].direction_ratios[2];
	  END_IF;
	END_IF;
  ELSE
	IF EXISTS(axis2) THEN
	  d1 := normalise(axis2);
	  u := [orthogonal_complement(d1),d1];
	  u[1].direction_ratios[1] := -u[1].direction_ratios[1];
	  u[1].direction_ratios[2] := -u[1].direction_ratios[2];
	ELSE
	  u := [dummy_gri || direction([1,0]),dummy_gri ||
	  direction([0,1])];
	END_IF;
  END_IF;
END_IF;
RETURN(u);
END_FUNCTION; -- base_axis
*/

/*
This function is used in ISO 10303:203 Am1 (2000) in a derived attribute for the
entity cartesian_transformation_operator_3d. 
*/

/*
:- object(base_axis).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(eval/5).
	:- mode(eval(+integer,+direction, +direction, +direction, -set(direction)), one).
	:- info(eval/5, [
		comment is '.',
		argnames is ['Axis1', 'Axis2', 'Directions']]).

	:- public(eval/4).
	:- mode(eval(+direction, +direction, +direction, -set(direction)), one).
	:- info(eval/4, [
		comment is '.',
		argnames is ['Axis1', 'Axis2', 'Axis3', 'Directions']]).
 
	eval(Axis1, Axis2, [U1, U2]) :-
		normalise::eval(Axis1, U1),
		orthogonal_complement::eval(U1, U2).

	eval(Axis1, Axis2, Axis3, [U1, U2, U3]) :-
		(	normalise::eval(Axis3, U3) ->
			true
		;	U3 = direction('', [0.0, 0.0, 1.0])
		),
		first_proj_axis::eval(U3, Axis1, U1),
		second_proj_axis::eval(U3, U1, Axis2, U2).

:- end_object.
*/

/*
FUNCTION boolean_choose(b: BOOLEAN;
		   choice1, choice2: GENERIC:item): GENERIC:item;
IF b THEN
  RETURN(choice1);
ELSE
  RETURN(choice2);
END_IF;
END_FUNCTION; -- boolean_choose
*/

:- object(boolean_choose).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(eval/4).
	:- mode(eval(+boolean, +nonvar, +nonvar, -nonvar), one).
	:- info(eval/4, [
		comment is '.',
		argnames is ['Boolean', 'Choice1', 'Choice2', 'Result']]).

	eval(true, Choice1, _, Choice1).
	eval(false, _, Choice2, Choice2).

:- end_object.


/*
FUNCTION build_2axes(ref_direction: direction): LIST [2:2] OF direction;
LOCAL
  d : direction := NVL(normalise(ref_direction),dummy_gri ||
	   direction([1,0]));
END_LOCAL;
RETURN([d,orthogonal_complement(d)]);
END_FUNCTION; -- build_2axes
*/

:- object(build_2axes).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(eval/2).
	:- mode(eval(+direction, -list(direction)), one).
 	:- info(eval/2,
		[comment is '.',
		 argnames is ['RefDirection', 'Directions']]).

	eval(RefDirection, [U1, U2]) :-
		(	normalise::eval(RefDirection, U1) ->
			true
		;	U1 = direction('', [1.0, 0.0])
		),
		orthogonal_complement::eval(U1, U2).

:- end_object.


/*
FUNCTION build_axes(axis, ref_direction: direction
  ): LIST [3:3] OF direction;
LOCAL
  d1 : direction;
  d2 : direction;
END_LOCAL;
d1 := NVL(normalise(axis),dummy_gri || direction([0,0,1]));
d2 := first_proj_axis(d1,ref_direction);
RETURN([d2,normalise(cross_product(d1,d2)).orientation,d1]);
END_FUNCTION; -- build_axes
*/

:- object(build_axes).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(eval/3).
	:- mode(eval(+direction, +direction, -list(direction)), one).
  	:- info(eval/3,
		[comment is '.',
		 argnames is ['Axis', 'RefDirection', 'Directions']]).

	eval(Axis, RefDirection, [U1, U2, U3]) :-
		(	normalise::eval(Axis, U3) ->
			true
		;	U3 = direction('', [0.0, 0.0, 1.0])
		),
		first_proj_axis::eval(U3, RefDirection, U1),
		cross_product::eval(U3, U1, Product),
		normalise::eval(Product, NProduct),
		NProduct::orientation(U2).

:- end_object.


/*
FUNCTION cc_design_date_time_correlation
(e : cc_design_date_and_time_assignment ) : BOOLEAN;
LOCAL
  dt_role : STRING;
END_LOCAL;
  dt_role := e\date_and_time_assignment.role.name;
CASE dt_role OF
  'creation_date'		 : IF SIZEOF (e.items) <>
							  SIZEOF (QUERY (x <* e.items |
							  'CONFIG_CONTROL_DESIGN.' +
							  'PRODUCT_DEFINITION'
							  IN TYPEOF (x)))
							  THEN RETURN(FALSE);
							END_IF;
  'request_date'		 : IF SIZEOF (e.items) <>
							  SIZEOF (QUERY (x <* e.items |
							  SIZEOF (
							  ['CONFIG_CONTROL_DESIGN.CHANGE_REQUEST',
							  'CONFIG_CONTROL_DESIGN.START_REQUEST'] *
							  TYPEOF (x)) = 1))
							  THEN RETURN(FALSE);
							END_IF;
  'release_date'		 : IF SIZEOF (e.items) <>
							  SIZEOF (QUERY (x <* e.items |
							  SIZEOF (
							  ['CONFIG_CONTROL_DESIGN.CHANGE',
							  'CONFIG_CONTROL_DESIGN.START_WORK'] *
							  TYPEOF (x)) = 1))
							  THEN RETURN(FALSE);
							END_IF;
  'start_date'		  : IF SIZEOF (e.items) <>
							  SIZEOF (QUERY (x <* e.items |
							  SIZEOF (
							  ['CONFIG_CONTROL_DESIGN.CHANGE',
							  'CONFIG_CONTROL_DESIGN.START_WORK'] *
							  TYPEOF (x)) = 1))
							  THEN RETURN(FALSE);
							END_IF;
  'sign_off_date'		 : IF SIZEOF (e.items) <>
							  SIZEOF (QUERY (x <* e.items |
							  'CONFIG_CONTROL_DESIGN.' +
							  'APPROVAL_PERSON_ORGANIZATION'
							  IN TYPEOF (x)))
							  THEN RETURN(FALSE);
							END_IF;
  'contract_date'		 : IF SIZEOF (e.items) <>
							  SIZEOF (QUERY (x <* e.items |
							  'CONFIG_CONTROL_DESIGN.CONTRACT'
							  IN TYPEOF (x)))
							  THEN RETURN(FALSE);
							END_IF;
  'certification_date'	: IF SIZEOF (e.items) <>
							  SIZEOF (QUERY (x <* e.items |
							  'CONFIG_CONTROL_DESIGN.CERTIFICATION'
							  IN TYPEOF (x)))
							  THEN RETURN(FALSE);
							END_IF;
  'classification_date'   : IF SIZEOF (e.items) <>
							  SIZEOF (QUERY (x <* e.items |
							  'CONFIG_CONTROL_DESIGN.' +
							  'SECURITY_CLASSIFICATION'
							  IN TYPEOF (x)))
							  THEN RETURN(FALSE);
							END_IF;
  'declassification_date' : IF SIZEOF (e.items) <>
							  SIZEOF (QUERY (x <* e.items |
							  'CONFIG_CONTROL_DESIGN.' +
							  'SECURITY_CLASSIFICATION'
							  IN TYPEOF (x)))
							  THEN RETURN(FALSE);
							END_IF;
  OTHERWISE : RETURN(TRUE);
END_CASE;
RETURN (TRUE);
END_FUNCTION;  -- cc_design_date_time_correlation
*/

:- object(cc_design_date_time_correlation).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(true/1).
	:- mode(true(+cc_design_date_and_time_assignment), zero_or_one).
	:- info(true/1,
		[comment is '.',
		 argnames is ['Assignment']]).

	true(Assignment) :-
		Assignment::items(Items),
		Assignment::role(Role),
		Role::name(Name),
		case(Name, Items).

	case(creation_date, Items) :-
		!,
		check_ancestor(Items, product_definition).
	case(request_date, Items) :-
		!,
		check_ancestor(Items, change_request, start_request).
	case(release_date, Items) :-
		!,
		check_ancestor(Items, change, start_work).
	case(start_date, Items) :- 
		!,
		check_ancestor(Items, change, start_work).
	case(sign_off_date, Items) :-
		!,
		check_ancestor(Items, approval_person_organization).
	case(contract_date, Items) :-
		!,
		check_ancestor(Items, contract).
	case(certification_date, Items) :-
		!,
		check_ancestor(Items, certification).
	case(classification_date, Items) :-
		!,
		check_ancestor(Items, security_classification).
	case(declassification_date, Items) :-
		!,
		check_ancestor(Items, security_classification).
	case(_, _).

	check_ancestor([],_).
	check_ancestor([Item| Items], Ancestor) :-
		Item::ancestor(Ancestor), !,
		check_ancestor(Items, Ancestor).

	check_ancestor([],_,_).
	check_ancestor([Item| Items], Ancestor1, Ancestor2) :-
		(	Item::ancestor(Ancestor1) ->
			true
		;	Item::ancestor(Ancestor2), !
		),
		check_ancestor(Items, Ancestor1, Ancestor2).
		
:- end_object.


/*
FUNCTION cc_design_person_and_organization_correlation
 (e : cc_design_person_and_organization_assignment ) : BOOLEAN;
 LOCAL
   po_role : STRING;
 END_LOCAL;
   po_role := e\person_and_organization_assignment.role.name;
 CASE po_role OF
  'request_recipient'	  : IF SIZEOF (e.items) <>
							   SIZEOF (QUERY (x <* e.items |
							   SIZEOF(['CONFIG_CONTROL_DESIGN.' +
							   'CHANGE_REQUEST',
							   'CONFIG_CONTROL_DESIGN.' +
							   'START_REQUEST'] *
							   TYPEOF (x)) = 1))
							   THEN RETURN(FALSE);
							 END_IF;
  'initiator'			  : IF SIZEOF (e.items) <>
							   SIZEOF (QUERY (x <* e.items |
							   SIZEOF(['CONFIG_CONTROL_DESIGN.' +
							   'CHANGE_REQUEST',
							   'CONFIG_CONTROL_DESIGN.' +
							   'START_REQUEST',
							   'CONFIG_CONTROL_DESIGN.' +
							   'START_WORK',
							   'CONFIG_CONTROL_DESIGN.' +
							   'CHANGE'] *
							   TYPEOF (x)) = 1))
							   THEN RETURN(FALSE);
							 END_IF;
  'creator'				: IF SIZEOF (e.items) <>
							   SIZEOF (QUERY (x <* e.items |
							   SIZEOF (['CONFIG_CONTROL_DESIGN.' +
							   'PRODUCT_DEFINITION_FORMATION',
							   'CONFIG_CONTROL_DESIGN.' +
							   'PRODUCT_DEFINITION'] *
							   TYPEOF (x)) = 1))
							   THEN RETURN (FALSE);
							 END_IF;
  'part_supplier'		  : IF SIZEOF (e.items) <>
							   SIZEOF (QUERY (x <* e.items |
							   'CONFIG_CONTROL_DESIGN.' +
							   'PRODUCT_DEFINITION_FORMATION'
							   IN TYPEOF (x)))
							   THEN RETURN(FALSE);
							 END_IF;
  'design_supplier'		: IF SIZEOF (e.items) <>
							   SIZEOF (QUERY (x <* e.items |
							   'CONFIG_CONTROL_DESIGN.' +
							   'PRODUCT_DEFINITION_FORMATION'
							   IN TYPEOF (x)))
							   THEN RETURN(FALSE);
							 END_IF;
  'design_owner'		   : IF SIZEOF (e.items) <>
							   SIZEOF (QUERY (x <* e.items |
							   'CONFIG_CONTROL_DESIGN.PRODUCT'
							   IN TYPEOF (x)))
							   THEN RETURN(FALSE);
							 END_IF;
  'configuration_manager'  : IF SIZEOF (e.items) <>
							   SIZEOF (QUERY (x <* e.items |
							   'CONFIG_CONTROL_DESIGN.' +
							   'CONFIGURATION_ITEM'
							   IN TYPEOF (x)))
							   THEN RETURN(FALSE);
							 END_IF;
  'contractor'			 : IF SIZEOF (e.items) <>
							   SIZEOF (QUERY (x <* e.items |
							   'CONFIG_CONTROL_DESIGN.CONTRACT'
							   IN TYPEOF (x)))
							   THEN RETURN(FALSE);
							 END_IF;
  'classification_officer' : IF SIZEOF (e.items) <>
							   SIZEOF (QUERY (x <* e.items |
							   'CONFIG_CONTROL_DESIGN.' +
							   'SECURITY_CLASSIFICATION'
							   IN TYPEOF (x))) THEN
							   RETURN(FALSE);
							 END_IF;
  OTHERWISE : RETURN(TRUE);
END_CASE;
RETURN (TRUE);
END_FUNCTION; -- cc_design_person_and_organization_correlation
*/

:- object(cc_design_person_and_organization_correlation).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(true/1).
	:- mode(true(+cc_design_person_and_organization_assignment), zero_or_one).
	:- info(true/1,
		[comment is '.',
		 argnames is ['Assignment']]).

	true(Assignment) :-
		Assignment::role(Role),
		Role::name(Name),
		Assignment::items(Items),
		case(Name, Items).

	case(request_recipient, Items) :-
		!,
		check_ancestors(Items, [change_request, start_request]).
	case(initiator, Items) :-
		!,
		check_ancestors(Items, [change_request, start_request, start_work, change]).
	case(creator, Items) :-
		!,
		check_ancestors(Items, [product_definition_formation, product_definition]).
	case(part_supplier, Items) :-
		!,
		check_ancestors(Items, [product_definition_formation]).		
	case(design_supplier, Items) :-
		!,
		check_ancestors(Items, [product_definition_formation]).		
	case(design_owner, Items) :-
		!,
		check_ancestors(Items, [product]).
	case(configuration_manager, Items) :-
		!,
		check_ancestors(Items, [configuration_item]).
	case(contractor, Items) :-
		!,
		check_ancestors(Items, [contract]).
	case(classification_officer, Items) :-
		!,
		check_ancestors(Items, [security_classification]).
	case(_, _).

	check_ancestors([], _).
	check_ancestors([Item| Items], Ancestors) :-
		list::member(Ancestor, Ancestors),
		Item::ancestor(Ancestor),
		!,
		check_ancestors(Items, Ancestors).

:- end_object.


/*
FUNCTION closed_shell_reversed(a_shell: closed_shell
  ): oriented_closed_shell;
LOCAL
  the_reverse : oriented_closed_shell;
END_LOCAL;
IF 'CONFIG_CONTROL_DESIGN.ORIENTED_CLOSED_SHELL' IN TYPEOF(a_shell)
	 THEN
  the_reverse := dummy_tri || connected_face_set(a_shell\
	  connected_face_set.cfs_faces) || closed_shell() ||
	  oriented_closed_shell(a_shell\oriented_closed_shell.
	  closed_shell_element,NOT a_shell\oriented_closed_shell.
	  orientation);
ELSE
  the_reverse := dummy_tri || connected_face_set(a_shell\
	  connected_face_set.cfs_faces) || closed_shell() ||
	  oriented_closed_shell(a_shell,FALSE);
END_IF;
RETURN(the_reverse);
END_FUNCTION; -- closed_shell_reversed
*/

:- object(closed_shell_reversed,
	imports(reversing_function)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(eval/2).
	:- mode(eval(+closed_shell, -oriented_closed_shell), one).
  	:- info(eval/2,
		[comment is '.',
		 argnames is ['Shell', 'Reversed']]).
		 
	eval(Shell, Reversed) :-
		(	Shell::ancestor(oriented_closed_shell) ->
			Shell::closed_shell_element(ShellElement),
			::reversed_orientation(Shell, Orientation),
			Reversed = oriented_closed_shell('', ShellElement, Orientation)
		;	Shell::ancestor(closed_shell) ->
			Reversed = oriented_closed_shell('', Shell, false)
		;	fail
		).

:- end_object.


/*
FUNCTION conditional_reverse(p: BOOLEAN;
		   an_item: reversible_topology): reversible_topology;
IF p THEN RETURN(an_item);
ELSE
  RETURN(topology_reversed(an_item));
END_IF;
END_FUNCTION; -- conditional_reverse
*/

:- object(conditional_reverse).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(eval/3).
	:- mode(eval(+boolean, +reversible_topology, -reversible_topology), one).
   	:- info(eval/3,
		[comment is '.',
		 argnames is ['Boolean', 'Topology', 'Result']]).

	eval(true, Topology, Topology).
	eval(false, Topology, Reversed) :-
		topology_reversed::eval(Topology, Reversed).

:- end_object.


/*
FUNCTION constraints_composite_curve_on_surface(
		   c: composite_curve_on_surface): BOOLEAN;
LOCAL
  n_segments : INTEGER := SIZEOF(c.segments);
END_LOCAL;
REPEAT k := 1 TO n_segments BY 1;
  IF (NOT ('CONFIG_CONTROL_DESIGN.PCURVE' IN TYPEOF(c\composite_curve.
	  segments[k].parent_curve))) AND (NOT (
	  'CONFIG_CONTROL_DESIGN.SURFACE_CURVE' IN TYPEOF(c\composite_curve
	  .segments[k].parent_curve))) AND (NOT (
	  'CONFIG_CONTROL_DESIGN.COMPOSITE_CURVE_ON_SURFACE' IN TYPEOF(c\
	  composite_curve.segments[k].parent_curve))) THEN
	RETURN(FALSE);
  END_IF;
END_REPEAT;
RETURN(TRUE);
END_FUNCTION; -- constraints_composite_curve_on_surface
*/

:- object(constraints_composite_curve_on_surface).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(true/1).
	:- mode(true(+composite_curve_on_surface), zero_or_one).
	:- info(true/1,
		[comment is '.',
		 argnames is ['Curve']]).

	true(Curve) :-
		Curve::segments(Segments),
		check_segments(Segments).

	check_segments([]).
	check_segments([Segment| Segments]) :-
		Segment::parent_curve(Curve),
		Curve::(	ancestor(pcurve)
				;	ancestor(surface_curve)
				;	ancestor(composite_curve_on_surface)
				), !,
		check_segments(Segments).

:- end_object.


/*
FUNCTION constraints_geometry_shell_based_surface_model(
		   m: shell_based_surface_model): BOOLEAN;
LOCAL
  result : BOOLEAN := TRUE;
END_LOCAL;
REPEAT j := 1 TO SIZEOF(m.sbsm_boundary) BY 1;
  IF (NOT ('CONFIG_CONTROL_DESIGN.OPEN_SHELL' IN TYPEOF(m.
	  sbsm_boundary[j]))) AND (NOT (
	  'CONFIG_CONTROL_DESIGN.CLOSED_SHELL' IN
	   TYPEOF(m.sbsm_boundary[j]))) THEN
	result := FALSE;
	RETURN(result);
  END_IF;
END_REPEAT;
RETURN(result);
END_FUNCTION; -- constraints_geometry_shell_based_surface_model
*/

:- object(constraints_geometry_shell_based_surface_model).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(true/1).
	:- mode(true(+shell_based_surface_model), zero_or_one).
	:- info(true/1,
		[comment is '.',
		 argnames is ['Model']]).

	true(Model) :-
		 Model::sbsm_boundary(Shells),
		 check_boundary(Shells).

	check_boundary([]).
	check_boundary([Shell| Shells]) :-
		Shell::(	ancestor(open_shell)
				;	ancestor(closed_shell)
				), !,
		check_boundary(Shells).

:- end_object.


/*
FUNCTION constraints_geometry_shell_based_wireframe_model(
		   m: shell_based_wireframe_model): BOOLEAN;
LOCAL
  result : BOOLEAN := TRUE;
END_LOCAL;
REPEAT j := 1 TO SIZEOF(m.sbwm_boundary) BY 1;
  IF (NOT ('CONFIG_CONTROL_DESIGN.WIRE_SHELL' IN TYPEOF(m.
	  sbwm_boundary[j]))) AND (NOT (
	  'CONFIG_CONTROL_DESIGN.VERTEX_SHELL' IN
	  TYPEOF(m.sbwm_boundary[j])))
	  THEN result := FALSE;
	RETURN(result);
  END_IF;
END_REPEAT;
RETURN(result);
END_FUNCTION; -- constraints_geometry_shell_based_wireframe_model
*/

:- object(constraints_geometry_shell_based_wireframe_model).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(true/1).
	:- mode(true(+shell_based_wireframe_model), zero_or_one).
	:- info(true/1,
		[comment is '.',
		 argnames is ['Model']]).

	true(Model) :-
		Model::sbwm_boundary(Shells),
		check_boundary(Shells).

	check_boundary([]).
	check_boundary([Shell| Shells]) :-
		Shell::(	ancestor(wire_shell)
				;	ancestor(vertex_shell)
				), !,
		check_boundary(Shells).

:- end_object.


/*
FUNCTION constraints_param_b_spline(degree, up_knots, up_cp: INTEGER;
		   knot_mult: LIST OF INTEGER;
		   knots: LIST OF parameter_value): BOOLEAN;
LOCAL
  k	  : INTEGER;
  sum	: INTEGER;
  result : BOOLEAN := TRUE;
END_LOCAL;
sum := knot_mult[1];
REPEAT i := 2 TO up_knots BY 1;
  sum := sum + knot_mult[i];
END_REPEAT;
IF (degree < 1) OR (up_knots < 2) OR (up_cp < degree) OR (sum <> (
	degree + up_cp + 2)) THEN result := FALSE;
  RETURN(result);
END_IF;
k := knot_mult[1];
IF (k < 1) OR (k > (degree + 1)) THEN result := FALSE;
  RETURN(result);
END_IF;
REPEAT i := 2 TO up_knots BY 1;
  IF (knot_mult[i] < 1) OR (knots[i] <= knots[i - 1]) THEN
	result := FALSE;
	RETURN(result);
  END_IF;
  k := knot_mult[i];
  IF (i < up_knots) AND (k > degree) THEN
	result := FALSE;
	RETURN(result);
  END_IF;
  IF (i = up_knots) AND (k > (degree + 1)) THEN
	result := FALSE;
	RETURN(result);
  END_IF;
END_REPEAT;
RETURN(result);
END_FUNCTION; -- constraints_param_b_spline
*/

:- object(constraints_param_b_spline).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(true/5).
	:- mode(true(+integer, +integer, +integer, +list(integer), +list(float)), zero_or_one).
  	:- info(true/5,
		[comment is '.',
		 argnames is ['Degree', 'Up_knots', 'Up_cp', 'Knot_mult', 'Knots']]).

	true(Degree, Up_knots, Up_cp, Knot_mult, Knots) :-
	% Degree is the order of the b spline polynomial (i.e. Degree =1 are linear functions, Degree=2 are quadratic)
	% Up_knots is the highest index of the Knot_mult array, since indexing for this array starts at 1 Up_knots is also
	% the number of Knot_mult
	% Up_cp is the highest index of the control points list, indexing for this array starts at 0, so Up_cp = N-1, where
	% N is the number of control points
	% Knot_mult is a list of knot multiplicities
	% Knots is the list of knot values
		
		Degree >= 1,
		Knot_mult = [_,_|_],	% at least two knot values/multiplicities
		Up_cp >= Degree,
		list::length(Knot_mult, Up_knots),
		list::length(Knots, Up_knots),
		
		numberlist::sum(Knot_mult, K),
		K is Degree + Up_cp + 2,

		check_multiplicities(Knot_mult, Degree),
		sort(Knots, Knots).	% Knots is a list of strictly increasing knot values
 
		
	check_multiplicities([M1| More], Degree) :-
	   check_endpoint_multiplicity(M1, Degree),	  % the first knot multiplicity
	   check_more_multiplicities(More, Degree).
		
	check_more_multiplicities([M1, M2| More], Degree) :-
		!,
		check_interior_multiplicity(M1, Degree),
		check_more_multiplicities([M2| More], Degree).

	check_more_multiplicities([Mlast], Degree) :-
		check_endpoint_multiplicity(Mlast, Degree). % the last knot multiplicity

	
	check_endpoint_multiplicity(M, Degree) :-
		DegPlusOne is Degree + 1,
		1 =< DegPlusOne, DegPlusOne >= M.

	check_interior_multiplicity(M, Degree) :-
		1 =< Degree, Degree >= M.
		
:- end_object.


/*
FUNCTION constraints_rectangular_composite_surface(
		   s: rectangular_composite_surface): BOOLEAN;
REPEAT i := 1 TO s.n_u BY 1;
  REPEAT j := 1 TO s.n_v BY 1;
	IF NOT (('CONFIG_CONTROL_DESIGN.B_SPLINE_SURFACE' IN TYPEOF(s.
		segments[i][j].parent_surface)) OR (
		'CONFIG_CONTROL_DESIGN.RECTANGULAR_TRIMMED_SURFACE' IN TYPEOF(s
		.segments[i][j].parent_surface))) THEN
	  RETURN(FALSE);
	END_IF;
  END_REPEAT;
END_REPEAT;
REPEAT i := 1 TO s.n_u - 1 BY 1;
  REPEAT j := 1 TO s.n_v BY 1;
	IF s.segments[i][j].u_transition = discontinuous THEN
	  RETURN(FALSE);
	END_IF;
  END_REPEAT;
END_REPEAT;
REPEAT i := 1 TO s.n_u BY 1;
  REPEAT j := 1 TO s.n_v - 1 BY 1;
	IF s.segments[i][j].v_transition = discontinuous THEN
	  RETURN(FALSE);
	END_IF;
  END_REPEAT;
END_REPEAT;
RETURN(TRUE);
END_FUNCTION; -- constraints_rectangular_composite_surface
*/

:- object(constraints_rectangular_composite_surface).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(true/1).
	:- mode(true(+rectangular_composite_surface), zero_or_one).
	:- info(true/1,
		[comment is '.',
		 argnames is ['Surface']]).

	true(Surface) :-
		Surface::segments(SRows),
		\+ (	list::member(SRow,SRows),
				list::member(Segment,SRow),
				Segment::parent_surface(Parent),
				\+ Parent::(ancestor(b_spline_surface); ancestor(rectangular_trimmed_surface))
			),
		delete_final_element(SRows,SRowsP),
		\+ (	list::member(SRow,SRowsP),
				list::member(Segment,SRow),
				\+ Segment::u_transition(discontinuous)
			),
		\+ (	list::member(SRow,SRows),
				delete_final_element(SRow, SRowP),
				list::member(Segment,SRowP),
				\+ Segment::v_transition(discontinuous)
			).

	delete_final_element([_], []) :- !.
	delete_final_element([], []).
	delete_final_element([X| Xrest], [X| XrestP]) :-
		delete_final_element(Xrest, XrestP).

:- end_object.


/*
FUNCTION cross_product(arg1, arg2: direction): vector;
LOCAL
  v2	 : LIST [3:3] OF REAL;
  v1	 : LIST [3:3] OF REAL;
  mag	: REAL;
  res	: direction;
  result : vector;
END_LOCAL;
IF (NOT EXISTS(arg1)) OR (arg1.dim = 2) OR (NOT EXISTS(arg2)) OR (arg2
	.dim = 2) THEN RETURN(?);
ELSE
  BEGIN
	v1 := normalise(arg1).direction_ratios;
	v2 := normalise(arg2).direction_ratios;
	res := dummy_gri || direction([(v1[2] * v2[3]) - (v1[3] * v2[2]),(
		v1[3] * v2[1]) - (v1[1] * v2[3]),(v1[1] * v2[2]) - (v1[2] * v2[
		1])]);
	mag := 0;
	REPEAT i := 1 TO 3 BY 1;
	  mag := mag + (res.direction_ratios[i] * res.direction_ratios[i]);
	END_REPEAT;
	IF mag > 0 THEN
	  result := dummy_gri || vector(res,SQRT(mag));
	ELSE
	  result := dummy_gri || vector(arg1,0);
	END_IF;
	RETURN(result);
  END;
END_IF;
END_FUNCTION; -- cross_product
*/

:- object(cross_product,
	imports(geometry_functions)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(eval/3).
	:- mode(eval(+direction, +direction, -vector),one).
   	:- info(eval/3,
		[comment is '.',
		 argnames is ['Vector1', 'Vector2', 'Product']]).

	eval(Arg1, Arg2, vector('', direction('', DirectionRatios), Mag)) :-
		Arg1::direction_ratios([ X1, Y1, Z1]),
		Arg2::direction_ratios([ X2, Y2, Z2]),
		::pythagorean_magnitude([X1, Y1, Z1], M1),
		::pythagorean_magnitude([X2, Y2, Z2], M2),
		
		XCP is (Y1*Z2-Z1*Y2),
		YCP is (Z1*X2-X1*Z2),
		ZCP is (X1*Y2-X2*Y1),

		::pythagorean_magnitude([XCP, YCP, ZCP], MagTmp),
		(	abs(MagTmp/(M1*M2)) < 1.0e-5 ->
			Mag = 0.0,
			DirectionRatios = [X1, Y1, Z1]
		;	Mag = MagTmp,
			DirectionRatios = [XCP, YCP, ZCP]
		).

:- end_object.


/*
FUNCTION curve_weights_positive(b: rational_b_spline_curve): BOOLEAN;
LOCAL
  result : BOOLEAN := TRUE;
END_LOCAL;
REPEAT i := 0 TO b.upper_index_on_control_points BY 1;
  IF b.weights[i] <= 0 THEN result := FALSE;
	RETURN(result);
  END_IF;
END_REPEAT;
RETURN(result);
END_FUNCTION; -- curve_weights_positive
*/

:- object(curve_weights_positive).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(true/1).
	:- mode(true(+rational_b_spline_curve), zero_or_one).
	:- info(true/1,
		[comment is '.',
		 argnames is ['Curve']]).

	true(Curve) :-
		Curve::weights(Weights),
		all_positive(Weights).

	all_positive([]).
	all_positive([Weight| Weights]) :-
		Weight > 0,
		all_positive(Weights).

:- end_object.


/*
FUNCTION derive_dimensional_exponents(x: unit): dimensional_exponents;
LOCAL
  i	  : INTEGER;
  result : dimensional_exponents := dimensional_exponents(0,0,0,0,0,0,
			0);
END_LOCAL;
IF 'CONFIG_CONTROL_DESIGN.DERIVED_UNIT' IN TYPEOF(x) THEN
  REPEAT i := LOINDEX(x.elements) TO HIINDEX(x.elements) BY 1;
		result.length_exponent := result.length_exponent +
		(x.elements[i].
		exponent * x.elements[i].unit.dimensions.length_exponent);
		result.mass_exponent := result.mass_exponent + (x.elements[i].
		exponent * x.elements[i].unit.dimensions.mass_exponent);
		result.time_exponent := result.time_exponent + (x.elements[i].
		exponent * x.elements[i].unit.dimensions.time_exponent);
		result.electric_current_exponent := result.
		electric_current_exponent + (x.elements[i].exponent * x.
		elements[i].unit.dimensions.electric_current_exponent);
		result.thermodynamic_temperature_exponent := result.
		thermodynamic_temperature_exponent + (x.elements[i].exponent *
		x.elements[i].unit.dimensions.
		thermodynamic_temperature_exponent);
		result.amount_of_substance_exponent := result.
		amount_of_substance_exponent + (x.elements[i].exponent * x.
		elements[i].unit.dimensions.amount_of_substance_exponent);
		result.luminous_intensity_exponent := result.
		luminous_intensity_exponent + (x.elements[i].exponent * x.
		elements[i].unit.dimensions.luminous_intensity_exponent);
  END_REPEAT;
ELSE
  result := x.dimensions;
END_IF;
RETURN(result);
END_FUNCTION; -- derive_dimensional_exponents
*/

:- object(derive_dimensional_exponents).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(eval/2).
	:- mode(eval(+unit, -dimensional_exponents), one).
  	:- info(eval/2,
		[comment is '.',
		 argnames is ['Unit', 'Exponents']]).

	eval(Unit, Exponents) :-
		Unit::dimensions(Exponents).

:- end_object.


/*
FUNCTION dimension_of(item: geometric_representation_item
  ): dimension_count;
LOCAL
  x : SET OF representation;
  y : representation_context;
END_LOCAL;
x := using_representations(item);
y := x[1].context_of_items;
RETURN(y\geometric_representation_context.coordinate_space_dimension);
END_FUNCTION; -- dimension_of
*/

:- object(dimension_of).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(eval/2).
	:- mode(eval(+geometric_representation_item, -dimension_count), one).
  	:- info(eval/2,
		[comment is '.',
		 argnames is ['Item', 'Dimension']]).

	eval(Item, Dimension) :-
		using_representations::eval(Item,[Rep|_]),
		Rep::context_of_items(Context),
 		Context::coordinate_space_dimension(Dimension).

:- end_object.


/*
FUNCTION dimensions_for_si_unit(n: si_unit_name
  ): dimensional_exponents;
CASE n OF
  metre		  :	RETURN(dimensional_exponents(1,0,0,0,0,0,0));
  gram		   :	RETURN(dimensional_exponents(0,1,0,0,0,0,0));
  second		 :	RETURN(dimensional_exponents(0,0,1,0,0,0,0));
  ampere		 :	RETURN(dimensional_exponents(0,0,0,1,0,0,0));
  kelvin		 :	RETURN(dimensional_exponents(0,0,0,0,1,0,0));
  mole		   :	RETURN(dimensional_exponents(0,0,0,0,0,1,0));
  candela		:	RETURN(dimensional_exponents(0,0,0,0,0,0,1));
  radian		 :	RETURN(dimensional_exponents(0,0,0,0,0,0,0));
  steradian	  :	RETURN(dimensional_exponents(0,0,0,0,0,0,0));
  hertz		  :	RETURN(dimensional_exponents(0,0,-1,0,0,0,0));
  newton		 :	RETURN(dimensional_exponents(1,1,-2,0,0,0,0));
  pascal		 :	RETURN(dimensional_exponents(-1,1,-2,0,0,0,0));
  joule		  :	RETURN(dimensional_exponents(2,1,-2,0,0,0,0));
  watt		   :	RETURN(dimensional_exponents(2,1,-3,0,0,0,0));
  coulomb		:	RETURN(dimensional_exponents(0,0,1,1,0,0,0));
  volt		   :	RETURN(dimensional_exponents(2,1,-3,-1,0,0,0));
  farad		  :	RETURN(dimensional_exponents(-2,-1,4,1,0,0,0));
  ohm			:	RETURN(dimensional_exponents(2,1,-3,-2,0,0,0));
  siemens		:	RETURN(dimensional_exponents(-2,-1,3,2,0,0,0));
  weber		  :	RETURN(dimensional_exponents(2,1,-2,-1,0,0,0));
  tesla		  :	RETURN(dimensional_exponents(0,1,-2,-1,0,0,0));
  henry		  :	RETURN(dimensional_exponents(2,1,-2,-2,0,0,0));
  degree_celsius :	RETURN(dimensional_exponents(0,0,0,0,1,0,0));
  lumen		  :	RETURN(dimensional_exponents(0,0,0,0,0,0,1));
  lux			:	RETURN(dimensional_exponents(-2,0,0,0,0,0,1));
  becquerel	  :	RETURN(dimensional_exponents(0,0,-1,0,0,0,0));
  gray		   :	RETURN(dimensional_exponents(2,0,-2,0,0,0,0));
  sievert		:	RETURN(dimensional_exponents(2,0,-2,0,0,0,0));
  END_CASE;
END_FUNCTION; -- dimensions_for_si_unit
*/

:- object(dimensions_for_si_unit).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(eval/2).
	:- mode(eval(+si_unit_name, -dimensional_exponents), one).
  	:- info(eval/2,
		[comment is '.',
		 argnames is ['Unit', 'Exponents']]).

	eval(metre,				dimensional_exponents( 1, 0, 0, 0, 0, 0, 0)).
	eval(gram,				dimensional_exponents( 0, 1, 0, 0, 0, 0, 0)).
	eval(second,			dimensional_exponents( 0, 0, 1, 0, 0, 0, 0)).
	eval(ampere,			dimensional_exponents( 0, 0, 0, 1, 0, 0, 0)).
	eval(kelvin,			dimensional_exponents( 0, 0, 0, 0, 1, 0, 0)).
	eval(mole,				dimensional_exponents( 0, 0, 0, 0, 0, 1, 0)).
	eval(candela,			dimensional_exponents( 0, 0, 0, 0, 0, 0, 1)).
	eval(radian,			dimensional_exponents( 0, 0, 0, 0, 0, 0, 0)).
	eval(steradian,			dimensional_exponents( 0, 0, 0, 0, 0, 0, 0)).
	eval(hertz,				dimensional_exponents( 0, 0,-1, 0, 0, 0, 0)).
	eval(newton,			dimensional_exponents( 1, 1,-2, 0, 0, 0, 0)).
	eval(pascal,			dimensional_exponents(-1, 1,-2, 0, 0, 0, 0)).
	eval(joule,				dimensional_exponents( 2, 1,-2, 0, 0, 0, 0)).
	eval(watt,				dimensional_exponents( 2, 1,-3, 0, 0, 0, 0)).
	eval(coulomb,			dimensional_exponents( 0, 0, 1, 1, 0, 0, 0)).
	eval(volt,				dimensional_exponents( 2, 1,-3,-1, 0, 0, 0)).
	eval(farad,				dimensional_exponents(-2,-1, 4, 1, 0, 0, 0)).
	eval(ohm,				dimensional_exponents( 2, 1,-3,-2, 0, 0, 0)).
	eval(siemens,			dimensional_exponents(-2,-1, 3, 2, 0, 0, 0)).
	eval(weber,				dimensional_exponents( 2, 1,-2,-1, 0, 0, 0)).
	eval(tesla,				dimensional_exponents( 0, 1,-2,-1, 0, 0, 0)).
	eval(henry,				dimensional_exponents( 2, 1,-2,-2, 0, 0, 0)).
	eval(degree_celsius,	dimensional_exponents( 0, 0, 0, 0, 1, 0, 0)).
	eval(lumen,				dimensional_exponents( 0, 0, 0, 0, 0, 0, 1)).
	eval(lux,				dimensional_exponents(-2, 0, 0, 0, 0, 0, 1)).
	eval(becquerel,			dimensional_exponents( 0, 0,-1, 0, 0, 0, 0)).
	eval(gray,				dimensional_exponents( 2, 0,-2, 0, 0, 0, 0)).
	eval(sievert,			dimensional_exponents( 2, 0,-2, 0, 0, 0, 0)).

:- end_object.


/*
FUNCTION dot_product(arg1, arg2: direction): REAL;
LOCAL
  ndim   : INTEGER;
  scalar : REAL;
  vec1   : direction;
  vec2   : direction;
END_LOCAL;
IF (NOT EXISTS(arg1)) OR (NOT EXISTS(arg2)) THEN
  scalar := ?;
ELSE
  IF arg1.dim <> arg2.dim THEN scalar := ?;
  ELSE
	BEGIN
	  vec1 := normalise(arg1);
	  vec2 := normalise(arg2);
	  ndim := arg1.dim;
	  scalar := 0;
	  REPEAT i := 1 TO ndim BY 1;
		scalar := scalar + (vec1.direction_ratios[i] * vec2.
			direction_ratios[i]);
	  END_REPEAT;
	END;
  END_IF;
END_IF;
RETURN(scalar);
END_FUNCTION; -- dot_product
*/

:- object(dot_product).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/03/23,
		comment is '.']).

	:- public(eval/3).
	:- mode(eval(+direction, +direction,-float), one).
  	:- info(eval/2,
		[comment is '.',
		 argnames is ['Unit', 'Exponents']]).
	
	 eval(Arg1, Arg2, Product) :-

		Arg1::dim(Nd),
		Arg2::dim(Nd),
		
		normalise::eval(Arg1,Vec1),
		normalise::eval(Arg2,Vec2),
		
		Vec1::direction_ratios(Ratios1),
		Vec2::direction_ratios(Ratios2),
	
		eval_sum(Ratios1, Ratios2, 0.0, Product).
		
	eval_sum([], [], Sum, Sum).
	eval_sum([X| Xs], [Y| Ys], Acc, Sum) :-
		Acc2 is X*Y + Acc,
		eval_sum(Xs, Ys, Acc2, Sum).
		
:- end_object.


/*
FUNCTION edge_reversed(an_edge: edge): oriented_edge;
LOCAL
  the_reverse : oriented_edge;
END_LOCAL;
IF 'CONFIG_CONTROL_DESIGN.ORIENTED_EDGE' IN TYPEOF(an_edge) THEN
  the_reverse := dummy_tri || edge(an_edge.edge_end,an_edge.edge_start)
	  || oriented_edge(an_edge\oriented_edge.edge_element,NOT an_edge\
	  oriented_edge.orientation);
ELSE
  the_reverse := dummy_tri || edge(an_edge.edge_end,an_edge.edge_start)
	  || oriented_edge(an_edge,FALSE);
END_IF;
RETURN(the_reverse);
END_FUNCTION; -- edge_reversed
*/

:- object(edge_reversed,
	imports(reversing_function)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(eval/2).
	:- mode(eval(+edge, -edge), one).
  	:- info(eval/2,
		[comment is '.',
		 argnames is ['Edge', 'Reversed']]).

	eval(Edge, oriented_edge('', EdgeElement, Orientation)) :-
		nonvar(Edge),
		Edge::ancestor(oriented_edge), !,
		Edge::edge_element(EdgeElement),
		::reversed_orientation(Edge, Orientation).

	eval(Edge, oriented_edge('', Edge, false)) :-
		nonvar(Edge).

:- end_object.


/*
FUNCTION face_bound_reversed(a_face_bound: face_bound): face_bound;
LOCAL
  the_reverse : face_bound;
END_LOCAL;
IF 'CONFIG_CONTROL_DESIGN.FACE_OUTER_BOUND' IN TYPEOF(a_face_bound)
	 THEN
  the_reverse := dummy_tri || face_bound(a_face_bound\face_bound.bound,
	  NOT a_face_bound\face_bound.orientation) || face_outer_bound();
ELSE
  the_reverse := dummy_tri || face_bound(a_face_bound.bound,NOT
	  a_face_bound.orientation);
END_IF;
RETURN(the_reverse);
END_FUNCTION; -- face_bound_reversed
*/

:- object(face_bound_reversed,
	imports(reversing_function)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(eval/2).
	:- mode(eval(+face_bound, -face_bound), one).
  	:- info(eval/2,
		[comment is '.',
		 argnames is ['FaceBound', 'Reversed']]).

	eval(FaceBound, face_outer_bound('', Bound, Orientation)) :-
		nonvar(FaceBound),
		FaceBound::ancestor(face_outer_bound), !,
		FaceBound::bound(Bound),
		::reversed_orientation(FaceBound, Orientation).

	eval(FaceBound, face__bound('', Bound, Orientation)) :-
		nonvar(FaceBound),
		FaceBound::bound(Bound),
		::reversed_orientation(FaceBound, Orientation).

:- end_object.


/*
FUNCTION face_reversed(a_face: face): oriented_face;
LOCAL
  the_reverse : oriented_face;
END_LOCAL;
IF 'CONFIG_CONTROL_DESIGN.ORIENTED_FACE' IN TYPEOF(a_face) THEN
  the_reverse := dummy_tri || face(set_of_topology_reversed(a_face.
	  bounds)) || oriented_face(a_face\oriented_face.face_element,NOT
	  a_face\oriented_face.orientation);
ELSE
  the_reverse := dummy_tri || face(set_of_topology_reversed(a_face.
	  bounds)) || oriented_face(a_face,FALSE);
END_IF;
RETURN(the_reverse);
END_FUNCTION; -- face_reversed
*/

:- object(face_reversed,
	imports(reversing_function)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(eval/2).
	:- mode(eval(+face, -face), one).
  	:- info(eval/2,
		[comment is '.',
		 argnames is ['Face', 'Reversed']]).

	eval(Face, oriented_face('', FaceElement, Orientation)) :-
		nonvar(Face),
		Face::ancestor(oriented_face), !,
		Face::face_element(FaceElement),
		::reversed_orientation(Face, Orientation).
   
	eval(Face, oriented_face('', Face, false)) :-
		nonvar(Face).

:- end_object.


/*
FUNCTION first_proj_axis(z_axis, arg: direction): direction;
LOCAL
  x_vec  : vector;
  v	  : direction;
  z	  : direction;
  x_axis : direction;
END_LOCAL;
IF NOT EXISTS(z_axis) THEN RETURN(?);
ELSE
  z := normalise(z_axis);
  IF NOT EXISTS(arg) THEN
	IF z.direction_ratios <> [1,0,0] THEN
	  v := dummy_gri || direction([1,0,0]);
	ELSE
	  v := dummy_gri || direction([0,1,0]);
	END_IF;
  ELSE
	IF arg.dim <> 3 THEN RETURN(?);
	END_IF;
	IF cross_product(arg,z).magnitude = 0 THEN RETURN(?);
	ELSE
	  v := normalise(arg);
	END_IF;
  END_IF;
  x_vec := scalar_times_vector(dot_product(v,z),z);
  x_axis := vector_difference(v,x_vec).orientation;
  x_axis := normalise(x_axis);
END_IF;
RETURN(x_axis);
END_FUNCTION; -- first_proj_axis
*/

:- object(first_proj_axis).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(eval/3).
	:- mode(eval(+direction, +direction, -direction), one).
   	:- info(eval/3,
		[comment is '.',
		 argnames is ['ZAxis', 'Arg', 'FirstProjAxis']]).
		 
	eval(ZAxis, FirstProjAxis) :-
		normalise::eval(ZAxis, NZAxis),
		(	\+ NZAxis::direction_ratios([1.0, 0.0, 0.0]) ->
			V = direction('', [1.0, 0.0, 0.0])
		;	V = direction('', [0.0, 1.0, 0.0])
		),
	dot_product::eval(V, NZAxis, DotProduct),
	scalar_times_vector::eval(DotProduct, ZAxis, XVec),
	vector_difference::eval(V, XVec, Difference),
	Difference::orientation(XAxis),
	normalise::eval(XAxis, FirstProjAxis).

	eval(ZAxis, Arg, FirstProjAxis) :-
		normalise::eval(ZAxis, NZAxis),
		(	cross_product::eval(Arg, NZAxis, CrossProduct), CrossProduct::magnitude(0) ->	% Z ?????????
			throw(error)
		;	normalise::eval(Arg, V)
		),
		dot_product::eval(V, NZAxis, DotProduct),
		scalar_times_vector::eval(DotProduct, ZAxis, XVec),
		vector_difference::eval(V, XVec, Difference),
		Difference::orientation(XAxis),
		normalise::eval(XAxis, FirstProjAxis).
		
:- end_object.


/*
This set of gbsf_??? functions is used to define restrictions placed on the geometry used
in the entity 
*/
/*
FUNCTION gbsf_check_curve(cv: curve): BOOLEAN;
IF SIZEOF(['CONFIG_CONTROL_DESIGN.BOUNDED_CURVE',
	'CONFIG_CONTROL_DESIGN.CONIC',
	'CONFIG_CONTROL_DESIGN.CURVE_REPLICA',
	'CONFIG_CONTROL_DESIGN.LINE',
	'CONFIG_CONTROL_DESIGN.OFFSET_CURVE_3D'] * TYPEOF(cv)) > 1 THEN
  RETURN(FALSE);
ELSE
  IF SIZEOF(['CONFIG_CONTROL_DESIGN.CIRCLE',
	  'CONFIG_CONTROL_DESIGN.ELLIPSE'] * TYPEOF(cv)) = 1 THEN
	RETURN(TRUE);
  ELSE
	IF (('CONFIG_CONTROL_DESIGN.B_SPLINE_CURVE' IN TYPEOF(cv)) AND (cv
		\b_spline_curve.self_intersect = FALSE)) OR (cv\b_spline_curve.
		self_intersect = UNKNOWN) THEN
	  RETURN(TRUE);
	ELSE
	  IF (('CONFIG_CONTROL_DESIGN.COMPOSITE_CURVE' IN TYPEOF(cv)) AND
		  (cv\composite_curve.self_intersect = FALSE)) OR (cv\
		  composite_curve.self_intersect = UNKNOWN) THEN
		RETURN(SIZEOF(QUERY ( seg <* cv\composite_curve.segments | (
			NOT gbsf_check_curve(seg.parent_curve)) )) = 0);
	  ELSE
		IF 'CONFIG_CONTROL_DESIGN.CURVE_REPLICA' IN TYPEOF(cv) THEN
		  RETURN(gbsf_check_curve(cv\curve_replica.parent_curve));
		ELSE
		  IF ('CONFIG_CONTROL_DESIGN.OFFSET_CURVE_3D' IN TYPEOF(cv))
			  AND ((cv\offset_curve_3d.self_intersect = FALSE) OR (cv\
			  offset_curve_3d.self_intersect = UNKNOWN)) AND (NOT (
			  'CONFIG_CONTROL_DESIGN.POLYLINE' IN
			  TYPEOF(cv.basis_curve))) THEN
			RETURN(gbsf_check_curve(cv\offset_curve_3d.basis_curve));
		  ELSE
			IF 'CONFIG_CONTROL_DESIGN.PCURVE' IN TYPEOF(cv) THEN
			  RETURN(gbsf_check_curve(cv\pcurve.reference_to_curve\
				  representation.items[1]) AND gbsf_check_surface(cv\
				  pcurve.basis_surface));
			ELSE
			  IF 'CONFIG_CONTROL_DESIGN.POLYLINE' IN TYPEOF(cv) THEN
				IF SIZEOF(cv\polyline.points) >= 3 THEN
				  RETURN(TRUE);
				END_IF;
			  ELSE
				IF 'CONFIG_CONTROL_DESIGN.SURFACE_CURVE' IN TYPEOF(cv)
					 THEN
				  IF gbsf_check_curve(cv\surface_curve.curve_3d) THEN
					REPEAT i := 1 TO SIZEOF(cv\surface_curve.
						associated_geometry) BY 1;
					  IF 'CONFIG_CONTROL_DESIGN.SURFACE' IN TYPEOF(cv\
						  surface_curve.associated_geometry[i]) THEN
						IF NOT gbsf_check_surface(cv\surface_curve.
							associated_geometry[i]) THEN
						  RETURN(FALSE);
						END_IF;
					  ELSE
						IF 'CONFIG_CONTROL_DESIGN.PCURVE' IN TYPEOF(cv
							\surface_curve.associated_geometry[i])
							 THEN
						  IF NOT gbsf_check_curve(cv\surface_curve.
							  associated_geometry[i]) THEN
							RETURN(FALSE);
						  END_IF;
						END_IF;
					  END_IF;
					END_REPEAT;
					RETURN(TRUE);
				  END_IF;
				ELSE
				  IF 'CONFIG_CONTROL_DESIGN.TRIMMED_CURVE' IN TYPEOF(
					  cv) THEN
					IF SIZEOF(['CONFIG_CONTROL_DESIGN.LINE',
						'CONFIG_CONTROL_DESIGN.PARABOLA',
						'CONFIG_CONTROL_DESIGN.HYPERBOLA'] * TYPEOF(cv\
						trimmed_curve.basis_curve)) = 1 THEN
					  RETURN(TRUE);
					ELSE
					  RETURN(gbsf_check_curve(cv\trimmed_curve.
						  basis_curve));
					END_IF;
				  END_IF;
				END_IF;
			  END_IF;
			END_IF;
		  END_IF;
		END_IF;
	  END_IF;
	END_IF;
  END_IF;
END_IF;
RETURN(FALSE);
END_FUNCTION; -- gbsf_check_curve
*/

:- object(gbsf_check_curve).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(true/1).
	:- mode(true(+curve), zero_or_one).
	:- info(true/1,
		[comment is '.',
		 argnames is ['Curve']]).

	true(Curve) :-
		(
			setof(X,(Curve::ancestor(X),(
					 X=bounded_curve;
					 X=conic;
					 X=curve_replica;
					 X=line;
					 X=offset_curve_3d)), XList),
			XList \= [_,_|_],
		 	Curve::(ancestor(circle); ancestor(ellipse)) ->
			true
		;	Curve::ancestor(b_spline_curve) ->
			Curve::(self_intersect(false); self_intersect(unknown))
		;	Curve::ancestor(composite_curve) ->
			Curve::segments(Segments),
			all_true(Segments)
		;	Curve::ancestor(curve_replica) ->
			Curve::parent_curve(Parent),
			true(Parent)
		;	Curve::ancestor(offset_curve_3d),
			Curve::(self_intersect(false); self_intersect(unknown)),
			Curve::basis_curve(Basis),
			\+ Basis::ancestor(polyline) ->
			true(Basis)
		;	Curve::ancestor(pcurve) ->
			Curve::reference_to_curve(Reference),
			Reference::items([Item| _]),
			true(Item),
			Curve::basis_surface(Basis),
			gbsf_check_surface::true(Basis)
		;	Curve::ancestor(polyline) ->
			Curve::points([_, _, _| _])
		;	Curve::ancestor(surface_curve) ->
			Curve::curve_3d(Curve3d),
			true(Curve3d),
			Curve::associated_geometry(Geometry),
			check_associated_geometry(Geometry)
		;	Curve::ancestor(trimmed_curve) ->
			Curve::basis_curve(Basis),
			(	Basis::(ancestor(line); ancestor(parabola); ancestor(hyperbola)) ->
				true
			;	true(Basis)
			)
		;	fail
		).

	all_true([]).
	all_true([Segment| Segments]) :-
		Segment::parent_curve(Cv),
		true(Cv),
		all_true(Segments).

	check_associated_geometry([]).
	check_associated_geometry([Geometry| Geometries]) :-
		(	Geometry::ancestor(surface) ->
			gbsf_check_surface::true(Geometry)
		;	Geometry::ancestor(pcurve) ->
			true(Geometry)
		;	fail
		),
		check_associated_geometry(Geometries).

:- end_object.

/* alternate implementation of gbsf_check_curve
:- object(gbsf_check_curve).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(true/1).
	:- mode(true(+curve), zero_or_one).
	:- info(true/1,
		[comment is '.',
		 argnames is ['Curve']]).

	true(Curve) :-
		setof(X,(Curve::ancestor(X),(
				 X=bounded_curve;
				 X=conic;
				 X=curve_replica;
				 X=line;
				 X=offset_curve_3d)), XList),
		XList \= [_,_|_],
		cases(Curve), !.
		
	cases(Curve) :-
		Curve::(ancestor(circle); ancestor(ellipse)).

	cases(Curve) :-
		Curve::ancestor(b_spline_curve), !,
		Curve::(self_intersect(false);self_intersect(unknown)).

	cases(Curve) :-		
		Curve::ancestor(composite_curve), !,
		Curve::segments(Segments),
		\+ (list::member(Seg, Segments),Seg::parent_curve(Pc),\+ true(Pc)).

	cases(Curve) :-
		Curve::ancestor(curve_replica), !,
		Curve::parent_curve(Parent),
		true(Parent).
		
	cases(Curve) :-
		Curve::ancestor(offset_curve_3d), !,
		Curve::(self_intersect(false);self_intersect(unknown)),
		Curve::basis_curve(Basis),
		\+ Basis::ancestor(polyline),
		true(Basis).	

	cases(Curve) :-
		Curve::ancestor(pcurve), !,
		Curve::reference_to_curve(Reference),
		Reference::items([Item| _]),
		true(Item),
		Curve::basis_surface(Basis),
		gbsf_check_surface::true(Basis).
		
	cases(Curve) :-		
		Curve::ancestor(polyline), !,
		Curve::points([_, _, _| _]).
		
	cases(Curve) :-
		Curve::ancestor(surface_curve), !,
		Curve::curve_3d(Curve3d),
		true(Curve3d),
		Curve::associated_geometry(Geometry),
		\+ (list::member(X,Geometry), \+ (X::ancestor(surface) -> gbsf_check_surface::true(X);
										  X::ancestor(curve)   -> gbsf_check_curve::true(X))).
		
	cases(Curve) :-
		Curve::ancestor(trimmed_curve), !,
		Curve::basis_curve(Basis),
		Basis::(ancestor(line); ancestor(parabola); ancestor(hyperbola)) -> true; true(Basis).

:- end_object.

*/

/*
FUNCTION gbsf_check_point(pnt: point): BOOLEAN;
IF 'CONFIG_CONTROL_DESIGN.CARTESIAN_POINT' IN TYPEOF(pnt) THEN
  RETURN(TRUE);
ELSE
  IF 'CONFIG_CONTROL_DESIGN.POINT_ON_CURVE' IN TYPEOF(pnt) THEN
	RETURN(gbsf_check_curve(pnt\point_on_curve.basis_curve));
  ELSE
	IF 'CONFIG_CONTROL_DESIGN.POINT_ON_SURFACE' IN TYPEOF(pnt) THEN
	  RETURN(gbsf_check_surface(pnt\point_on_surface.basis_surface));
	ELSE
	  IF 'CONFIG_CONTROL_DESIGN.DEGENERATE_PCURVE' IN TYPEOF(pnt)
		   THEN
		RETURN(gbsf_check_curve(pnt\degenerate_pcurve.
			reference_to_curve\representation.items[1]) AND
			gbsf_check_surface(pnt\degenerate_pcurve.basis_surface));
	  END_IF;
	END_IF;
  END_IF;
END_IF;
RETURN(FALSE);
END_FUNCTION; -- gbsf_check_point
*/

:- object(gbsf_check_point).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(true/1).
	:- mode(true(+point), zero_or_one).
	:- info(true/1,
		[comment is '.',
		 argnames is ['Point']]).

	true(Point) :-
		(	Point::ancestor(cartesian_point) ->
			true
		;	Point::ancestor(point_on_curve) ->
			Point::basis_curve(Curve),
			gbsf_check_curve::true(Curve)
		;	Point::ancestor(point_on_surface) ->
			Point::basis_surface(Surface),
			gbsf_check_surface::true(Surface)
		;	Point::ancestor(degenerate_pcurve) ->
			Point::reference_to_curve(Reference),
			Reference::items([Item| _]),
			gbsf_check_curve::true(Item),
			Point::basis_surface(Surface),
			gbsf_check_surface::true(Surface)
		;	fail
		).

:- end_object.


/*
FUNCTION gbsf_check_surface(sf: surface): BOOLEAN;
IF (('CONFIG_CONTROL_DESIGN.B_SPLINE_SURFACE' IN TYPEOF(sf)) AND (sf\
	b_spline_surface.self_intersect = FALSE)) OR (sf\b_spline_surface.
	self_intersect = UNKNOWN) THEN RETURN(TRUE);
ELSE
  IF SIZEOF(['CONFIG_CONTROL_DESIGN.SPHERICAL_SURFACE',
	  'CONFIG_CONTROL_DESIGN.TOROIDAL_SURFACE'] * TYPEOF(sf)) = 1 THEN
	RETURN(TRUE);
  ELSE
	IF 'CONFIG_CONTROL_DESIGN.CURVE_BOUNDED_SURFACE' IN TYPEOF(sf)
		 THEN
	  IF SIZEOF(['CONFIG_CONTROL_DESIGN.CONICAL_SURFACE',
		  'CONFIG_CONTROL_DESIGN.CYLINDRICAL_SURFACE',
		  'CONFIG_CONTROL_DESIGN.PLANE'] * TYPEOF(sf\
		  curve_bounded_surface.basis_surface)) = 1 THEN
		RETURN(SIZEOF(QUERY ( bcurve <* sf\curve_bounded_surface.
			boundaries | (NOT gbsf_check_curve(bcurve)) )) = 0);
	  ELSE
		IF gbsf_check_surface(sf\curve_bounded_surface.basis_surface)
			 THEN
		  RETURN(SIZEOF(QUERY ( bcurve <* sf\curve_bounded_surface.
			  boundaries | (NOT gbsf_check_curve(bcurve)) )) = 0);
		END_IF;
	  END_IF;
	ELSE
	  IF (('CONFIG_CONTROL_DESIGN.OFFSET_SURFACE' IN TYPEOF(sf)) AND (
		  sf\offset_surface.self_intersect = FALSE)) OR (sf\
		  offset_surface.self_intersect = UNKNOWN) THEN
		RETURN(gbsf_check_surface(sf\offset_surface.basis_surface));
	  ELSE
		IF 'CONFIG_CONTROL_DESIGN.RECTANGULAR_COMPOSITE_SURFACE' IN
			TYPEOF(sf) THEN
		  REPEAT i := 1 TO SIZEOF(sf\rectangular_composite_surface.
			  segments) BY 1;
			REPEAT j := 1 TO SIZEOF(sf\rectangular_composite_surface.
				segments[i]) BY 1;
			  IF NOT gbsf_check_surface(sf\
				  rectangular_composite_surface.segments[i][j].
				  parent_surface) THEN RETURN(FALSE);
			  END_IF;
			END_REPEAT;
		  END_REPEAT;
		  RETURN(TRUE);
		ELSE
		  IF 'CONFIG_CONTROL_DESIGN.RECTANGULAR_TRIMMED_SURFACE' IN
			  TYPEOF(sf) THEN
			IF SIZEOF(['CONFIG_CONTROL_DESIGN.CONICAL_SURFACE',
				'CONFIG_CONTROL_DESIGN.CYLINDRICAL_SURFACE',
				'CONFIG_CONTROL_DESIGN.PLANE'] * TYPEOF(sf\
				rectangular_trimmed_surface.basis_surface)) = 1 THEN
			  RETURN(TRUE);
			ELSE
			  RETURN(gbsf_check_surface(sf\rectangular_trimmed_surface
				  .basis_surface));
			END_IF;
		  ELSE
			IF 'CONFIG_CONTROL_DESIGN.SURFACE_REPLICA' IN TYPEOF(sf)
				 THEN
			  RETURN(gbsf_check_surface(sf\surface_replica.
				  parent_surface));
			ELSE
			  IF 'CONFIG_CONTROL_DESIGN.SWEPT_SURFACE' IN TYPEOF(sf)
				   THEN
				RETURN(gbsf_check_curve(sf\swept_surface.swept_curve));
			  END_IF;
			END_IF;
		  END_IF;
		END_IF;
	  END_IF;
	END_IF;
  END_IF;
END_IF;
RETURN(FALSE);
END_FUNCTION; -- gbsf_check_surface
*/

:- object(gbsf_check_surface).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(true/1).
	:- mode(true(+surface), zero_or_one).
	:- info(true/1,
		[comment is '.',
		 argnames is ['Surface']]).
	
	true(Surface) :-
		cases(Surface), !.

	cases(Surface) :-
		Surface::ancestor(b_spline_surface), !,
		Surface::(self_intersect(false); self_intersect(unknown)).
		
	cases(Surface) :-
		Surface::ancestor(curve_bounded_surface), !,
		Surface::basis_surface(Basis),
		(	setof(X, (Basis::ancestor(X), (X=conical_surface; X=cylindrical_surface; X=plane)), [_])
		;	true(Basis)
		), !,
		Surface::boundaries(Boundaries),
		\+ (list::member(Boundary, Boundaries), \+ gbsf_check_curve::true(Boundary)).
		
	cases(Surface) :-
		Surface::ancestor(offset_surface), !,
		Surface::(self_intersect(false); self_intersect(unknown)), !,
		Surface::basis_surface(Basis),
		true(Basis).
		
	cases(Surface) :-
		Surface::ancestor(rectangular_composite_surface), !,
		\+ (	Surface::segments(Segments2),
				list::member(Segments, Segments2),
				list::member(Segment, Segments),
				Segment::parent_surface(Parent),
				\+ true(Parent)
			).

	cases(Surface) :-
		Surface::ancestor(rectangular_trimmed_surface), !,
		Surface::basis_surface(Basis),
		(	setof(X, (Basis::ancestor(X), (X=conical_surface; X=cylindrical_surface; X=plane)), [_])
		;	true(Basis)
		).

	cases(Surface) :-
		Surface::ancestor(surface_replica), !,
		Surface::parent_surface(Parent),
		true(Parent).
		
	cases(Surface) :-
		Surface::ancestor(swept_surface), !,
		Surface::swept_curve(Curve),
		gbsf_check_curve::true(Curve).
		
			
/*
	true(Surface) :-
		(	\+ Surface::ancestor(surface) ->
			true
		;	Surface::ancestor(b_spline_surface) ->
			Surface::self_intersect(false)
		;	Surface::ancestor(spherical_surface) ->
			%??????
		;	Surface::ancestor(curve_bounded_surface) ->
			(	
			;	
			)
		).
*/
:- end_object.


/*
FUNCTION get_basis_surface(c: curve_on_surface): SET [0:2] OF surface;
LOCAL
  surfs : SET [0:2] OF surface;
  n	 : INTEGER;
END_LOCAL;
surfs := [];
IF 'CONFIG_CONTROL_DESIGN.PCURVE' IN TYPEOF(c) THEN
  surfs := [c\pcurve.basis_surface];
ELSE
  IF 'CONFIG_CONTROL_DESIGN.SURFACE_CURVE' IN TYPEOF(c) THEN
	n := SIZEOF(c\surface_curve.associated_geometry);
	REPEAT i := 1 TO n BY 1;
	  surfs := surfs + associated_surface(c\surface_curve.
		  associated_geometry[i]);
	END_REPEAT;
  END_IF;
END_IF;
IF 'CONFIG_CONTROL_DESIGN.COMPOSITE_CURVE_ON_SURFACE' IN TYPEOF(c)
	 THEN
  n := SIZEOF(c\composite_curve.segments);
  surfs := get_basis_surface(c\composite_curve.segments[1].
	  parent_curve);
  IF n > 1 THEN
	REPEAT i := 2 TO n BY 1;
	  surfs := surfs * get_basis_surface(c\composite_curve.segments[i]
		  .parent_curve);
	END_REPEAT;
  END_IF;
END_IF;
RETURN(surfs);
END_FUNCTION; -- get_basis_surface
*/

:- object(get_basis_surface).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(eval/2).
	:- mode(eval(+curve_on_surface, -set(surface)), one).
  	:- info(eval/2,
		[comment is '.',
		 argnames is ['Curve', 'Surfaces']]).

	eval(Curve, Surfaces) :-
		(	Curve::ancestor(pcurve) ->
			Curve::basis_surface(Surface),
			Surfaces = [Surface]
		;	Curve::ancestor(surface_curve) ->
			Curve::associated_geometry(Geometry),
			geometry_surfaces(Geometry, [], Surfaces)
		;	Curve::ancestor(composite_curve_on_surface) ->
			Curve::segments([Segment| Segments]),
			Segment::parent_curve(Parent),
			eval(Parent, Surfs),
			segments_surfaces(Segments, Surfs, Surfaces)
		;	fail
		).

	geometry_surfaces([], Surfs, Surfaces) :-
		sort(Surfs, Surfaces).
	geometry_surfaces([Geometry| Geometrys], Surfs, Surfaces) :-
		associated_surface::eval(Geometry, GeometrySurfaces),
		set::union(Surfs, GeometrySurfaces, Surfs2),
		geometry_surfaces(Geometrys, Surfs2, Surfaces).

	segments_surfaces([], Surfs, Surfaces) :-
		sort(Surfs, Surfaces).
	segments_surfaces([Segment| Segments], Surfs, Surfaces) :-
		Segment::parent_curve(Parent),
		eval(Parent, ParentSurfaces),
		set::intersection(Surfs, ParentSurfaces, Surfs2),
		segments_surfaces(Segments, Surfs2, Surfaces).

:- end_object.


/*
FUNCTION item_in_context(item: representation_item;
		   cntxt: representation_context): BOOLEAN;
LOCAL
  i : INTEGER;
  y : BAG OF representation_item;
END_LOCAL;
IF SIZEOF(USEDIN(item,'CONFIG_CONTROL_DESIGN.REPRESENTATION.ITEMS') *
	cntxt.representations_in_context) > 0 THEN RETURN(TRUE);
ELSE
  y := QUERY ( z <* USEDIN(item,'') | (
	  'CONFIG_CONTROL_DESIGN.REPRESENTATION_ITEM' IN TYPEOF(z)) );
  IF SIZEOF(y) > 0 THEN
	REPEAT i := 1 TO HIINDEX(y) BY 1;
	  IF item_in_context(y[i],cntxt) THEN RETURN(TRUE);
	  END_IF;
	END_REPEAT;
  END_IF;
END_IF;
RETURN(FALSE);
END_FUNCTION; -- item_in_context
*/

:- object(item_in_context).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(true/2).
	:- mode(true(+representation_item, +representation_context), zero_or_one).

	true(Item, Context) :-
		Context::representations_in_context(Representations),
		list::member(Representation, Representations),
		Item::used_in_representation(Representation), !.

:- end_object.


/*
FUNCTION leap_year(year: year_number): BOOLEAN;
IF (((year MOD 4) = 0) AND ((year MOD 100) <> 0)) OR ((year MOD 400) =
	 0) THEN RETURN(TRUE);
ELSE
  RETURN(FALSE);
END_IF;
END_FUNCTION; -- leap_year
*/

:- object(leap_year).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(true/1).
	:- mode(true(+year_number), zero_or_one).
	:- info(true/1,
		[comment is '.',
		 argnames is ['Year']]).

	true(Year) :-
		(	0 =:= mod(Year, 4), 0 =\= mod(Year, 100) ->
			true
		;	0 =:= mod(Year, 400)
		).

:- end_object.


/*
FUNCTION list_face_loops(f: face): LIST [0:?] OF loop;
LOCAL
  loops : LIST [0:?] OF loop := [];
END_LOCAL;
REPEAT i := 1 TO SIZEOF(f.bounds) BY 1;
  loops := loops + f.bounds[i].bound;
END_REPEAT;
RETURN(loops);
END_FUNCTION; -- list_face_loops
*/

:- object(list_face_loops).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(eval/2).
	:- mode(eval(+face, -list(loop)), one).
  	:- info(eval/2,
		[comment is '.',
		 argnames is ['Face', 'Loops']]).

	eval(Face, Loops) :-
		Face::bounds(Bounds),
		face_loops(Bounds, Loops).

	face_loops([], []).
	face_loops([Bound| Bounds], [Loop| Loops]) :-
		Bound::bound(Loop),
		face_loops(Bounds, Loops).

:- end_object.


/*
FUNCTION list_of_topology_reversed(
		   a_list: list_of_reversible_topology_item
  ): list_of_reversible_topology_item;
LOCAL
  the_reverse : list_of_reversible_topology_item;
END_LOCAL;
the_reverse := [];
REPEAT i := 1 TO SIZEOF(a_list) BY 1;
  the_reverse := topology_reversed(a_list[i]) + the_reverse;
END_REPEAT;
RETURN(the_reverse);
END_FUNCTION; -- list_of_topology_reversed
*/

:- object(list_of_topology_reversed).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(eval/2).
	:- mode(eval(+list_of_reversible_topology_item, -list_of_reversible_topology_item), one).
  	:- info(eval/2,
		[comment is '.',
		 argnames is ['Items', 'ReversedItems']]).
	/* note the specification requires that the order of items in
	the list be reversed 
	The reversing algorithm here was taken from Sterling & Shapiro,
	"Art of Prolog", 1986,  Program 3.16 */
	
	eval(TList, RList) :-
		reverse(TList, [], RList).

	reverse([X| Xs], Acc, Ys) :-
		topology_reversed::eval(X, XRev),
		reverse(Xs, [XRev| Acc], Ys).
	reverse([], Ys, Ys).

:- end_object.
		

/*
FUNCTION list_to_array(lis: LIST [0:?] OF GENERIC:t;
		   low, u: INTEGER): ARRAY OF GENERIC:t;
LOCAL
  n   : INTEGER;
  res : ARRAY [low:u] OF GENERIC:t;
END_LOCAL;
n := SIZEOF(lis);
IF n <> ((u - low) + 1) THEN RETURN(?);
ELSE
  res := [lis[1],n];
  REPEAT i := 2 TO n BY 1;
	res[(low + i) - 1] := lis[i];
  END_REPEAT;
  RETURN(res);
END_IF;
END_FUNCTION; -- list_to_array
*/

:- object(list_to_array).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(eval/4).
	:- mode(eval(+list, +integer, +integer, -array), one).
	:- info(eval/4, [
		comment is '.',
		argnames is ['List', 'Low', 'U', 'Array']]).

	eval(List, _Low, _U, Array) :-
		List = Array.

:- end_object.


/*
FUNCTION list_to_set(l: LIST [0:?] OF GENERIC:t): SET OF GENERIC:t;
LOCAL
  s : SET OF GENERIC:t := [];
END_LOCAL;
REPEAT i := 1 TO SIZEOF(l) BY 1;
  s := s + l[i];
END_REPEAT;
RETURN(s);
END_FUNCTION; -- list_to_set
*/

:- object(list_to_set).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(eval/2).
	:- mode(eval(+list, +set), one).
  	:- info(eval/2,
		[comment is '.',
		 argnames is ['List', 'Set']]).

	eval(List, Set) :-
		sort(List, Set).

:- end_object.


/*
FUNCTION make_array_of_array(lis: LIST [1:?] OF LIST [1:?] OF GENERIC:t;
		   low1, u1, low2, u2: INTEGER): ARRAY OF ARRAY OF GENERIC:t;
LOCAL
  res : ARRAY [low1:u1] OF ARRAY [low2:u2] OF GENERIC:t;
END_LOCAL;
IF ((u1 - low1) + 1) <> SIZEOF(lis) THEN RETURN(?);
END_IF;
IF ((u2 - low2) + 1) <> SIZEOF(lis[1]) THEN RETURN(?);
END_IF;
res := [list_to_array(lis[1],low2,u2),(u1 - low1) + 1];
REPEAT i := 2 TO HIINDEX(lis) BY 1;
  IF ((u2 - low2) + 1) <> SIZEOF(lis[i]) THEN RETURN(?);
  END_IF;
  res[(low1 + i) - 1] := list_to_array(lis[i],low2,u2);
END_REPEAT;
RETURN(res);
END_FUNCTION; -- make_array_of_array
*/

:- object(make_array_of_array).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(eval/6).
	:- mode(eval(+array, +integer, +integer, +integer, +integer, -array), one).
	:- info(eval/6, [
		comment is '.',
		argnames is ['Data', '', '', '', '', 'Array']]).

	eval(Data, 0, _UU, 0, _VU, Weights) :-
		Data = Weights.		% JUST A TEMPORARY WORKAROUND

:- end_object.


/*
FUNCTION mixed_loop_type_set(l: SET [0:?] OF loop): LOGICAL;
LOCAL
  poly_loop_type : LOGICAL;
END_LOCAL;
IF SIZEOF(l) <= 1 THEN RETURN(FALSE);
END_IF;
poly_loop_type := 'CONFIG_CONTROL_DESIGN.POLY_LOOP' IN TYPEOF(l[1]);
REPEAT i := 2 TO SIZEOF(l) BY 1;
  IF ('CONFIG_CONTROL_DESIGN.POLY_LOOP' IN TYPEOF(l[i])) <>
	  poly_loop_type THEN RETURN(TRUE);
  END_IF;
END_REPEAT;
RETURN(FALSE);
END_FUNCTION; -- mixed_loop_type_set
*/

:- object(mixed_loop_type_set).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(true/1).
	:- mode(true(+set(loop)), one).
	:- info(true/1,
		[comment is 'True if the argument contains mixed type loops. Note that this implies a set with two or more loops.',
		 argnames is ['Loops']]).

	true([Loop1, Loop2| Loops]) :-
		\+ uniform_loop_type_set([Loop1, Loop2| Loops]).
	
	uniform_loop_type_set([Loop| Loops]) :-
		loop_type(Loop, Type),
		check_loops(Loops, Type).
	
	loop_type(Loop, Type) :-
		(	Loop::ancestor(poly_loop) ->
			Type = polygonal
		;	Type = nonpolygonal
		).

	check_loops([], _).
	check_loops([Loop| Loops], Type) :-
		loop_type(Loop, Type),
		check_loops(Loops, Type).

:- end_object.


/*
FUNCTION msb_shells(brep: manifold_solid_brep
  ): SET [1:?] OF closed_shell;
IF SIZEOF(QUERY ( msbtype <* TYPEOF(brep) | (msbtype LIKE
	'*BREP_WITH_VOIDS') )) >= 1 THEN
  RETURN(brep\brep_with_voids.voids + brep.outer);
ELSE
  RETURN([brep.outer]);
END_IF;
END_FUNCTION; -- msb_shells
*/

:- object(msb_shells).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(eval/2).
	:- mode(eval(+manifold_solid_brep, -set(closed_shell)), one).
  	:- info(eval/2,
		[comment is '.',
		 argnames is ['Brep', 'Shells']]).

	eval(Brep, Shells) :-
		Brep::outer(Outer),
		(	Brep::ancestor(brep_with_voids) ->
			Brep::voids(Voids),
			set::union([Outer], Voids, Shells)
		;	Shells = Outer
		).

:- end_object.


/*
FUNCTION msf_curve_check(cv: curve): BOOLEAN;
IF SIZEOF(['CONFIG_CONTROL_DESIGN.BOUNDED_CURVE',
	'CONFIG_CONTROL_DESIGN.CONIC',
	'CONFIG_CONTROL_DESIGN.CURVE_REPLICA',
	'CONFIG_CONTROL_DESIGN.LINE',
	'CONFIG_CONTROL_DESIGN.OFFSET_CURVE_3D'] * TYPEOF(cv)) > 1 THEN
  RETURN(FALSE);
ELSE
  IF (('CONFIG_CONTROL_DESIGN.B_SPLINE_CURVE' IN TYPEOF(cv)) AND (cv\
	  b_spline_curve.self_intersect = FALSE)) OR (cv\b_spline_curve.
	  self_intersect = UNKNOWN) THEN RETURN(TRUE);
  ELSE
	IF SIZEOF(['CONFIG_CONTROL_DESIGN.CONIC',
		'CONFIG_CONTROL_DESIGN.LINE'] * TYPEOF(cv)) = 1 THEN
	  RETURN(TRUE);
	ELSE
	  IF 'CONFIG_CONTROL_DESIGN.CURVE_REPLICA' IN TYPEOF(cv) THEN
		RETURN(msf_curve_check(cv\curve_replica.parent_curve));
	  ELSE
		IF ('CONFIG_CONTROL_DESIGN.OFFSET_CURVE_3D' IN TYPEOF(cv)) AND
			 ((cv\offset_curve_3d.self_intersect = FALSE) OR (cv\
			offset_curve_3d.self_intersect = UNKNOWN)) AND (NOT (
			'CONFIG_CONTROL_DESIGN.POLYLINE'
			IN TYPEOF(cv.basis_curve))) THEN
		  RETURN(msf_curve_check(cv\offset_curve_3d.basis_curve));
		ELSE
		  IF 'CONFIG_CONTROL_DESIGN.PCURVE' IN TYPEOF(cv) THEN
			RETURN(msf_curve_check(cv\pcurve.reference_to_curve\
				representation.items[1]) AND msf_surface_check(cv\
				pcurve.basis_surface));
		  ELSE
			IF 'CONFIG_CONTROL_DESIGN.SURFACE_CURVE' IN TYPEOF(cv)
				 THEN
			  IF msf_curve_check(cv\surface_curve.curve_3d) THEN
				REPEAT i := 1 TO SIZEOF(cv\surface_curve.
					associated_geometry) BY 1;
				  IF 'CONFIG_CONTROL_DESIGN.SURFACE' IN TYPEOF(cv\
					  surface_curve.associated_geometry[i]) THEN
					IF NOT msf_surface_check(cv\surface_curve.
						associated_geometry[i]) THEN
					  RETURN(FALSE);
					END_IF;
				  ELSE
					IF 'CONFIG_CONTROL_DESIGN.PCURVE' IN TYPEOF(cv\
						surface_curve.associated_geometry[i]) THEN
					  IF NOT msf_curve_check(cv\surface_curve.
						  associated_geometry[i]) THEN
						RETURN(FALSE);
					  END_IF;
					END_IF;
				  END_IF;
				END_REPEAT;
				RETURN(TRUE);
			  END_IF;
			ELSE
			  IF 'CONFIG_CONTROL_DESIGN.POLYLINE' IN TYPEOF(cv) THEN
				IF SIZEOF(cv\polyline.points) >= 3 THEN
				  RETURN(TRUE);
				END_IF;
			  END_IF;
			END_IF;
		  END_IF;
		END_IF;
	  END_IF;
	END_IF;
  END_IF;
END_IF;
RETURN(FALSE);
END_FUNCTION; -- msf_curve_check
*/

:- object(msf_curve_check).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(true/1).
	:- mode(true(+curve), one).
	:- info(true/1,
		[comment is 'True if curve satisfies restrictions placed on manifold shell models',
		 argnames is ['Curve']]).

	true(Curve) :-
		Curve::ancestor(b_spline_curve), !,
		Curve::(self_intersect(false); self_intersect(unknown)), !.
		
	true(Curve) :-
		Curve::(ancestor(conic); ancestor(line)), !.
		
	true(Curve) :-
		Curve::ancestor(curve_replica), !,
		Curve::parent_curve(Parent),
		true(Parent).
		
	true(Curve) :-
		Curve::ancestor(offset_curve_3d), !,
		Curve::(self_intersect(false); self_intersect(unknown)), !,
		Curve::basis_curve(Basis),
		\+ Basis::ancestor(polyline),
		true(Basis).
		
	true(Curve) :-
		Curve::ancestor(pcurve), !,
		Curve::reference_to_curve(CurveRef),
		CurveRef::items([X| _]),
		true(X),
		
		Curve::basis_surface(Surface),
		msf_surface_check::true(Surface).
		
	true(Curve) :-
		Curve::ancestor(surface_curve), !,
		Curve::curve_3d(Curve2),
		true(Curve2),
		Curve::associated_geometry(AssociatedGeometry),
		\+ (	list::member(X, AssociatedGeometry),
				X::ancestor(surface),
				\+ msf_surface_check::true(X)
			).

	true(Curve) :-
		Curve::ancestor(polyline), !,
		Curve::points([_, _, _| _]).

:- end_object.		


/*
FUNCTION msf_surface_check(surf: surface): BOOLEAN;
IF 'CONFIG_CONTROL_DESIGN.ELEMENTARY_SURFACE' IN TYPEOF(surf) THEN
  RETURN(TRUE);
ELSE
  IF 'CONFIG_CONTROL_DESIGN.SWEPT_SURFACE' IN TYPEOF(surf) THEN
	RETURN(msf_curve_check(surf\swept_surface.swept_curve));
  ELSE
	IF (('CONFIG_CONTROL_DESIGN.OFFSET_SURFACE' IN TYPEOF(surf)) AND (
		surf\offset_surface.self_intersect = FALSE)) OR (surf\
		offset_surface.self_intersect = UNKNOWN) THEN
	  RETURN(msf_surface_check(surf\offset_surface.basis_surface));
	ELSE
	  IF 'CONFIG_CONTROL_DESIGN.SURFACE_REPLICA' IN TYPEOF(surf) THEN
		RETURN(msf_surface_check(surf\surface_replica.parent_surface));
	  ELSE
		IF (('CONFIG_CONTROL_DESIGN.B_SPLINE_SURFACE' IN TYPEOF(surf))
			AND (surf\b_spline_surface.self_intersect = FALSE)) OR (
			surf\b_spline_surface.self_intersect = UNKNOWN) THEN
		  RETURN(TRUE);
		END_IF;
	  END_IF;
	END_IF;
  END_IF;
END_IF;
RETURN(FALSE);
END_FUNCTION; -- msf_surface_check
*/

:- object(msf_surface_check).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(true/1).
	:- mode(true(+surface), one).
	:- info(true/1,
		[comment is 'True if surface satisfies restrictions placed on manifold shell models',
		 argnames is ['Surface']]).

	true(Surface) :-
		Surface::ancestor(elementary_surface), !.
		
	true(Surface) :-
		Surface::ancestor(swept_surface), !,
		Surface::swept_curve(SweptCurve),
		msf_curve_check::true(SweptCurve).
		
	true(Surface) :-
		Surface::ancestor(offset_surface), !,
		Surface::(self_intersect(false); self_intersect(unknown)), !,
		Surface::basis_surface(Surface2),
		true(Surface2).
		
	true(Surface) :-
		Surface::ancestor(surface_replica), !,
		Surface::parent_surface(Parent),
		true(Parent).
		
	true(Surface) :-
		Surface::ancestor(b_spline_surface), !,
		Surface::(self_intersect(false); self_intersect(unknown)), !.

:- end_object.


/*
FUNCTION normalise(arg: vector_or_direction): vector_or_direction;
LOCAL
  ndim   : INTEGER;
  v	  : direction;
  vec	: vector;
  mag	: REAL;
  result : vector_or_direction;
END_LOCAL;
IF NOT EXISTS(arg) THEN result := ?;
ELSE
  ndim := arg.dim;
  IF 'CONFIG_CONTROL_DESIGN.VECTOR' IN TYPEOF(arg) THEN
	BEGIN
	  v := dummy_gri || direction(arg.orientation.direction_ratios);
	  IF arg.magnitude = 0 THEN RETURN(?);
	  ELSE
		vec := dummy_gri || vector(v,1);
	  END_IF;
	END;
  ELSE
	v := dummy_gri || direction(arg.direction_ratios);
  END_IF;
  mag := 0;
  REPEAT i := 1 TO ndim BY 1;
	mag := mag + (v.direction_ratios[i] * v.direction_ratios[i]);
  END_REPEAT;
  IF mag > 0 THEN
	mag := SQRT(mag);
	REPEAT i := 1 TO ndim BY 1;
	  v.direction_ratios[i] := v.direction_ratios[i] / mag;
	END_REPEAT;
	IF 'CONFIG_CONTROL_DESIGN.VECTOR' IN TYPEOF(arg) THEN
	  vec.orientation := v;
	  result := vec;
	ELSE
	  result := v;
	END_IF;
  ELSE
	RETURN(?);
  END_IF;
END_IF;
RETURN(result);
END_FUNCTION; -- normalise
*/

:- object(normalise,
	imports(geometry_functions)).

	:- info([
		version is 1.01,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2019/03/11,
		comment is '.']).

	:- public(eval/2).
	:- mode(eval(+vector_or_direction, -vector_or_direction), one).
  	:- info(eval/2,
		[comment is '.',
		 argnames is ['FaceOrDirection', 'Normalised']]).

	eval(Vector, vector('', Direction, 1.0)) :-
		Vector::ancestor(vector), !,
		Vector::magnitude(Mag),
		Mag > 0.0,
		Vector::orientation(Tmp),
		eval(Tmp, Direction).
		
	eval(Direction, direction('', DirectionRatios)) :-
		Direction::ancestor(direction), !,
		Direction::direction_ratios(Coordinates),
		::pythagorean_magnitude(Coordinates, Magnitude),
		Scale is 1.0 / Magnitude,
		::scale_list(Coordinates, Scale, DirectionRatios).

:- end_object.	   


/*
FUNCTION open_shell_reversed(a_shell: open_shell): oriented_open_shell;
LOCAL
  the_reverse : oriented_open_shell;
END_LOCAL;
IF 'CONFIG_CONTROL_DESIGN.ORIENTED_OPEN_SHELL' IN TYPEOF(a_shell)
	 THEN
  the_reverse := dummy_tri || connected_face_set(a_shell\
	  connected_face_set.cfs_faces) || open_shell() ||
	  oriented_open_shell(a_shell\oriented_open_shell.
	  open_shell_element,NOT a_shell\oriented_open_shell.orientation);
ELSE
  the_reverse := dummy_tri || connected_face_set(a_shell\
	  connected_face_set.cfs_faces) || open_shell() ||
	  oriented_open_shell(a_shell,FALSE);
END_IF;
RETURN(the_reverse);
END_FUNCTION; -- open_shell_reversed
*/

:- object(open_shell_reversed,
	imports(reversing_function)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(eval/2).
	:- mode(eval(+open_shell, -oriented_open_shell), one).
  	:- info(eval/2,
		[comment is '.',
		 argnames is ['Shell', 'Reversed']]).
		 
	eval(Shell, Reversed) :-
		(	Shell::ancestor(oriented_open_shell) ->
			Shell::open_shell_element(ShellElement),
			::reversed_orientation(Shell, Orientation),
			Reversed = oriented_open_shell('', ShellElement, Orientation)
		;	Shell::ancestor(open_shell) ->
			Reversed = oriented_open_shell('', Shell, false)
		;	fail
		).

:- end_object.


/*
FUNCTION orthogonal_complement(vec: direction): direction;
LOCAL
  result : direction;
END_LOCAL;
IF (vec.dim <> 2) OR (NOT EXISTS(vec)) THEN RETURN(?);
ELSE
  result := dummy_gri || direction([-vec.direction_ratios[2],vec.
	  direction_ratios[1]]);
  RETURN(result);
END_IF;
END_FUNCTION; -- orthogonal_complement
*/

:- object(orthogonal_complement).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(eval/2).
	:- mode(eval(+direction, -direction), one).
  	:- info(eval/2,
		[comment is '.',
		 argnames is ['Direction', 'Complement']]).

	eval(Vector, direction('', [-D2, D1])) :-
		Vector::dim(2),
		Vector::direction_ratios([D1, D2]).

:- end_object.


/*
FUNCTION path_head_to_tail(a_path: path): LOGICAL;
LOCAL
  n : INTEGER;
  p : BOOLEAN := TRUE;
END_LOCAL;
n := SIZEOF(a_path.edge_list);
REPEAT i := 2 TO n BY 1;
  p := p AND (a_path.edge_list[i - 1].edge_end :=: a_path.edge_list[i]
	  .edge_start);
END_REPEAT;
RETURN(p);
END_FUNCTION; -- path_head_to_tail
*/

:- object(path_head_to_tail).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(true/1).
	:- mode(true(+path), zero_or_one).

	true(Path) :-	
		Path::edge_list(Edges),
		path_head_to_tail(Edges).

	path_head_to_tail([Edge1, Edge2| Edges]) :-
		!,
		Edge1::edge_end(SameEdge),
		Edge2::edge_start(SameEdge),
		path_head_to_tail([Edge2| Edges]).
	path_head_to_tail([_]).

:- end_object.


/*
FUNCTION path_reversed(a_path: path): oriented_path;
LOCAL
  the_reverse : oriented_path;
END_LOCAL;
IF 'CONFIG_CONTROL_DESIGN.ORIENTED_PATH' IN TYPEOF(a_path) THEN
  the_reverse := dummy_tri || path(list_of_topology_reversed(a_path.
	  edge_list)) || oriented_path(a_path\oriented_path.path_element,
	  NOT a_path\oriented_path.orientation);
ELSE
  the_reverse := dummy_tri || path(list_of_topology_reversed(a_path.
	  edge_list)) || oriented_path(a_path,FALSE);
END_IF;
RETURN(the_reverse);
END_FUNCTION; -- path_reversed
*/

:- object(path_reversed,
	imports(reversing_function)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(eval/2).
	:- mode(eval(+path, -path), one).
  	:- info(eval/2,
		[comment is '.',
		 argnames is ['Path', 'Reversed']]).

	eval(Path, oriented_path('', PathElement, Orientation)) :-
		nonvar(Path),
		Path::ancestor(oriented_path), !,
		Path::path_element(PathElement),
		::reversed_orientation(Path, Orientation).
		
	eval(Path, oriented_path('', Path, false)) :-
		nonvar(Path).

:- end_object.


/*
FUNCTION scalar_times_vector(scalar: REAL;
		   vec: vector_or_direction): vector;
LOCAL
  v	  : direction;
  mag	: REAL;
  result : vector;
END_LOCAL;
IF (NOT EXISTS(scalar)) OR (NOT EXISTS(vec)) THEN RETURN(?);
ELSE
  IF 'CONFIG_CONTROL_DESIGN.VECTOR' IN TYPEOF(vec) THEN
	v := dummy_gri || direction(vec.orientation.direction_ratios);
	mag := scalar * vec.magnitude;
  ELSE
	v := dummy_gri || direction(vec.direction_ratios);
	mag := scalar;
  END_IF;
  IF mag < 0 THEN
	REPEAT i := 1 TO SIZEOF(v.direction_ratios) BY 1;
	  v.direction_ratios[i] := -v.direction_ratios[i];
	END_REPEAT;
	mag := -mag;
  END_IF;
  result := dummy_gri || vector(normalise(v),mag);
END_IF;
RETURN(result);
END_FUNCTION; -- scalar_times_vector
*/

:- object(scalar_times_vector).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(eval/3).
	:- mode(eval(+float, +vector_or_direction, -vector), one).
   	:- info(eval/3,
		[comment is '.',
		 argnames is ['Scalar', 'Vector', 'ScaledVector']]).

	eval(Scalar, Vector, vector('', NV, Mag)) :-
		(	Vector::ancestor(vector) ->
			Vector::orientation(V),
			Vector::magnitude(Magnitude),
			Mag is Scalar*Magnitude
		;	V = Vector,
			Mag = Scalar
		),
		(	Mag < 0 ->
			V::direction_ratios(Ratios),
			negate(Ratios, NegatedRatios),
			Mag is -Mag,
			normalise::eval(direction('', NegatedRatios), NV)
		;	normalise::eval(V, NV)
		).

	negate([], []).
	negate([Ratio| Ratios], [-Ratio| NegatedRatios]) :-
		negate(Ratios, NegatedRatios).

:- end_object.


/*
FUNCTION second_proj_axis(z_axis, x_axis, arg: direction
  ): direction;
LOCAL
  temp   : vector;
  v	  : direction;
  y_axis : vector;
END_LOCAL;
IF NOT EXISTS(arg) THEN
  v := dummy_gri || direction([0,1,0]);
ELSE
  v := arg;
END_IF;
temp := scalar_times_vector(dot_product(v,z_axis),z_axis);
y_axis := vector_difference(v,temp);
temp := scalar_times_vector(dot_product(v,x_axis),x_axis);
y_axis := vector_difference(y_axis,temp);
y_axis := normalise(y_axis);
RETURN(y_axis.orientation);
END_FUNCTION; -- second_proj_axis
*/

:- object(second_proj_axis).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(true/4).
	:- mode(true(+direction, +direction, +direction, -direction), one).
 
	true(ZAxis, XAxis, V, Direction) :-
		dot_product::eval(V, ZAxis, ZProduct),
		scalar_times_vector::eval(ZProduct, ZAxis, Temp),
		vector_difference::eval(V, Temp, YAxis),
		dot_product::eval(V, XAxis, XProduct),
		scalar_times_vector::eval(XProduct, XAxis, Temp2),
		vector_difference::eval(YAxis, Temp2, YAxis2),
		normalise::eval(YAxis2, NYAxis),
		NYAxis::orientation(Direction).

:- end_object.


/*
FUNCTION set_of_topology_reversed(a_set: set_of_reversible_topology_item
  ): set_of_reversible_topology_item;
LOCAL
  the_reverse : set_of_reversible_topology_item;
END_LOCAL;
the_reverse := [];
REPEAT i := 1 TO SIZEOF(a_set) BY 1;
  the_reverse := the_reverse + topology_reversed(a_set[i]);
END_REPEAT;
RETURN(the_reverse);
END_FUNCTION; -- set_of_topology_reversed
*/

:- object(set_of_topology_reversed).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(eval/2).
	:- mode(eval(+set_of_reversible_topology_item, -set_of_reversible_topology_item), one).
   	:- info(eval/2,
		[comment is '.',
		 argnames is ['Topology', 'Reversed']]).

	eval([], []).
	eval([Item| Items], [RItem| RItems]) :-
		topology_reversed::eval(Item, RItem),
		eval(Items, RItems).

:- end_object.


/*
FUNCTION shell_reversed(a_shell: shell): shell;
IF 'CONFIG_CONTROL_DESIGN.OPEN_SHELL' IN TYPEOF(a_shell) THEN
  RETURN(open_shell_reversed(a_shell));
ELSE
  IF 'CONFIG_CONTROL_DESIGN.CLOSED_SHELL' IN TYPEOF(a_shell) THEN
	RETURN(closed_shell_reversed(a_shell));
  ELSE
	RETURN(?);
  END_IF;
END_IF;
END_FUNCTION; -- shell_reversed
*/

:- object(shell_reversed,
	imports(reversing_function)).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(eval/2).
	:- mode(eval(+shell, -shell), one).
  	:- info(eval/2,
		[comment is '.',
		 argnames is ['Shell', 'Reversed']]).

	eval(Shell,Reversed) :-
		Shell::ancestor(open_shell), !,
		open_shell_reversed::eval(Shell, Reversed).
		
	eval(Shell, Reversed) :-
		Shell::ancestor(closed_shell), !,
		closed_shell_reversed::eval(Shell, Reversed).
		
:- end_object.


/*
FUNCTION surface_weights_positive(b: rational_b_spline_surface
  ): BOOLEAN;
LOCAL
  result : BOOLEAN := TRUE;
END_LOCAL;
REPEAT i := 0 TO b.u_upper BY 1;
  REPEAT j := 0 TO b.v_upper BY 1;
	IF b.weights[i][j] <= 0 THEN result := FALSE;
	  RETURN(result);
	END_IF;
  END_REPEAT;
END_REPEAT;
RETURN(result);
END_FUNCTION; -- surface_weights_positive
*/

:- object(surface_weights_positive).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(true/1).
	:- mode(true(+rational_b_spline_surface), zero_or_one).
	:- info(true/1,
		[comment is '.',
		 argnames is ['Surface']]).

	true(Surface) :-
		Surface::weights(Weights),
		all_positive_array(Weights).

	all_positive_array([]).
	all_positive_array([Line| Lines]) :-
		all_positive_line(Line),
		all_positive_array(Lines).

	all_positive_line([]).
	all_positive_line([Weight| Weights]) :-
		Weight > 0,
		all_positive_line(Weights).

:- end_object.


/*
FUNCTION topology_reversed(an_item: reversible_topology
  ): reversible_topology;
IF 'CONFIG_CONTROL_DESIGN.EDGE' IN TYPEOF(an_item) THEN
  RETURN(edge_reversed(an_item));
END_IF;
IF 'CONFIG_CONTROL_DESIGN.PATH' IN TYPEOF(an_item) THEN
  RETURN(path_reversed(an_item));
END_IF;
IF 'CONFIG_CONTROL_DESIGN.FACE_BOUND' IN TYPEOF(an_item) THEN
  RETURN(face_bound_reversed(an_item));
END_IF;
IF 'CONFIG_CONTROL_DESIGN.FACE' IN TYPEOF(an_item) THEN
  RETURN(face_reversed(an_item));
END_IF;
IF 'CONFIG_CONTROL_DESIGN.SHELL' IN TYPEOF(an_item) THEN
  RETURN(shell_reversed(an_item));
END_IF;
IF 'SET' IN TYPEOF(an_item) THEN
  RETURN(set_of_topology_reversed(an_item));
END_IF;
IF 'LIST' IN TYPEOF(an_item) THEN
  RETURN(list_of_topology_reversed(an_item));
END_IF;
RETURN(?);
END_FUNCTION; -- topology_reversed
*/

:- object(topology_reversed).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(eval/2).
	:- mode(eval(+reversible_topology, -reversible_topology), one).
  	:- info(eval/2,
		[comment is '.',
		 argnames is ['Topology', 'Reversed']]).

	eval(Item, Reversed) :-
		(	Item::ancestor(edge) ->
			edge_reversed::eval(Item, Reversed)
		;	Item::ancestor(path) ->
			path_reversed::eval(Item, Reversed)
		;	Item::ancestor(face_bound) ->
			face_bound_reversed::eval(Item, Reversed)
		;	Item::ancestor(face) ->
			face_reversed::eval(Item, Reversed)
		;	Item::ancestor(shell) ->
			shell_reversed::eval(Item, Reversed)
		;	list_of_topology_reversed::eval(Item, Reversed)
		).

:- end_object.


/*
FUNCTION unique_version_change_order(c: action): BOOLEAN;
LOCAL
  ords	 : action_directive := c\directed_action.directive;
  assign   : SET OF change_request := [];
  versions : SET OF product_definition_formation := [];
END_LOCAL;
REPEAT i := 1 TO SIZEOF(ords.requests) BY 1;
  assign := assign + QUERY ( ara <* bag_to_set(USEDIN(ords.requests[i],
	  'CONFIG_CONTROL_DESIGN.ACTION_REQUEST_ASSIGNMENT.' +
	  'ASSIGNED_ACTION_REQUEST')) | (
	  'CONFIG_CONTROL_DESIGN.CHANGE_REQUEST' IN TYPEOF(ara)) );
END_REPEAT;
REPEAT k := 1 TO SIZEOF(assign) BY 1;
  versions := versions + assign[k].items;
END_REPEAT;
RETURN(SIZEOF(QUERY ( vers <* versions | (NOT (SIZEOF(
	QUERY ( other_vers <* (versions - vers) | (vers.of_product :=:
	other_vers.of_product) )) = 0)) )) = 0);
END_FUNCTION; -- unique_version_change_order
*/
/*
:- object(unique_version_change_order).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(true/1).
	:- mode(true(+action), zero_or_one).
	:- info(true/1,
		[comment is '.',
		 argnames is ['Action']]).

	true(Action) :-
		Action::directive(Ords),
		Ords::requests(Requests),
		versioned_action_requests(Requests, Assign),
		product_definition_formations(Assign, [], Versions).

	versioned_action_requests(Requests, Assign).

	product_definition_formations([], Acc, Versions) :-
		{sort(Acc, Versions)}.
	product_definition_formations([Assign| Assigns], Acc, [Version| Versions]) :-
		Assign::items(Items),
		set::union(Acc, Items, Acc2),
		product_definition_formations(Assign, Acc2, Versions).

:- end_object.
*/
/* alternate implementation 10 Apr 2006 */

:- object(unique_version_change_order).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(true/1).
	:- mode(true(+action), zero_or_one).
	:- info(true/1,
		[comment is '.',
		 argnames is ['Action']]).

	true(Action) :-
		\+ (	version_affected_by_order(Action, Vers1),
				version_affected_by_order(Action, Vers2),
				Vers1 \= Vers2,
				Vers1::of_product(Product1),
				Vers2::of_product(Product1)
			).

	version_affected_by_order(Action, Version) :-
		Action::directive(ActionDirective),
		ActionDirective::requests(Requests),
		list::member(Request, Requests),
		change_request::descendant_instance(ChangeRequest),
		ChangeRequest::assigned_action_request(Request),
		ChangeRequest::items(Items),
		list::member(Version, Items).

:- end_object.


/*
FUNCTION using_items(item: founded_item_select;
		   checked_items: SET OF founded_item_select
  ): SET OF founded_item_select;
LOCAL
  next_items	  : SET OF founded_item_select;
  new_check_items : SET OF founded_item_select;
  result_items	: SET OF founded_item_select;
END_LOCAL;
result_items := [];
new_check_items := checked_items + item;
next_items := QUERY ( z <* bag_to_set(USEDIN(item,'')) | ((
	'CONFIG_CONTROL_DESIGN.REPRESENTATION_ITEM' IN TYPEOF(z)) OR (
	'CONFIG_CONTROL_DESIGN.FOUNDED_ITEM' IN TYPEOF(z))) );
IF SIZEOF(next_items) > 0 THEN
  REPEAT i := 1 TO HIINDEX(next_items) BY 1;
	IF NOT (next_items[i] IN new_check_items) THEN
	  result_items := result_items + next_items[i] + using_items(
		  next_items[i],new_check_items);
	END_IF;
  END_REPEAT;
END_IF;
RETURN(result_items);
END_FUNCTION; -- using_items
*/


/*
FUNCTION using_representations(item: founded_item_select
  ): SET OF representation;
LOCAL
  results			: SET OF representation;
  intermediate_items : SET OF founded_item_select;
  result_bag		 : BAG OF representation;
END_LOCAL;
results := [];
result_bag := USEDIN(item,
'CONFIG_CONTROL_DESIGN.REPRESENTATION.ITEMS');
IF SIZEOF(result_bag) > 0 THEN
  REPEAT i := 1 TO HIINDEX(result_bag) BY 1;
	results := results + result_bag[i];
  END_REPEAT;
END_IF;
intermediate_items := using_items(item,[]);
IF SIZEOF(intermediate_items) > 0 THEN
  REPEAT i := 1 TO HIINDEX(intermediate_items) BY 1;
	result_bag := USEDIN(intermediate_items[i],
		'CONFIG_CONTROL_DESIGN.REPRESENTATION.ITEMS');
	IF SIZEOF(result_bag) > 0 THEN
	  REPEAT j := 1 TO HIINDEX(result_bag) BY 1;
		results := results + result_bag[j];
	  END_REPEAT;
	END_IF;
  END_REPEAT;
END_IF;
RETURN(results);
END_FUNCTION; -- using_representations
*/

:- object(using_representations).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(eval/2).
	:- mode(eval(+representation_item, -set(representation)), one).
  	:- info(eval/2,
		[comment is '.',
		 argnames is ['Item', 'Representations']]).

	eval(Item, Representations) :-		% assumes representation cache already built
		(	setof(Representation, Item::used_in_representation(Representation), Representations) ->
			true
		;	Representations = []
		).

:- end_object.


/*
FUNCTION valid_calendar_date(date: calendar_date): LOGICAL;
IF NOT ((1 <= date.day_component) AND (date.day_component <= 31))
	 THEN RETURN(FALSE);
END_IF;
CASE date.month_component OF
  4	  :	   RETURN((1 <= date.day_component) AND (date.
		day_component <= 30));
  6	  :	   RETURN((1 <= date.day_component) AND (date.
		day_component <= 30));
  9	  :	   RETURN((1 <= date.day_component) AND (date.
		day_component <= 30));
  11	 :	   RETURN((1 <= date.day_component) AND (date.
		day_component <= 30));
  2	  :	   BEGIN
	  IF leap_year(date.year_component) THEN
		RETURN((1 <= date.day_component) AND
		(date.day_component <= 29));
	  ELSE
		RETURN((1 <= date.day_component) AND
		(date.day_component <= 28));
	  END_IF;
	END;
  OTHERWISE  :		 RETURN(TRUE);
  END_CASE;
END_FUNCTION; -- valid_calendar_date
*/

:- object(valid_calendar_date).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(true/1).
	:- mode(true(+calendar_date), zero_or_one).
	:- info(true/1,
		[comment is '.',
		 argnames is ['Date']]).

	true(Date) :-
		Date::year_component(Year),
		Date::month_component(Month),
		Date::day_component(Day),
		integer(Year),
		integer(Month), Month >= 1, Month =< 12,
		integer(Day),
		days_in_month(Month, Year, Days),
		Day >= 1, Day =< Days.

	days_in_month( 1, _, 31).
	days_in_month( 2, Year, Days) :-
		leap_year::true(Year) -> Days = 29; Days = 28.
	days_in_month( 3, _, 31).
	days_in_month( 4, _, 30).
	days_in_month( 5, _, 31).
	days_in_month( 6, _, 30).
	days_in_month( 7, _, 31).
	days_in_month( 8, _, 31).
	days_in_month( 9, _, 30).
	days_in_month(10, _, 31).
	days_in_month(11, _, 30).
	days_in_month(12, _, 31).

:- end_object.


/*
FUNCTION valid_geometrically_bounded_wf_curve(crv: curve): BOOLEAN;
IF SIZEOF(['CONFIG_CONTROL_DESIGN.POLYLINE',
	'CONFIG_CONTROL_DESIGN.B_SPLINE_CURVE',
	'CONFIG_CONTROL_DESIGN.ELLIPSE','CONFIG_CONTROL_DESIGN.CIRCLE'] *
	TYPEOF(crv)) = 1 THEN RETURN(TRUE);
ELSE
  IF 'CONFIG_CONTROL_DESIGN.TRIMMED_CURVE' IN TYPEOF(crv) THEN
	IF SIZEOF(['CONFIG_CONTROL_DESIGN.LINE',
		'CONFIG_CONTROL_DESIGN.PARABOLA',
		'CONFIG_CONTROL_DESIGN.HYPERBOLA'] * TYPEOF(crv\trimmed_curve.
		basis_curve)) = 1 THEN RETURN(TRUE);
	ELSE
	  RETURN(valid_geometrically_bounded_wf_curve(crv\trimmed_curve.
		  basis_curve));
	END_IF;
  ELSE
	IF 'CONFIG_CONTROL_DESIGN.OFFSET_CURVE_3D' IN TYPEOF(crv) THEN
	  RETURN(valid_geometrically_bounded_wf_curve(crv\offset_curve_3d.
		  basis_curve));
	ELSE
	  IF 'CONFIG_CONTROL_DESIGN.CURVE_REPLICA' IN TYPEOF(crv) THEN
		RETURN(valid_geometrically_bounded_wf_curve(crv\curve_replica.
			parent_curve));
	  ELSE
		IF 'CONFIG_CONTROL_DESIGN.COMPOSITE_CURVE' IN TYPEOF(crv)
			 THEN
		  RETURN(SIZEOF(QUERY ( ccs <* crv\composite_curve.segments |
			  (NOT valid_geometrically_bounded_wf_curve(ccs.
			  parent_curve)) )) = 0);
		END_IF;
	  END_IF;
	END_IF;
  END_IF;
END_IF;
RETURN(FALSE);
END_FUNCTION; -- valid_geometrically_bounded_wf_curve
*/

:- object(valid_geometrically_bounded_wf_curve).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(true/1).
	:- mode(true(+curve), zero_or_one).
	:- info(true/1,
		[comment is '.',
		 argnames is ['Curve']]).

	true(Curve) :-
		(	basic_curve(Curve) ->
			true
		;	(	Curve::ancestor(trimmed_curve) ->
				Curve::basis_curve(Basis),
				(	Basis::(ancestor(line);	ancestor(parabola); ancestor(hyperbola)) ->
					true
				;	true(Basis)
				)
			;	(	Curve::ancestor(offset_curve_3d) ->
					Curve::basis_curve(Basis),
					true(Basis)
				;	(	Curve::ancestor(curve_replica) ->
						Curve::parent_curve(Parent),
						true(Parent)
					;	Curve::ancestor(composite_curve) ->
						Curve::segments(Segments),
						check_segments(Segments)
					;	fail
					)
				)
			)
		).

	basic_curve(Curve) :-
		(	Curve::ancestor(polyline)
		;   Curve::ancestor(b_spline_curve)
		;	Curve::ancestor(ellipse)
		;	Curve::ancestor(circle)
		),
		!.

	check_segments([]).
	check_segments([Segment| Segments]) :-
		Segment::parent_curve(Parent),
		true(Parent),
		check_segments(Segments).

:- end_object.


/*
FUNCTION valid_geometrically_bounded_wf_point(pnt: point): BOOLEAN;
IF 'CONFIG_CONTROL_DESIGN.CARTESIAN_POINT' IN TYPEOF(pnt) THEN
  RETURN(TRUE);
ELSE
  IF 'CONFIG_CONTROL_DESIGN.POINT_ON_CURVE' IN TYPEOF(pnt) THEN
	RETURN(valid_geometrically_bounded_wf_curve(pnt\point_on_curve.
		basis_curve));
  ELSE
	IF 'CONFIG_CONTROL_DESIGN.POINT_REPLICA' IN TYPEOF(pnt) THEN
	  RETURN(valid_geometrically_bounded_wf_point(pnt\point_replica.
		  parent_pt));
	END_IF;
  END_IF;
END_IF;
RETURN(FALSE);
END_FUNCTION; -- valid_geometrically_bounded_wf_point
*/

:- object(valid_geometrically_bounded_wf_point).

	:- info([
		version is 1.01,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2019/03/11,
		comment is '.']).

	:- public(true/1).
	:- mode(true(+point), zero_or_one).
	:- info(true/1,
		[comment is '.',
		 argnames is ['Point']]).

	true(Point) :-
		(	Point::ancestor(cartesian_point) ->
			true
		;	Point::ancestor(point_on_curve) ->
			Point::basis_curve(Curve),
			valid_geometrically_bounded_wf_curve::true(Curve)
		;	Point::ancestor(point_replica) ->
			Point::parent_pt(Parent),
			true(Parent)
		;	fail
		).

:- end_object.


/*
FUNCTION valid_measure_value(m: measure_value): BOOLEAN;
IF 'REAL' IN TYPEOF(m) THEN
  RETURN(m > 0);
ELSE
  IF 'INTEGER' IN TYPEOF(m) THEN RETURN(m > 0);
  ELSE
	RETURN(TRUE);
  END_IF;
END_IF;
END_FUNCTION; -- valid_measure_value
*/

:- object(valid_measure_value).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(true/1).
	:- mode(true(+measure_value), zero_or_one).
	:- info(true/1,
		[comment is '.',
		 argnames is ['Value']]).

	true(Value) :-
		(	number(Value) ->
			Value > 0
		;	true
		).

:- end_object.


/*
FUNCTION valid_time(time: local_time): BOOLEAN;
IF EXISTS(time.second_component) THEN
  RETURN(EXISTS(time.minute_component));
ELSE
  RETURN(TRUE);
END_IF;
END_FUNCTION; -- valid_time
*/

:- object(valid_time).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(true/1).
	:- mode(true(+local_time), zero_or_one).
	:- info(true/1,
		[comment is '.',
		 argnames is ['Time']]).

	true(Time) :-
		(	Time::second_component(_) ->
			Time::minute_component(_)
		;	true
		).

:- end_object.


/*
FUNCTION valid_units(m: measure_with_unit): BOOLEAN;
IF 'CONFIG_CONTROL_DESIGN.LENGTH_MEASURE' IN TYPEOF(m.value_component)
	 THEN
  IF derive_dimensional_exponents(m.unit_component) <>
	  dimensional_exponents(1,0,0,0,0,0,0) THEN RETURN(FALSE);
  END_IF;
END_IF;
IF 'CONFIG_CONTROL_DESIGN.MASS_MEASURE' IN TYPEOF(m.value_component)
	 THEN
  IF derive_dimensional_exponents(m.unit_component) <>
	  dimensional_exponents(0,1,0,0,0,0,0) THEN
	RETURN(FALSE);
  END_IF;
END_IF;
IF 'CONFIG_CONTROL_DESIGN.TIME_MEASURE' IN TYPEOF(m.value_component)
	 THEN
  IF derive_dimensional_exponents(m.unit_component) <>
	  dimensional_exponents(0,0,1,0,0,0,0) THEN RETURN(FALSE);
  END_IF;
END_IF;
IF 'CONFIG_CONTROL_DESIGN.ELECTRIC_CURRENT_MEASURE' IN TYPEOF(m.
	value_component) THEN
  IF derive_dimensional_exponents(m.unit_component) <>
	  dimensional_exponents(0,0,0,1,0,0,0) THEN RETURN(FALSE);
  END_IF;
END_IF;
IF 'CONFIG_CONTROL_DESIGN.THERMODYNAMIC_TEMPERATURE_MEASURE' IN
	TYPEOF(m.value_component) THEN
  IF derive_dimensional_exponents(m.unit_component) <>
	  dimensional_exponents(0,0,0,0,1,0,0) THEN RETURN(FALSE);
  END_IF;
END_IF;
IF 'CONFIG_CONTROL_DESIGN.AMOUNT_OF_SUBSTANCE_MEASURE' IN TYPEOF(m.
	value_component) THEN
  IF derive_dimensional_exponents(m.unit_component) <>
	  dimensional_exponents(0,0,0,0,0,1,0) THEN RETURN(FALSE);
  END_IF;
END_IF;
IF 'CONFIG_CONTROL_DESIGN.LUMINOUS_INTENSITY_MEASURE' IN TYPEOF(m.
	value_component) THEN
  IF derive_dimensional_exponents(m.unit_component) <>
	  dimensional_exponents(0,0,0,0,0,0,1) THEN RETURN(FALSE);
  END_IF;
END_IF;
IF 'CONFIG_CONTROL_DESIGN.PLANE_ANGLE_MEASURE' IN TYPEOF(m.
	value_component) THEN
  IF derive_dimensional_exponents(m.unit_component) <>
	  dimensional_exponents(0,0,0,0,0,0,0) THEN RETURN(FALSE);
  END_IF;
END_IF;
IF 'CONFIG_CONTROL_DESIGN.SOLID_ANGLE_MEASURE' IN TYPEOF(m.
	value_component) THEN
  IF derive_dimensional_exponents(m.unit_component) <>
	  dimensional_exponents(0,0,0,0,0,0,0) THEN RETURN(FALSE);
  END_IF;
END_IF;
IF 'CONFIG_CONTROL_DESIGN.AREA_MEASURE' IN TYPEOF(m.value_component)
	 THEN
  IF derive_dimensional_exponents(m.unit_component) <>
	  dimensional_exponents(2,0,0,0,0,0,0) THEN RETURN(FALSE);
  END_IF;
END_IF;
IF 'CONFIG_CONTROL_DESIGN.VOLUME_MEASURE' IN TYPEOF(m.value_component)
	 THEN
  IF derive_dimensional_exponents(m.unit_component) <>
	  dimensional_exponents(3,0,0,0,0,0,0) THEN RETURN(FALSE);
  END_IF;
END_IF;
IF 'CONFIG_CONTROL_DESIGN.RATIO_MEASURE' IN TYPEOF(m.value_component)
	 THEN
  IF derive_dimensional_exponents(m.unit_component) <>
	  dimensional_exponents(0,0,0,0,0,0,0) THEN RETURN(FALSE);
  END_IF;
END_IF;
IF 'CONFIG_CONTROL_DESIGN.POSITIVE_LENGTH_MEASURE' IN TYPEOF(m.
	value_component) THEN
  IF derive_dimensional_exponents(m.unit_component) <>
	  dimensional_exponents(1,0,0,0,0,0,0) THEN RETURN(FALSE);
  END_IF;
END_IF;
IF 'CONFIG_CONTROL_DESIGN.POSITIVE_PLANE_ANGLE_MEASURE' IN TYPEOF(m.
	value_component) THEN
  IF derive_dimensional_exponents(m.unit_component) <>
	  dimensional_exponents(0,0,0,0,0,0,0) THEN RETURN(FALSE);
  END_IF;
END_IF;
RETURN(TRUE);
END_FUNCTION; -- valid_units
*/

:- object(valid_units).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(true/1).
	:- mode(true(+measure_with_unit), zero_or_one).
	:- info(true/1,
		[comment is '.',
		 argnames is ['Measure']]).

	true(Measure) :-
		Measure::value_component(typed_value(ValueType, _)),
		Measure::unit_component(Unit),
		Unit::dimensions(Dims),
		check_dimensions(ValueType, Dims).


	check_dimensions(mass_measure,Dims) :-
		!,
		Dims::length_exponent(0.0),
		Dims::mass_exponent(1.0),
		Dims::time_exponent(0.0),
		Dims::electric_current_exponent(0.0),
		Dims::thermodynamic_temperature_exponent(0.0),
		Dims::amount_of_substance_exponent(0.0),
		Dims::luminous_intensity_exponent(0.0).

	check_dimensions(time_measure,Dims) :-
		!,
		Dims::length_exponent(0.0),
		Dims::mass_exponent(0.0),
		Dims::time_exponent(1.0),
		Dims::electric_current_exponent(0.0),
		Dims::thermodynamic_temperature_exponent(0.0),
		Dims::amount_of_substance_exponent(0.0),
		Dims::luminous_intensity_exponent(0.0).

	check_dimensions(electric_current_measure,Dims) :-
		!,
		Dims::length_exponent(0.0),
		Dims::mass_exponent(0.0),
		Dims::time_exponent(0.0),
		Dims::electric_current_exponent(1.0),
		Dims::thermodynamic_temperature_exponent(0.0),
		Dims::amount_of_substance_exponent(0.0),
		Dims::luminous_intensity_exponent(0.0).

	check_dimensions(thermodynamic_temperature_measure,Dims) :-
		!,
		Dims::length_exponent(0.0),
		Dims::mass_exponent(0.0),
		Dims::time_exponent(0.0),
		Dims::electric_current_exponent(0.0),
		Dims::thermodynamic_temperature_exponent(1.0),
		Dims::amount_of_substance_exponent(0.0),
		Dims::luminous_intensity_exponent(0.0).

	check_dimensions(amount_of_substance_measure,Dims) :-
		!,
		Dims::length_exponent(0.0),
		Dims::mass_exponent(0.0),
		Dims::time_exponent(0.0),
		Dims::electric_current_exponent(0.0),
		Dims::thermodynamic_temperature_exponent(0.0),
		Dims::amount_of_substance_exponent(1.0),
		Dims::luminous_intensity_exponent(0.0).

	check_dimensions(luminous_intensity_measure,Dims) :-
		!,
		Dims::length_exponent(0.0),
		Dims::mass_exponent(0.0),
		Dims::time_exponent(0.0),
		Dims::electric_current_exponent(0.0),
		Dims::thermodynamic_temperature_exponent(0.0),
		Dims::amount_of_substance_exponent(0.0),
		Dims::luminous_intensity_exponent(1.0).

	check_dimensions(area_measure,Dims) :-
		!,
		Dims::length_exponent(2.0),
		Dims::mass_exponent(0.0),
		Dims::time_exponent(0.0),
		Dims::electric_current_exponent(0.0),
		Dims::thermodynamic_temperature_exponent(0.0),
		Dims::amount_of_substance_exponent(0.0),
		Dims::luminous_intensity_exponent(0.0).

	check_dimensions(volume_measure,Dims) :-
		!,
		Dims::length_exponent(3.0),
		Dims::mass_exponent(0.0),
		Dims::time_exponent(0.0),
		Dims::electric_current_exponent(0.0),
		Dims::thermodynamic_temperature_exponent(0.0),
		Dims::amount_of_substance_exponent(0.0),
		Dims::luminous_intensity_exponent(0.0).

	check_dimensions(ValueType, Dims) :-
		(	ValueType == length_measure
		;	ValueType == positive_length_measure
		), !,
		Dims::length_exponent(1.0),
		Dims::mass_exponent(0.0),
		Dims::time_exponent(0.0),
		Dims::electric_current_exponent(0.0),
		Dims::thermodynamic_temperature_exponent(0.0),
		Dims::amount_of_substance_exponent(0.0),
		Dims::luminous_intensity_exponent(0.0).

	check_dimensions(ValueType, Dims) :-
		(	ValueType == plane_angle_measure
		;	ValueType == positive_plane_angle_measure
		;	ValueType == solid_angle_measure
		;	ValueType == ratio_measure
		), !,
		Dims::length_exponent(0.0),
		Dims::mass_exponent(0.0),
		Dims::time_exponent(0.0),
		Dims::electric_current_exponent(0.0),
		Dims::thermodynamic_temperature_exponent(0.0),
		Dims::amount_of_substance_exponent(0.0),
		Dims::luminous_intensity_exponent(0.0).

:- end_object.		


/*
FUNCTION valid_wireframe_edge_curve(crv: curve): BOOLEAN;
IF SIZEOF(['CONFIG_CONTROL_DESIGN.LINE','CONFIG_CONTROL_DESIGN.CONIC',
	'CONFIG_CONTROL_DESIGN.B_SPLINE_CURVE',
	'CONFIG_CONTROL_DESIGN.POLYLINE'] * TYPEOF(crv)) = 1 THEN
  RETURN(TRUE);
ELSE
  IF 'CONFIG_CONTROL_DESIGN.CURVE_REPLICA' IN TYPEOF(crv) THEN
	RETURN(valid_wireframe_edge_curve(crv\curve_replica.parent_curve));
  ELSE
	IF 'CONFIG_CONTROL_DESIGN.OFFSET_CURVE_3D' IN TYPEOF(crv) THEN
	  RETURN(valid_wireframe_edge_curve(crv\offset_curve_3d.
		  basis_curve));
	END_IF;
  END_IF;
END_IF;
RETURN(FALSE);
END_FUNCTION; -- valid_wireframe_edge_curve
*/

:- object(valid_wireframe_edge_curve).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(true/1).
	:- mode(true(+curve), zero_or_one).
	:- info(true/1,
		[comment is '.',
		 argnames is ['Curve']]).

	true(Curve) :-
		(	basic_curve(Curve) ->
			true
		;	Curve::ancestor(curve_replica) ->
			Curve::parent_curve(Parent),
			true(Parent)
		;	Curve::ancestor(offset_curve_3d) ->
			Curve::basis_curve(Basis),
			true(Basis)
		;	fail
		).

	basic_curve(Curve) :-
		(	Curve::ancestor(circle)
		;	Curve::ancestor(ellipse)
		;	Curve::ancestor(parabola)
		;	Curve::ancestor(hyperbola)
		;	Curve::ancestor(b_spline_curve)
		;	Curve::ancestor(polyline)
		),
		!.

:- end_object.


/*
FUNCTION valid_wireframe_vertex_point(pnt: point): BOOLEAN;
IF 'CONFIG_CONTROL_DESIGN.CARTESIAN_POINT' IN TYPEOF(pnt) THEN
  RETURN(TRUE);
ELSE
  IF 'CONFIG_CONTROL_DESIGN.POINT_REPLICA' IN TYPEOF(pnt) THEN
	RETURN(valid_wireframe_vertex_point(pnt\point_replica.parent_pt));
  END_IF;
END_IF;
RETURN(FALSE);
END_FUNCTION; -- valid_wireframe_vertex_point
*/

:- object(valid_wireframe_vertex_point).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(true/1).
	:- mode(true(+point), zero_or_one).
	:- info(true/1,
		[comment is '.',
		 argnames is ['Point']]).

	true(Point) :-
		(	Point::ancestor(cartesian_point) ->
			true
		;	Point::ancestor(point_replica), !,
			Point::parent_pt(Parent),
			true(Parent)
		).

:- end_object.


/*
FUNCTION vector_difference(arg1, arg2: vector_or_direction
  ): vector;
LOCAL
  ndim   : INTEGER;
  mag2   : REAL;
  mag1   : REAL;
  mag	: REAL;
  res	: direction;
  vec1   : direction;
  vec2   : direction;
  result : vector;
END_LOCAL;
IF (NOT EXISTS(arg1)) OR (NOT EXISTS(arg2)) OR (arg1.dim <> arg2.dim)
	 THEN RETURN(?);
ELSE
  BEGIN
	IF 'CONFIG_CONTROL_DESIGN.VECTOR' IN TYPEOF(arg1) THEN
	  mag1 := arg1.magnitude;
	  vec1 := arg1.orientation;
	ELSE
	  mag1 := 1;
	  vec1 := arg1;
	END_IF;
	IF 'CONFIG_CONTROL_DESIGN.VECTOR' IN TYPEOF(arg2) THEN
	  mag2 := arg2.magnitude;
	  vec2 := arg2.orientation;
	ELSE
	  mag2 := 1;
	  vec2 := arg2;
	END_IF;
	vec1 := normalise(vec1);
	vec2 := normalise(vec2);
	ndim := SIZEOF(vec1.direction_ratios);
	mag := 0;
	res := dummy_gri || direction(vec1.direction_ratios);
	REPEAT i := 1 TO ndim BY 1;
	  res.direction_ratios[i] := (mag1 * vec1.direction_ratios[i]) + (
		  mag2 * vec2.direction_ratios[i]);
	  mag := mag + (res.direction_ratios[i] * res.direction_ratios[i]);
	END_REPEAT;
	IF mag > 0 THEN
	  result := dummy_gri || vector(res,SQRT(mag));
	ELSE
	  result := dummy_gri || vector(vec1,0);
	END_IF;
  END;
END_IF;
RETURN(result);
END_FUNCTION; -- vector_difference
*/

:- object(vector_difference).

	:- info([
		version is 1.0,
		author is 'Vincent Marchetti and Paulo Moura',
		date is 2006/02/04,
		comment is '.']).

	:- public(eval/3).
	:- mode(eval(+vector_or_direction, +vector_or_direction, -vector), one).
   	:- info(eval/3,
		[comment is '.',
		 argnames is ['Vector1', 'Vector2', 'Difference']]).

	eval(Vector1, Vector2, Vector) :-
		(	Vector1::ancestor(vector) ->
			Vector1::magnitude(Mag1),
			Vector1::orientation(Vec1)
		;	Mag1 = 1,
			Vec1 = Vector1
		),
		(	Vector2::ancestor(vector) ->
			Vector2::magnitude(Mag2),
			Vector2::orientation(Vec2)
		;	Mag2 = 1,
			Vec2 = Vector2
		),
		normalise::eval(Vec1, NVec1),
		normalise::eval(Vec2, NVec2),
		NVec1::direction_ratios(Ratios1),
		NVec2::direction_ratios(Ratios2),
		direction_ratios(Ratios1, Mag1, Ratios2, Mag2, DirectionRatios, 0, Mag),
		(	Mag > 0 ->
			Magnitude is sqrt(Mag),
			Vector = vector('', direction('', DirectionRatios), Magnitude)
		;	Vector = vector('', NVec1, 0)
		).

	direction_ratios([], _, _, _, [], Mag, Mag).
	direction_ratios([R1| Rs1], Mag1, [R2| Rs2], Mag2, [Dr| Drs], Acc, Mag) :-
		Dr is Mag1*R1 - Mag2*R2,
		Acc2 is Acc + Dr*Dr,
		direction_ratios(Rs1, Mag1, Rs2, Mag2, Drs, Acc2, Mag).

:- end_object.


