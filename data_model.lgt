:- object('#5',instantiates(application_context)).
	application('configuration controlled 3D designs of mechanical parts and assemblies').
:- end_object.

:- object('#6',instantiates(application_protocol_definition)).
	status('International Standard').
	application_interpreted_model_schema_name('config_control_design').
	application_protocol_year(1995).
	application('#5').
:- end_object.

:- object('#7',instantiates(mechanical_context)).
	name('').
	frame_of_reference('#5').
	discipline_type('mechanical').
:- end_object.

:- object('#8',instantiates(product)).
	id('').
	name('Part2').
	description('').
	frame_of_reference(['#7']).
:- end_object.

:- object('#9',instantiates(product_related_product_category)).
	name('detail').
	products(['#8']).
:- end_object.

:- object('#10',instantiates(product_category)).
	name('mechanical').
:- end_object.

:- object('#11',instantiates(product_category_relationship)).
	name('').
	description('').
	category('#10').
	sub_category('#9').
:- end_object.

:- object('#12',instantiates(person)).
	id('product_owner_').
	last_name('').
	first_name('').
:- end_object.

:- object('#18',instantiates(person)).
	id('prdffr_cr_').
	last_name('').
	first_name('').
:- end_object.

:- object('#23',instantiates(person)).
	id('prdffr_su_').
	last_name('').
	first_name('').
:- end_object.

:- object('#30',instantiates(person)).
	id('prdffr_app_').
	last_name('').
	first_name('').
:- end_object.

:- object('#46',instantiates(person)).
	id('prdffr_sc_app_').
	last_name('').
	first_name('').
:- end_object.

:- object('#57',instantiates(person)).
	id('prdffr_scco_').
	last_name('').
	first_name('').
:- end_object.

:- object('#72',instantiates(person)).
	id('creator_wamware').
	last_name('').
	first_name('').
:- end_object.

:- object('#85',instantiates(person)).
	id('def_app_').
	last_name('').
	first_name('').
:- end_object.

:- object('#13',instantiates(organization)).
	name('').
	description('').
:- end_object.

:- object('#19',instantiates(organization)).
	name('').
	description('').
:- end_object.

:- object('#24',instantiates(organization)).
	name('').
	description('').
:- end_object.

:- object('#31',instantiates(organization)).
	name('').
	description('').
:- end_object.

:- object('#47',instantiates(organization)).
	name('').
	description('').
:- end_object.

:- object('#58',instantiates(organization)).
	name('').
	description('').
:- end_object.

:- object('#73',instantiates(organization)).
	name('').
	description('').
:- end_object.

:- object('#86',instantiates(organization)).
	name('').
	description('').
:- end_object.

:- object('#14',instantiates(person_and_organization)).
	the_person('#12').
	the_organization('#13').
:- end_object.

:- object('#20',instantiates(person_and_organization)).
	the_person('#18').
	the_organization('#19').
:- end_object.

:- object('#25',instantiates(person_and_organization)).
	the_person('#23').
	the_organization('#24').
:- end_object.

:- object('#32',instantiates(person_and_organization)).
	the_person('#30').
	the_organization('#31').
:- end_object.

:- object('#48',instantiates(person_and_organization)).
	the_person('#46').
	the_organization('#47').
:- end_object.

:- object('#59',instantiates(person_and_organization)).
	the_person('#57').
	the_organization('#58').
:- end_object.

:- object('#74',instantiates(person_and_organization)).
	the_person('#72').
	the_organization('#73').
:- end_object.

:- object('#87',instantiates(person_and_organization)).
	the_person('#85').
	the_organization('#86').
:- end_object.

:- object('#15',instantiates(person_and_organization_role)).
	name('design_owner').
:- end_object.

:- object('#21',instantiates(person_and_organization_role)).
	name('creator').
:- end_object.

:- object('#26',instantiates(person_and_organization_role)).
	name('part_supplier').
:- end_object.

:- object('#60',instantiates(person_and_organization_role)).
	name('classification_officer').
:- end_object.

:- object('#75',instantiates(person_and_organization_role)).
	name('creator').
:- end_object.

:- object('#16',instantiates(cc_design_person_and_organization_assignment)).
	assigned_person_and_organization('#14').
	role('#15').
	items(['#8']).
:- end_object.

:- object('#22',instantiates(cc_design_person_and_organization_assignment)).
	assigned_person_and_organization('#20').
	role('#21').
	items(['#17']).
:- end_object.

:- object('#27',instantiates(cc_design_person_and_organization_assignment)).
	assigned_person_and_organization('#25').
	role('#26').
	items(['#17']).
:- end_object.

:- object('#61',instantiates(cc_design_person_and_organization_assignment)).
	assigned_person_and_organization('#59').
	role('#60').
	items(['#42']).
:- end_object.

:- object('#76',instantiates(cc_design_person_and_organization_assignment)).
	assigned_person_and_organization('#74').
	role('#75').
	items(['#71']).
:- end_object.

:- object('#17',instantiates(product_definition_formation_with_specified_source)).
	id('').
	description('').
	of_product('#8').
	make_or_buy('not_known').
:- end_object.

:- object('#28',instantiates(approval_status)).
	name('approved').
:- end_object.

:- object('#44',instantiates(approval_status)).
	name('approved').
:- end_object.

:- object('#83',instantiates(approval_status)).
	name('approved').
:- end_object.

:- object('#29',instantiates(approval)).
	status('#28').
	level('').
:- end_object.

:- object('#45',instantiates(approval)).
	status('#44').
	level('').
:- end_object.

:- object('#84',instantiates(approval)).
	status('#83').
	level('').
:- end_object.

:- object('#33',instantiates(approval_role)).
	role('').
:- end_object.

:- object('#49',instantiates(approval_role)).
	role('').
:- end_object.

:- object('#88',instantiates(approval_role)).
	role('').
:- end_object.

:- object('#34',instantiates(approval_person_organization)).
	person_organization('#32').
	authorized_approval('#29').
	role('#33').
:- end_object.

:- object('#50',instantiates(approval_person_organization)).
	person_organization('#48').
	authorized_approval('#45').
	role('#49').
:- end_object.

:- object('#89',instantiates(approval_person_organization)).
	person_organization('#87').
	authorized_approval('#84').
	role('#88').
:- end_object.

:- object('#35',instantiates(calendar_date)).
	year_component(1996).
	day_component(25).
	month_component(9).
:- end_object.

:- object('#51',instantiates(calendar_date)).
	year_component(1996).
	day_component(25).
	month_component(9).
:- end_object.

:- object('#63',instantiates(calendar_date)).
	year_component(1996).
	day_component(25).
	month_component(9).
:- end_object.

:- object('#78',instantiates(calendar_date)).
	year_component(1996).
	day_component(25).
	month_component(9).
:- end_object.

:- object('#90',instantiates(calendar_date)).
	year_component(1996).
	day_component(25).
	month_component(9).
:- end_object.

:- object('#36',instantiates(coordinated_universal_time_offset)).
	hour_offset(0).
	minute_offset(0).
	sense('ahead').
:- end_object.

:- object('#52',instantiates(coordinated_universal_time_offset)).
	hour_offset(0).
	minute_offset(0).
	sense('ahead').
:- end_object.

:- object('#64',instantiates(coordinated_universal_time_offset)).
	hour_offset(0).
	minute_offset(0).
	sense('ahead').
:- end_object.

:- object('#79',instantiates(coordinated_universal_time_offset)).
	hour_offset(0).
	minute_offset(0).
	sense('ahead').
:- end_object.

:- object('#91',instantiates(coordinated_universal_time_offset)).
	hour_offset(0).
	minute_offset(0).
	sense('ahead').
:- end_object.

:- object('#37',instantiates(local_time)).
	hour_component(0).
	minute_component(49).
	second_component(  4.10000000e+01).
	zone('#36').
:- end_object.

:- object('#53',instantiates(local_time)).
	hour_component(0).
	minute_component(49).
	second_component(  4.10000000e+01).
	zone('#52').
:- end_object.

:- object('#65',instantiates(local_time)).
	hour_component(0).
	minute_component(49).
	second_component(  4.10000000e+01).
	zone('#64').
:- end_object.

:- object('#80',instantiates(local_time)).
	hour_component(0).
	minute_component(49).
	second_component(  4.10000000e+01).
	zone('#79').
:- end_object.

:- object('#92',instantiates(local_time)).
	hour_component(0).
	minute_component(49).
	second_component(  4.10000000e+01).
	zone('#91').
:- end_object.

:- object('#38',instantiates(date_and_time)).
	date_component('#35').
	time_component('#37').
:- end_object.

:- object('#54',instantiates(date_and_time)).
	date_component('#51').
	time_component('#53').
:- end_object.

:- object('#66',instantiates(date_and_time)).
	date_component('#63').
	time_component('#65').
:- end_object.

:- object('#81',instantiates(date_and_time)).
	date_component('#78').
	time_component('#80').
:- end_object.

:- object('#93',instantiates(date_and_time)).
	date_component('#90').
	time_component('#92').
:- end_object.

:- object('#39',instantiates(approval_date_time)).
	date_time('#38').
	dated_approval('#29').
:- end_object.

:- object('#55',instantiates(approval_date_time)).
	date_time('#54').
	dated_approval('#45').
:- end_object.

:- object('#94',instantiates(approval_date_time)).
	date_time('#93').
	dated_approval('#84').
:- end_object.

:- object('#40',instantiates(cc_design_approval)).
	assigned_approval('#29').
	items(['#17']).
:- end_object.

:- object('#56',instantiates(cc_design_approval)).
	assigned_approval('#45').
	items(['#42']).
:- end_object.

:- object('#95',instantiates(cc_design_approval)).
	assigned_approval('#84').
	items(['#71']).
:- end_object.

:- object('#41',instantiates(security_classification_level)).
	name('unclassified').
:- end_object.

:- object('#42',instantiates(security_classification)).
	name('').
	purpose('').
	security_level('#41').
:- end_object.

:- object('#43',instantiates(cc_design_security_classification)).
	assigned_security_classification('#42').
	items(['#17']).
:- end_object.

:- object('#62',instantiates(date_time_role)).
	name('classification_date').
:- end_object.

:- object('#77',instantiates(date_time_role)).
	name('creation_date').
:- end_object.

:- object('#67',instantiates(cc_design_date_and_time_assignment)).
	assigned_date_and_time('#66').
	role('#62').
	items(['#42']).
:- end_object.

:- object('#82',instantiates(cc_design_date_and_time_assignment)).
	assigned_date_and_time('#81').
	role('#77').
	items(['#71']).
:- end_object.

:- object('#68',instantiates(design_context)).
	name('').
	frame_of_reference('#5').
	life_cycle_stage('design').
:- end_object.

:- object('#69',instantiates(document_type)).
	product_data_type('cad_filename').
:- end_object.

:- object('#70',instantiates(document)).
	id('').
	name('/scratch/wamware/tmp/Part02.step').
	description('').
	kind('#69').
:- end_object.

:- object('#71',instantiates(product_definition_with_associated_documents)).
	id('').
	description('').
	formation('#17').
	frame_of_reference('#68').
	documentation_ids(['#70']).
:- end_object.

:- object('#96',instantiates(product_definition_shape)).
	name('').
	description('').
	definition('#71').
:- end_object.

:- object('#97',instantiates(shape_definition_representation)).
	definition('#96').
	used_representation('#4089').
:- end_object.

:- object('#103',instantiates(plane_angle_unit,si_unit)).
	:- alias(plane_angle_unit,attr_spec/4,plane_angle_unit_attr_spec/4).
	:- alias(si_unit,attr_spec/4,si_unit_attr_spec/4).
	attr_spec(N,T,S,K) :- ::plane_angle_unit_attr_spec(N,T,S,K).
	attr_spec(N,T,S,K) :- ::si_unit_attr_spec(N,T,S,K).
	:- alias(plane_angle_unit,domain_rule/2,plane_angle_unit_domain_rule/2).
	:- alias(si_unit,domain_rule/2,si_unit_domain_rule/2).
	domain_rule(S,R) :- ::plane_angle_unit_domain_rule(S,R).
	domain_rule(S,R) :- ::si_unit_domain_rule(S,R).
	name('radian').
:- end_object.

:- object('#104',instantiates(dimensional_exponents)).
	length_exponent(  0.00000000e+00).
	mass_exponent(  0.00000000e+00).
	time_exponent(  0.00000000e+00).
	electric_current_exponent(  0.00000000e+00).
	thermodynamic_temperature_exponent(  0.00000000e+00).
	amount_of_substance_exponent(  0.00000000e+00).
	luminous_intensity_exponent(  0.00000000e+00).
:- end_object.

:- object('#105',instantiates(plane_angle_measure_with_unit)).
	value_component(typed_value(plane_angle_measure,  1.74532925e-02)).
	unit_component('#103').
:- end_object.

:- object('#109',instantiates(conversion_based_unit,plane_angle_unit)).
	:- alias(conversion_based_unit,attr_spec/4,conversion_based_unit_attr_spec/4).
	:- alias(plane_angle_unit,attr_spec/4,plane_angle_unit_attr_spec/4).
	attr_spec(N,T,S,K) :- ::conversion_based_unit_attr_spec(N,T,S,K).
	attr_spec(N,T,S,K) :- ::plane_angle_unit_attr_spec(N,T,S,K).
	:- alias(conversion_based_unit,domain_rule/2,conversion_based_unit_domain_rule/2).
	:- alias(plane_angle_unit,domain_rule/2,plane_angle_unit_domain_rule/2).
	domain_rule(S,R) :- ::conversion_based_unit_domain_rule(S,R).
	domain_rule(S,R) :- ::plane_angle_unit_domain_rule(S,R).
	name('DEGREE').
	conversion_factor('#105').
	dimensions('#104').
:- end_object.

:- object('#113',instantiates(si_unit,solid_angle_unit)).
	:- alias(si_unit,attr_spec/4,si_unit_attr_spec/4).
	:- alias(solid_angle_unit,attr_spec/4,solid_angle_unit_attr_spec/4).
	attr_spec(N,T,S,K) :- ::si_unit_attr_spec(N,T,S,K).
	attr_spec(N,T,S,K) :- ::solid_angle_unit_attr_spec(N,T,S,K).
	:- alias(si_unit,domain_rule/2,si_unit_domain_rule/2).
	:- alias(solid_angle_unit,domain_rule/2,solid_angle_unit_domain_rule/2).
	domain_rule(S,R) :- ::si_unit_domain_rule(S,R).
	domain_rule(S,R) :- ::solid_angle_unit_domain_rule(S,R).
	name('steradian').
:- end_object.

:- object('#117',instantiates(length_unit,si_unit)).
	:- alias(length_unit,attr_spec/4,length_unit_attr_spec/4).
	:- alias(si_unit,attr_spec/4,si_unit_attr_spec/4).
	attr_spec(N,T,S,K) :- ::length_unit_attr_spec(N,T,S,K).
	attr_spec(N,T,S,K) :- ::si_unit_attr_spec(N,T,S,K).
	:- alias(length_unit,domain_rule/2,length_unit_domain_rule/2).
	:- alias(si_unit,domain_rule/2,si_unit_domain_rule/2).
	domain_rule(S,R) :- ::length_unit_domain_rule(S,R).
	domain_rule(S,R) :- ::si_unit_domain_rule(S,R).
	name('metre').
:- end_object.

:- object('#119',instantiates(uncertainty_measure_with_unit)).
	value_component(typed_value(length_measure,  1.00000000e-05)).
	unit_component('#117').
	name('DISTANCE_ACCURACY_VALUE').
	description('').
:- end_object.

:- object('#121',instantiates(geometric_representation_context,global_uncertainty_assigned_context,global_unit_assigned_context)).
	:- alias(geometric_representation_context,attr_spec/4,geometric_representation_context_attr_spec/4).
	:- alias(global_uncertainty_assigned_context,attr_spec/4,global_uncertainty_assigned_context_attr_spec/4).
	:- alias(global_unit_assigned_context,attr_spec/4,global_unit_assigned_context_attr_spec/4).
	attr_spec(N,T,S,K) :- ::geometric_representation_context_attr_spec(N,T,S,K).
	attr_spec(N,T,S,K) :- ::global_uncertainty_assigned_context_attr_spec(N,T,S,K).
	attr_spec(N,T,S,K) :- ::global_unit_assigned_context_attr_spec(N,T,S,K).
	:- alias(geometric_representation_context,domain_rule/2,geometric_representation_context_domain_rule/2).
	:- alias(global_uncertainty_assigned_context,domain_rule/2,global_uncertainty_assigned_context_domain_rule/2).
	:- alias(global_unit_assigned_context,domain_rule/2,global_unit_assigned_context_domain_rule/2).
	domain_rule(S,R) :- ::geometric_representation_context_domain_rule(S,R).
	domain_rule(S,R) :- ::global_uncertainty_assigned_context_domain_rule(S,R).
	domain_rule(S,R) :- ::global_unit_assigned_context_domain_rule(S,R).
	coordinate_space_dimension(3).
	uncertainty(['#119']).
	units(['#109','#113','#117']).
	context_identifier('').
	context_type('3D').
:- end_object.

:- object('#122',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.83212124e-01,  4.08224907e-01,  3.08495214e-01]).
:- end_object.

:- object('#123',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.83212124e-01,  4.11164838e-01,  3.08474866e-01]).
:- end_object.

:- object('#124',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.83212124e-01,  4.08204559e-01,  3.05555284e-01]).
:- end_object.

:- object('#125',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.83212124e-01,  4.11144490e-01,  3.05534936e-01]).
:- end_object.

:- object('#127',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.83212124e-01,  4.09694389e-01,  3.08415042e-01]).
:- end_object.

:- object('#129',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.83212124e-01,  4.09694389e-01,  3.08415042e-01]).
:- end_object.

:- object('#130',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.83212124e-01,  4.07269576e-01,  3.08431824e-01]).
:- end_object.

:- object('#131',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.83212124e-01,  4.08467448e-01,  3.06323483e-01]).
:- end_object.

:- object('#132',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.83212124e-01,  4.09665320e-01,  3.04215142e-01]).
:- end_object.

:- object('#133',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.83212124e-01,  4.10892261e-01,  3.06306701e-01]).
:- end_object.

:- object('#134',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.83212124e-01,  4.12119202e-01,  3.08398259e-01]).
:- end_object.

:- object('#135',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.83212124e-01,  4.09694389e-01,  3.08415042e-01]).
:- end_object.

:- object('#149',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.09694389e-01,  3.08415042e-01]).
:- end_object.

:- object('#150',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.12119202e-01,  3.08398259e-01]).
:- end_object.

:- object('#151',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.10892261e-01,  3.06306701e-01]).
:- end_object.

:- object('#152',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.09665320e-01,  3.04215142e-01]).
:- end_object.

:- object('#153',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.08467448e-01,  3.06323483e-01]).
:- end_object.

:- object('#154',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.07269576e-01,  3.08431824e-01]).
:- end_object.

:- object('#155',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.09694389e-01,  3.08415042e-01]).
:- end_object.

:- object('#156',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.83212124e-01,  4.09694389e-01,  3.08415042e-01]).
:- end_object.

:- object('#157',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.83212124e-01,  4.12119202e-01,  3.08398259e-01]).
:- end_object.

:- object('#158',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.83212124e-01,  4.10892261e-01,  3.06306701e-01]).
:- end_object.

:- object('#159',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.83212124e-01,  4.09665320e-01,  3.04215142e-01]).
:- end_object.

:- object('#160',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.83212124e-01,  4.08467448e-01,  3.06323483e-01]).
:- end_object.

:- object('#161',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.83212124e-01,  4.07269576e-01,  3.08431824e-01]).
:- end_object.

:- object('#162',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.83212124e-01,  4.09694389e-01,  3.08415042e-01]).
:- end_object.

:- object('#171',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.09694389e-01,  3.08415042e-01]).
:- end_object.

:- object('#173',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.09694389e-01,  3.08415042e-01]).
:- end_object.

:- object('#174',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.07269576e-01,  3.08431824e-01]).
:- end_object.

:- object('#175',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.08467448e-01,  3.06323483e-01]).
:- end_object.

:- object('#176',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.09665320e-01,  3.04215142e-01]).
:- end_object.

:- object('#177',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.10892261e-01,  3.06306701e-01]).
:- end_object.

:- object('#178',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.12119202e-01,  3.08398259e-01]).
:- end_object.

:- object('#179',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.09694389e-01,  3.08415042e-01]).
:- end_object.

:- object('#190',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.83212124e-01,  4.09694389e-01,  3.08415042e-01]).
:- end_object.

:- object('#191',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.09694389e-01,  3.08415042e-01]).
:- end_object.

:- object('#200',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.83212124e-01,  4.31224357e-01,  3.08336029e-01]).
:- end_object.

:- object('#201',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.83212124e-01,  4.34164288e-01,  3.08315681e-01]).
:- end_object.

:- object('#202',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.83212124e-01,  4.31204009e-01,  3.05396100e-01]).
:- end_object.

:- object('#203',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.83212124e-01,  4.34143940e-01,  3.05375752e-01]).
:- end_object.

:- object('#205',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.83212124e-01,  4.32693838e-01,  3.08255857e-01]).
:- end_object.

:- object('#207',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.83212124e-01,  4.32693838e-01,  3.08255857e-01]).
:- end_object.

:- object('#208',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.83212124e-01,  4.30269025e-01,  3.08272640e-01]).
:- end_object.

:- object('#209',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.83212124e-01,  4.31466897e-01,  3.06164298e-01]).
:- end_object.

:- object('#210',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.83212124e-01,  4.32664769e-01,  3.04055957e-01]).
:- end_object.

:- object('#211',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.83212124e-01,  4.33891710e-01,  3.06147516e-01]).
:- end_object.

:- object('#212',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.83212124e-01,  4.35118651e-01,  3.08239074e-01]).
:- end_object.

:- object('#213',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.83212124e-01,  4.32693838e-01,  3.08255857e-01]).
:- end_object.

:- object('#227',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.32693838e-01,  3.08255857e-01]).
:- end_object.

:- object('#228',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.35118651e-01,  3.08239074e-01]).
:- end_object.

:- object('#229',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.33891710e-01,  3.06147516e-01]).
:- end_object.

:- object('#230',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.32664769e-01,  3.04055957e-01]).
:- end_object.

:- object('#231',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.31466897e-01,  3.06164298e-01]).
:- end_object.

:- object('#232',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.30269025e-01,  3.08272640e-01]).
:- end_object.

:- object('#233',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.32693838e-01,  3.08255857e-01]).
:- end_object.

:- object('#234',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.83212124e-01,  4.32693838e-01,  3.08255857e-01]).
:- end_object.

:- object('#235',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.83212124e-01,  4.35118651e-01,  3.08239074e-01]).
:- end_object.

:- object('#236',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.83212124e-01,  4.33891710e-01,  3.06147516e-01]).
:- end_object.

:- object('#237',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.83212124e-01,  4.32664769e-01,  3.04055957e-01]).
:- end_object.

:- object('#238',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.83212124e-01,  4.31466897e-01,  3.06164298e-01]).
:- end_object.

:- object('#239',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.83212124e-01,  4.30269025e-01,  3.08272640e-01]).
:- end_object.

:- object('#240',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.83212124e-01,  4.32693838e-01,  3.08255857e-01]).
:- end_object.

:- object('#249',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.32693838e-01,  3.08255857e-01]).
:- end_object.

:- object('#251',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.32693838e-01,  3.08255857e-01]).
:- end_object.

:- object('#252',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.30269025e-01,  3.08272640e-01]).
:- end_object.

:- object('#253',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.31466897e-01,  3.06164298e-01]).
:- end_object.

:- object('#254',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.32664769e-01,  3.04055957e-01]).
:- end_object.

:- object('#255',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.33891710e-01,  3.06147516e-01]).
:- end_object.

:- object('#256',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.35118651e-01,  3.08239074e-01]).
:- end_object.

:- object('#257',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.32693838e-01,  3.08255857e-01]).
:- end_object.

:- object('#268',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.83212124e-01,  4.32693838e-01,  3.08255857e-01]).
:- end_object.

:- object('#269',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.32693838e-01,  3.08255857e-01]).
:- end_object.

:- object('#278',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.24740832e-01,  3.04868787e-01]).
:- end_object.

:- object('#279',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.24770967e-01,  3.09222748e-01]).
:- end_object.

:- object('#280',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.24740832e-01,  3.04868787e-01]).
:- end_object.

:- object('#281',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.24770967e-01,  3.09222748e-01]).
:- end_object.

:- object('#283',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.24770967e-01,  3.09222748e-01]).
:- end_object.

:- object('#285',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.24740832e-01,  3.04868787e-01]).
:- end_object.

:- object('#287',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.24770967e-01,  3.09222748e-01]).
:- end_object.

:- object('#288',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.24740832e-01,  3.04868787e-01]).
:- end_object.

:- object('#292',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.24770967e-01,  3.09222748e-01]).
:- end_object.

:- object('#294',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.24770967e-01,  3.09222748e-01]).
:- end_object.

:- object('#295',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.24770967e-01,  3.09222748e-01]).
:- end_object.

:- object('#299',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.24740832e-01,  3.04868787e-01]).
:- end_object.

:- object('#301',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.24740832e-01,  3.04868787e-01]).
:- end_object.

:- object('#302',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.24770967e-01,  3.09222748e-01]).
:- end_object.

:- object('#306',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.24740832e-01,  3.04868787e-01]).
:- end_object.

:- object('#307',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.24740832e-01,  3.04868787e-01]).
:- end_object.

:- object('#314',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.25950283e-01,  3.04860417e-01]).
:- end_object.

:- object('#315',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.24740832e-01,  3.04868787e-01]).
:- end_object.

:- object('#316',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.25950283e-01,  3.04860417e-01]).
:- end_object.

:- object('#317',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.24740832e-01,  3.04868787e-01]).
:- end_object.

:- object('#319',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.25458848e-01,  3.04863818e-01]).
:- end_object.

:- object('#321',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.25458848e-01,  3.04863818e-01]).
:- end_object.

:- object('#323',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.25458848e-01,  3.04863818e-01]).
:- end_object.

:- object('#324',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.25458848e-01,  3.04863818e-01]).
:- end_object.

:- object('#328',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.24740832e-01,  3.04868787e-01]).
:- end_object.

:- object('#329',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.25458848e-01,  3.04863818e-01]).
:- end_object.

:- object('#334',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.25458848e-01,  3.04863818e-01]).
:- end_object.

:- object('#335',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.24740832e-01,  3.04868787e-01]).
:- end_object.

:- object('#342',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.21151549e-01,  3.02185596e-01]).
:- end_object.

:- object('#343',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.12924504e-01,  3.02242538e-01]).
:- end_object.

:- object('#344',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.17087339e-01,  3.09338897e-01]).
:- end_object.

:- object('#345',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.21250174e-01,  3.16435255e-01]).
:- end_object.

:- object('#346',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.25314383e-01,  3.09281955e-01]).
:- end_object.

:- object('#347',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.29378593e-01,  3.02128655e-01]).
:- end_object.

:- object('#348',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.21151549e-01,  3.02185596e-01]).
:- end_object.

:- object('#349',instantiates(cartesian_point)).
	name('').
	coordinates([ -4.26692303e-01,  4.21151549e-01,  3.02185596e-01]).
:- end_object.

:- object('#350',instantiates(cartesian_point)).
	name('').
	coordinates([ -4.26692303e-01,  4.12924504e-01,  3.02242538e-01]).
:- end_object.

:- object('#351',instantiates(cartesian_point)).
	name('').
	coordinates([ -4.26692303e-01,  4.17087339e-01,  3.09338897e-01]).
:- end_object.

:- object('#352',instantiates(cartesian_point)).
	name('').
	coordinates([ -4.26692303e-01,  4.21250174e-01,  3.16435255e-01]).
:- end_object.

:- object('#353',instantiates(cartesian_point)).
	name('').
	coordinates([ -4.26692303e-01,  4.25314383e-01,  3.09281955e-01]).
:- end_object.

:- object('#354',instantiates(cartesian_point)).
	name('').
	coordinates([ -4.26692303e-01,  4.29378593e-01,  3.02128655e-01]).
:- end_object.

:- object('#355',instantiates(cartesian_point)).
	name('').
	coordinates([ -4.26692303e-01,  4.21151549e-01,  3.02185596e-01]).
:- end_object.

:- object('#365',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.21151549e-01,  3.02185596e-01]).
:- end_object.

:- object('#367',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.25458848e-01,  3.04863818e-01]).
:- end_object.

:- object('#368',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.24150747e-01,  3.02164838e-01]).
:- end_object.

:- object('#369',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.21151549e-01,  3.02185596e-01]).
:- end_object.

:- object('#380',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.21151549e-01,  3.02185596e-01]).
:- end_object.

:- object('#382',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.21151549e-01,  3.02185596e-01]).
:- end_object.

:- object('#383',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.21151549e-01,  3.02185596e-01]).
:- end_object.

:- object('#387',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.21151549e-01,  3.02185596e-01]).
:- end_object.

:- object('#388',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.24150747e-01,  3.02164838e-01]).
:- end_object.

:- object('#389',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.25458848e-01,  3.04863818e-01]).
:- end_object.

:- object('#403',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.21151549e-01,  3.02185596e-01]).
:- end_object.

:- object('#404',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.12924504e-01,  3.02242538e-01]).
:- end_object.

:- object('#405',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.17087339e-01,  3.09338897e-01]).
:- end_object.

:- object('#406',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.21250174e-01,  3.16435255e-01]).
:- end_object.

:- object('#407',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.25314383e-01,  3.09281955e-01]).
:- end_object.

:- object('#408',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.29378593e-01,  3.02128655e-01]).
:- end_object.

:- object('#409',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.21151549e-01,  3.02185596e-01]).
:- end_object.

:- object('#410',instantiates(cartesian_point)).
	name('').
	coordinates([ -4.26692303e-01,  4.21151549e-01,  3.02185596e-01]).
:- end_object.

:- object('#411',instantiates(cartesian_point)).
	name('').
	coordinates([ -4.26692303e-01,  4.12924504e-01,  3.02242538e-01]).
:- end_object.

:- object('#412',instantiates(cartesian_point)).
	name('').
	coordinates([ -4.26692303e-01,  4.17087339e-01,  3.09338897e-01]).
:- end_object.

:- object('#413',instantiates(cartesian_point)).
	name('').
	coordinates([ -4.26692303e-01,  4.21250174e-01,  3.16435255e-01]).
:- end_object.

:- object('#414',instantiates(cartesian_point)).
	name('').
	coordinates([ -4.26692303e-01,  4.25314383e-01,  3.09281955e-01]).
:- end_object.

:- object('#415',instantiates(cartesian_point)).
	name('').
	coordinates([ -4.26692303e-01,  4.29378593e-01,  3.02128655e-01]).
:- end_object.

:- object('#416',instantiates(cartesian_point)).
	name('').
	coordinates([ -4.26692303e-01,  4.21151549e-01,  3.02185596e-01]).
:- end_object.

:- object('#425',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.25349663e-01,  3.09218743e-01]).
:- end_object.

:- object('#427',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.25349663e-01,  3.09218743e-01]).
:- end_object.

:- object('#429',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.25349663e-01,  3.09218743e-01]).
:- end_object.

:- object('#430',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.25349663e-01,  3.09218743e-01]).
:- end_object.

:- object('#434',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.25349663e-01,  3.09218743e-01]).
:- end_object.

:- object('#435',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.21249852e-01,  3.16434706e-01]).
:- end_object.

:- object('#436',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.17087339e-01,  3.09338897e-01]).
:- end_object.

:- object('#437',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.12924504e-01,  3.02242538e-01]).
:- end_object.

:- object('#438',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.21151549e-01,  3.02185596e-01]).
:- end_object.

:- object('#450',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.21151549e-01,  3.02185596e-01]).
:- end_object.

:- object('#451',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.12924504e-01,  3.02242538e-01]).
:- end_object.

:- object('#452',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.17087339e-01,  3.09338897e-01]).
:- end_object.

:- object('#453',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.21250174e-01,  3.16435255e-01]).
:- end_object.

:- object('#454',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.25314383e-01,  3.09281955e-01]).
:- end_object.

:- object('#455',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.25332264e-01,  3.09250484e-01]).
:- end_object.

:- object('#456',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.25349663e-01,  3.09218743e-01]).
:- end_object.

:- object('#470',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.24770967e-01,  3.09222748e-01]).
:- end_object.

:- object('#471',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.25980418e-01,  3.09214377e-01]).
:- end_object.

:- object('#472',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.24770967e-01,  3.09222748e-01]).
:- end_object.

:- object('#473',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.25980418e-01,  3.09214377e-01]).
:- end_object.

:- object('#476',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.24770967e-01,  3.09222748e-01]).
:- end_object.

:- object('#477',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.25349663e-01,  3.09218743e-01]).
:- end_object.

:- object('#482',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.25349663e-01,  3.09218743e-01]).
:- end_object.

:- object('#483',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.24770967e-01,  3.09222748e-01]).
:- end_object.

:- object('#490',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.13364116e-01,  3.14864797e-01]).
:- end_object.

:- object('#491',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.13255109e-01,  2.99115175e-01]).
:- end_object.

:- object('#492',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.29113738e-01,  3.14755790e-01]).
:- end_object.

:- object('#493',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.29004731e-01,  2.99006168e-01]).
:- end_object.

:- object('#495',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.13684603e-01,  3.06987391e-01]).
:- end_object.

:- object('#497',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.13684603e-01,  3.06987391e-01]).
:- end_object.

:- object('#498',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.13774511e-01,  3.19977461e-01]).
:- end_object.

:- object('#499',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.24979288e-01,  3.13404564e-01]).
:- end_object.

:- object('#500',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.36184064e-01,  3.06831667e-01]).
:- end_object.

:- object('#501',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.24889380e-01,  3.00414494e-01]).
:- end_object.

:- object('#502',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.13594696e-01,  2.93997321e-01]).
:- end_object.

:- object('#503',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.13684603e-01,  3.06987391e-01]).
:- end_object.

:- object('#524',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.13684603e-01,  3.06987391e-01]).
:- end_object.

:- object('#525',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.13594696e-01,  2.93997321e-01]).
:- end_object.

:- object('#526',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.24889380e-01,  3.00414494e-01]).
:- end_object.

:- object('#527',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.36184064e-01,  3.06831667e-01]).
:- end_object.

:- object('#528',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.24979288e-01,  3.13404564e-01]).
:- end_object.

:- object('#529',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.13774511e-01,  3.19977461e-01]).
:- end_object.

:- object('#530',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.13684603e-01,  3.06987391e-01]).
:- end_object.

:- object('#531',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.13684603e-01,  3.06987391e-01]).
:- end_object.

:- object('#532',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.13594696e-01,  2.93997321e-01]).
:- end_object.

:- object('#533',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.24889380e-01,  3.00414494e-01]).
:- end_object.

:- object('#534',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.36184064e-01,  3.06831667e-01]).
:- end_object.

:- object('#535',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.24979288e-01,  3.13404564e-01]).
:- end_object.

:- object('#536',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.13774511e-01,  3.19977461e-01]).
:- end_object.

:- object('#537',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.13684603e-01,  3.06987391e-01]).
:- end_object.

:- object('#546',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.13684603e-01,  3.06987391e-01]).
:- end_object.

:- object('#548',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.13684603e-01,  3.06987391e-01]).
:- end_object.

:- object('#549',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.13774511e-01,  3.19977461e-01]).
:- end_object.

:- object('#550',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.24979288e-01,  3.13404564e-01]).
:- end_object.

:- object('#551',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.36184064e-01,  3.06831667e-01]).
:- end_object.

:- object('#552',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.24889380e-01,  3.00414494e-01]).
:- end_object.

:- object('#553',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.13594696e-01,  2.93997321e-01]).
:- end_object.

:- object('#554',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.13684603e-01,  3.06987391e-01]).
:- end_object.

:- object('#565',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.66312124e-01,  4.13684603e-01,  3.06987391e-01]).
:- end_object.

:- object('#566',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.13684603e-01,  3.06987391e-01]).
:- end_object.

:- object('#575',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.43195812e-01,  3.28676161e-01]).
:- end_object.

:- object('#576',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  3.99476075e-01,  3.28978755e-01]).
:- end_object.

:- object('#577',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.42892773e-01,  2.84892210e-01]).
:- end_object.

:- object('#578',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  3.99173035e-01,  2.85194805e-01]).
:- end_object.

:- object('#580',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.21328728e-01,  3.27784983e-01]).
:- end_object.

:- object('#582',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.22374870e-01,  3.26399111e-01]).
:- end_object.

:- object('#584',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.21328728e-01,  3.27784983e-01]).
:- end_object.

:- object('#585',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.22374870e-01,  3.26399111e-01]).
:- end_object.

:- object('#589',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.20263503e-01,  3.26413725e-01]).
:- end_object.

:- object('#591',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.21328728e-01,  3.27784983e-01]).
:- end_object.

:- object('#592',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.20263503e-01,  3.26413725e-01]).
:- end_object.

:- object('#596',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.19073655e-01,  3.27678365e-01]).
:- end_object.

:- object('#598',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.20263503e-01,  3.26413725e-01]).
:- end_object.

:- object('#599',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.19073655e-01,  3.27678365e-01]).
:- end_object.

:- object('#603',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.18162933e-01,  3.26199973e-01]).
:- end_object.

:- object('#605',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.19073655e-01,  3.27678365e-01]).
:- end_object.

:- object('#606',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.18162933e-01,  3.26199973e-01]).
:- end_object.

:- object('#610',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.16843328e-01,  3.27328555e-01]).
:- end_object.

:- object('#612',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.18162933e-01,  3.26199973e-01]).
:- end_object.

:- object('#613',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.16843328e-01,  3.27328555e-01]).
:- end_object.

:- object('#617',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.16097788e-01,  3.25760363e-01]).
:- end_object.

:- object('#619',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.16843328e-01,  3.27328555e-01]).
:- end_object.

:- object('#620',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.16097788e-01,  3.25760363e-01]).
:- end_object.

:- object('#624',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.14663897e-01,  3.26739655e-01]).
:- end_object.

:- object('#626',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.16097788e-01,  3.25760363e-01]).
:- end_object.

:- object('#627',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.14663897e-01,  3.26739655e-01]).
:- end_object.

:- object('#631',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.14092278e-01,  3.25100049e-01]).
:- end_object.

:- object('#633',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.14663897e-01,  3.26739655e-01]).
:- end_object.

:- object('#634',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.14092278e-01,  3.25100049e-01]).
:- end_object.

:- object('#638',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.12560913e-01,  3.25918569e-01]).
:- end_object.

:- object('#640',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.14092278e-01,  3.25100049e-01]).
:- end_object.

:- object('#641',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.12560913e-01,  3.25918569e-01]).
:- end_object.

:- object('#645',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.12169917e-01,  3.24226772e-01]).
:- end_object.

:- object('#647',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.12560913e-01,  3.25918569e-01]).
:- end_object.

:- object('#648',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.12169917e-01,  3.24226772e-01]).
:- end_object.

:- object('#652',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.10559031e-01,  3.24874924e-01]).
:- end_object.

:- object('#654',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.12169917e-01,  3.24226772e-01]).
:- end_object.

:- object('#655',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.10559031e-01,  3.24874924e-01]).
:- end_object.

:- object('#659',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.10353244e-01,  3.23150770e-01]).
:- end_object.

:- object('#661',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.10559031e-01,  3.24874924e-01]).
:- end_object.

:- object('#662',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.10353244e-01,  3.23150770e-01]).
:- end_object.

:- object('#666',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.08681723e-01,  3.23620955e-01]).
:- end_object.

:- object('#668',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.10353244e-01,  3.23150770e-01]).
:- end_object.

:- object('#669',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.08681723e-01,  3.23620955e-01]).
:- end_object.

:- object('#673',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.08663556e-01,  3.21884659e-01]).
:- end_object.

:- object('#675',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.08681723e-01,  3.23620955e-01]).
:- end_object.

:- object('#676',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.08663556e-01,  3.21884659e-01]).
:- end_object.

:- object('#680',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.06950998e-01,  3.22171364e-01]).
:- end_object.

:- object('#682',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.08663556e-01,  3.21884659e-01]).
:- end_object.

:- object('#683',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.06950998e-01,  3.22171364e-01]).
:- end_object.

:- object('#687',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.07120663e-01,  3.20443282e-01]).
:- end_object.

:- object('#689',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.06950998e-01,  3.22171364e-01]).
:- end_object.

:- object('#690',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.07120663e-01,  3.20443282e-01]).
:- end_object.

:- object('#694',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.05387146e-01,  3.20543147e-01]).
:- end_object.

:- object('#696',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.07120663e-01,  3.20443282e-01]).
:- end_object.

:- object('#697',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.05387146e-01,  3.20543147e-01]).
:- end_object.

:- object('#701',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.05742656e-01,  3.18843539e-01]).
:- end_object.

:- object('#703',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.05387146e-01,  3.20543147e-01]).
:- end_object.

:- object('#704',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.05742656e-01,  3.18843539e-01]).
:- end_object.

:- object('#708',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.04008503e-01,  3.18755392e-01]).
:- end_object.

:- object('#710',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.05742656e-01,  3.18843539e-01]).
:- end_object.

:- object('#711',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.04008503e-01,  3.18755392e-01]).
:- end_object.

:- object('#715',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.04545689e-01,  3.17104184e-01]).
:- end_object.

:- object('#717',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.04008503e-01,  3.18755392e-01]).
:- end_object.

:- object('#718',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.04545689e-01,  3.17104184e-01]).
:- end_object.

:- object('#722',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.02831232e-01,  3.16829059e-01]).
:- end_object.

:- object('#724',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.04545689e-01,  3.17104184e-01]).
:- end_object.

:- object('#725',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.02831232e-01,  3.16829059e-01]).
:- end_object.

:- object('#729',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.03543795e-01,  3.15245611e-01]).
:- end_object.

:- object('#731',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.02831232e-01,  3.16829059e-01]).
:- end_object.

:- object('#732',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.03543795e-01,  3.15245611e-01]).
:- end_object.

:- object('#736',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.01869135e-01,  3.14786734e-01]).
:- end_object.

:- object('#738',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.03543795e-01,  3.15245611e-01]).
:- end_object.

:- object('#739',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.01869135e-01,  3.14786734e-01]).
:- end_object.

:- object('#743',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.02748723e-01,  3.13289609e-01]).
:- end_object.

:- object('#745',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.01869135e-01,  3.14786734e-01]).
:- end_object.

:- object('#746',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.02748723e-01,  3.13289609e-01]).
:- end_object.

:- object('#750',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.01133493e-01,  3.12652359e-01]).
:- end_object.

:- object('#752',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.02748723e-01,  3.13289609e-01]).
:- end_object.

:- object('#753',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.01133493e-01,  3.12652359e-01]).
:- end_object.

:- object('#757',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.02169792e-01,  3.11259111e-01]).
:- end_object.

:- object('#759',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.01133493e-01,  3.12652359e-01]).
:- end_object.

:- object('#760',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.02169792e-01,  3.11259111e-01]).
:- end_object.

:- object('#764',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.00632929e-01,  3.10450960e-01]).
:- end_object.

:- object('#766',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.02169792e-01,  3.11259111e-01]).
:- end_object.

:- object('#767',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.00632929e-01,  3.10450960e-01]).
:- end_object.

:- object('#771',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.01813790e-01,  3.09177923e-01]).
:- end_object.

:- object('#773',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.00632929e-01,  3.10450960e-01]).
:- end_object.

:- object('#774',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.01813790e-01,  3.09177923e-01]).
:- end_object.

:- object('#778',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.00373313e-01,  3.08208345e-01]).
:- end_object.

:- object('#780',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.01813790e-01,  3.09177923e-01]).
:- end_object.

:- object('#781',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.00373313e-01,  3.08208345e-01]).
:- end_object.

:- object('#785',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.01684891e-01,  3.07070443e-01]).
:- end_object.

:- object('#787',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.00373313e-01,  3.08208345e-01]).
:- end_object.

:- object('#788',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.01684891e-01,  3.07070443e-01]).
:- end_object.

:- object('#792',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.00357688e-01,  3.05950806e-01]).
:- end_object.

:- object('#794',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.01684891e-01,  3.07070443e-01]).
:- end_object.

:- object('#795',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.00357688e-01,  3.05950806e-01]).
:- end_object.

:- object('#799',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.01784606e-01,  3.04961382e-01]).
:- end_object.

:- object('#801',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.00357688e-01,  3.05950806e-01]).
:- end_object.

:- object('#802',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.01784606e-01,  3.04961382e-01]).
:- end_object.

:- object('#806',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.00586238e-01,  3.03704812e-01]).
:- end_object.

:- object('#808',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.01784606e-01,  3.04961382e-01]).
:- end_object.

:- object('#809',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.00586238e-01,  3.03704812e-01]).
:- end_object.

:- object('#813',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.02111766e-01,  3.02875465e-01]).
:- end_object.

:- object('#815',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.00586238e-01,  3.03704812e-01]).
:- end_object.

:- object('#816',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.02111766e-01,  3.02875465e-01]).
:- end_object.

:- object('#820',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.01056282e-01,  3.01496695e-01]).
:- end_object.

:- object('#822',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.02111766e-01,  3.02875465e-01]).
:- end_object.

:- object('#823',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.01056282e-01,  3.01496695e-01]).
:- end_object.

:- object('#827',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.02662536e-01,  3.00837148e-01]).
:- end_object.

:- object('#829',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.01056282e-01,  3.01496695e-01]).
:- end_object.

:- object('#830',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.02662536e-01,  3.00837148e-01]).
:- end_object.

:- object('#834',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.01762311e-01,  2.99352342e-01]).
:- end_object.

:- object('#836',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.02662536e-01,  3.00837148e-01]).
:- end_object.

:- object('#837',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.01762311e-01,  2.99352342e-01]).
:- end_object.

:- object('#841',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.03430458e-01,  2.98870328e-01]).
:- end_object.

:- object('#843',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.01762311e-01,  2.99352342e-01]).
:- end_object.

:- object('#844',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.03430458e-01,  2.98870328e-01]).
:- end_object.

:- object('#848',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.02696045e-01,  2.97296895e-01]).
:- end_object.

:- object('#850',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.03430458e-01,  2.98870328e-01]).
:- end_object.

:- object('#851',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.02696045e-01,  2.97296895e-01]).
:- end_object.

:- object('#855',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.04406529e-01,  2.96998065e-01]).
:- end_object.

:- object('#857',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.02696045e-01,  2.97296895e-01]).
:- end_object.

:- object('#858',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.04406529e-01,  2.96998065e-01]).
:- end_object.

:- object('#862',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.03846540e-01,  2.95354452e-01]).
:- end_object.

:- object('#864',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.04406529e-01,  2.96998065e-01]).
:- end_object.

:- object('#865',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.03846540e-01,  2.95354452e-01]).
:- end_object.

:- object('#869',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.05579306e-01,  2.95242309e-01]).
:- end_object.

:- object('#871',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.03846540e-01,  2.95354452e-01]).
:- end_object.

:- object('#872',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.05579306e-01,  2.95242309e-01]).
:- end_object.

:- object('#876',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.05200305e-01,  2.93547785e-01]).
:- end_object.

:- object('#878',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.05579306e-01,  2.95242309e-01]).
:- end_object.

:- object('#879',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.05200305e-01,  2.93547785e-01]).
:- end_object.

:- object('#883',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.06935038e-01,  2.93623645e-01]).
:- end_object.

:- object('#885',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.05200305e-01,  2.93547785e-01]).
:- end_object.

:- object('#886',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.06935038e-01,  2.93623645e-01]).
:- end_object.

:- object('#890',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.06741469e-01,  2.91898077e-01]).
:- end_object.

:- object('#892',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.06935038e-01,  2.93623645e-01]).
:- end_object.

:- object('#893',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.06741469e-01,  2.91898077e-01]).
:- end_object.

:- object('#897',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.08457832e-01,  2.92161050e-01]).
:- end_object.

:- object('#899',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.06741469e-01,  2.91898077e-01]).
:- end_object.

:- object('#900',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.08457832e-01,  2.92161050e-01]).
:- end_object.

:- object('#904',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.08451964e-01,  2.90424669e-01]).
:- end_object.

:- object('#906',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.08457832e-01,  2.92161050e-01]).
:- end_object.

:- object('#907',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.08451964e-01,  2.90424669e-01]).
:- end_object.

:- object('#911',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.10129833e-01,  2.90871672e-01]).
:- end_object.

:- object('#913',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.08451964e-01,  2.90424669e-01]).
:- end_object.

:- object('#914',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.10129833e-01,  2.90871672e-01]).
:- end_object.

:- object('#918',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.10311735e-01,  2.89144835e-01]).
:- end_object.

:- object('#920',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.10129833e-01,  2.90871672e-01]).
:- end_object.

:- object('#921',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.10311735e-01,  2.89144835e-01]).
:- end_object.

:- object('#925',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.11931439e-01,  2.89770627e-01]).
:- end_object.

:- object('#927',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.10311735e-01,  2.89144835e-01]).
:- end_object.

:- object('#928',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.11931439e-01,  2.89770627e-01]).
:- end_object.

:- object('#932',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.12298979e-01,  2.88073580e-01]).
:- end_object.

:- object('#934',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.11931439e-01,  2.89770627e-01]).
:- end_object.

:- object('#935',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.12298979e-01,  2.88073580e-01]).
:- end_object.

:- object('#939',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.13841527e-01,  2.88870825e-01]).
:- end_object.

:- object('#941',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.12298979e-01,  2.88073580e-01]).
:- end_object.

:- object('#942',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.13841527e-01,  2.88870825e-01]).
:- end_object.

:- object('#946',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.14390396e-01,  2.87223464e-01]).
:- end_object.

:- object('#948',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.13841527e-01,  2.88870825e-01]).
:- end_object.

:- object('#949',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.14390396e-01,  2.87223464e-01]).
:- end_object.

:- object('#953',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.15837705e-01,  2.88182814e-01]).
:- end_object.

:- object('#955',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.14390396e-01,  2.87223464e-01]).
:- end_object.

:- object('#956',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.15837705e-01,  2.88182814e-01]).
:- end_object.

:- object('#960',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.16561467e-01,  2.86604453e-01]).
:- end_object.

:- object('#962',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.15837705e-01,  2.88182814e-01]).
:- end_object.

:- object('#963',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.16561467e-01,  2.86604453e-01]).
:- end_object.

:- object('#967',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.17896568e-01,  2.87714661e-01]).
:- end_object.

:- object('#969',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.16561467e-01,  2.86604453e-01]).
:- end_object.

:- object('#970',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.17896568e-01,  2.87714661e-01]).
:- end_object.

:- object('#974',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.18786738e-01,  2.86223805e-01]).
:- end_object.

:- object('#976',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.17896568e-01,  2.87714661e-01]).
:- end_object.

:- object('#977',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.18786738e-01,  2.86223805e-01]).
:- end_object.

:- object('#981',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.19993977e-01,  2.87471854e-01]).
:- end_object.

:- object('#983',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.18786738e-01,  2.86223805e-01]).
:- end_object.

:- object('#984',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.19993977e-01,  2.87471854e-01]).
:- end_object.

:- object('#988',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.21040120e-01,  2.86085982e-01]).
:- end_object.

:- object('#990',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.19993977e-01,  2.87471854e-01]).
:- end_object.

:- object('#991',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.21040120e-01,  2.86085982e-01]).
:- end_object.

:- object('#995',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.22105345e-01,  2.87457241e-01]).
:- end_object.

:- object('#997',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.21040120e-01,  2.86085982e-01]).
:- end_object.

:- object('#998',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.22105345e-01,  2.87457241e-01]).
:- end_object.

:- object('#1002',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.23295193e-01,  2.86192601e-01]).
:- end_object.

:- object('#1004',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.22105345e-01,  2.87457241e-01]).
:- end_object.

:- object('#1005',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.23295193e-01,  2.86192601e-01]).
:- end_object.

:- object('#1009',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.24205914e-01,  2.87670992e-01]).
:- end_object.

:- object('#1011',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.23295193e-01,  2.86192601e-01]).
:- end_object.

:- object('#1012',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.24205914e-01,  2.87670992e-01]).
:- end_object.

:- object('#1016',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.25525520e-01,  2.86542411e-01]).
:- end_object.

:- object('#1018',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.24205914e-01,  2.87670992e-01]).
:- end_object.

:- object('#1019',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.25525520e-01,  2.86542411e-01]).
:- end_object.

:- object('#1023',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.26271060e-01,  2.88110602e-01]).
:- end_object.

:- object('#1025',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.25525520e-01,  2.86542411e-01]).
:- end_object.

:- object('#1026',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.26271060e-01,  2.88110602e-01]).
:- end_object.

:- object('#1030',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.27704951e-01,  2.87131311e-01]).
:- end_object.

:- object('#1032',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.26271060e-01,  2.88110602e-01]).
:- end_object.

:- object('#1033',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.27704951e-01,  2.87131311e-01]).
:- end_object.

:- object('#1037',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.28276570e-01,  2.88770917e-01]).
:- end_object.

:- object('#1039',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.27704951e-01,  2.87131311e-01]).
:- end_object.

:- object('#1040',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.28276570e-01,  2.88770917e-01]).
:- end_object.

:- object('#1044',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.29807935e-01,  2.87952397e-01]).
:- end_object.

:- object('#1046',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.28276570e-01,  2.88770917e-01]).
:- end_object.

:- object('#1047',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.29807935e-01,  2.87952397e-01]).
:- end_object.

:- object('#1051',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.30198930e-01,  2.89644194e-01]).
:- end_object.

:- object('#1053',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.29807935e-01,  2.87952397e-01]).
:- end_object.

:- object('#1054',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.30198930e-01,  2.89644194e-01]).
:- end_object.

:- object('#1058',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.31809816e-01,  2.88996042e-01]).
:- end_object.

:- object('#1060',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.30198930e-01,  2.89644194e-01]).
:- end_object.

:- object('#1061',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.31809816e-01,  2.88996042e-01]).
:- end_object.

:- object('#1065',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.32015604e-01,  2.90720196e-01]).
:- end_object.

:- object('#1067',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.31809816e-01,  2.88996042e-01]).
:- end_object.

:- object('#1068',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.32015604e-01,  2.90720196e-01]).
:- end_object.

:- object('#1072',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.33687125e-01,  2.90250011e-01]).
:- end_object.

:- object('#1074',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.32015604e-01,  2.90720196e-01]).
:- end_object.

:- object('#1075',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.33687125e-01,  2.90250011e-01]).
:- end_object.

:- object('#1079',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.33705292e-01,  2.91986307e-01]).
:- end_object.

:- object('#1081',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.33687125e-01,  2.90250011e-01]).
:- end_object.

:- object('#1082',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.33705292e-01,  2.91986307e-01]).
:- end_object.

:- object('#1086',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.35417850e-01,  2.91699602e-01]).
:- end_object.

:- object('#1088',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.33705292e-01,  2.91986307e-01]).
:- end_object.

:- object('#1089',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.35417850e-01,  2.91699602e-01]).
:- end_object.

:- object('#1093',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.35248184e-01,  2.93427684e-01]).
:- end_object.

:- object('#1095',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.35417850e-01,  2.91699602e-01]).
:- end_object.

:- object('#1096',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.35248184e-01,  2.93427684e-01]).
:- end_object.

:- object('#1100',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.36981702e-01,  2.93327819e-01]).
:- end_object.

:- object('#1102',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.35248184e-01,  2.93427684e-01]).
:- end_object.

:- object('#1103',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.36981702e-01,  2.93327819e-01]).
:- end_object.

:- object('#1107',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.36626192e-01,  2.95027427e-01]).
:- end_object.

:- object('#1109',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.36981702e-01,  2.93327819e-01]).
:- end_object.

:- object('#1110',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.36626192e-01,  2.95027427e-01]).
:- end_object.

:- object('#1114',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.38360345e-01,  2.95115574e-01]).
:- end_object.

:- object('#1116',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.36626192e-01,  2.95027427e-01]).
:- end_object.

:- object('#1117',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.38360345e-01,  2.95115574e-01]).
:- end_object.

:- object('#1121',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.37823159e-01,  2.96766782e-01]).
:- end_object.

:- object('#1123',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.38360345e-01,  2.95115574e-01]).
:- end_object.

:- object('#1124',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.37823159e-01,  2.96766782e-01]).
:- end_object.

:- object('#1128',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.39537615e-01,  2.97041907e-01]).
:- end_object.

:- object('#1130',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.37823159e-01,  2.96766782e-01]).
:- end_object.

:- object('#1131',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.39537615e-01,  2.97041907e-01]).
:- end_object.

:- object('#1135',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.38825052e-01,  2.98625355e-01]).
:- end_object.

:- object('#1137',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.39537615e-01,  2.97041907e-01]).
:- end_object.

:- object('#1138',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.38825052e-01,  2.98625355e-01]).
:- end_object.

:- object('#1142',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.40499712e-01,  2.99084232e-01]).
:- end_object.

:- object('#1144',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.38825052e-01,  2.98625355e-01]).
:- end_object.

:- object('#1145',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.40499712e-01,  2.99084232e-01]).
:- end_object.

:- object('#1149',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.39620125e-01,  3.00581356e-01]).
:- end_object.

:- object('#1151',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.40499712e-01,  2.99084232e-01]).
:- end_object.

:- object('#1152',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.39620125e-01,  3.00581356e-01]).
:- end_object.

:- object('#1156',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.41235355e-01,  3.01218607e-01]).
:- end_object.

:- object('#1158',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.39620125e-01,  3.00581356e-01]).
:- end_object.

:- object('#1159',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.41235355e-01,  3.01218607e-01]).
:- end_object.

:- object('#1163',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.40199056e-01,  3.02611854e-01]).
:- end_object.

:- object('#1165',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.41235355e-01,  3.01218607e-01]).
:- end_object.

:- object('#1166',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.40199056e-01,  3.02611854e-01]).
:- end_object.

:- object('#1170',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.41735918e-01,  3.03420006e-01]).
:- end_object.

:- object('#1172',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.40199056e-01,  3.02611854e-01]).
:- end_object.

:- object('#1173',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.41735918e-01,  3.03420006e-01]).
:- end_object.

:- object('#1177',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.40555058e-01,  3.04693043e-01]).
:- end_object.

:- object('#1179',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.41735918e-01,  3.03420006e-01]).
:- end_object.

:- object('#1180',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.40555058e-01,  3.04693043e-01]).
:- end_object.

:- object('#1184',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.41995534e-01,  3.05662621e-01]).
:- end_object.

:- object('#1186',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.40555058e-01,  3.04693043e-01]).
:- end_object.

:- object('#1187',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.41995534e-01,  3.05662621e-01]).
:- end_object.

:- object('#1191',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.40683957e-01,  3.06800522e-01]).
:- end_object.

:- object('#1193',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.41995534e-01,  3.05662621e-01]).
:- end_object.

:- object('#1194',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.40683957e-01,  3.06800522e-01]).
:- end_object.

:- object('#1198',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.42011159e-01,  3.07920160e-01]).
:- end_object.

:- object('#1200',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.40683957e-01,  3.06800522e-01]).
:- end_object.

:- object('#1201',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.42011159e-01,  3.07920160e-01]).
:- end_object.

:- object('#1205',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.40584241e-01,  3.08909584e-01]).
:- end_object.

:- object('#1207',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.42011159e-01,  3.07920160e-01]).
:- end_object.

:- object('#1208',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.40584241e-01,  3.08909584e-01]).
:- end_object.

:- object('#1212',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.41782610e-01,  3.10166154e-01]).
:- end_object.

:- object('#1214',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.40584241e-01,  3.08909584e-01]).
:- end_object.

:- object('#1215',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.41782610e-01,  3.10166154e-01]).
:- end_object.

:- object('#1219',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.40257081e-01,  3.10995501e-01]).
:- end_object.

:- object('#1221',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.41782610e-01,  3.10166154e-01]).
:- end_object.

:- object('#1222',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.40257081e-01,  3.10995501e-01]).
:- end_object.

:- object('#1226',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.41312565e-01,  3.12374271e-01]).
:- end_object.

:- object('#1228',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.40257081e-01,  3.10995501e-01]).
:- end_object.

:- object('#1229',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.41312565e-01,  3.12374271e-01]).
:- end_object.

:- object('#1233',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.39706311e-01,  3.13033818e-01]).
:- end_object.

:- object('#1235',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.41312565e-01,  3.12374271e-01]).
:- end_object.

:- object('#1236',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.39706311e-01,  3.13033818e-01]).
:- end_object.

:- object('#1240',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.40606537e-01,  3.14518624e-01]).
:- end_object.

:- object('#1242',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.39706311e-01,  3.13033818e-01]).
:- end_object.

:- object('#1243',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.40606537e-01,  3.14518624e-01]).
:- end_object.

:- object('#1247',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.38938389e-01,  3.15000637e-01]).
:- end_object.

:- object('#1249',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.40606537e-01,  3.14518624e-01]).
:- end_object.

:- object('#1250',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.38938389e-01,  3.15000637e-01]).
:- end_object.

:- object('#1254',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.39672802e-01,  3.16574071e-01]).
:- end_object.

:- object('#1256',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.38938389e-01,  3.15000637e-01]).
:- end_object.

:- object('#1257',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.39672802e-01,  3.16574071e-01]).
:- end_object.

:- object('#1261',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.37962318e-01,  3.16872901e-01]).
:- end_object.

:- object('#1263',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.39672802e-01,  3.16574071e-01]).
:- end_object.

:- object('#1264',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.37962318e-01,  3.16872901e-01]).
:- end_object.

:- object('#1268',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.38522307e-01,  3.18516514e-01]).
:- end_object.

:- object('#1270',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.37962318e-01,  3.16872901e-01]).
:- end_object.

:- object('#1271',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.38522307e-01,  3.18516514e-01]).
:- end_object.

:- object('#1275',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.36789541e-01,  3.18628656e-01]).
:- end_object.

:- object('#1277',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.38522307e-01,  3.18516514e-01]).
:- end_object.

:- object('#1278',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.36789541e-01,  3.18628656e-01]).
:- end_object.

:- object('#1282',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.37168542e-01,  3.20323181e-01]).
:- end_object.

:- object('#1284',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.36789541e-01,  3.18628656e-01]).
:- end_object.

:- object('#1285',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.37168542e-01,  3.20323181e-01]).
:- end_object.

:- object('#1289',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.35433809e-01,  3.20247320e-01]).
:- end_object.

:- object('#1291',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.37168542e-01,  3.20323181e-01]).
:- end_object.

:- object('#1292',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.35433809e-01,  3.20247320e-01]).
:- end_object.

:- object('#1296',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.35627378e-01,  3.21972889e-01]).
:- end_object.

:- object('#1298',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.35433809e-01,  3.20247320e-01]).
:- end_object.

:- object('#1299',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.35627378e-01,  3.21972889e-01]).
:- end_object.

:- object('#1303',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.33911015e-01,  3.21709915e-01]).
:- end_object.

:- object('#1305',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.35627378e-01,  3.21972889e-01]).
:- end_object.

:- object('#1306',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.33911015e-01,  3.21709915e-01]).
:- end_object.

:- object('#1310',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.33916883e-01,  3.23446297e-01]).
:- end_object.

:- object('#1312',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.33911015e-01,  3.21709915e-01]).
:- end_object.

:- object('#1313',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.33916883e-01,  3.23446297e-01]).
:- end_object.

:- object('#1317',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.32239014e-01,  3.22999294e-01]).
:- end_object.

:- object('#1319',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.33916883e-01,  3.23446297e-01]).
:- end_object.

:- object('#1320',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.32239014e-01,  3.22999294e-01]).
:- end_object.

:- object('#1324',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.32057112e-01,  3.24726131e-01]).
:- end_object.

:- object('#1326',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.32239014e-01,  3.22999294e-01]).
:- end_object.

:- object('#1327',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.32057112e-01,  3.24726131e-01]).
:- end_object.

:- object('#1331',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.30437408e-01,  3.24100338e-01]).
:- end_object.

:- object('#1333',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.32057112e-01,  3.24726131e-01]).
:- end_object.

:- object('#1334',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.30437408e-01,  3.24100338e-01]).
:- end_object.

:- object('#1338',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.30069868e-01,  3.25797386e-01]).
:- end_object.

:- object('#1340',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.30437408e-01,  3.24100338e-01]).
:- end_object.

:- object('#1341',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.30069868e-01,  3.25797386e-01]).
:- end_object.

:- object('#1345',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.28527320e-01,  3.25000141e-01]).
:- end_object.

:- object('#1347',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.30069868e-01,  3.25797386e-01]).
:- end_object.

:- object('#1348',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.28527320e-01,  3.25000141e-01]).
:- end_object.

:- object('#1352',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.27978451e-01,  3.26647502e-01]).
:- end_object.

:- object('#1354',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.28527320e-01,  3.25000141e-01]).
:- end_object.

:- object('#1355',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.27978451e-01,  3.26647502e-01]).
:- end_object.

:- object('#1359',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.26531142e-01,  3.25688152e-01]).
:- end_object.

:- object('#1361',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.27978451e-01,  3.26647502e-01]).
:- end_object.

:- object('#1362',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.26531142e-01,  3.25688152e-01]).
:- end_object.

:- object('#1366',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.25807380e-01,  3.27266513e-01]).
:- end_object.

:- object('#1368',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.26531142e-01,  3.25688152e-01]).
:- end_object.

:- object('#1369',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.25807380e-01,  3.27266513e-01]).
:- end_object.

:- object('#1373',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.24472279e-01,  3.26156305e-01]).
:- end_object.

:- object('#1375',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.25807380e-01,  3.27266513e-01]).
:- end_object.

:- object('#1376',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.24472279e-01,  3.26156305e-01]).
:- end_object.

:- object('#1380',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.23582109e-01,  3.27647161e-01]).
:- end_object.

:- object('#1382',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.24472279e-01,  3.26156305e-01]).
:- end_object.

:- object('#1383',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.23582109e-01,  3.27647161e-01]).
:- end_object.

:- object('#1387',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.23582109e-01,  3.27647161e-01]).
:- end_object.

:- object('#1388',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.22374870e-01,  3.26399111e-01]).
:- end_object.

:- object('#1398',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.24472279e-01,  3.26156305e-01]).
:- end_object.

:- object('#1399',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.23582109e-01,  3.27647161e-01]).
:- end_object.

:- object('#1400',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.24472279e-01,  3.26156305e-01]).
:- end_object.

:- object('#1401',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.23582109e-01,  3.27647161e-01]).
:- end_object.

:- object('#1403',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.23582109e-01,  3.27647161e-01]).
:- end_object.

:- object('#1405',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.24472279e-01,  3.26156305e-01]).
:- end_object.

:- object('#1407',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.23582109e-01,  3.27647161e-01]).
:- end_object.

:- object('#1408',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.24472279e-01,  3.26156305e-01]).
:- end_object.

:- object('#1412',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.23582109e-01,  3.27647161e-01]).
:- end_object.

:- object('#1413',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.23582109e-01,  3.27647161e-01]).
:- end_object.

:- object('#1418',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.24472279e-01,  3.26156305e-01]).
:- end_object.

:- object('#1419',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.24472279e-01,  3.26156305e-01]).
:- end_object.

:- object('#1426',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.25807380e-01,  3.27266513e-01]).
:- end_object.

:- object('#1427',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.24472279e-01,  3.26156305e-01]).
:- end_object.

:- object('#1428',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.25807380e-01,  3.27266513e-01]).
:- end_object.

:- object('#1429',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.24472279e-01,  3.26156305e-01]).
:- end_object.

:- object('#1431',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.25807380e-01,  3.27266513e-01]).
:- end_object.

:- object('#1433',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.24472279e-01,  3.26156305e-01]).
:- end_object.

:- object('#1434',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.25807380e-01,  3.27266513e-01]).
:- end_object.

:- object('#1440',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.25807380e-01,  3.27266513e-01]).
:- end_object.

:- object('#1441',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.25807380e-01,  3.27266513e-01]).
:- end_object.

:- object('#1448',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.26531142e-01,  3.25688152e-01]).
:- end_object.

:- object('#1449',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.25807380e-01,  3.27266513e-01]).
:- end_object.

:- object('#1450',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.26531142e-01,  3.25688152e-01]).
:- end_object.

:- object('#1451',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.25807380e-01,  3.27266513e-01]).
:- end_object.

:- object('#1453',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.26531142e-01,  3.25688152e-01]).
:- end_object.

:- object('#1455',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.25807380e-01,  3.27266513e-01]).
:- end_object.

:- object('#1456',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.26531142e-01,  3.25688152e-01]).
:- end_object.

:- object('#1462',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.26531142e-01,  3.25688152e-01]).
:- end_object.

:- object('#1463',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.26531142e-01,  3.25688152e-01]).
:- end_object.

:- object('#1470',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.27978451e-01,  3.26647502e-01]).
:- end_object.

:- object('#1471',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.26531142e-01,  3.25688152e-01]).
:- end_object.

:- object('#1472',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.27978451e-01,  3.26647502e-01]).
:- end_object.

:- object('#1473',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.26531142e-01,  3.25688152e-01]).
:- end_object.

:- object('#1475',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.27978451e-01,  3.26647502e-01]).
:- end_object.

:- object('#1477',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.26531142e-01,  3.25688152e-01]).
:- end_object.

:- object('#1478',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.27978451e-01,  3.26647502e-01]).
:- end_object.

:- object('#1484',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.27978451e-01,  3.26647502e-01]).
:- end_object.

:- object('#1485',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.27978451e-01,  3.26647502e-01]).
:- end_object.

:- object('#1492',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.28527320e-01,  3.25000141e-01]).
:- end_object.

:- object('#1493',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.27978451e-01,  3.26647502e-01]).
:- end_object.

:- object('#1494',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.28527320e-01,  3.25000141e-01]).
:- end_object.

:- object('#1495',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.27978451e-01,  3.26647502e-01]).
:- end_object.

:- object('#1497',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.28527320e-01,  3.25000141e-01]).
:- end_object.

:- object('#1499',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.27978451e-01,  3.26647502e-01]).
:- end_object.

:- object('#1500',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.28527320e-01,  3.25000141e-01]).
:- end_object.

:- object('#1506',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.28527320e-01,  3.25000141e-01]).
:- end_object.

:- object('#1507',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.28527320e-01,  3.25000141e-01]).
:- end_object.

:- object('#1514',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.30069868e-01,  3.25797386e-01]).
:- end_object.

:- object('#1515',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.28527320e-01,  3.25000141e-01]).
:- end_object.

:- object('#1516',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.30069868e-01,  3.25797386e-01]).
:- end_object.

:- object('#1517',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.28527320e-01,  3.25000141e-01]).
:- end_object.

:- object('#1519',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.30069868e-01,  3.25797386e-01]).
:- end_object.

:- object('#1521',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.28527320e-01,  3.25000141e-01]).
:- end_object.

:- object('#1522',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.30069868e-01,  3.25797386e-01]).
:- end_object.

:- object('#1528',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.30069868e-01,  3.25797386e-01]).
:- end_object.

:- object('#1529',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.30069868e-01,  3.25797386e-01]).
:- end_object.

:- object('#1536',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.30437408e-01,  3.24100338e-01]).
:- end_object.

:- object('#1537',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.30069868e-01,  3.25797386e-01]).
:- end_object.

:- object('#1538',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.30437408e-01,  3.24100338e-01]).
:- end_object.

:- object('#1539',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.30069868e-01,  3.25797386e-01]).
:- end_object.

:- object('#1541',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.30437408e-01,  3.24100338e-01]).
:- end_object.

:- object('#1543',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.30069868e-01,  3.25797386e-01]).
:- end_object.

:- object('#1544',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.30437408e-01,  3.24100338e-01]).
:- end_object.

:- object('#1550',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.30437408e-01,  3.24100338e-01]).
:- end_object.

:- object('#1551',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.30437408e-01,  3.24100338e-01]).
:- end_object.

:- object('#1558',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.32057112e-01,  3.24726131e-01]).
:- end_object.

:- object('#1559',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.30437408e-01,  3.24100338e-01]).
:- end_object.

:- object('#1560',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.32057112e-01,  3.24726131e-01]).
:- end_object.

:- object('#1561',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.30437408e-01,  3.24100338e-01]).
:- end_object.

:- object('#1563',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.32057112e-01,  3.24726131e-01]).
:- end_object.

:- object('#1565',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.30437408e-01,  3.24100338e-01]).
:- end_object.

:- object('#1566',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.32057112e-01,  3.24726131e-01]).
:- end_object.

:- object('#1572',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.32057112e-01,  3.24726131e-01]).
:- end_object.

:- object('#1573',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.32057112e-01,  3.24726131e-01]).
:- end_object.

:- object('#1580',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.32239014e-01,  3.22999294e-01]).
:- end_object.

:- object('#1581',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.32057112e-01,  3.24726131e-01]).
:- end_object.

:- object('#1582',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.32239014e-01,  3.22999294e-01]).
:- end_object.

:- object('#1583',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.32057112e-01,  3.24726131e-01]).
:- end_object.

:- object('#1585',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.32239014e-01,  3.22999294e-01]).
:- end_object.

:- object('#1587',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.32057112e-01,  3.24726131e-01]).
:- end_object.

:- object('#1588',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.32239014e-01,  3.22999294e-01]).
:- end_object.

:- object('#1594',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.32239014e-01,  3.22999294e-01]).
:- end_object.

:- object('#1595',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.32239014e-01,  3.22999294e-01]).
:- end_object.

:- object('#1602',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.33916883e-01,  3.23446297e-01]).
:- end_object.

:- object('#1603',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.32239014e-01,  3.22999294e-01]).
:- end_object.

:- object('#1604',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.33916883e-01,  3.23446297e-01]).
:- end_object.

:- object('#1605',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.32239014e-01,  3.22999294e-01]).
:- end_object.

:- object('#1607',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.33916883e-01,  3.23446297e-01]).
:- end_object.

:- object('#1609',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.32239014e-01,  3.22999294e-01]).
:- end_object.

:- object('#1610',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.33916883e-01,  3.23446297e-01]).
:- end_object.

:- object('#1616',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.33916883e-01,  3.23446297e-01]).
:- end_object.

:- object('#1617',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.33916883e-01,  3.23446297e-01]).
:- end_object.

:- object('#1624',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.33911015e-01,  3.21709915e-01]).
:- end_object.

:- object('#1625',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.33916883e-01,  3.23446297e-01]).
:- end_object.

:- object('#1626',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.33911015e-01,  3.21709915e-01]).
:- end_object.

:- object('#1627',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.33916883e-01,  3.23446297e-01]).
:- end_object.

:- object('#1629',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.33911015e-01,  3.21709915e-01]).
:- end_object.

:- object('#1631',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.33916883e-01,  3.23446297e-01]).
:- end_object.

:- object('#1632',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.33911015e-01,  3.21709915e-01]).
:- end_object.

:- object('#1638',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.33911015e-01,  3.21709915e-01]).
:- end_object.

:- object('#1639',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.33911015e-01,  3.21709915e-01]).
:- end_object.

:- object('#1646',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.35627378e-01,  3.21972889e-01]).
:- end_object.

:- object('#1647',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.33911015e-01,  3.21709915e-01]).
:- end_object.

:- object('#1648',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.35627378e-01,  3.21972889e-01]).
:- end_object.

:- object('#1649',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.33911015e-01,  3.21709915e-01]).
:- end_object.

:- object('#1651',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.35627378e-01,  3.21972889e-01]).
:- end_object.

:- object('#1653',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.33911015e-01,  3.21709915e-01]).
:- end_object.

:- object('#1654',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.35627378e-01,  3.21972889e-01]).
:- end_object.

:- object('#1660',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.35627378e-01,  3.21972889e-01]).
:- end_object.

:- object('#1661',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.35627378e-01,  3.21972889e-01]).
:- end_object.

:- object('#1668',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.35433809e-01,  3.20247320e-01]).
:- end_object.

:- object('#1669',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.35627378e-01,  3.21972889e-01]).
:- end_object.

:- object('#1670',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.35433809e-01,  3.20247320e-01]).
:- end_object.

:- object('#1671',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.35627378e-01,  3.21972889e-01]).
:- end_object.

:- object('#1673',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.35433809e-01,  3.20247320e-01]).
:- end_object.

:- object('#1675',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.35627378e-01,  3.21972889e-01]).
:- end_object.

:- object('#1676',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.35433809e-01,  3.20247320e-01]).
:- end_object.

:- object('#1682',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.35433809e-01,  3.20247320e-01]).
:- end_object.

:- object('#1683',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.35433809e-01,  3.20247320e-01]).
:- end_object.

:- object('#1690',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.37168542e-01,  3.20323181e-01]).
:- end_object.

:- object('#1691',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.35433809e-01,  3.20247320e-01]).
:- end_object.

:- object('#1692',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.37168542e-01,  3.20323181e-01]).
:- end_object.

:- object('#1693',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.35433809e-01,  3.20247320e-01]).
:- end_object.

:- object('#1695',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.37168542e-01,  3.20323181e-01]).
:- end_object.

:- object('#1697',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.35433809e-01,  3.20247320e-01]).
:- end_object.

:- object('#1698',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.37168542e-01,  3.20323181e-01]).
:- end_object.

:- object('#1704',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.37168542e-01,  3.20323181e-01]).
:- end_object.

:- object('#1705',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.37168542e-01,  3.20323181e-01]).
:- end_object.

:- object('#1712',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.36789541e-01,  3.18628656e-01]).
:- end_object.

:- object('#1713',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.37168542e-01,  3.20323181e-01]).
:- end_object.

:- object('#1714',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.36789541e-01,  3.18628656e-01]).
:- end_object.

:- object('#1715',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.37168542e-01,  3.20323181e-01]).
:- end_object.

:- object('#1717',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.36789541e-01,  3.18628656e-01]).
:- end_object.

:- object('#1719',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.37168542e-01,  3.20323181e-01]).
:- end_object.

:- object('#1720',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.36789541e-01,  3.18628656e-01]).
:- end_object.

:- object('#1726',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.36789541e-01,  3.18628656e-01]).
:- end_object.

:- object('#1727',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.36789541e-01,  3.18628656e-01]).
:- end_object.

:- object('#1734',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.38522307e-01,  3.18516514e-01]).
:- end_object.

:- object('#1735',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.36789541e-01,  3.18628656e-01]).
:- end_object.

:- object('#1736',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.38522307e-01,  3.18516514e-01]).
:- end_object.

:- object('#1737',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.36789541e-01,  3.18628656e-01]).
:- end_object.

:- object('#1739',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.38522307e-01,  3.18516514e-01]).
:- end_object.

:- object('#1741',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.36789541e-01,  3.18628656e-01]).
:- end_object.

:- object('#1742',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.38522307e-01,  3.18516514e-01]).
:- end_object.

:- object('#1748',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.38522307e-01,  3.18516514e-01]).
:- end_object.

:- object('#1749',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.38522307e-01,  3.18516514e-01]).
:- end_object.

:- object('#1756',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.37962318e-01,  3.16872901e-01]).
:- end_object.

:- object('#1757',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.38522307e-01,  3.18516514e-01]).
:- end_object.

:- object('#1758',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.37962318e-01,  3.16872901e-01]).
:- end_object.

:- object('#1759',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.38522307e-01,  3.18516514e-01]).
:- end_object.

:- object('#1761',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.37962318e-01,  3.16872901e-01]).
:- end_object.

:- object('#1763',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.38522307e-01,  3.18516514e-01]).
:- end_object.

:- object('#1764',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.37962318e-01,  3.16872901e-01]).
:- end_object.

:- object('#1770',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.37962318e-01,  3.16872901e-01]).
:- end_object.

:- object('#1771',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.37962318e-01,  3.16872901e-01]).
:- end_object.

:- object('#1778',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.39672802e-01,  3.16574071e-01]).
:- end_object.

:- object('#1779',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.37962318e-01,  3.16872901e-01]).
:- end_object.

:- object('#1780',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.39672802e-01,  3.16574071e-01]).
:- end_object.

:- object('#1781',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.37962318e-01,  3.16872901e-01]).
:- end_object.

:- object('#1783',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.39672802e-01,  3.16574071e-01]).
:- end_object.

:- object('#1785',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.37962318e-01,  3.16872901e-01]).
:- end_object.

:- object('#1786',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.39672802e-01,  3.16574071e-01]).
:- end_object.

:- object('#1792',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.39672802e-01,  3.16574071e-01]).
:- end_object.

:- object('#1793',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.39672802e-01,  3.16574071e-01]).
:- end_object.

:- object('#1800',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.38938389e-01,  3.15000637e-01]).
:- end_object.

:- object('#1801',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.39672802e-01,  3.16574071e-01]).
:- end_object.

:- object('#1802',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.38938389e-01,  3.15000637e-01]).
:- end_object.

:- object('#1803',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.39672802e-01,  3.16574071e-01]).
:- end_object.

:- object('#1805',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.38938389e-01,  3.15000637e-01]).
:- end_object.

:- object('#1807',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.39672802e-01,  3.16574071e-01]).
:- end_object.

:- object('#1808',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.38938389e-01,  3.15000637e-01]).
:- end_object.

:- object('#1814',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.38938389e-01,  3.15000637e-01]).
:- end_object.

:- object('#1815',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.38938389e-01,  3.15000637e-01]).
:- end_object.

:- object('#1822',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.40606537e-01,  3.14518624e-01]).
:- end_object.

:- object('#1823',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.38938389e-01,  3.15000637e-01]).
:- end_object.

:- object('#1824',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.40606537e-01,  3.14518624e-01]).
:- end_object.

:- object('#1825',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.38938389e-01,  3.15000637e-01]).
:- end_object.

:- object('#1827',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.40606537e-01,  3.14518624e-01]).
:- end_object.

:- object('#1829',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.38938389e-01,  3.15000637e-01]).
:- end_object.

:- object('#1830',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.40606537e-01,  3.14518624e-01]).
:- end_object.

:- object('#1836',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.40606537e-01,  3.14518624e-01]).
:- end_object.

:- object('#1837',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.40606537e-01,  3.14518624e-01]).
:- end_object.

:- object('#1844',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.39706311e-01,  3.13033818e-01]).
:- end_object.

:- object('#1845',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.40606537e-01,  3.14518624e-01]).
:- end_object.

:- object('#1846',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.39706311e-01,  3.13033818e-01]).
:- end_object.

:- object('#1847',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.40606537e-01,  3.14518624e-01]).
:- end_object.

:- object('#1849',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.39706311e-01,  3.13033818e-01]).
:- end_object.

:- object('#1851',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.40606537e-01,  3.14518624e-01]).
:- end_object.

:- object('#1852',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.39706311e-01,  3.13033818e-01]).
:- end_object.

:- object('#1858',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.39706311e-01,  3.13033818e-01]).
:- end_object.

:- object('#1859',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.39706311e-01,  3.13033818e-01]).
:- end_object.

:- object('#1866',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.41312565e-01,  3.12374271e-01]).
:- end_object.

:- object('#1867',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.39706311e-01,  3.13033818e-01]).
:- end_object.

:- object('#1868',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.41312565e-01,  3.12374271e-01]).
:- end_object.

:- object('#1869',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.39706311e-01,  3.13033818e-01]).
:- end_object.

:- object('#1871',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.41312565e-01,  3.12374271e-01]).
:- end_object.

:- object('#1873',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.39706311e-01,  3.13033818e-01]).
:- end_object.

:- object('#1874',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.41312565e-01,  3.12374271e-01]).
:- end_object.

:- object('#1880',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.41312565e-01,  3.12374271e-01]).
:- end_object.

:- object('#1881',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.41312565e-01,  3.12374271e-01]).
:- end_object.

:- object('#1888',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.40257081e-01,  3.10995501e-01]).
:- end_object.

:- object('#1889',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.41312565e-01,  3.12374271e-01]).
:- end_object.

:- object('#1890',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.40257081e-01,  3.10995501e-01]).
:- end_object.

:- object('#1891',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.41312565e-01,  3.12374271e-01]).
:- end_object.

:- object('#1893',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.40257081e-01,  3.10995501e-01]).
:- end_object.

:- object('#1895',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.41312565e-01,  3.12374271e-01]).
:- end_object.

:- object('#1896',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.40257081e-01,  3.10995501e-01]).
:- end_object.

:- object('#1902',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.40257081e-01,  3.10995501e-01]).
:- end_object.

:- object('#1903',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.40257081e-01,  3.10995501e-01]).
:- end_object.

:- object('#1910',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.41782610e-01,  3.10166154e-01]).
:- end_object.

:- object('#1911',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.40257081e-01,  3.10995501e-01]).
:- end_object.

:- object('#1912',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.41782610e-01,  3.10166154e-01]).
:- end_object.

:- object('#1913',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.40257081e-01,  3.10995501e-01]).
:- end_object.

:- object('#1915',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.41782610e-01,  3.10166154e-01]).
:- end_object.

:- object('#1917',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.40257081e-01,  3.10995501e-01]).
:- end_object.

:- object('#1918',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.41782610e-01,  3.10166154e-01]).
:- end_object.

:- object('#1924',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.41782610e-01,  3.10166154e-01]).
:- end_object.

:- object('#1925',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.41782610e-01,  3.10166154e-01]).
:- end_object.

:- object('#1932',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.40584241e-01,  3.08909584e-01]).
:- end_object.

:- object('#1933',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.41782610e-01,  3.10166154e-01]).
:- end_object.

:- object('#1934',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.40584241e-01,  3.08909584e-01]).
:- end_object.

:- object('#1935',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.41782610e-01,  3.10166154e-01]).
:- end_object.

:- object('#1937',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.40584241e-01,  3.08909584e-01]).
:- end_object.

:- object('#1939',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.41782610e-01,  3.10166154e-01]).
:- end_object.

:- object('#1940',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.40584241e-01,  3.08909584e-01]).
:- end_object.

:- object('#1946',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.40584241e-01,  3.08909584e-01]).
:- end_object.

:- object('#1947',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.40584241e-01,  3.08909584e-01]).
:- end_object.

:- object('#1954',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.42011159e-01,  3.07920160e-01]).
:- end_object.

:- object('#1955',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.40584241e-01,  3.08909584e-01]).
:- end_object.

:- object('#1956',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.42011159e-01,  3.07920160e-01]).
:- end_object.

:- object('#1957',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.40584241e-01,  3.08909584e-01]).
:- end_object.

:- object('#1959',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.42011159e-01,  3.07920160e-01]).
:- end_object.

:- object('#1961',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.40584241e-01,  3.08909584e-01]).
:- end_object.

:- object('#1962',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.42011159e-01,  3.07920160e-01]).
:- end_object.

:- object('#1968',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.42011159e-01,  3.07920160e-01]).
:- end_object.

:- object('#1969',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.42011159e-01,  3.07920160e-01]).
:- end_object.

:- object('#1976',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.40683957e-01,  3.06800522e-01]).
:- end_object.

:- object('#1977',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.42011159e-01,  3.07920160e-01]).
:- end_object.

:- object('#1978',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.40683957e-01,  3.06800522e-01]).
:- end_object.

:- object('#1979',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.42011159e-01,  3.07920160e-01]).
:- end_object.

:- object('#1981',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.40683957e-01,  3.06800522e-01]).
:- end_object.

:- object('#1983',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.42011159e-01,  3.07920160e-01]).
:- end_object.

:- object('#1984',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.40683957e-01,  3.06800522e-01]).
:- end_object.

:- object('#1990',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.40683957e-01,  3.06800522e-01]).
:- end_object.

:- object('#1991',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.40683957e-01,  3.06800522e-01]).
:- end_object.

:- object('#1998',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.41995534e-01,  3.05662621e-01]).
:- end_object.

:- object('#1999',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.40683957e-01,  3.06800522e-01]).
:- end_object.

:- object('#2000',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.41995534e-01,  3.05662621e-01]).
:- end_object.

:- object('#2001',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.40683957e-01,  3.06800522e-01]).
:- end_object.

:- object('#2003',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.41995534e-01,  3.05662621e-01]).
:- end_object.

:- object('#2005',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.40683957e-01,  3.06800522e-01]).
:- end_object.

:- object('#2006',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.41995534e-01,  3.05662621e-01]).
:- end_object.

:- object('#2012',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.41995534e-01,  3.05662621e-01]).
:- end_object.

:- object('#2013',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.41995534e-01,  3.05662621e-01]).
:- end_object.

:- object('#2020',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.40555058e-01,  3.04693043e-01]).
:- end_object.

:- object('#2021',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.41995534e-01,  3.05662621e-01]).
:- end_object.

:- object('#2022',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.40555058e-01,  3.04693043e-01]).
:- end_object.

:- object('#2023',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.41995534e-01,  3.05662621e-01]).
:- end_object.

:- object('#2025',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.40555058e-01,  3.04693043e-01]).
:- end_object.

:- object('#2027',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.41995534e-01,  3.05662621e-01]).
:- end_object.

:- object('#2028',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.40555058e-01,  3.04693043e-01]).
:- end_object.

:- object('#2034',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.40555058e-01,  3.04693043e-01]).
:- end_object.

:- object('#2035',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.40555058e-01,  3.04693043e-01]).
:- end_object.

:- object('#2042',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.41735918e-01,  3.03420006e-01]).
:- end_object.

:- object('#2043',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.40555058e-01,  3.04693043e-01]).
:- end_object.

:- object('#2044',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.41735918e-01,  3.03420006e-01]).
:- end_object.

:- object('#2045',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.40555058e-01,  3.04693043e-01]).
:- end_object.

:- object('#2047',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.41735918e-01,  3.03420006e-01]).
:- end_object.

:- object('#2049',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.40555058e-01,  3.04693043e-01]).
:- end_object.

:- object('#2050',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.41735918e-01,  3.03420006e-01]).
:- end_object.

:- object('#2056',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.41735918e-01,  3.03420006e-01]).
:- end_object.

:- object('#2057',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.41735918e-01,  3.03420006e-01]).
:- end_object.

:- object('#2064',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.40199056e-01,  3.02611854e-01]).
:- end_object.

:- object('#2065',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.41735918e-01,  3.03420006e-01]).
:- end_object.

:- object('#2066',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.40199056e-01,  3.02611854e-01]).
:- end_object.

:- object('#2067',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.41735918e-01,  3.03420006e-01]).
:- end_object.

:- object('#2069',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.40199056e-01,  3.02611854e-01]).
:- end_object.

:- object('#2071',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.41735918e-01,  3.03420006e-01]).
:- end_object.

:- object('#2072',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.40199056e-01,  3.02611854e-01]).
:- end_object.

:- object('#2078',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.40199056e-01,  3.02611854e-01]).
:- end_object.

:- object('#2079',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.40199056e-01,  3.02611854e-01]).
:- end_object.

:- object('#2086',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.41235355e-01,  3.01218607e-01]).
:- end_object.

:- object('#2087',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.40199056e-01,  3.02611854e-01]).
:- end_object.

:- object('#2088',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.41235355e-01,  3.01218607e-01]).
:- end_object.

:- object('#2089',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.40199056e-01,  3.02611854e-01]).
:- end_object.

:- object('#2091',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.41235355e-01,  3.01218607e-01]).
:- end_object.

:- object('#2093',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.40199056e-01,  3.02611854e-01]).
:- end_object.

:- object('#2094',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.41235355e-01,  3.01218607e-01]).
:- end_object.

:- object('#2100',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.41235355e-01,  3.01218607e-01]).
:- end_object.

:- object('#2101',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.41235355e-01,  3.01218607e-01]).
:- end_object.

:- object('#2108',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.39620125e-01,  3.00581356e-01]).
:- end_object.

:- object('#2109',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.41235355e-01,  3.01218607e-01]).
:- end_object.

:- object('#2110',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.39620125e-01,  3.00581356e-01]).
:- end_object.

:- object('#2111',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.41235355e-01,  3.01218607e-01]).
:- end_object.

:- object('#2113',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.39620125e-01,  3.00581356e-01]).
:- end_object.

:- object('#2115',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.41235355e-01,  3.01218607e-01]).
:- end_object.

:- object('#2116',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.39620125e-01,  3.00581356e-01]).
:- end_object.

:- object('#2122',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.39620125e-01,  3.00581356e-01]).
:- end_object.

:- object('#2123',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.39620125e-01,  3.00581356e-01]).
:- end_object.

:- object('#2130',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.40499712e-01,  2.99084232e-01]).
:- end_object.

:- object('#2131',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.39620125e-01,  3.00581356e-01]).
:- end_object.

:- object('#2132',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.40499712e-01,  2.99084232e-01]).
:- end_object.

:- object('#2133',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.39620125e-01,  3.00581356e-01]).
:- end_object.

:- object('#2135',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.40499712e-01,  2.99084232e-01]).
:- end_object.

:- object('#2137',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.39620125e-01,  3.00581356e-01]).
:- end_object.

:- object('#2138',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.40499712e-01,  2.99084232e-01]).
:- end_object.

:- object('#2144',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.40499712e-01,  2.99084232e-01]).
:- end_object.

:- object('#2145',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.40499712e-01,  2.99084232e-01]).
:- end_object.

:- object('#2152',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.38825052e-01,  2.98625355e-01]).
:- end_object.

:- object('#2153',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.40499712e-01,  2.99084232e-01]).
:- end_object.

:- object('#2154',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.38825052e-01,  2.98625355e-01]).
:- end_object.

:- object('#2155',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.40499712e-01,  2.99084232e-01]).
:- end_object.

:- object('#2157',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.38825052e-01,  2.98625355e-01]).
:- end_object.

:- object('#2159',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.40499712e-01,  2.99084232e-01]).
:- end_object.

:- object('#2160',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.38825052e-01,  2.98625355e-01]).
:- end_object.

:- object('#2166',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.38825052e-01,  2.98625355e-01]).
:- end_object.

:- object('#2167',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.38825052e-01,  2.98625355e-01]).
:- end_object.

:- object('#2174',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.39537615e-01,  2.97041907e-01]).
:- end_object.

:- object('#2175',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.38825052e-01,  2.98625355e-01]).
:- end_object.

:- object('#2176',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.39537615e-01,  2.97041907e-01]).
:- end_object.

:- object('#2177',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.38825052e-01,  2.98625355e-01]).
:- end_object.

:- object('#2179',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.39537615e-01,  2.97041907e-01]).
:- end_object.

:- object('#2181',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.38825052e-01,  2.98625355e-01]).
:- end_object.

:- object('#2182',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.39537615e-01,  2.97041907e-01]).
:- end_object.

:- object('#2188',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.39537615e-01,  2.97041907e-01]).
:- end_object.

:- object('#2189',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.39537615e-01,  2.97041907e-01]).
:- end_object.

:- object('#2196',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.37823159e-01,  2.96766782e-01]).
:- end_object.

:- object('#2197',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.39537615e-01,  2.97041907e-01]).
:- end_object.

:- object('#2198',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.37823159e-01,  2.96766782e-01]).
:- end_object.

:- object('#2199',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.39537615e-01,  2.97041907e-01]).
:- end_object.

:- object('#2201',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.37823159e-01,  2.96766782e-01]).
:- end_object.

:- object('#2203',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.39537615e-01,  2.97041907e-01]).
:- end_object.

:- object('#2204',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.37823159e-01,  2.96766782e-01]).
:- end_object.

:- object('#2210',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.37823159e-01,  2.96766782e-01]).
:- end_object.

:- object('#2211',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.37823159e-01,  2.96766782e-01]).
:- end_object.

:- object('#2218',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.38360345e-01,  2.95115574e-01]).
:- end_object.

:- object('#2219',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.37823159e-01,  2.96766782e-01]).
:- end_object.

:- object('#2220',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.38360345e-01,  2.95115574e-01]).
:- end_object.

:- object('#2221',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.37823159e-01,  2.96766782e-01]).
:- end_object.

:- object('#2223',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.38360345e-01,  2.95115574e-01]).
:- end_object.

:- object('#2225',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.37823159e-01,  2.96766782e-01]).
:- end_object.

:- object('#2226',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.38360345e-01,  2.95115574e-01]).
:- end_object.

:- object('#2232',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.38360345e-01,  2.95115574e-01]).
:- end_object.

:- object('#2233',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.38360345e-01,  2.95115574e-01]).
:- end_object.

:- object('#2240',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.36626192e-01,  2.95027427e-01]).
:- end_object.

:- object('#2241',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.38360345e-01,  2.95115574e-01]).
:- end_object.

:- object('#2242',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.36626192e-01,  2.95027427e-01]).
:- end_object.

:- object('#2243',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.38360345e-01,  2.95115574e-01]).
:- end_object.

:- object('#2245',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.36626192e-01,  2.95027427e-01]).
:- end_object.

:- object('#2247',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.38360345e-01,  2.95115574e-01]).
:- end_object.

:- object('#2248',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.36626192e-01,  2.95027427e-01]).
:- end_object.

:- object('#2254',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.36626192e-01,  2.95027427e-01]).
:- end_object.

:- object('#2255',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.36626192e-01,  2.95027427e-01]).
:- end_object.

:- object('#2262',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.36981702e-01,  2.93327819e-01]).
:- end_object.

:- object('#2263',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.36626192e-01,  2.95027427e-01]).
:- end_object.

:- object('#2264',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.36981702e-01,  2.93327819e-01]).
:- end_object.

:- object('#2265',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.36626192e-01,  2.95027427e-01]).
:- end_object.

:- object('#2267',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.36981702e-01,  2.93327819e-01]).
:- end_object.

:- object('#2269',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.36626192e-01,  2.95027427e-01]).
:- end_object.

:- object('#2270',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.36981702e-01,  2.93327819e-01]).
:- end_object.

:- object('#2276',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.36981702e-01,  2.93327819e-01]).
:- end_object.

:- object('#2277',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.36981702e-01,  2.93327819e-01]).
:- end_object.

:- object('#2284',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.35248184e-01,  2.93427684e-01]).
:- end_object.

:- object('#2285',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.36981702e-01,  2.93327819e-01]).
:- end_object.

:- object('#2286',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.35248184e-01,  2.93427684e-01]).
:- end_object.

:- object('#2287',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.36981702e-01,  2.93327819e-01]).
:- end_object.

:- object('#2289',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.35248184e-01,  2.93427684e-01]).
:- end_object.

:- object('#2291',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.36981702e-01,  2.93327819e-01]).
:- end_object.

:- object('#2292',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.35248184e-01,  2.93427684e-01]).
:- end_object.

:- object('#2298',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.35248184e-01,  2.93427684e-01]).
:- end_object.

:- object('#2299',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.35248184e-01,  2.93427684e-01]).
:- end_object.

:- object('#2306',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.35417850e-01,  2.91699602e-01]).
:- end_object.

:- object('#2307',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.35248184e-01,  2.93427684e-01]).
:- end_object.

:- object('#2308',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.35417850e-01,  2.91699602e-01]).
:- end_object.

:- object('#2309',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.35248184e-01,  2.93427684e-01]).
:- end_object.

:- object('#2311',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.35417850e-01,  2.91699602e-01]).
:- end_object.

:- object('#2313',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.35248184e-01,  2.93427684e-01]).
:- end_object.

:- object('#2314',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.35417850e-01,  2.91699602e-01]).
:- end_object.

:- object('#2320',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.35417850e-01,  2.91699602e-01]).
:- end_object.

:- object('#2321',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.35417850e-01,  2.91699602e-01]).
:- end_object.

:- object('#2328',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.33705292e-01,  2.91986307e-01]).
:- end_object.

:- object('#2329',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.35417850e-01,  2.91699602e-01]).
:- end_object.

:- object('#2330',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.33705292e-01,  2.91986307e-01]).
:- end_object.

:- object('#2331',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.35417850e-01,  2.91699602e-01]).
:- end_object.

:- object('#2333',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.33705292e-01,  2.91986307e-01]).
:- end_object.

:- object('#2335',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.35417850e-01,  2.91699602e-01]).
:- end_object.

:- object('#2336',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.33705292e-01,  2.91986307e-01]).
:- end_object.

:- object('#2342',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.33705292e-01,  2.91986307e-01]).
:- end_object.

:- object('#2343',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.33705292e-01,  2.91986307e-01]).
:- end_object.

:- object('#2350',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.33687125e-01,  2.90250011e-01]).
:- end_object.

:- object('#2351',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.33705292e-01,  2.91986307e-01]).
:- end_object.

:- object('#2352',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.33687125e-01,  2.90250011e-01]).
:- end_object.

:- object('#2353',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.33705292e-01,  2.91986307e-01]).
:- end_object.

:- object('#2355',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.33687125e-01,  2.90250011e-01]).
:- end_object.

:- object('#2357',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.33705292e-01,  2.91986307e-01]).
:- end_object.

:- object('#2358',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.33687125e-01,  2.90250011e-01]).
:- end_object.

:- object('#2364',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.33687125e-01,  2.90250011e-01]).
:- end_object.

:- object('#2365',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.33687125e-01,  2.90250011e-01]).
:- end_object.

:- object('#2372',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.32015604e-01,  2.90720196e-01]).
:- end_object.

:- object('#2373',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.33687125e-01,  2.90250011e-01]).
:- end_object.

:- object('#2374',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.32015604e-01,  2.90720196e-01]).
:- end_object.

:- object('#2375',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.33687125e-01,  2.90250011e-01]).
:- end_object.

:- object('#2377',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.32015604e-01,  2.90720196e-01]).
:- end_object.

:- object('#2379',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.33687125e-01,  2.90250011e-01]).
:- end_object.

:- object('#2380',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.32015604e-01,  2.90720196e-01]).
:- end_object.

:- object('#2386',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.32015604e-01,  2.90720196e-01]).
:- end_object.

:- object('#2387',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.32015604e-01,  2.90720196e-01]).
:- end_object.

:- object('#2394',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.31809816e-01,  2.88996042e-01]).
:- end_object.

:- object('#2395',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.32015604e-01,  2.90720196e-01]).
:- end_object.

:- object('#2396',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.31809816e-01,  2.88996042e-01]).
:- end_object.

:- object('#2397',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.32015604e-01,  2.90720196e-01]).
:- end_object.

:- object('#2399',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.31809816e-01,  2.88996042e-01]).
:- end_object.

:- object('#2401',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.32015604e-01,  2.90720196e-01]).
:- end_object.

:- object('#2402',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.31809816e-01,  2.88996042e-01]).
:- end_object.

:- object('#2408',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.31809816e-01,  2.88996042e-01]).
:- end_object.

:- object('#2409',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.31809816e-01,  2.88996042e-01]).
:- end_object.

:- object('#2416',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.30198930e-01,  2.89644194e-01]).
:- end_object.

:- object('#2417',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.31809816e-01,  2.88996042e-01]).
:- end_object.

:- object('#2418',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.30198930e-01,  2.89644194e-01]).
:- end_object.

:- object('#2419',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.31809816e-01,  2.88996042e-01]).
:- end_object.

:- object('#2421',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.30198930e-01,  2.89644194e-01]).
:- end_object.

:- object('#2423',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.31809816e-01,  2.88996042e-01]).
:- end_object.

:- object('#2424',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.30198930e-01,  2.89644194e-01]).
:- end_object.

:- object('#2430',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.30198930e-01,  2.89644194e-01]).
:- end_object.

:- object('#2431',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.30198930e-01,  2.89644194e-01]).
:- end_object.

:- object('#2438',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.29807935e-01,  2.87952397e-01]).
:- end_object.

:- object('#2439',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.30198930e-01,  2.89644194e-01]).
:- end_object.

:- object('#2440',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.29807935e-01,  2.87952397e-01]).
:- end_object.

:- object('#2441',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.30198930e-01,  2.89644194e-01]).
:- end_object.

:- object('#2443',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.29807935e-01,  2.87952397e-01]).
:- end_object.

:- object('#2445',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.30198930e-01,  2.89644194e-01]).
:- end_object.

:- object('#2446',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.29807935e-01,  2.87952397e-01]).
:- end_object.

:- object('#2452',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.29807935e-01,  2.87952397e-01]).
:- end_object.

:- object('#2453',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.29807935e-01,  2.87952397e-01]).
:- end_object.

:- object('#2460',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.28276570e-01,  2.88770917e-01]).
:- end_object.

:- object('#2461',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.29807935e-01,  2.87952397e-01]).
:- end_object.

:- object('#2462',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.28276570e-01,  2.88770917e-01]).
:- end_object.

:- object('#2463',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.29807935e-01,  2.87952397e-01]).
:- end_object.

:- object('#2465',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.28276570e-01,  2.88770917e-01]).
:- end_object.

:- object('#2467',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.29807935e-01,  2.87952397e-01]).
:- end_object.

:- object('#2468',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.28276570e-01,  2.88770917e-01]).
:- end_object.

:- object('#2474',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.28276570e-01,  2.88770917e-01]).
:- end_object.

:- object('#2475',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.28276570e-01,  2.88770917e-01]).
:- end_object.

:- object('#2482',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.27704951e-01,  2.87131311e-01]).
:- end_object.

:- object('#2483',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.28276570e-01,  2.88770917e-01]).
:- end_object.

:- object('#2484',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.27704951e-01,  2.87131311e-01]).
:- end_object.

:- object('#2485',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.28276570e-01,  2.88770917e-01]).
:- end_object.

:- object('#2487',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.27704951e-01,  2.87131311e-01]).
:- end_object.

:- object('#2489',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.28276570e-01,  2.88770917e-01]).
:- end_object.

:- object('#2490',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.27704951e-01,  2.87131311e-01]).
:- end_object.

:- object('#2496',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.27704951e-01,  2.87131311e-01]).
:- end_object.

:- object('#2497',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.27704951e-01,  2.87131311e-01]).
:- end_object.

:- object('#2504',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.26271060e-01,  2.88110602e-01]).
:- end_object.

:- object('#2505',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.27704951e-01,  2.87131311e-01]).
:- end_object.

:- object('#2506',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.26271060e-01,  2.88110602e-01]).
:- end_object.

:- object('#2507',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.27704951e-01,  2.87131311e-01]).
:- end_object.

:- object('#2509',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.26271060e-01,  2.88110602e-01]).
:- end_object.

:- object('#2511',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.27704951e-01,  2.87131311e-01]).
:- end_object.

:- object('#2512',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.26271060e-01,  2.88110602e-01]).
:- end_object.

:- object('#2518',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.26271060e-01,  2.88110602e-01]).
:- end_object.

:- object('#2519',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.26271060e-01,  2.88110602e-01]).
:- end_object.

:- object('#2526',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.25525520e-01,  2.86542411e-01]).
:- end_object.

:- object('#2527',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.26271060e-01,  2.88110602e-01]).
:- end_object.

:- object('#2528',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.25525520e-01,  2.86542411e-01]).
:- end_object.

:- object('#2529',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.26271060e-01,  2.88110602e-01]).
:- end_object.

:- object('#2531',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.25525520e-01,  2.86542411e-01]).
:- end_object.

:- object('#2533',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.26271060e-01,  2.88110602e-01]).
:- end_object.

:- object('#2534',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.25525520e-01,  2.86542411e-01]).
:- end_object.

:- object('#2540',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.25525520e-01,  2.86542411e-01]).
:- end_object.

:- object('#2541',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.25525520e-01,  2.86542411e-01]).
:- end_object.

:- object('#2548',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.24205914e-01,  2.87670992e-01]).
:- end_object.

:- object('#2549',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.25525520e-01,  2.86542411e-01]).
:- end_object.

:- object('#2550',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.24205914e-01,  2.87670992e-01]).
:- end_object.

:- object('#2551',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.25525520e-01,  2.86542411e-01]).
:- end_object.

:- object('#2553',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.24205914e-01,  2.87670992e-01]).
:- end_object.

:- object('#2555',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.25525520e-01,  2.86542411e-01]).
:- end_object.

:- object('#2556',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.24205914e-01,  2.87670992e-01]).
:- end_object.

:- object('#2562',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.24205914e-01,  2.87670992e-01]).
:- end_object.

:- object('#2563',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.24205914e-01,  2.87670992e-01]).
:- end_object.

:- object('#2570',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.23295193e-01,  2.86192601e-01]).
:- end_object.

:- object('#2571',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.24205914e-01,  2.87670992e-01]).
:- end_object.

:- object('#2572',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.23295193e-01,  2.86192601e-01]).
:- end_object.

:- object('#2573',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.24205914e-01,  2.87670992e-01]).
:- end_object.

:- object('#2575',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.23295193e-01,  2.86192601e-01]).
:- end_object.

:- object('#2577',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.24205914e-01,  2.87670992e-01]).
:- end_object.

:- object('#2578',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.23295193e-01,  2.86192601e-01]).
:- end_object.

:- object('#2584',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.23295193e-01,  2.86192601e-01]).
:- end_object.

:- object('#2585',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.23295193e-01,  2.86192601e-01]).
:- end_object.

:- object('#2592',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.22105345e-01,  2.87457241e-01]).
:- end_object.

:- object('#2593',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.23295193e-01,  2.86192601e-01]).
:- end_object.

:- object('#2594',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.22105345e-01,  2.87457241e-01]).
:- end_object.

:- object('#2595',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.23295193e-01,  2.86192601e-01]).
:- end_object.

:- object('#2597',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.22105345e-01,  2.87457241e-01]).
:- end_object.

:- object('#2599',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.23295193e-01,  2.86192601e-01]).
:- end_object.

:- object('#2600',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.22105345e-01,  2.87457241e-01]).
:- end_object.

:- object('#2606',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.22105345e-01,  2.87457241e-01]).
:- end_object.

:- object('#2607',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.22105345e-01,  2.87457241e-01]).
:- end_object.

:- object('#2614',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.21040120e-01,  2.86085982e-01]).
:- end_object.

:- object('#2615',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.22105345e-01,  2.87457241e-01]).
:- end_object.

:- object('#2616',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.21040120e-01,  2.86085982e-01]).
:- end_object.

:- object('#2617',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.22105345e-01,  2.87457241e-01]).
:- end_object.

:- object('#2619',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.21040120e-01,  2.86085982e-01]).
:- end_object.

:- object('#2621',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.22105345e-01,  2.87457241e-01]).
:- end_object.

:- object('#2622',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.21040120e-01,  2.86085982e-01]).
:- end_object.

:- object('#2628',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.21040120e-01,  2.86085982e-01]).
:- end_object.

:- object('#2629',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.21040120e-01,  2.86085982e-01]).
:- end_object.

:- object('#2636',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.19993977e-01,  2.87471854e-01]).
:- end_object.

:- object('#2637',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.21040120e-01,  2.86085982e-01]).
:- end_object.

:- object('#2638',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.19993977e-01,  2.87471854e-01]).
:- end_object.

:- object('#2639',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.21040120e-01,  2.86085982e-01]).
:- end_object.

:- object('#2641',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.19993977e-01,  2.87471854e-01]).
:- end_object.

:- object('#2643',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.21040120e-01,  2.86085982e-01]).
:- end_object.

:- object('#2644',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.19993977e-01,  2.87471854e-01]).
:- end_object.

:- object('#2650',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.19993977e-01,  2.87471854e-01]).
:- end_object.

:- object('#2651',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.19993977e-01,  2.87471854e-01]).
:- end_object.

:- object('#2658',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.18786738e-01,  2.86223805e-01]).
:- end_object.

:- object('#2659',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.19993977e-01,  2.87471854e-01]).
:- end_object.

:- object('#2660',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.18786738e-01,  2.86223805e-01]).
:- end_object.

:- object('#2661',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.19993977e-01,  2.87471854e-01]).
:- end_object.

:- object('#2663',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.18786738e-01,  2.86223805e-01]).
:- end_object.

:- object('#2665',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.19993977e-01,  2.87471854e-01]).
:- end_object.

:- object('#2666',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.18786738e-01,  2.86223805e-01]).
:- end_object.

:- object('#2672',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.18786738e-01,  2.86223805e-01]).
:- end_object.

:- object('#2673',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.18786738e-01,  2.86223805e-01]).
:- end_object.

:- object('#2680',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.17896568e-01,  2.87714661e-01]).
:- end_object.

:- object('#2681',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.18786738e-01,  2.86223805e-01]).
:- end_object.

:- object('#2682',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.17896568e-01,  2.87714661e-01]).
:- end_object.

:- object('#2683',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.18786738e-01,  2.86223805e-01]).
:- end_object.

:- object('#2685',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.17896568e-01,  2.87714661e-01]).
:- end_object.

:- object('#2687',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.18786738e-01,  2.86223805e-01]).
:- end_object.

:- object('#2688',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.17896568e-01,  2.87714661e-01]).
:- end_object.

:- object('#2694',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.17896568e-01,  2.87714661e-01]).
:- end_object.

:- object('#2695',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.17896568e-01,  2.87714661e-01]).
:- end_object.

:- object('#2702',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.16561467e-01,  2.86604453e-01]).
:- end_object.

:- object('#2703',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.17896568e-01,  2.87714661e-01]).
:- end_object.

:- object('#2704',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.16561467e-01,  2.86604453e-01]).
:- end_object.

:- object('#2705',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.17896568e-01,  2.87714661e-01]).
:- end_object.

:- object('#2707',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.16561467e-01,  2.86604453e-01]).
:- end_object.

:- object('#2709',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.17896568e-01,  2.87714661e-01]).
:- end_object.

:- object('#2710',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.16561467e-01,  2.86604453e-01]).
:- end_object.

:- object('#2716',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.16561467e-01,  2.86604453e-01]).
:- end_object.

:- object('#2717',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.16561467e-01,  2.86604453e-01]).
:- end_object.

:- object('#2724',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.15837705e-01,  2.88182814e-01]).
:- end_object.

:- object('#2725',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.16561467e-01,  2.86604453e-01]).
:- end_object.

:- object('#2726',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.15837705e-01,  2.88182814e-01]).
:- end_object.

:- object('#2727',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.16561467e-01,  2.86604453e-01]).
:- end_object.

:- object('#2729',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.15837705e-01,  2.88182814e-01]).
:- end_object.

:- object('#2731',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.16561467e-01,  2.86604453e-01]).
:- end_object.

:- object('#2732',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.15837705e-01,  2.88182814e-01]).
:- end_object.

:- object('#2738',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.15837705e-01,  2.88182814e-01]).
:- end_object.

:- object('#2739',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.15837705e-01,  2.88182814e-01]).
:- end_object.

:- object('#2746',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.14390396e-01,  2.87223464e-01]).
:- end_object.

:- object('#2747',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.15837705e-01,  2.88182814e-01]).
:- end_object.

:- object('#2748',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.14390396e-01,  2.87223464e-01]).
:- end_object.

:- object('#2749',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.15837705e-01,  2.88182814e-01]).
:- end_object.

:- object('#2751',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.14390396e-01,  2.87223464e-01]).
:- end_object.

:- object('#2753',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.15837705e-01,  2.88182814e-01]).
:- end_object.

:- object('#2754',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.14390396e-01,  2.87223464e-01]).
:- end_object.

:- object('#2760',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.14390396e-01,  2.87223464e-01]).
:- end_object.

:- object('#2761',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.14390396e-01,  2.87223464e-01]).
:- end_object.

:- object('#2768',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.13841527e-01,  2.88870825e-01]).
:- end_object.

:- object('#2769',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.14390396e-01,  2.87223464e-01]).
:- end_object.

:- object('#2770',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.13841527e-01,  2.88870825e-01]).
:- end_object.

:- object('#2771',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.14390396e-01,  2.87223464e-01]).
:- end_object.

:- object('#2773',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.13841527e-01,  2.88870825e-01]).
:- end_object.

:- object('#2775',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.14390396e-01,  2.87223464e-01]).
:- end_object.

:- object('#2776',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.13841527e-01,  2.88870825e-01]).
:- end_object.

:- object('#2782',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.13841527e-01,  2.88870825e-01]).
:- end_object.

:- object('#2783',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.13841527e-01,  2.88870825e-01]).
:- end_object.

:- object('#2790',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.12298979e-01,  2.88073580e-01]).
:- end_object.

:- object('#2791',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.13841527e-01,  2.88870825e-01]).
:- end_object.

:- object('#2792',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.12298979e-01,  2.88073580e-01]).
:- end_object.

:- object('#2793',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.13841527e-01,  2.88870825e-01]).
:- end_object.

:- object('#2795',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.12298979e-01,  2.88073580e-01]).
:- end_object.

:- object('#2797',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.13841527e-01,  2.88870825e-01]).
:- end_object.

:- object('#2798',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.12298979e-01,  2.88073580e-01]).
:- end_object.

:- object('#2804',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.12298979e-01,  2.88073580e-01]).
:- end_object.

:- object('#2805',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.12298979e-01,  2.88073580e-01]).
:- end_object.

:- object('#2812',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.11931439e-01,  2.89770627e-01]).
:- end_object.

:- object('#2813',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.12298979e-01,  2.88073580e-01]).
:- end_object.

:- object('#2814',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.11931439e-01,  2.89770627e-01]).
:- end_object.

:- object('#2815',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.12298979e-01,  2.88073580e-01]).
:- end_object.

:- object('#2817',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.11931439e-01,  2.89770627e-01]).
:- end_object.

:- object('#2819',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.12298979e-01,  2.88073580e-01]).
:- end_object.

:- object('#2820',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.11931439e-01,  2.89770627e-01]).
:- end_object.

:- object('#2826',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.11931439e-01,  2.89770627e-01]).
:- end_object.

:- object('#2827',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.11931439e-01,  2.89770627e-01]).
:- end_object.

:- object('#2834',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.10311735e-01,  2.89144835e-01]).
:- end_object.

:- object('#2835',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.11931439e-01,  2.89770627e-01]).
:- end_object.

:- object('#2836',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.10311735e-01,  2.89144835e-01]).
:- end_object.

:- object('#2837',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.11931439e-01,  2.89770627e-01]).
:- end_object.

:- object('#2839',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.10311735e-01,  2.89144835e-01]).
:- end_object.

:- object('#2841',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.11931439e-01,  2.89770627e-01]).
:- end_object.

:- object('#2842',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.10311735e-01,  2.89144835e-01]).
:- end_object.

:- object('#2848',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.10311735e-01,  2.89144835e-01]).
:- end_object.

:- object('#2849',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.10311735e-01,  2.89144835e-01]).
:- end_object.

:- object('#2856',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.10129833e-01,  2.90871672e-01]).
:- end_object.

:- object('#2857',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.10311735e-01,  2.89144835e-01]).
:- end_object.

:- object('#2858',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.10129833e-01,  2.90871672e-01]).
:- end_object.

:- object('#2859',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.10311735e-01,  2.89144835e-01]).
:- end_object.

:- object('#2861',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.10129833e-01,  2.90871672e-01]).
:- end_object.

:- object('#2863',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.10311735e-01,  2.89144835e-01]).
:- end_object.

:- object('#2864',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.10129833e-01,  2.90871672e-01]).
:- end_object.

:- object('#2870',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.10129833e-01,  2.90871672e-01]).
:- end_object.

:- object('#2871',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.10129833e-01,  2.90871672e-01]).
:- end_object.

:- object('#2878',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.08451964e-01,  2.90424669e-01]).
:- end_object.

:- object('#2879',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.10129833e-01,  2.90871672e-01]).
:- end_object.

:- object('#2880',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.08451964e-01,  2.90424669e-01]).
:- end_object.

:- object('#2881',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.10129833e-01,  2.90871672e-01]).
:- end_object.

:- object('#2883',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.08451964e-01,  2.90424669e-01]).
:- end_object.

:- object('#2885',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.10129833e-01,  2.90871672e-01]).
:- end_object.

:- object('#2886',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.08451964e-01,  2.90424669e-01]).
:- end_object.

:- object('#2892',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.08451964e-01,  2.90424669e-01]).
:- end_object.

:- object('#2893',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.08451964e-01,  2.90424669e-01]).
:- end_object.

:- object('#2900',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.08457832e-01,  2.92161050e-01]).
:- end_object.

:- object('#2901',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.08451964e-01,  2.90424669e-01]).
:- end_object.

:- object('#2902',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.08457832e-01,  2.92161050e-01]).
:- end_object.

:- object('#2903',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.08451964e-01,  2.90424669e-01]).
:- end_object.

:- object('#2905',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.08457832e-01,  2.92161050e-01]).
:- end_object.

:- object('#2907',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.08451964e-01,  2.90424669e-01]).
:- end_object.

:- object('#2908',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.08457832e-01,  2.92161050e-01]).
:- end_object.

:- object('#2914',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.08457832e-01,  2.92161050e-01]).
:- end_object.

:- object('#2915',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.08457832e-01,  2.92161050e-01]).
:- end_object.

:- object('#2922',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.06741469e-01,  2.91898077e-01]).
:- end_object.

:- object('#2923',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.08457832e-01,  2.92161050e-01]).
:- end_object.

:- object('#2924',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.06741469e-01,  2.91898077e-01]).
:- end_object.

:- object('#2925',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.08457832e-01,  2.92161050e-01]).
:- end_object.

:- object('#2927',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.06741469e-01,  2.91898077e-01]).
:- end_object.

:- object('#2929',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.08457832e-01,  2.92161050e-01]).
:- end_object.

:- object('#2930',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.06741469e-01,  2.91898077e-01]).
:- end_object.

:- object('#2936',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.06741469e-01,  2.91898077e-01]).
:- end_object.

:- object('#2937',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.06741469e-01,  2.91898077e-01]).
:- end_object.

:- object('#2944',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.06935038e-01,  2.93623645e-01]).
:- end_object.

:- object('#2945',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.06741469e-01,  2.91898077e-01]).
:- end_object.

:- object('#2946',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.06935038e-01,  2.93623645e-01]).
:- end_object.

:- object('#2947',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.06741469e-01,  2.91898077e-01]).
:- end_object.

:- object('#2949',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.06935038e-01,  2.93623645e-01]).
:- end_object.

:- object('#2951',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.06741469e-01,  2.91898077e-01]).
:- end_object.

:- object('#2952',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.06935038e-01,  2.93623645e-01]).
:- end_object.

:- object('#2958',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.06935038e-01,  2.93623645e-01]).
:- end_object.

:- object('#2959',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.06935038e-01,  2.93623645e-01]).
:- end_object.

:- object('#2966',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.05200305e-01,  2.93547785e-01]).
:- end_object.

:- object('#2967',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.06935038e-01,  2.93623645e-01]).
:- end_object.

:- object('#2968',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.05200305e-01,  2.93547785e-01]).
:- end_object.

:- object('#2969',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.06935038e-01,  2.93623645e-01]).
:- end_object.

:- object('#2971',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.05200305e-01,  2.93547785e-01]).
:- end_object.

:- object('#2973',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.06935038e-01,  2.93623645e-01]).
:- end_object.

:- object('#2974',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.05200305e-01,  2.93547785e-01]).
:- end_object.

:- object('#2980',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.05200305e-01,  2.93547785e-01]).
:- end_object.

:- object('#2981',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.05200305e-01,  2.93547785e-01]).
:- end_object.

:- object('#2988',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.05579306e-01,  2.95242309e-01]).
:- end_object.

:- object('#2989',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.05200305e-01,  2.93547785e-01]).
:- end_object.

:- object('#2990',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.05579306e-01,  2.95242309e-01]).
:- end_object.

:- object('#2991',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.05200305e-01,  2.93547785e-01]).
:- end_object.

:- object('#2993',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.05579306e-01,  2.95242309e-01]).
:- end_object.

:- object('#2995',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.05200305e-01,  2.93547785e-01]).
:- end_object.

:- object('#2996',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.05579306e-01,  2.95242309e-01]).
:- end_object.

:- object('#3002',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.05579306e-01,  2.95242309e-01]).
:- end_object.

:- object('#3003',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.05579306e-01,  2.95242309e-01]).
:- end_object.

:- object('#3010',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.03846540e-01,  2.95354452e-01]).
:- end_object.

:- object('#3011',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.05579306e-01,  2.95242309e-01]).
:- end_object.

:- object('#3012',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.03846540e-01,  2.95354452e-01]).
:- end_object.

:- object('#3013',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.05579306e-01,  2.95242309e-01]).
:- end_object.

:- object('#3015',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.03846540e-01,  2.95354452e-01]).
:- end_object.

:- object('#3017',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.05579306e-01,  2.95242309e-01]).
:- end_object.

:- object('#3018',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.03846540e-01,  2.95354452e-01]).
:- end_object.

:- object('#3024',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.03846540e-01,  2.95354452e-01]).
:- end_object.

:- object('#3025',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.03846540e-01,  2.95354452e-01]).
:- end_object.

:- object('#3032',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.04406529e-01,  2.96998065e-01]).
:- end_object.

:- object('#3033',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.03846540e-01,  2.95354452e-01]).
:- end_object.

:- object('#3034',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.04406529e-01,  2.96998065e-01]).
:- end_object.

:- object('#3035',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.03846540e-01,  2.95354452e-01]).
:- end_object.

:- object('#3037',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.04406529e-01,  2.96998065e-01]).
:- end_object.

:- object('#3039',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.03846540e-01,  2.95354452e-01]).
:- end_object.

:- object('#3040',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.04406529e-01,  2.96998065e-01]).
:- end_object.

:- object('#3046',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.04406529e-01,  2.96998065e-01]).
:- end_object.

:- object('#3047',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.04406529e-01,  2.96998065e-01]).
:- end_object.

:- object('#3054',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.02696045e-01,  2.97296895e-01]).
:- end_object.

:- object('#3055',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.04406529e-01,  2.96998065e-01]).
:- end_object.

:- object('#3056',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.02696045e-01,  2.97296895e-01]).
:- end_object.

:- object('#3057',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.04406529e-01,  2.96998065e-01]).
:- end_object.

:- object('#3059',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.02696045e-01,  2.97296895e-01]).
:- end_object.

:- object('#3061',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.04406529e-01,  2.96998065e-01]).
:- end_object.

:- object('#3062',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.02696045e-01,  2.97296895e-01]).
:- end_object.

:- object('#3068',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.02696045e-01,  2.97296895e-01]).
:- end_object.

:- object('#3069',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.02696045e-01,  2.97296895e-01]).
:- end_object.

:- object('#3076',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.03430458e-01,  2.98870328e-01]).
:- end_object.

:- object('#3077',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.02696045e-01,  2.97296895e-01]).
:- end_object.

:- object('#3078',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.03430458e-01,  2.98870328e-01]).
:- end_object.

:- object('#3079',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.02696045e-01,  2.97296895e-01]).
:- end_object.

:- object('#3081',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.03430458e-01,  2.98870328e-01]).
:- end_object.

:- object('#3083',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.02696045e-01,  2.97296895e-01]).
:- end_object.

:- object('#3084',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.03430458e-01,  2.98870328e-01]).
:- end_object.

:- object('#3090',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.03430458e-01,  2.98870328e-01]).
:- end_object.

:- object('#3091',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.03430458e-01,  2.98870328e-01]).
:- end_object.

:- object('#3098',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.01762311e-01,  2.99352342e-01]).
:- end_object.

:- object('#3099',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.03430458e-01,  2.98870328e-01]).
:- end_object.

:- object('#3100',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.01762311e-01,  2.99352342e-01]).
:- end_object.

:- object('#3101',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.03430458e-01,  2.98870328e-01]).
:- end_object.

:- object('#3103',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.01762311e-01,  2.99352342e-01]).
:- end_object.

:- object('#3105',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.03430458e-01,  2.98870328e-01]).
:- end_object.

:- object('#3106',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.01762311e-01,  2.99352342e-01]).
:- end_object.

:- object('#3112',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.01762311e-01,  2.99352342e-01]).
:- end_object.

:- object('#3113',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.01762311e-01,  2.99352342e-01]).
:- end_object.

:- object('#3120',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.02662536e-01,  3.00837148e-01]).
:- end_object.

:- object('#3121',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.01762311e-01,  2.99352342e-01]).
:- end_object.

:- object('#3122',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.02662536e-01,  3.00837148e-01]).
:- end_object.

:- object('#3123',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.01762311e-01,  2.99352342e-01]).
:- end_object.

:- object('#3125',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.02662536e-01,  3.00837148e-01]).
:- end_object.

:- object('#3127',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.01762311e-01,  2.99352342e-01]).
:- end_object.

:- object('#3128',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.02662536e-01,  3.00837148e-01]).
:- end_object.

:- object('#3134',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.02662536e-01,  3.00837148e-01]).
:- end_object.

:- object('#3135',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.02662536e-01,  3.00837148e-01]).
:- end_object.

:- object('#3142',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.01056282e-01,  3.01496695e-01]).
:- end_object.

:- object('#3143',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.02662536e-01,  3.00837148e-01]).
:- end_object.

:- object('#3144',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.01056282e-01,  3.01496695e-01]).
:- end_object.

:- object('#3145',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.02662536e-01,  3.00837148e-01]).
:- end_object.

:- object('#3147',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.01056282e-01,  3.01496695e-01]).
:- end_object.

:- object('#3149',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.02662536e-01,  3.00837148e-01]).
:- end_object.

:- object('#3150',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.01056282e-01,  3.01496695e-01]).
:- end_object.

:- object('#3156',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.01056282e-01,  3.01496695e-01]).
:- end_object.

:- object('#3157',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.01056282e-01,  3.01496695e-01]).
:- end_object.

:- object('#3164',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.02111766e-01,  3.02875465e-01]).
:- end_object.

:- object('#3165',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.01056282e-01,  3.01496695e-01]).
:- end_object.

:- object('#3166',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.02111766e-01,  3.02875465e-01]).
:- end_object.

:- object('#3167',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.01056282e-01,  3.01496695e-01]).
:- end_object.

:- object('#3169',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.02111766e-01,  3.02875465e-01]).
:- end_object.

:- object('#3171',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.01056282e-01,  3.01496695e-01]).
:- end_object.

:- object('#3172',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.02111766e-01,  3.02875465e-01]).
:- end_object.

:- object('#3178',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.02111766e-01,  3.02875465e-01]).
:- end_object.

:- object('#3179',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.02111766e-01,  3.02875465e-01]).
:- end_object.

:- object('#3186',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.00586238e-01,  3.03704812e-01]).
:- end_object.

:- object('#3187',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.02111766e-01,  3.02875465e-01]).
:- end_object.

:- object('#3188',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.00586238e-01,  3.03704812e-01]).
:- end_object.

:- object('#3189',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.02111766e-01,  3.02875465e-01]).
:- end_object.

:- object('#3191',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.00586238e-01,  3.03704812e-01]).
:- end_object.

:- object('#3193',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.02111766e-01,  3.02875465e-01]).
:- end_object.

:- object('#3194',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.00586238e-01,  3.03704812e-01]).
:- end_object.

:- object('#3200',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.00586238e-01,  3.03704812e-01]).
:- end_object.

:- object('#3201',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.00586238e-01,  3.03704812e-01]).
:- end_object.

:- object('#3208',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.01784606e-01,  3.04961382e-01]).
:- end_object.

:- object('#3209',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.00586238e-01,  3.03704812e-01]).
:- end_object.

:- object('#3210',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.01784606e-01,  3.04961382e-01]).
:- end_object.

:- object('#3211',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.00586238e-01,  3.03704812e-01]).
:- end_object.

:- object('#3213',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.01784606e-01,  3.04961382e-01]).
:- end_object.

:- object('#3215',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.00586238e-01,  3.03704812e-01]).
:- end_object.

:- object('#3216',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.01784606e-01,  3.04961382e-01]).
:- end_object.

:- object('#3222',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.01784606e-01,  3.04961382e-01]).
:- end_object.

:- object('#3223',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.01784606e-01,  3.04961382e-01]).
:- end_object.

:- object('#3230',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.00357688e-01,  3.05950806e-01]).
:- end_object.

:- object('#3231',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.01784606e-01,  3.04961382e-01]).
:- end_object.

:- object('#3232',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.00357688e-01,  3.05950806e-01]).
:- end_object.

:- object('#3233',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.01784606e-01,  3.04961382e-01]).
:- end_object.

:- object('#3235',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.00357688e-01,  3.05950806e-01]).
:- end_object.

:- object('#3237',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.01784606e-01,  3.04961382e-01]).
:- end_object.

:- object('#3238',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.00357688e-01,  3.05950806e-01]).
:- end_object.

:- object('#3244',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.00357688e-01,  3.05950806e-01]).
:- end_object.

:- object('#3245',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.00357688e-01,  3.05950806e-01]).
:- end_object.

:- object('#3252',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.01684891e-01,  3.07070443e-01]).
:- end_object.

:- object('#3253',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.00357688e-01,  3.05950806e-01]).
:- end_object.

:- object('#3254',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.01684891e-01,  3.07070443e-01]).
:- end_object.

:- object('#3255',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.00357688e-01,  3.05950806e-01]).
:- end_object.

:- object('#3257',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.01684891e-01,  3.07070443e-01]).
:- end_object.

:- object('#3259',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.00357688e-01,  3.05950806e-01]).
:- end_object.

:- object('#3260',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.01684891e-01,  3.07070443e-01]).
:- end_object.

:- object('#3266',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.01684891e-01,  3.07070443e-01]).
:- end_object.

:- object('#3267',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.01684891e-01,  3.07070443e-01]).
:- end_object.

:- object('#3274',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.00373313e-01,  3.08208345e-01]).
:- end_object.

:- object('#3275',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.01684891e-01,  3.07070443e-01]).
:- end_object.

:- object('#3276',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.00373313e-01,  3.08208345e-01]).
:- end_object.

:- object('#3277',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.01684891e-01,  3.07070443e-01]).
:- end_object.

:- object('#3279',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.00373313e-01,  3.08208345e-01]).
:- end_object.

:- object('#3281',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.01684891e-01,  3.07070443e-01]).
:- end_object.

:- object('#3282',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.00373313e-01,  3.08208345e-01]).
:- end_object.

:- object('#3288',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.00373313e-01,  3.08208345e-01]).
:- end_object.

:- object('#3289',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.00373313e-01,  3.08208345e-01]).
:- end_object.

:- object('#3296',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.01813790e-01,  3.09177923e-01]).
:- end_object.

:- object('#3297',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.00373313e-01,  3.08208345e-01]).
:- end_object.

:- object('#3298',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.01813790e-01,  3.09177923e-01]).
:- end_object.

:- object('#3299',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.00373313e-01,  3.08208345e-01]).
:- end_object.

:- object('#3301',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.01813790e-01,  3.09177923e-01]).
:- end_object.

:- object('#3303',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.00373313e-01,  3.08208345e-01]).
:- end_object.

:- object('#3304',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.01813790e-01,  3.09177923e-01]).
:- end_object.

:- object('#3310',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.01813790e-01,  3.09177923e-01]).
:- end_object.

:- object('#3311',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.01813790e-01,  3.09177923e-01]).
:- end_object.

:- object('#3318',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.00632929e-01,  3.10450960e-01]).
:- end_object.

:- object('#3319',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.01813790e-01,  3.09177923e-01]).
:- end_object.

:- object('#3320',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.00632929e-01,  3.10450960e-01]).
:- end_object.

:- object('#3321',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.01813790e-01,  3.09177923e-01]).
:- end_object.

:- object('#3323',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.00632929e-01,  3.10450960e-01]).
:- end_object.

:- object('#3325',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.01813790e-01,  3.09177923e-01]).
:- end_object.

:- object('#3326',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.00632929e-01,  3.10450960e-01]).
:- end_object.

:- object('#3332',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.00632929e-01,  3.10450960e-01]).
:- end_object.

:- object('#3333',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.00632929e-01,  3.10450960e-01]).
:- end_object.

:- object('#3340',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.02169792e-01,  3.11259111e-01]).
:- end_object.

:- object('#3341',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.00632929e-01,  3.10450960e-01]).
:- end_object.

:- object('#3342',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.02169792e-01,  3.11259111e-01]).
:- end_object.

:- object('#3343',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.00632929e-01,  3.10450960e-01]).
:- end_object.

:- object('#3345',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.02169792e-01,  3.11259111e-01]).
:- end_object.

:- object('#3347',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.00632929e-01,  3.10450960e-01]).
:- end_object.

:- object('#3348',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.02169792e-01,  3.11259111e-01]).
:- end_object.

:- object('#3354',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.02169792e-01,  3.11259111e-01]).
:- end_object.

:- object('#3355',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.02169792e-01,  3.11259111e-01]).
:- end_object.

:- object('#3362',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.01133493e-01,  3.12652359e-01]).
:- end_object.

:- object('#3363',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.02169792e-01,  3.11259111e-01]).
:- end_object.

:- object('#3364',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.01133493e-01,  3.12652359e-01]).
:- end_object.

:- object('#3365',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.02169792e-01,  3.11259111e-01]).
:- end_object.

:- object('#3367',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.01133493e-01,  3.12652359e-01]).
:- end_object.

:- object('#3369',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.02169792e-01,  3.11259111e-01]).
:- end_object.

:- object('#3370',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.01133493e-01,  3.12652359e-01]).
:- end_object.

:- object('#3376',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.01133493e-01,  3.12652359e-01]).
:- end_object.

:- object('#3377',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.01133493e-01,  3.12652359e-01]).
:- end_object.

:- object('#3384',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.02748723e-01,  3.13289609e-01]).
:- end_object.

:- object('#3385',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.01133493e-01,  3.12652359e-01]).
:- end_object.

:- object('#3386',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.02748723e-01,  3.13289609e-01]).
:- end_object.

:- object('#3387',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.01133493e-01,  3.12652359e-01]).
:- end_object.

:- object('#3389',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.02748723e-01,  3.13289609e-01]).
:- end_object.

:- object('#3391',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.01133493e-01,  3.12652359e-01]).
:- end_object.

:- object('#3392',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.02748723e-01,  3.13289609e-01]).
:- end_object.

:- object('#3398',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.02748723e-01,  3.13289609e-01]).
:- end_object.

:- object('#3399',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.02748723e-01,  3.13289609e-01]).
:- end_object.

:- object('#3406',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.01869135e-01,  3.14786734e-01]).
:- end_object.

:- object('#3407',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.02748723e-01,  3.13289609e-01]).
:- end_object.

:- object('#3408',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.01869135e-01,  3.14786734e-01]).
:- end_object.

:- object('#3409',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.02748723e-01,  3.13289609e-01]).
:- end_object.

:- object('#3411',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.01869135e-01,  3.14786734e-01]).
:- end_object.

:- object('#3413',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.02748723e-01,  3.13289609e-01]).
:- end_object.

:- object('#3414',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.01869135e-01,  3.14786734e-01]).
:- end_object.

:- object('#3420',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.01869135e-01,  3.14786734e-01]).
:- end_object.

:- object('#3421',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.01869135e-01,  3.14786734e-01]).
:- end_object.

:- object('#3428',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.03543795e-01,  3.15245611e-01]).
:- end_object.

:- object('#3429',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.01869135e-01,  3.14786734e-01]).
:- end_object.

:- object('#3430',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.03543795e-01,  3.15245611e-01]).
:- end_object.

:- object('#3431',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.01869135e-01,  3.14786734e-01]).
:- end_object.

:- object('#3433',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.03543795e-01,  3.15245611e-01]).
:- end_object.

:- object('#3435',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.01869135e-01,  3.14786734e-01]).
:- end_object.

:- object('#3436',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.03543795e-01,  3.15245611e-01]).
:- end_object.

:- object('#3442',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.03543795e-01,  3.15245611e-01]).
:- end_object.

:- object('#3443',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.03543795e-01,  3.15245611e-01]).
:- end_object.

:- object('#3450',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.02831232e-01,  3.16829059e-01]).
:- end_object.

:- object('#3451',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.03543795e-01,  3.15245611e-01]).
:- end_object.

:- object('#3452',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.02831232e-01,  3.16829059e-01]).
:- end_object.

:- object('#3453',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.03543795e-01,  3.15245611e-01]).
:- end_object.

:- object('#3455',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.02831232e-01,  3.16829059e-01]).
:- end_object.

:- object('#3457',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.03543795e-01,  3.15245611e-01]).
:- end_object.

:- object('#3458',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.02831232e-01,  3.16829059e-01]).
:- end_object.

:- object('#3464',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.02831232e-01,  3.16829059e-01]).
:- end_object.

:- object('#3465',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.02831232e-01,  3.16829059e-01]).
:- end_object.

:- object('#3472',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.04545689e-01,  3.17104184e-01]).
:- end_object.

:- object('#3473',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.02831232e-01,  3.16829059e-01]).
:- end_object.

:- object('#3474',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.04545689e-01,  3.17104184e-01]).
:- end_object.

:- object('#3475',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.02831232e-01,  3.16829059e-01]).
:- end_object.

:- object('#3477',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.04545689e-01,  3.17104184e-01]).
:- end_object.

:- object('#3479',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.02831232e-01,  3.16829059e-01]).
:- end_object.

:- object('#3480',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.04545689e-01,  3.17104184e-01]).
:- end_object.

:- object('#3486',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.04545689e-01,  3.17104184e-01]).
:- end_object.

:- object('#3487',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.04545689e-01,  3.17104184e-01]).
:- end_object.

:- object('#3494',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.04008503e-01,  3.18755392e-01]).
:- end_object.

:- object('#3495',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.04545689e-01,  3.17104184e-01]).
:- end_object.

:- object('#3496',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.04008503e-01,  3.18755392e-01]).
:- end_object.

:- object('#3497',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.04545689e-01,  3.17104184e-01]).
:- end_object.

:- object('#3499',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.04008503e-01,  3.18755392e-01]).
:- end_object.

:- object('#3501',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.04545689e-01,  3.17104184e-01]).
:- end_object.

:- object('#3502',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.04008503e-01,  3.18755392e-01]).
:- end_object.

:- object('#3508',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.04008503e-01,  3.18755392e-01]).
:- end_object.

:- object('#3509',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.04008503e-01,  3.18755392e-01]).
:- end_object.

:- object('#3516',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.05742656e-01,  3.18843539e-01]).
:- end_object.

:- object('#3517',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.04008503e-01,  3.18755392e-01]).
:- end_object.

:- object('#3518',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.05742656e-01,  3.18843539e-01]).
:- end_object.

:- object('#3519',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.04008503e-01,  3.18755392e-01]).
:- end_object.

:- object('#3521',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.05742656e-01,  3.18843539e-01]).
:- end_object.

:- object('#3523',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.04008503e-01,  3.18755392e-01]).
:- end_object.

:- object('#3524',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.05742656e-01,  3.18843539e-01]).
:- end_object.

:- object('#3530',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.05742656e-01,  3.18843539e-01]).
:- end_object.

:- object('#3531',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.05742656e-01,  3.18843539e-01]).
:- end_object.

:- object('#3538',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.05387146e-01,  3.20543147e-01]).
:- end_object.

:- object('#3539',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.05742656e-01,  3.18843539e-01]).
:- end_object.

:- object('#3540',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.05387146e-01,  3.20543147e-01]).
:- end_object.

:- object('#3541',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.05742656e-01,  3.18843539e-01]).
:- end_object.

:- object('#3543',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.05387146e-01,  3.20543147e-01]).
:- end_object.

:- object('#3545',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.05742656e-01,  3.18843539e-01]).
:- end_object.

:- object('#3546',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.05387146e-01,  3.20543147e-01]).
:- end_object.

:- object('#3552',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.05387146e-01,  3.20543147e-01]).
:- end_object.

:- object('#3553',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.05387146e-01,  3.20543147e-01]).
:- end_object.

:- object('#3560',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.07120663e-01,  3.20443282e-01]).
:- end_object.

:- object('#3561',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.05387146e-01,  3.20543147e-01]).
:- end_object.

:- object('#3562',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.07120663e-01,  3.20443282e-01]).
:- end_object.

:- object('#3563',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.05387146e-01,  3.20543147e-01]).
:- end_object.

:- object('#3565',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.07120663e-01,  3.20443282e-01]).
:- end_object.

:- object('#3567',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.05387146e-01,  3.20543147e-01]).
:- end_object.

:- object('#3568',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.07120663e-01,  3.20443282e-01]).
:- end_object.

:- object('#3574',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.07120663e-01,  3.20443282e-01]).
:- end_object.

:- object('#3575',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.07120663e-01,  3.20443282e-01]).
:- end_object.

:- object('#3582',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.06950998e-01,  3.22171364e-01]).
:- end_object.

:- object('#3583',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.07120663e-01,  3.20443282e-01]).
:- end_object.

:- object('#3584',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.06950998e-01,  3.22171364e-01]).
:- end_object.

:- object('#3585',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.07120663e-01,  3.20443282e-01]).
:- end_object.

:- object('#3587',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.06950998e-01,  3.22171364e-01]).
:- end_object.

:- object('#3589',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.07120663e-01,  3.20443282e-01]).
:- end_object.

:- object('#3590',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.06950998e-01,  3.22171364e-01]).
:- end_object.

:- object('#3596',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.06950998e-01,  3.22171364e-01]).
:- end_object.

:- object('#3597',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.06950998e-01,  3.22171364e-01]).
:- end_object.

:- object('#3604',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.08663556e-01,  3.21884659e-01]).
:- end_object.

:- object('#3605',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.06950998e-01,  3.22171364e-01]).
:- end_object.

:- object('#3606',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.08663556e-01,  3.21884659e-01]).
:- end_object.

:- object('#3607',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.06950998e-01,  3.22171364e-01]).
:- end_object.

:- object('#3609',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.08663556e-01,  3.21884659e-01]).
:- end_object.

:- object('#3611',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.06950998e-01,  3.22171364e-01]).
:- end_object.

:- object('#3612',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.08663556e-01,  3.21884659e-01]).
:- end_object.

:- object('#3618',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.08663556e-01,  3.21884659e-01]).
:- end_object.

:- object('#3619',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.08663556e-01,  3.21884659e-01]).
:- end_object.

:- object('#3626',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.08681723e-01,  3.23620955e-01]).
:- end_object.

:- object('#3627',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.08663556e-01,  3.21884659e-01]).
:- end_object.

:- object('#3628',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.08681723e-01,  3.23620955e-01]).
:- end_object.

:- object('#3629',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.08663556e-01,  3.21884659e-01]).
:- end_object.

:- object('#3631',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.08681723e-01,  3.23620955e-01]).
:- end_object.

:- object('#3633',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.08663556e-01,  3.21884659e-01]).
:- end_object.

:- object('#3634',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.08681723e-01,  3.23620955e-01]).
:- end_object.

:- object('#3640',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.08681723e-01,  3.23620955e-01]).
:- end_object.

:- object('#3641',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.08681723e-01,  3.23620955e-01]).
:- end_object.

:- object('#3648',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.10353244e-01,  3.23150770e-01]).
:- end_object.

:- object('#3649',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.08681723e-01,  3.23620955e-01]).
:- end_object.

:- object('#3650',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.10353244e-01,  3.23150770e-01]).
:- end_object.

:- object('#3651',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.08681723e-01,  3.23620955e-01]).
:- end_object.

:- object('#3653',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.10353244e-01,  3.23150770e-01]).
:- end_object.

:- object('#3655',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.08681723e-01,  3.23620955e-01]).
:- end_object.

:- object('#3656',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.10353244e-01,  3.23150770e-01]).
:- end_object.

:- object('#3662',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.10353244e-01,  3.23150770e-01]).
:- end_object.

:- object('#3663',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.10353244e-01,  3.23150770e-01]).
:- end_object.

:- object('#3670',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.10559031e-01,  3.24874924e-01]).
:- end_object.

:- object('#3671',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.10353244e-01,  3.23150770e-01]).
:- end_object.

:- object('#3672',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.10559031e-01,  3.24874924e-01]).
:- end_object.

:- object('#3673',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.10353244e-01,  3.23150770e-01]).
:- end_object.

:- object('#3675',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.10559031e-01,  3.24874924e-01]).
:- end_object.

:- object('#3677',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.10353244e-01,  3.23150770e-01]).
:- end_object.

:- object('#3678',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.10559031e-01,  3.24874924e-01]).
:- end_object.

:- object('#3684',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.10559031e-01,  3.24874924e-01]).
:- end_object.

:- object('#3685',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.10559031e-01,  3.24874924e-01]).
:- end_object.

:- object('#3692',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.12169917e-01,  3.24226772e-01]).
:- end_object.

:- object('#3693',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.10559031e-01,  3.24874924e-01]).
:- end_object.

:- object('#3694',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.12169917e-01,  3.24226772e-01]).
:- end_object.

:- object('#3695',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.10559031e-01,  3.24874924e-01]).
:- end_object.

:- object('#3697',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.12169917e-01,  3.24226772e-01]).
:- end_object.

:- object('#3699',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.10559031e-01,  3.24874924e-01]).
:- end_object.

:- object('#3700',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.12169917e-01,  3.24226772e-01]).
:- end_object.

:- object('#3706',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.12169917e-01,  3.24226772e-01]).
:- end_object.

:- object('#3707',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.12169917e-01,  3.24226772e-01]).
:- end_object.

:- object('#3714',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.12560913e-01,  3.25918569e-01]).
:- end_object.

:- object('#3715',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.12169917e-01,  3.24226772e-01]).
:- end_object.

:- object('#3716',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.12560913e-01,  3.25918569e-01]).
:- end_object.

:- object('#3717',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.12169917e-01,  3.24226772e-01]).
:- end_object.

:- object('#3719',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.12560913e-01,  3.25918569e-01]).
:- end_object.

:- object('#3721',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.12169917e-01,  3.24226772e-01]).
:- end_object.

:- object('#3722',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.12560913e-01,  3.25918569e-01]).
:- end_object.

:- object('#3728',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.12560913e-01,  3.25918569e-01]).
:- end_object.

:- object('#3729',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.12560913e-01,  3.25918569e-01]).
:- end_object.

:- object('#3736',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.14092278e-01,  3.25100049e-01]).
:- end_object.

:- object('#3737',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.12560913e-01,  3.25918569e-01]).
:- end_object.

:- object('#3738',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.14092278e-01,  3.25100049e-01]).
:- end_object.

:- object('#3739',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.12560913e-01,  3.25918569e-01]).
:- end_object.

:- object('#3741',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.14092278e-01,  3.25100049e-01]).
:- end_object.

:- object('#3743',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.12560913e-01,  3.25918569e-01]).
:- end_object.

:- object('#3744',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.14092278e-01,  3.25100049e-01]).
:- end_object.

:- object('#3750',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.14092278e-01,  3.25100049e-01]).
:- end_object.

:- object('#3751',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.14092278e-01,  3.25100049e-01]).
:- end_object.

:- object('#3758',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.14663897e-01,  3.26739655e-01]).
:- end_object.

:- object('#3759',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.14092278e-01,  3.25100049e-01]).
:- end_object.

:- object('#3760',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.14663897e-01,  3.26739655e-01]).
:- end_object.

:- object('#3761',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.14092278e-01,  3.25100049e-01]).
:- end_object.

:- object('#3763',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.14663897e-01,  3.26739655e-01]).
:- end_object.

:- object('#3765',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.14092278e-01,  3.25100049e-01]).
:- end_object.

:- object('#3766',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.14663897e-01,  3.26739655e-01]).
:- end_object.

:- object('#3772',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.14663897e-01,  3.26739655e-01]).
:- end_object.

:- object('#3773',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.14663897e-01,  3.26739655e-01]).
:- end_object.

:- object('#3780',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.16097788e-01,  3.25760363e-01]).
:- end_object.

:- object('#3781',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.14663897e-01,  3.26739655e-01]).
:- end_object.

:- object('#3782',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.16097788e-01,  3.25760363e-01]).
:- end_object.

:- object('#3783',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.14663897e-01,  3.26739655e-01]).
:- end_object.

:- object('#3785',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.16097788e-01,  3.25760363e-01]).
:- end_object.

:- object('#3787',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.14663897e-01,  3.26739655e-01]).
:- end_object.

:- object('#3788',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.16097788e-01,  3.25760363e-01]).
:- end_object.

:- object('#3794',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.16097788e-01,  3.25760363e-01]).
:- end_object.

:- object('#3795',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.16097788e-01,  3.25760363e-01]).
:- end_object.

:- object('#3802',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.16843328e-01,  3.27328555e-01]).
:- end_object.

:- object('#3803',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.16097788e-01,  3.25760363e-01]).
:- end_object.

:- object('#3804',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.16843328e-01,  3.27328555e-01]).
:- end_object.

:- object('#3805',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.16097788e-01,  3.25760363e-01]).
:- end_object.

:- object('#3807',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.16843328e-01,  3.27328555e-01]).
:- end_object.

:- object('#3809',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.16097788e-01,  3.25760363e-01]).
:- end_object.

:- object('#3810',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.16843328e-01,  3.27328555e-01]).
:- end_object.

:- object('#3816',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.16843328e-01,  3.27328555e-01]).
:- end_object.

:- object('#3817',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.16843328e-01,  3.27328555e-01]).
:- end_object.

:- object('#3824',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.18162933e-01,  3.26199973e-01]).
:- end_object.

:- object('#3825',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.16843328e-01,  3.27328555e-01]).
:- end_object.

:- object('#3826',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.18162933e-01,  3.26199973e-01]).
:- end_object.

:- object('#3827',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.16843328e-01,  3.27328555e-01]).
:- end_object.

:- object('#3829',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.18162933e-01,  3.26199973e-01]).
:- end_object.

:- object('#3831',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.16843328e-01,  3.27328555e-01]).
:- end_object.

:- object('#3832',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.18162933e-01,  3.26199973e-01]).
:- end_object.

:- object('#3838',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.18162933e-01,  3.26199973e-01]).
:- end_object.

:- object('#3839',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.18162933e-01,  3.26199973e-01]).
:- end_object.

:- object('#3846',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.19073655e-01,  3.27678365e-01]).
:- end_object.

:- object('#3847',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.18162933e-01,  3.26199973e-01]).
:- end_object.

:- object('#3848',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.19073655e-01,  3.27678365e-01]).
:- end_object.

:- object('#3849',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.18162933e-01,  3.26199973e-01]).
:- end_object.

:- object('#3851',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.19073655e-01,  3.27678365e-01]).
:- end_object.

:- object('#3853',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.18162933e-01,  3.26199973e-01]).
:- end_object.

:- object('#3854',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.19073655e-01,  3.27678365e-01]).
:- end_object.

:- object('#3860',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.19073655e-01,  3.27678365e-01]).
:- end_object.

:- object('#3861',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.19073655e-01,  3.27678365e-01]).
:- end_object.

:- object('#3868',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.20263503e-01,  3.26413725e-01]).
:- end_object.

:- object('#3869',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.19073655e-01,  3.27678365e-01]).
:- end_object.

:- object('#3870',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.20263503e-01,  3.26413725e-01]).
:- end_object.

:- object('#3871',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.19073655e-01,  3.27678365e-01]).
:- end_object.

:- object('#3873',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.20263503e-01,  3.26413725e-01]).
:- end_object.

:- object('#3875',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.19073655e-01,  3.27678365e-01]).
:- end_object.

:- object('#3876',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.20263503e-01,  3.26413725e-01]).
:- end_object.

:- object('#3882',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.20263503e-01,  3.26413725e-01]).
:- end_object.

:- object('#3883',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.20263503e-01,  3.26413725e-01]).
:- end_object.

:- object('#3890',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.21328728e-01,  3.27784983e-01]).
:- end_object.

:- object('#3891',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.20263503e-01,  3.26413725e-01]).
:- end_object.

:- object('#3892',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.21328728e-01,  3.27784983e-01]).
:- end_object.

:- object('#3893',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.20263503e-01,  3.26413725e-01]).
:- end_object.

:- object('#3895',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.21328728e-01,  3.27784983e-01]).
:- end_object.

:- object('#3897',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.20263503e-01,  3.26413725e-01]).
:- end_object.

:- object('#3898',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.21328728e-01,  3.27784983e-01]).
:- end_object.

:- object('#3904',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.21328728e-01,  3.27784983e-01]).
:- end_object.

:- object('#3905',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.21328728e-01,  3.27784983e-01]).
:- end_object.

:- object('#3912',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.22374870e-01,  3.26399111e-01]).
:- end_object.

:- object('#3913',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.21328728e-01,  3.27784983e-01]).
:- end_object.

:- object('#3914',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.22374870e-01,  3.26399111e-01]).
:- end_object.

:- object('#3915',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.21328728e-01,  3.27784983e-01]).
:- end_object.

:- object('#3917',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.22374870e-01,  3.26399111e-01]).
:- end_object.

:- object('#3919',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.22374870e-01,  3.26399111e-01]).
:- end_object.

:- object('#3920',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.21328728e-01,  3.27784983e-01]).
:- end_object.

:- object('#3926',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.22374870e-01,  3.26399111e-01]).
:- end_object.

:- object('#3927',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.22374870e-01,  3.26399111e-01]).
:- end_object.

:- object('#3934',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.23582109e-01,  3.27647161e-01]).
:- end_object.

:- object('#3935',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.22374870e-01,  3.26399111e-01]).
:- end_object.

:- object('#3936',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.23582109e-01,  3.27647161e-01]).
:- end_object.

:- object('#3937',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.70312124e-01,  4.22374870e-01,  3.26399111e-01]).
:- end_object.

:- object('#3939',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.22374870e-01,  3.26399111e-01]).
:- end_object.

:- object('#3940',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.23582109e-01,  3.27647161e-01]).
:- end_object.

:- object('#3950',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  3.99173035e-01,  2.85194805e-01]).
:- end_object.

:- object('#3951',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  3.99476075e-01,  3.28978755e-01]).
:- end_object.

:- object('#3952',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.42892773e-01,  2.84892210e-01]).
:- end_object.

:- object('#3953',instantiates(cartesian_point)).
	name('').
	coordinates([ -3.76212124e-01,  4.43195812e-01,  3.28676161e-01]).
:- end_object.

:- object('#126',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#122','#124'],['#123','#125']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#204',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#200','#202'],['#201','#203']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#282',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#278','#280'],['#279','#281']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#318',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#314','#316'],['#315','#317']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#474',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#470','#472'],['#471','#473']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#494',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#490','#492'],['#491','#493']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#579',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#575','#577'],['#576','#578']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#1402',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#1398','#1400'],['#1399','#1401']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#1430',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#1426','#1428'],['#1427','#1429']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#1452',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#1448','#1450'],['#1449','#1451']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#1474',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#1470','#1472'],['#1471','#1473']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#1496',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#1492','#1494'],['#1493','#1495']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#1518',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#1514','#1516'],['#1515','#1517']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#1540',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#1536','#1538'],['#1537','#1539']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#1562',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#1558','#1560'],['#1559','#1561']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#1584',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#1580','#1582'],['#1581','#1583']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#1606',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#1602','#1604'],['#1603','#1605']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#1628',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#1624','#1626'],['#1625','#1627']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#1650',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#1646','#1648'],['#1647','#1649']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#1672',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#1668','#1670'],['#1669','#1671']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#1694',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#1690','#1692'],['#1691','#1693']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#1716',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#1712','#1714'],['#1713','#1715']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#1738',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#1734','#1736'],['#1735','#1737']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#1760',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#1756','#1758'],['#1757','#1759']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#1782',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#1778','#1780'],['#1779','#1781']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#1804',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#1800','#1802'],['#1801','#1803']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#1826',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#1822','#1824'],['#1823','#1825']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#1848',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#1844','#1846'],['#1845','#1847']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#1870',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#1866','#1868'],['#1867','#1869']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#1892',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#1888','#1890'],['#1889','#1891']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#1914',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#1910','#1912'],['#1911','#1913']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#1936',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#1932','#1934'],['#1933','#1935']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#1958',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#1954','#1956'],['#1955','#1957']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#1980',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#1976','#1978'],['#1977','#1979']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#2002',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#1998','#2000'],['#1999','#2001']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#2024',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#2020','#2022'],['#2021','#2023']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#2046',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#2042','#2044'],['#2043','#2045']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#2068',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#2064','#2066'],['#2065','#2067']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#2090',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#2086','#2088'],['#2087','#2089']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#2112',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#2108','#2110'],['#2109','#2111']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#2134',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#2130','#2132'],['#2131','#2133']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#2156',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#2152','#2154'],['#2153','#2155']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#2178',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#2174','#2176'],['#2175','#2177']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#2200',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#2196','#2198'],['#2197','#2199']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#2222',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#2218','#2220'],['#2219','#2221']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#2244',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#2240','#2242'],['#2241','#2243']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#2266',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#2262','#2264'],['#2263','#2265']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#2288',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#2284','#2286'],['#2285','#2287']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#2310',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#2306','#2308'],['#2307','#2309']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#2332',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#2328','#2330'],['#2329','#2331']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#2354',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#2350','#2352'],['#2351','#2353']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#2376',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#2372','#2374'],['#2373','#2375']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#2398',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#2394','#2396'],['#2395','#2397']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#2420',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#2416','#2418'],['#2417','#2419']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#2442',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#2438','#2440'],['#2439','#2441']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#2464',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#2460','#2462'],['#2461','#2463']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#2486',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#2482','#2484'],['#2483','#2485']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#2508',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#2504','#2506'],['#2505','#2507']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#2530',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#2526','#2528'],['#2527','#2529']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#2552',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#2548','#2550'],['#2549','#2551']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#2574',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#2570','#2572'],['#2571','#2573']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#2596',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#2592','#2594'],['#2593','#2595']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#2618',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#2614','#2616'],['#2615','#2617']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#2640',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#2636','#2638'],['#2637','#2639']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#2662',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#2658','#2660'],['#2659','#2661']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#2684',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#2680','#2682'],['#2681','#2683']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#2706',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#2702','#2704'],['#2703','#2705']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#2728',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#2724','#2726'],['#2725','#2727']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#2750',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#2746','#2748'],['#2747','#2749']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#2772',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#2768','#2770'],['#2769','#2771']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#2794',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#2790','#2792'],['#2791','#2793']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#2816',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#2812','#2814'],['#2813','#2815']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#2838',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#2834','#2836'],['#2835','#2837']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#2860',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#2856','#2858'],['#2857','#2859']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#2882',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#2878','#2880'],['#2879','#2881']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#2904',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#2900','#2902'],['#2901','#2903']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#2926',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#2922','#2924'],['#2923','#2925']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#2948',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#2944','#2946'],['#2945','#2947']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#2970',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#2966','#2968'],['#2967','#2969']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#2992',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#2988','#2990'],['#2989','#2991']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#3014',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#3010','#3012'],['#3011','#3013']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#3036',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#3032','#3034'],['#3033','#3035']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#3058',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#3054','#3056'],['#3055','#3057']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#3080',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#3076','#3078'],['#3077','#3079']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#3102',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#3098','#3100'],['#3099','#3101']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#3124',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#3120','#3122'],['#3121','#3123']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#3146',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#3142','#3144'],['#3143','#3145']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#3168',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#3164','#3166'],['#3165','#3167']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#3190',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#3186','#3188'],['#3187','#3189']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#3212',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#3208','#3210'],['#3209','#3211']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#3234',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#3230','#3232'],['#3231','#3233']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#3256',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#3252','#3254'],['#3253','#3255']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#3278',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#3274','#3276'],['#3275','#3277']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#3300',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#3296','#3298'],['#3297','#3299']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#3322',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#3318','#3320'],['#3319','#3321']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#3344',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#3340','#3342'],['#3341','#3343']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#3366',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#3362','#3364'],['#3363','#3365']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#3388',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#3384','#3386'],['#3385','#3387']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#3410',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#3406','#3408'],['#3407','#3409']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#3432',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#3428','#3430'],['#3429','#3431']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#3454',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#3450','#3452'],['#3451','#3453']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#3476',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#3472','#3474'],['#3473','#3475']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#3498',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#3494','#3496'],['#3495','#3497']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#3520',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#3516','#3518'],['#3517','#3519']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#3542',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#3538','#3540'],['#3539','#3541']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#3564',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#3560','#3562'],['#3561','#3563']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#3586',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#3582','#3584'],['#3583','#3585']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#3608',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#3604','#3606'],['#3605','#3607']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#3630',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#3626','#3628'],['#3627','#3629']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#3652',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#3648','#3650'],['#3649','#3651']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#3674',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#3670','#3672'],['#3671','#3673']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#3696',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#3692','#3694'],['#3693','#3695']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#3718',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#3714','#3716'],['#3715','#3717']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#3740',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#3736','#3738'],['#3737','#3739']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#3762',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#3758','#3760'],['#3759','#3761']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#3784',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#3780','#3782'],['#3781','#3783']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#3806',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#3802','#3804'],['#3803','#3805']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#3828',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#3824','#3826'],['#3825','#3827']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#3850',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#3846','#3848'],['#3847','#3849']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#3872',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#3868','#3870'],['#3869','#3871']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#3894',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#3890','#3892'],['#3891','#3893']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#3916',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#3912','#3914'],['#3913','#3915']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#3938',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#3934','#3936'],['#3935','#3937']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#3954',instantiates(quasi_uniform_surface)).
	name('').
	u_degree(1).
	v_degree(1).
	control_points_list([['#3950','#3952'],['#3951','#3953']]).
	surface_form('plane_surf').
	u_closed(false).
	v_closed(false).
	self_intersect(unknown).
:- end_object.

:- object('#128',instantiates(vertex_point)).
	name('').
	vertex_geometry('#127').
:- end_object.

:- object('#172',instantiates(vertex_point)).
	name('').
	vertex_geometry('#171').
:- end_object.

:- object('#206',instantiates(vertex_point)).
	name('').
	vertex_geometry('#205').
:- end_object.

:- object('#250',instantiates(vertex_point)).
	name('').
	vertex_geometry('#249').
:- end_object.

:- object('#284',instantiates(vertex_point)).
	name('').
	vertex_geometry('#283').
:- end_object.

:- object('#286',instantiates(vertex_point)).
	name('').
	vertex_geometry('#285').
:- end_object.

:- object('#293',instantiates(vertex_point)).
	name('').
	vertex_geometry('#292').
:- end_object.

:- object('#300',instantiates(vertex_point)).
	name('').
	vertex_geometry('#299').
:- end_object.

:- object('#320',instantiates(vertex_point)).
	name('').
	vertex_geometry('#319').
:- end_object.

:- object('#322',instantiates(vertex_point)).
	name('').
	vertex_geometry('#321').
:- end_object.

:- object('#366',instantiates(vertex_point)).
	name('').
	vertex_geometry('#365').
:- end_object.

:- object('#381',instantiates(vertex_point)).
	name('').
	vertex_geometry('#380').
:- end_object.

:- object('#426',instantiates(vertex_point)).
	name('').
	vertex_geometry('#425').
:- end_object.

:- object('#428',instantiates(vertex_point)).
	name('').
	vertex_geometry('#427').
:- end_object.

:- object('#496',instantiates(vertex_point)).
	name('').
	vertex_geometry('#495').
:- end_object.

:- object('#547',instantiates(vertex_point)).
	name('').
	vertex_geometry('#546').
:- end_object.

:- object('#581',instantiates(vertex_point)).
	name('').
	vertex_geometry('#580').
:- end_object.

:- object('#583',instantiates(vertex_point)).
	name('').
	vertex_geometry('#582').
:- end_object.

:- object('#590',instantiates(vertex_point)).
	name('').
	vertex_geometry('#589').
:- end_object.

:- object('#597',instantiates(vertex_point)).
	name('').
	vertex_geometry('#596').
:- end_object.

:- object('#604',instantiates(vertex_point)).
	name('').
	vertex_geometry('#603').
:- end_object.

:- object('#611',instantiates(vertex_point)).
	name('').
	vertex_geometry('#610').
:- end_object.

:- object('#618',instantiates(vertex_point)).
	name('').
	vertex_geometry('#617').
:- end_object.

:- object('#625',instantiates(vertex_point)).
	name('').
	vertex_geometry('#624').
:- end_object.

:- object('#632',instantiates(vertex_point)).
	name('').
	vertex_geometry('#631').
:- end_object.

:- object('#639',instantiates(vertex_point)).
	name('').
	vertex_geometry('#638').
:- end_object.

:- object('#646',instantiates(vertex_point)).
	name('').
	vertex_geometry('#645').
:- end_object.

:- object('#653',instantiates(vertex_point)).
	name('').
	vertex_geometry('#652').
:- end_object.

:- object('#660',instantiates(vertex_point)).
	name('').
	vertex_geometry('#659').
:- end_object.

:- object('#667',instantiates(vertex_point)).
	name('').
	vertex_geometry('#666').
:- end_object.

:- object('#674',instantiates(vertex_point)).
	name('').
	vertex_geometry('#673').
:- end_object.

:- object('#681',instantiates(vertex_point)).
	name('').
	vertex_geometry('#680').
:- end_object.

:- object('#688',instantiates(vertex_point)).
	name('').
	vertex_geometry('#687').
:- end_object.

:- object('#695',instantiates(vertex_point)).
	name('').
	vertex_geometry('#694').
:- end_object.

:- object('#702',instantiates(vertex_point)).
	name('').
	vertex_geometry('#701').
:- end_object.

:- object('#709',instantiates(vertex_point)).
	name('').
	vertex_geometry('#708').
:- end_object.

:- object('#716',instantiates(vertex_point)).
	name('').
	vertex_geometry('#715').
:- end_object.

:- object('#723',instantiates(vertex_point)).
	name('').
	vertex_geometry('#722').
:- end_object.

:- object('#730',instantiates(vertex_point)).
	name('').
	vertex_geometry('#729').
:- end_object.

:- object('#737',instantiates(vertex_point)).
	name('').
	vertex_geometry('#736').
:- end_object.

:- object('#744',instantiates(vertex_point)).
	name('').
	vertex_geometry('#743').
:- end_object.

:- object('#751',instantiates(vertex_point)).
	name('').
	vertex_geometry('#750').
:- end_object.

:- object('#758',instantiates(vertex_point)).
	name('').
	vertex_geometry('#757').
:- end_object.

:- object('#765',instantiates(vertex_point)).
	name('').
	vertex_geometry('#764').
:- end_object.

:- object('#772',instantiates(vertex_point)).
	name('').
	vertex_geometry('#771').
:- end_object.

:- object('#779',instantiates(vertex_point)).
	name('').
	vertex_geometry('#778').
:- end_object.

:- object('#786',instantiates(vertex_point)).
	name('').
	vertex_geometry('#785').
:- end_object.

:- object('#793',instantiates(vertex_point)).
	name('').
	vertex_geometry('#792').
:- end_object.

:- object('#800',instantiates(vertex_point)).
	name('').
	vertex_geometry('#799').
:- end_object.

:- object('#807',instantiates(vertex_point)).
	name('').
	vertex_geometry('#806').
:- end_object.

:- object('#814',instantiates(vertex_point)).
	name('').
	vertex_geometry('#813').
:- end_object.

:- object('#821',instantiates(vertex_point)).
	name('').
	vertex_geometry('#820').
:- end_object.

:- object('#828',instantiates(vertex_point)).
	name('').
	vertex_geometry('#827').
:- end_object.

:- object('#835',instantiates(vertex_point)).
	name('').
	vertex_geometry('#834').
:- end_object.

:- object('#842',instantiates(vertex_point)).
	name('').
	vertex_geometry('#841').
:- end_object.

:- object('#849',instantiates(vertex_point)).
	name('').
	vertex_geometry('#848').
:- end_object.

:- object('#856',instantiates(vertex_point)).
	name('').
	vertex_geometry('#855').
:- end_object.

:- object('#863',instantiates(vertex_point)).
	name('').
	vertex_geometry('#862').
:- end_object.

:- object('#870',instantiates(vertex_point)).
	name('').
	vertex_geometry('#869').
:- end_object.

:- object('#877',instantiates(vertex_point)).
	name('').
	vertex_geometry('#876').
:- end_object.

:- object('#884',instantiates(vertex_point)).
	name('').
	vertex_geometry('#883').
:- end_object.

:- object('#891',instantiates(vertex_point)).
	name('').
	vertex_geometry('#890').
:- end_object.

:- object('#898',instantiates(vertex_point)).
	name('').
	vertex_geometry('#897').
:- end_object.

:- object('#905',instantiates(vertex_point)).
	name('').
	vertex_geometry('#904').
:- end_object.

:- object('#912',instantiates(vertex_point)).
	name('').
	vertex_geometry('#911').
:- end_object.

:- object('#919',instantiates(vertex_point)).
	name('').
	vertex_geometry('#918').
:- end_object.

:- object('#926',instantiates(vertex_point)).
	name('').
	vertex_geometry('#925').
:- end_object.

:- object('#933',instantiates(vertex_point)).
	name('').
	vertex_geometry('#932').
:- end_object.

:- object('#940',instantiates(vertex_point)).
	name('').
	vertex_geometry('#939').
:- end_object.

:- object('#947',instantiates(vertex_point)).
	name('').
	vertex_geometry('#946').
:- end_object.

:- object('#954',instantiates(vertex_point)).
	name('').
	vertex_geometry('#953').
:- end_object.

:- object('#961',instantiates(vertex_point)).
	name('').
	vertex_geometry('#960').
:- end_object.

:- object('#968',instantiates(vertex_point)).
	name('').
	vertex_geometry('#967').
:- end_object.

:- object('#975',instantiates(vertex_point)).
	name('').
	vertex_geometry('#974').
:- end_object.

:- object('#982',instantiates(vertex_point)).
	name('').
	vertex_geometry('#981').
:- end_object.

:- object('#989',instantiates(vertex_point)).
	name('').
	vertex_geometry('#988').
:- end_object.

:- object('#996',instantiates(vertex_point)).
	name('').
	vertex_geometry('#995').
:- end_object.

:- object('#1003',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1002').
:- end_object.

:- object('#1010',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1009').
:- end_object.

:- object('#1017',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1016').
:- end_object.

:- object('#1024',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1023').
:- end_object.

:- object('#1031',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1030').
:- end_object.

:- object('#1038',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1037').
:- end_object.

:- object('#1045',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1044').
:- end_object.

:- object('#1052',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1051').
:- end_object.

:- object('#1059',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1058').
:- end_object.

:- object('#1066',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1065').
:- end_object.

:- object('#1073',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1072').
:- end_object.

:- object('#1080',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1079').
:- end_object.

:- object('#1087',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1086').
:- end_object.

:- object('#1094',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1093').
:- end_object.

:- object('#1101',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1100').
:- end_object.

:- object('#1108',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1107').
:- end_object.

:- object('#1115',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1114').
:- end_object.

:- object('#1122',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1121').
:- end_object.

:- object('#1129',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1128').
:- end_object.

:- object('#1136',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1135').
:- end_object.

:- object('#1143',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1142').
:- end_object.

:- object('#1150',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1149').
:- end_object.

:- object('#1157',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1156').
:- end_object.

:- object('#1164',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1163').
:- end_object.

:- object('#1171',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1170').
:- end_object.

:- object('#1178',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1177').
:- end_object.

:- object('#1185',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1184').
:- end_object.

:- object('#1192',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1191').
:- end_object.

:- object('#1199',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1198').
:- end_object.

:- object('#1206',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1205').
:- end_object.

:- object('#1213',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1212').
:- end_object.

:- object('#1220',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1219').
:- end_object.

:- object('#1227',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1226').
:- end_object.

:- object('#1234',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1233').
:- end_object.

:- object('#1241',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1240').
:- end_object.

:- object('#1248',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1247').
:- end_object.

:- object('#1255',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1254').
:- end_object.

:- object('#1262',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1261').
:- end_object.

:- object('#1269',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1268').
:- end_object.

:- object('#1276',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1275').
:- end_object.

:- object('#1283',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1282').
:- end_object.

:- object('#1290',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1289').
:- end_object.

:- object('#1297',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1296').
:- end_object.

:- object('#1304',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1303').
:- end_object.

:- object('#1311',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1310').
:- end_object.

:- object('#1318',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1317').
:- end_object.

:- object('#1325',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1324').
:- end_object.

:- object('#1332',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1331').
:- end_object.

:- object('#1339',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1338').
:- end_object.

:- object('#1346',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1345').
:- end_object.

:- object('#1353',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1352').
:- end_object.

:- object('#1360',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1359').
:- end_object.

:- object('#1367',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1366').
:- end_object.

:- object('#1374',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1373').
:- end_object.

:- object('#1381',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1380').
:- end_object.

:- object('#1404',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1403').
:- end_object.

:- object('#1406',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1405').
:- end_object.

:- object('#1432',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1431').
:- end_object.

:- object('#1454',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1453').
:- end_object.

:- object('#1476',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1475').
:- end_object.

:- object('#1498',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1497').
:- end_object.

:- object('#1520',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1519').
:- end_object.

:- object('#1542',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1541').
:- end_object.

:- object('#1564',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1563').
:- end_object.

:- object('#1586',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1585').
:- end_object.

:- object('#1608',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1607').
:- end_object.

:- object('#1630',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1629').
:- end_object.

:- object('#1652',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1651').
:- end_object.

:- object('#1674',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1673').
:- end_object.

:- object('#1696',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1695').
:- end_object.

:- object('#1718',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1717').
:- end_object.

:- object('#1740',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1739').
:- end_object.

:- object('#1762',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1761').
:- end_object.

:- object('#1784',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1783').
:- end_object.

:- object('#1806',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1805').
:- end_object.

:- object('#1828',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1827').
:- end_object.

:- object('#1850',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1849').
:- end_object.

:- object('#1872',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1871').
:- end_object.

:- object('#1894',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1893').
:- end_object.

:- object('#1916',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1915').
:- end_object.

:- object('#1938',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1937').
:- end_object.

:- object('#1960',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1959').
:- end_object.

:- object('#1982',instantiates(vertex_point)).
	name('').
	vertex_geometry('#1981').
:- end_object.

:- object('#2004',instantiates(vertex_point)).
	name('').
	vertex_geometry('#2003').
:- end_object.

:- object('#2026',instantiates(vertex_point)).
	name('').
	vertex_geometry('#2025').
:- end_object.

:- object('#2048',instantiates(vertex_point)).
	name('').
	vertex_geometry('#2047').
:- end_object.

:- object('#2070',instantiates(vertex_point)).
	name('').
	vertex_geometry('#2069').
:- end_object.

:- object('#2092',instantiates(vertex_point)).
	name('').
	vertex_geometry('#2091').
:- end_object.

:- object('#2114',instantiates(vertex_point)).
	name('').
	vertex_geometry('#2113').
:- end_object.

:- object('#2136',instantiates(vertex_point)).
	name('').
	vertex_geometry('#2135').
:- end_object.

:- object('#2158',instantiates(vertex_point)).
	name('').
	vertex_geometry('#2157').
:- end_object.

:- object('#2180',instantiates(vertex_point)).
	name('').
	vertex_geometry('#2179').
:- end_object.

:- object('#2202',instantiates(vertex_point)).
	name('').
	vertex_geometry('#2201').
:- end_object.

:- object('#2224',instantiates(vertex_point)).
	name('').
	vertex_geometry('#2223').
:- end_object.

:- object('#2246',instantiates(vertex_point)).
	name('').
	vertex_geometry('#2245').
:- end_object.

:- object('#2268',instantiates(vertex_point)).
	name('').
	vertex_geometry('#2267').
:- end_object.

:- object('#2290',instantiates(vertex_point)).
	name('').
	vertex_geometry('#2289').
:- end_object.

:- object('#2312',instantiates(vertex_point)).
	name('').
	vertex_geometry('#2311').
:- end_object.

:- object('#2334',instantiates(vertex_point)).
	name('').
	vertex_geometry('#2333').
:- end_object.

:- object('#2356',instantiates(vertex_point)).
	name('').
	vertex_geometry('#2355').
:- end_object.

:- object('#2378',instantiates(vertex_point)).
	name('').
	vertex_geometry('#2377').
:- end_object.

:- object('#2400',instantiates(vertex_point)).
	name('').
	vertex_geometry('#2399').
:- end_object.

:- object('#2422',instantiates(vertex_point)).
	name('').
	vertex_geometry('#2421').
:- end_object.

:- object('#2444',instantiates(vertex_point)).
	name('').
	vertex_geometry('#2443').
:- end_object.

:- object('#2466',instantiates(vertex_point)).
	name('').
	vertex_geometry('#2465').
:- end_object.

:- object('#2488',instantiates(vertex_point)).
	name('').
	vertex_geometry('#2487').
:- end_object.

:- object('#2510',instantiates(vertex_point)).
	name('').
	vertex_geometry('#2509').
:- end_object.

:- object('#2532',instantiates(vertex_point)).
	name('').
	vertex_geometry('#2531').
:- end_object.

:- object('#2554',instantiates(vertex_point)).
	name('').
	vertex_geometry('#2553').
:- end_object.

:- object('#2576',instantiates(vertex_point)).
	name('').
	vertex_geometry('#2575').
:- end_object.

:- object('#2598',instantiates(vertex_point)).
	name('').
	vertex_geometry('#2597').
:- end_object.

:- object('#2620',instantiates(vertex_point)).
	name('').
	vertex_geometry('#2619').
:- end_object.

:- object('#2642',instantiates(vertex_point)).
	name('').
	vertex_geometry('#2641').
:- end_object.

:- object('#2664',instantiates(vertex_point)).
	name('').
	vertex_geometry('#2663').
:- end_object.

:- object('#2686',instantiates(vertex_point)).
	name('').
	vertex_geometry('#2685').
:- end_object.

:- object('#2708',instantiates(vertex_point)).
	name('').
	vertex_geometry('#2707').
:- end_object.

:- object('#2730',instantiates(vertex_point)).
	name('').
	vertex_geometry('#2729').
:- end_object.

:- object('#2752',instantiates(vertex_point)).
	name('').
	vertex_geometry('#2751').
:- end_object.

:- object('#2774',instantiates(vertex_point)).
	name('').
	vertex_geometry('#2773').
:- end_object.

:- object('#2796',instantiates(vertex_point)).
	name('').
	vertex_geometry('#2795').
:- end_object.

:- object('#2818',instantiates(vertex_point)).
	name('').
	vertex_geometry('#2817').
:- end_object.

:- object('#2840',instantiates(vertex_point)).
	name('').
	vertex_geometry('#2839').
:- end_object.

:- object('#2862',instantiates(vertex_point)).
	name('').
	vertex_geometry('#2861').
:- end_object.

:- object('#2884',instantiates(vertex_point)).
	name('').
	vertex_geometry('#2883').
:- end_object.

:- object('#2906',instantiates(vertex_point)).
	name('').
	vertex_geometry('#2905').
:- end_object.

:- object('#2928',instantiates(vertex_point)).
	name('').
	vertex_geometry('#2927').
:- end_object.

:- object('#2950',instantiates(vertex_point)).
	name('').
	vertex_geometry('#2949').
:- end_object.

:- object('#2972',instantiates(vertex_point)).
	name('').
	vertex_geometry('#2971').
:- end_object.

:- object('#2994',instantiates(vertex_point)).
	name('').
	vertex_geometry('#2993').
:- end_object.

:- object('#3016',instantiates(vertex_point)).
	name('').
	vertex_geometry('#3015').
:- end_object.

:- object('#3038',instantiates(vertex_point)).
	name('').
	vertex_geometry('#3037').
:- end_object.

:- object('#3060',instantiates(vertex_point)).
	name('').
	vertex_geometry('#3059').
:- end_object.

:- object('#3082',instantiates(vertex_point)).
	name('').
	vertex_geometry('#3081').
:- end_object.

:- object('#3104',instantiates(vertex_point)).
	name('').
	vertex_geometry('#3103').
:- end_object.

:- object('#3126',instantiates(vertex_point)).
	name('').
	vertex_geometry('#3125').
:- end_object.

:- object('#3148',instantiates(vertex_point)).
	name('').
	vertex_geometry('#3147').
:- end_object.

:- object('#3170',instantiates(vertex_point)).
	name('').
	vertex_geometry('#3169').
:- end_object.

:- object('#3192',instantiates(vertex_point)).
	name('').
	vertex_geometry('#3191').
:- end_object.

:- object('#3214',instantiates(vertex_point)).
	name('').
	vertex_geometry('#3213').
:- end_object.

:- object('#3236',instantiates(vertex_point)).
	name('').
	vertex_geometry('#3235').
:- end_object.

:- object('#3258',instantiates(vertex_point)).
	name('').
	vertex_geometry('#3257').
:- end_object.

:- object('#3280',instantiates(vertex_point)).
	name('').
	vertex_geometry('#3279').
:- end_object.

:- object('#3302',instantiates(vertex_point)).
	name('').
	vertex_geometry('#3301').
:- end_object.

:- object('#3324',instantiates(vertex_point)).
	name('').
	vertex_geometry('#3323').
:- end_object.

:- object('#3346',instantiates(vertex_point)).
	name('').
	vertex_geometry('#3345').
:- end_object.

:- object('#3368',instantiates(vertex_point)).
	name('').
	vertex_geometry('#3367').
:- end_object.

:- object('#3390',instantiates(vertex_point)).
	name('').
	vertex_geometry('#3389').
:- end_object.

:- object('#3412',instantiates(vertex_point)).
	name('').
	vertex_geometry('#3411').
:- end_object.

:- object('#3434',instantiates(vertex_point)).
	name('').
	vertex_geometry('#3433').
:- end_object.

:- object('#3456',instantiates(vertex_point)).
	name('').
	vertex_geometry('#3455').
:- end_object.

:- object('#3478',instantiates(vertex_point)).
	name('').
	vertex_geometry('#3477').
:- end_object.

:- object('#3500',instantiates(vertex_point)).
	name('').
	vertex_geometry('#3499').
:- end_object.

:- object('#3522',instantiates(vertex_point)).
	name('').
	vertex_geometry('#3521').
:- end_object.

:- object('#3544',instantiates(vertex_point)).
	name('').
	vertex_geometry('#3543').
:- end_object.

:- object('#3566',instantiates(vertex_point)).
	name('').
	vertex_geometry('#3565').
:- end_object.

:- object('#3588',instantiates(vertex_point)).
	name('').
	vertex_geometry('#3587').
:- end_object.

:- object('#3610',instantiates(vertex_point)).
	name('').
	vertex_geometry('#3609').
:- end_object.

:- object('#3632',instantiates(vertex_point)).
	name('').
	vertex_geometry('#3631').
:- end_object.

:- object('#3654',instantiates(vertex_point)).
	name('').
	vertex_geometry('#3653').
:- end_object.

:- object('#3676',instantiates(vertex_point)).
	name('').
	vertex_geometry('#3675').
:- end_object.

:- object('#3698',instantiates(vertex_point)).
	name('').
	vertex_geometry('#3697').
:- end_object.

:- object('#3720',instantiates(vertex_point)).
	name('').
	vertex_geometry('#3719').
:- end_object.

:- object('#3742',instantiates(vertex_point)).
	name('').
	vertex_geometry('#3741').
:- end_object.

:- object('#3764',instantiates(vertex_point)).
	name('').
	vertex_geometry('#3763').
:- end_object.

:- object('#3786',instantiates(vertex_point)).
	name('').
	vertex_geometry('#3785').
:- end_object.

:- object('#3808',instantiates(vertex_point)).
	name('').
	vertex_geometry('#3807').
:- end_object.

:- object('#3830',instantiates(vertex_point)).
	name('').
	vertex_geometry('#3829').
:- end_object.

:- object('#3852',instantiates(vertex_point)).
	name('').
	vertex_geometry('#3851').
:- end_object.

:- object('#3874',instantiates(vertex_point)).
	name('').
	vertex_geometry('#3873').
:- end_object.

:- object('#3896',instantiates(vertex_point)).
	name('').
	vertex_geometry('#3895').
:- end_object.

:- object('#3918',instantiates(vertex_point)).
	name('').
	vertex_geometry('#3917').
:- end_object.

:- object('#143',instantiates(b_spline_curve_with_knots,rational_b_spline_curve)).
	:- alias(b_spline_curve_with_knots,attr_spec/4,b_spline_curve_with_knots_attr_spec/4).
	:- alias(rational_b_spline_curve,attr_spec/4,rational_b_spline_curve_attr_spec/4).
	attr_spec(N,T,S,K) :- ::b_spline_curve_with_knots_attr_spec(N,T,S,K).
	attr_spec(N,T,S,K) :- ::rational_b_spline_curve_attr_spec(N,T,S,K).
	:- alias(b_spline_curve_with_knots,domain_rule/2,b_spline_curve_with_knots_domain_rule/2).
	:- alias(rational_b_spline_curve,domain_rule/2,rational_b_spline_curve_domain_rule/2).
	domain_rule(S,R) :- ::b_spline_curve_with_knots_domain_rule(S,R).
	domain_rule(S,R) :- ::rational_b_spline_curve_domain_rule(S,R).
	degree(2).
	control_points_list(['#129','#130','#131','#132','#133','#134','#135']).
	curve_form('circular_arc').
	closed_curve(true).
	self_intersect(unknown).
	knot_multiplicities([3,2,2,3]).
	knots([  0.00000000e+00,  3.33333333e-01,  6.66666667e-01,  1.00000000e+00]).
	knot_spec('unspecified').
	weights_data([  1.00000000e+00,  5.00000000e-01,  1.00000000e+00,  5.00000000e-01,  1.00000000e+00,  5.00000000e-01,  1.00000000e+00]).
	name('').
:- end_object.

:- object('#187',instantiates(b_spline_curve_with_knots,rational_b_spline_curve)).
	:- alias(b_spline_curve_with_knots,attr_spec/4,b_spline_curve_with_knots_attr_spec/4).
	:- alias(rational_b_spline_curve,attr_spec/4,rational_b_spline_curve_attr_spec/4).
	attr_spec(N,T,S,K) :- ::b_spline_curve_with_knots_attr_spec(N,T,S,K).
	attr_spec(N,T,S,K) :- ::rational_b_spline_curve_attr_spec(N,T,S,K).
	:- alias(b_spline_curve_with_knots,domain_rule/2,b_spline_curve_with_knots_domain_rule/2).
	:- alias(rational_b_spline_curve,domain_rule/2,rational_b_spline_curve_domain_rule/2).
	domain_rule(S,R) :- ::b_spline_curve_with_knots_domain_rule(S,R).
	domain_rule(S,R) :- ::rational_b_spline_curve_domain_rule(S,R).
	degree(2).
	control_points_list(['#173','#174','#175','#176','#177','#178','#179']).
	curve_form('circular_arc').
	closed_curve(true).
	self_intersect(unknown).
	knot_multiplicities([3,2,2,3]).
	knots([  0.00000000e+00,  3.33333333e-01,  6.66666667e-01,  1.00000000e+00]).
	knot_spec('unspecified').
	weights_data([  1.00000000e+00,  5.00000000e-01,  1.00000000e+00,  5.00000000e-01,  1.00000000e+00,  5.00000000e-01,  1.00000000e+00]).
	name('').
:- end_object.

:- object('#221',instantiates(b_spline_curve_with_knots,rational_b_spline_curve)).
	:- alias(b_spline_curve_with_knots,attr_spec/4,b_spline_curve_with_knots_attr_spec/4).
	:- alias(rational_b_spline_curve,attr_spec/4,rational_b_spline_curve_attr_spec/4).
	attr_spec(N,T,S,K) :- ::b_spline_curve_with_knots_attr_spec(N,T,S,K).
	attr_spec(N,T,S,K) :- ::rational_b_spline_curve_attr_spec(N,T,S,K).
	:- alias(b_spline_curve_with_knots,domain_rule/2,b_spline_curve_with_knots_domain_rule/2).
	:- alias(rational_b_spline_curve,domain_rule/2,rational_b_spline_curve_domain_rule/2).
	domain_rule(S,R) :- ::b_spline_curve_with_knots_domain_rule(S,R).
	domain_rule(S,R) :- ::rational_b_spline_curve_domain_rule(S,R).
	degree(2).
	control_points_list(['#207','#208','#209','#210','#211','#212','#213']).
	curve_form('circular_arc').
	closed_curve(true).
	self_intersect(unknown).
	knot_multiplicities([3,2,2,3]).
	knots([  0.00000000e+00,  3.33333333e-01,  6.66666667e-01,  1.00000000e+00]).
	knot_spec('unspecified').
	weights_data([  1.00000000e+00,  5.00000000e-01,  1.00000000e+00,  5.00000000e-01,  1.00000000e+00,  5.00000000e-01,  1.00000000e+00]).
	name('').
:- end_object.

:- object('#265',instantiates(b_spline_curve_with_knots,rational_b_spline_curve)).
	:- alias(b_spline_curve_with_knots,attr_spec/4,b_spline_curve_with_knots_attr_spec/4).
	:- alias(rational_b_spline_curve,attr_spec/4,rational_b_spline_curve_attr_spec/4).
	attr_spec(N,T,S,K) :- ::b_spline_curve_with_knots_attr_spec(N,T,S,K).
	attr_spec(N,T,S,K) :- ::rational_b_spline_curve_attr_spec(N,T,S,K).
	:- alias(b_spline_curve_with_knots,domain_rule/2,b_spline_curve_with_knots_domain_rule/2).
	:- alias(rational_b_spline_curve,domain_rule/2,rational_b_spline_curve_domain_rule/2).
	domain_rule(S,R) :- ::b_spline_curve_with_knots_domain_rule(S,R).
	domain_rule(S,R) :- ::rational_b_spline_curve_domain_rule(S,R).
	degree(2).
	control_points_list(['#251','#252','#253','#254','#255','#256','#257']).
	curve_form('circular_arc').
	closed_curve(true).
	self_intersect(unknown).
	knot_multiplicities([3,2,2,3]).
	knots([  0.00000000e+00,  3.33333333e-01,  6.66666667e-01,  1.00000000e+00]).
	knot_spec('unspecified').
	weights_data([  1.00000000e+00,  5.00000000e-01,  1.00000000e+00,  5.00000000e-01,  1.00000000e+00,  5.00000000e-01,  1.00000000e+00]).
	name('').
:- end_object.

:- object('#377',instantiates(b_spline_curve_with_knots,rational_b_spline_curve)).
	:- alias(b_spline_curve_with_knots,attr_spec/4,b_spline_curve_with_knots_attr_spec/4).
	:- alias(rational_b_spline_curve,attr_spec/4,rational_b_spline_curve_attr_spec/4).
	attr_spec(N,T,S,K) :- ::b_spline_curve_with_knots_attr_spec(N,T,S,K).
	attr_spec(N,T,S,K) :- ::rational_b_spline_curve_attr_spec(N,T,S,K).
	:- alias(b_spline_curve_with_knots,domain_rule/2,b_spline_curve_with_knots_domain_rule/2).
	:- alias(rational_b_spline_curve,domain_rule/2,rational_b_spline_curve_domain_rule/2).
	domain_rule(S,R) :- ::b_spline_curve_with_knots_domain_rule(S,R).
	domain_rule(S,R) :- ::rational_b_spline_curve_domain_rule(S,R).
	degree(2).
	control_points_list(['#367','#368','#369']).
	curve_form('circular_arc').
	closed_curve(false).
	self_intersect(unknown).
	knot_multiplicities([3,3]).
	knots([  8.21893618e-01,  1.00000000e+00]).
	knot_spec('unspecified').
	weights_data([  7.51177804e-01,  7.32840426e-01,  1.00000000e+00]).
	name('').
:- end_object.

:- object('#397',instantiates(b_spline_curve_with_knots,rational_b_spline_curve)).
	:- alias(b_spline_curve_with_knots,attr_spec/4,b_spline_curve_with_knots_attr_spec/4).
	:- alias(rational_b_spline_curve,attr_spec/4,rational_b_spline_curve_attr_spec/4).
	attr_spec(N,T,S,K) :- ::b_spline_curve_with_knots_attr_spec(N,T,S,K).
	attr_spec(N,T,S,K) :- ::rational_b_spline_curve_attr_spec(N,T,S,K).
	:- alias(b_spline_curve_with_knots,domain_rule/2,b_spline_curve_with_knots_domain_rule/2).
	:- alias(rational_b_spline_curve,domain_rule/2,rational_b_spline_curve_domain_rule/2).
	domain_rule(S,R) :- ::b_spline_curve_with_knots_domain_rule(S,R).
	domain_rule(S,R) :- ::rational_b_spline_curve_domain_rule(S,R).
	degree(2).
	control_points_list(['#387','#388','#389']).
	curve_form('circular_arc').
	closed_curve(false).
	self_intersect(unknown).
	knot_multiplicities([3,3]).
	knots([  0.00000000e+00,  1.78106382e-01]).
	knot_spec('unspecified').
	weights_data([  1.00000000e+00,  7.32840426e-01,  7.51177804e-01]).
	name('').
:- end_object.

:- object('#446',instantiates(b_spline_curve_with_knots,rational_b_spline_curve)).
	:- alias(b_spline_curve_with_knots,attr_spec/4,b_spline_curve_with_knots_attr_spec/4).
	:- alias(rational_b_spline_curve,attr_spec/4,rational_b_spline_curve_attr_spec/4).
	attr_spec(N,T,S,K) :- ::b_spline_curve_with_knots_attr_spec(N,T,S,K).
	attr_spec(N,T,S,K) :- ::rational_b_spline_curve_attr_spec(N,T,S,K).
	:- alias(b_spline_curve_with_knots,domain_rule/2,b_spline_curve_with_knots_domain_rule/2).
	:- alias(rational_b_spline_curve,domain_rule/2,rational_b_spline_curve_domain_rule/2).
	domain_rule(S,R) :- ::b_spline_curve_with_knots_domain_rule(S,R).
	domain_rule(S,R) :- ::rational_b_spline_curve_domain_rule(S,R).
	degree(2).
	control_points_list(['#434','#435','#436','#437','#438']).
	curve_form('unspecified').
	closed_curve(false).
	self_intersect(unknown).
	knot_multiplicities([3,2,3]).
	knots([  3.30413120e-01,  6.65206560e-01,  1.00000000e+00]).
	knot_spec('unspecified').
	weights_data([  1.00000000e+00,  5.00000000e-01,  1.00000000e+00,  5.00000000e-01,  1.00000000e+00]).
	name('').
:- end_object.

:- object('#464',instantiates(b_spline_curve_with_knots,rational_b_spline_curve)).
	:- alias(b_spline_curve_with_knots,attr_spec/4,b_spline_curve_with_knots_attr_spec/4).
	:- alias(rational_b_spline_curve,attr_spec/4,rational_b_spline_curve_attr_spec/4).
	attr_spec(N,T,S,K) :- ::b_spline_curve_with_knots_attr_spec(N,T,S,K).
	attr_spec(N,T,S,K) :- ::rational_b_spline_curve_attr_spec(N,T,S,K).
	:- alias(b_spline_curve_with_knots,domain_rule/2,b_spline_curve_with_knots_domain_rule/2).
	:- alias(rational_b_spline_curve,domain_rule/2,rational_b_spline_curve_domain_rule/2).
	domain_rule(S,R) :- ::b_spline_curve_with_knots_domain_rule(S,R).
	domain_rule(S,R) :- ::rational_b_spline_curve_domain_rule(S,R).
	degree(2).
	control_points_list(['#450','#451','#452','#453','#454','#455','#456']).
	curve_form('circular_arc').
	closed_curve(false).
	self_intersect(unknown).
	knot_multiplicities([3,2,2,3]).
	knots([  0.00000000e+00,  3.33333333e-01,  6.66666667e-01,  6.69586880e-01]).
	knot_spec('unspecified').
	weights_data([  1.00000000e+00,  5.00000000e-01,  1.00000000e+00,  5.00000000e-01,  1.00000000e+00,  9.95619679e-01,  9.91316108e-01]).
	name('').
:- end_object.

:- object('#511',instantiates(b_spline_curve_with_knots,rational_b_spline_curve)).
	:- alias(b_spline_curve_with_knots,attr_spec/4,b_spline_curve_with_knots_attr_spec/4).
	:- alias(rational_b_spline_curve,attr_spec/4,rational_b_spline_curve_attr_spec/4).
	attr_spec(N,T,S,K) :- ::b_spline_curve_with_knots_attr_spec(N,T,S,K).
	attr_spec(N,T,S,K) :- ::rational_b_spline_curve_attr_spec(N,T,S,K).
	:- alias(b_spline_curve_with_knots,domain_rule/2,b_spline_curve_with_knots_domain_rule/2).
	:- alias(rational_b_spline_curve,domain_rule/2,rational_b_spline_curve_domain_rule/2).
	domain_rule(S,R) :- ::b_spline_curve_with_knots_domain_rule(S,R).
	domain_rule(S,R) :- ::rational_b_spline_curve_domain_rule(S,R).
	degree(2).
	control_points_list(['#497','#498','#499','#500','#501','#502','#503']).
	curve_form('circular_arc').
	closed_curve(true).
	self_intersect(unknown).
	knot_multiplicities([3,2,2,3]).
	knots([  0.00000000e+00,  3.33333333e-01,  6.66666667e-01,  1.00000000e+00]).
	knot_spec('unspecified').
	weights_data([  1.00000000e+00,  5.00000000e-01,  1.00000000e+00,  5.00000000e-01,  1.00000000e+00,  5.00000000e-01,  1.00000000e+00]).
	name('').
:- end_object.

:- object('#562',instantiates(b_spline_curve_with_knots,rational_b_spline_curve)).
	:- alias(b_spline_curve_with_knots,attr_spec/4,b_spline_curve_with_knots_attr_spec/4).
	:- alias(rational_b_spline_curve,attr_spec/4,rational_b_spline_curve_attr_spec/4).
	attr_spec(N,T,S,K) :- ::b_spline_curve_with_knots_attr_spec(N,T,S,K).
	attr_spec(N,T,S,K) :- ::rational_b_spline_curve_attr_spec(N,T,S,K).
	:- alias(b_spline_curve_with_knots,domain_rule/2,b_spline_curve_with_knots_domain_rule/2).
	:- alias(rational_b_spline_curve,domain_rule/2,rational_b_spline_curve_domain_rule/2).
	domain_rule(S,R) :- ::b_spline_curve_with_knots_domain_rule(S,R).
	domain_rule(S,R) :- ::rational_b_spline_curve_domain_rule(S,R).
	degree(2).
	control_points_list(['#548','#549','#550','#551','#552','#553','#554']).
	curve_form('circular_arc').
	closed_curve(true).
	self_intersect(unknown).
	knot_multiplicities([3,2,2,3]).
	knots([  0.00000000e+00,  3.33333333e-01,  6.66666667e-01,  1.00000000e+00]).
	knot_spec('unspecified').
	weights_data([  1.00000000e+00,  5.00000000e-01,  1.00000000e+00,  5.00000000e-01,  1.00000000e+00,  5.00000000e-01,  1.00000000e+00]).
	name('').
:- end_object.

:- object('#144',instantiates(edge_curve)).
	name('').
	edge_start('#128').
	edge_end('#128').
	edge_geometry('#143').
	same_sense(true).
:- end_object.

:- object('#188',instantiates(edge_curve)).
	name('').
	edge_start('#172').
	edge_end('#172').
	edge_geometry('#187').
	same_sense(true).
:- end_object.

:- object('#193',instantiates(edge_curve)).
	name('').
	edge_start('#128').
	edge_end('#172').
	edge_geometry('#192').
	same_sense(true).
:- end_object.

:- object('#222',instantiates(edge_curve)).
	name('').
	edge_start('#206').
	edge_end('#206').
	edge_geometry('#221').
	same_sense(true).
:- end_object.

:- object('#266',instantiates(edge_curve)).
	name('').
	edge_start('#250').
	edge_end('#250').
	edge_geometry('#265').
	same_sense(true).
:- end_object.

:- object('#271',instantiates(edge_curve)).
	name('').
	edge_start('#206').
	edge_end('#250').
	edge_geometry('#270').
	same_sense(true).
:- end_object.

:- object('#290',instantiates(edge_curve)).
	name('').
	edge_start('#284').
	edge_end('#286').
	edge_geometry('#289').
	same_sense(true).
:- end_object.

:- object('#297',instantiates(edge_curve)).
	name('').
	edge_start('#284').
	edge_end('#293').
	edge_geometry('#296').
	same_sense(true).
:- end_object.

:- object('#304',instantiates(edge_curve)).
	name('').
	edge_start('#300').
	edge_end('#293').
	edge_geometry('#303').
	same_sense(true).
:- end_object.

:- object('#309',instantiates(edge_curve)).
	name('').
	edge_start('#300').
	edge_end('#286').
	edge_geometry('#308').
	same_sense(true).
:- end_object.

:- object('#326',instantiates(edge_curve)).
	name('').
	edge_start('#320').
	edge_end('#322').
	edge_geometry('#325').
	same_sense(true).
:- end_object.

:- object('#331',instantiates(edge_curve)).
	name('').
	edge_start('#286').
	edge_end('#322').
	edge_geometry('#330').
	same_sense(true).
:- end_object.

:- object('#337',instantiates(edge_curve)).
	name('').
	edge_start('#320').
	edge_end('#300').
	edge_geometry('#336').
	same_sense(true).
:- end_object.

:- object('#378',instantiates(edge_curve)).
	name('').
	edge_start('#322').
	edge_end('#366').
	edge_geometry('#377').
	same_sense(true).
:- end_object.

:- object('#385',instantiates(edge_curve)).
	name('').
	edge_start('#366').
	edge_end('#381').
	edge_geometry('#384').
	same_sense(true).
:- end_object.

:- object('#398',instantiates(edge_curve)).
	name('').
	edge_start('#381').
	edge_end('#320').
	edge_geometry('#397').
	same_sense(true).
:- end_object.

:- object('#432',instantiates(edge_curve)).
	name('').
	edge_start('#426').
	edge_end('#428').
	edge_geometry('#431').
	same_sense(true).
:- end_object.

:- object('#447',instantiates(edge_curve)).
	name('').
	edge_start('#428').
	edge_end('#381').
	edge_geometry('#446').
	same_sense(true).
:- end_object.

:- object('#465',instantiates(edge_curve)).
	name('').
	edge_start('#366').
	edge_end('#426').
	edge_geometry('#464').
	same_sense(true).
:- end_object.

:- object('#479',instantiates(edge_curve)).
	name('').
	edge_start('#293').
	edge_end('#428').
	edge_geometry('#478').
	same_sense(true).
:- end_object.

:- object('#485',instantiates(edge_curve)).
	name('').
	edge_start('#426').
	edge_end('#284').
	edge_geometry('#484').
	same_sense(true).
:- end_object.

:- object('#512',instantiates(edge_curve)).
	name('').
	edge_start('#496').
	edge_end('#496').
	edge_geometry('#511').
	same_sense(true).
:- end_object.

:- object('#563',instantiates(edge_curve)).
	name('').
	edge_start('#547').
	edge_end('#547').
	edge_geometry('#562').
	same_sense(true).
:- end_object.

:- object('#568',instantiates(edge_curve)).
	name('').
	edge_start('#496').
	edge_end('#547').
	edge_geometry('#567').
	same_sense(true).
:- end_object.

:- object('#587',instantiates(edge_curve)).
	name('').
	edge_start('#581').
	edge_end('#583').
	edge_geometry('#586').
	same_sense(true).
:- end_object.

:- object('#594',instantiates(edge_curve)).
	name('').
	edge_start('#581').
	edge_end('#590').
	edge_geometry('#593').
	same_sense(true).
:- end_object.

:- object('#601',instantiates(edge_curve)).
	name('').
	edge_start('#590').
	edge_end('#597').
	edge_geometry('#600').
	same_sense(true).
:- end_object.

:- object('#608',instantiates(edge_curve)).
	name('').
	edge_start('#597').
	edge_end('#604').
	edge_geometry('#607').
	same_sense(true).
:- end_object.

:- object('#615',instantiates(edge_curve)).
	name('').
	edge_start('#604').
	edge_end('#611').
	edge_geometry('#614').
	same_sense(true).
:- end_object.

:- object('#622',instantiates(edge_curve)).
	name('').
	edge_start('#611').
	edge_end('#618').
	edge_geometry('#621').
	same_sense(true).
:- end_object.

:- object('#629',instantiates(edge_curve)).
	name('').
	edge_start('#618').
	edge_end('#625').
	edge_geometry('#628').
	same_sense(true).
:- end_object.

:- object('#636',instantiates(edge_curve)).
	name('').
	edge_start('#625').
	edge_end('#632').
	edge_geometry('#635').
	same_sense(true).
:- end_object.

:- object('#643',instantiates(edge_curve)).
	name('').
	edge_start('#632').
	edge_end('#639').
	edge_geometry('#642').
	same_sense(true).
:- end_object.

:- object('#650',instantiates(edge_curve)).
	name('').
	edge_start('#639').
	edge_end('#646').
	edge_geometry('#649').
	same_sense(true).
:- end_object.

:- object('#657',instantiates(edge_curve)).
	name('').
	edge_start('#646').
	edge_end('#653').
	edge_geometry('#656').
	same_sense(true).
:- end_object.

:- object('#664',instantiates(edge_curve)).
	name('').
	edge_start('#653').
	edge_end('#660').
	edge_geometry('#663').
	same_sense(true).
:- end_object.

:- object('#671',instantiates(edge_curve)).
	name('').
	edge_start('#660').
	edge_end('#667').
	edge_geometry('#670').
	same_sense(true).
:- end_object.

:- object('#678',instantiates(edge_curve)).
	name('').
	edge_start('#667').
	edge_end('#674').
	edge_geometry('#677').
	same_sense(true).
:- end_object.

:- object('#685',instantiates(edge_curve)).
	name('').
	edge_start('#674').
	edge_end('#681').
	edge_geometry('#684').
	same_sense(true).
:- end_object.

:- object('#692',instantiates(edge_curve)).
	name('').
	edge_start('#681').
	edge_end('#688').
	edge_geometry('#691').
	same_sense(true).
:- end_object.

:- object('#699',instantiates(edge_curve)).
	name('').
	edge_start('#688').
	edge_end('#695').
	edge_geometry('#698').
	same_sense(true).
:- end_object.

:- object('#706',instantiates(edge_curve)).
	name('').
	edge_start('#695').
	edge_end('#702').
	edge_geometry('#705').
	same_sense(true).
:- end_object.

:- object('#713',instantiates(edge_curve)).
	name('').
	edge_start('#702').
	edge_end('#709').
	edge_geometry('#712').
	same_sense(true).
:- end_object.

:- object('#720',instantiates(edge_curve)).
	name('').
	edge_start('#709').
	edge_end('#716').
	edge_geometry('#719').
	same_sense(true).
:- end_object.

:- object('#727',instantiates(edge_curve)).
	name('').
	edge_start('#716').
	edge_end('#723').
	edge_geometry('#726').
	same_sense(true).
:- end_object.

:- object('#734',instantiates(edge_curve)).
	name('').
	edge_start('#723').
	edge_end('#730').
	edge_geometry('#733').
	same_sense(true).
:- end_object.

:- object('#741',instantiates(edge_curve)).
	name('').
	edge_start('#730').
	edge_end('#737').
	edge_geometry('#740').
	same_sense(true).
:- end_object.

:- object('#748',instantiates(edge_curve)).
	name('').
	edge_start('#737').
	edge_end('#744').
	edge_geometry('#747').
	same_sense(true).
:- end_object.

:- object('#755',instantiates(edge_curve)).
	name('').
	edge_start('#744').
	edge_end('#751').
	edge_geometry('#754').
	same_sense(true).
:- end_object.

:- object('#762',instantiates(edge_curve)).
	name('').
	edge_start('#751').
	edge_end('#758').
	edge_geometry('#761').
	same_sense(true).
:- end_object.

:- object('#769',instantiates(edge_curve)).
	name('').
	edge_start('#758').
	edge_end('#765').
	edge_geometry('#768').
	same_sense(true).
:- end_object.

:- object('#776',instantiates(edge_curve)).
	name('').
	edge_start('#765').
	edge_end('#772').
	edge_geometry('#775').
	same_sense(true).
:- end_object.

:- object('#783',instantiates(edge_curve)).
	name('').
	edge_start('#772').
	edge_end('#779').
	edge_geometry('#782').
	same_sense(true).
:- end_object.

:- object('#790',instantiates(edge_curve)).
	name('').
	edge_start('#779').
	edge_end('#786').
	edge_geometry('#789').
	same_sense(true).
:- end_object.

:- object('#797',instantiates(edge_curve)).
	name('').
	edge_start('#786').
	edge_end('#793').
	edge_geometry('#796').
	same_sense(true).
:- end_object.

:- object('#804',instantiates(edge_curve)).
	name('').
	edge_start('#793').
	edge_end('#800').
	edge_geometry('#803').
	same_sense(true).
:- end_object.

:- object('#811',instantiates(edge_curve)).
	name('').
	edge_start('#800').
	edge_end('#807').
	edge_geometry('#810').
	same_sense(true).
:- end_object.

:- object('#818',instantiates(edge_curve)).
	name('').
	edge_start('#807').
	edge_end('#814').
	edge_geometry('#817').
	same_sense(true).
:- end_object.

:- object('#825',instantiates(edge_curve)).
	name('').
	edge_start('#814').
	edge_end('#821').
	edge_geometry('#824').
	same_sense(true).
:- end_object.

:- object('#832',instantiates(edge_curve)).
	name('').
	edge_start('#821').
	edge_end('#828').
	edge_geometry('#831').
	same_sense(true).
:- end_object.

:- object('#839',instantiates(edge_curve)).
	name('').
	edge_start('#828').
	edge_end('#835').
	edge_geometry('#838').
	same_sense(true).
:- end_object.

:- object('#846',instantiates(edge_curve)).
	name('').
	edge_start('#835').
	edge_end('#842').
	edge_geometry('#845').
	same_sense(true).
:- end_object.

:- object('#853',instantiates(edge_curve)).
	name('').
	edge_start('#842').
	edge_end('#849').
	edge_geometry('#852').
	same_sense(true).
:- end_object.

:- object('#860',instantiates(edge_curve)).
	name('').
	edge_start('#849').
	edge_end('#856').
	edge_geometry('#859').
	same_sense(true).
:- end_object.

:- object('#867',instantiates(edge_curve)).
	name('').
	edge_start('#856').
	edge_end('#863').
	edge_geometry('#866').
	same_sense(true).
:- end_object.

:- object('#874',instantiates(edge_curve)).
	name('').
	edge_start('#863').
	edge_end('#870').
	edge_geometry('#873').
	same_sense(true).
:- end_object.

:- object('#881',instantiates(edge_curve)).
	name('').
	edge_start('#870').
	edge_end('#877').
	edge_geometry('#880').
	same_sense(true).
:- end_object.

:- object('#888',instantiates(edge_curve)).
	name('').
	edge_start('#877').
	edge_end('#884').
	edge_geometry('#887').
	same_sense(true).
:- end_object.

:- object('#895',instantiates(edge_curve)).
	name('').
	edge_start('#884').
	edge_end('#891').
	edge_geometry('#894').
	same_sense(true).
:- end_object.

:- object('#902',instantiates(edge_curve)).
	name('').
	edge_start('#891').
	edge_end('#898').
	edge_geometry('#901').
	same_sense(true).
:- end_object.

:- object('#909',instantiates(edge_curve)).
	name('').
	edge_start('#898').
	edge_end('#905').
	edge_geometry('#908').
	same_sense(true).
:- end_object.

:- object('#916',instantiates(edge_curve)).
	name('').
	edge_start('#905').
	edge_end('#912').
	edge_geometry('#915').
	same_sense(true).
:- end_object.

:- object('#923',instantiates(edge_curve)).
	name('').
	edge_start('#912').
	edge_end('#919').
	edge_geometry('#922').
	same_sense(true).
:- end_object.

:- object('#930',instantiates(edge_curve)).
	name('').
	edge_start('#919').
	edge_end('#926').
	edge_geometry('#929').
	same_sense(true).
:- end_object.

:- object('#937',instantiates(edge_curve)).
	name('').
	edge_start('#926').
	edge_end('#933').
	edge_geometry('#936').
	same_sense(true).
:- end_object.

:- object('#944',instantiates(edge_curve)).
	name('').
	edge_start('#933').
	edge_end('#940').
	edge_geometry('#943').
	same_sense(true).
:- end_object.

:- object('#951',instantiates(edge_curve)).
	name('').
	edge_start('#940').
	edge_end('#947').
	edge_geometry('#950').
	same_sense(true).
:- end_object.

:- object('#958',instantiates(edge_curve)).
	name('').
	edge_start('#947').
	edge_end('#954').
	edge_geometry('#957').
	same_sense(true).
:- end_object.

:- object('#965',instantiates(edge_curve)).
	name('').
	edge_start('#954').
	edge_end('#961').
	edge_geometry('#964').
	same_sense(true).
:- end_object.

:- object('#972',instantiates(edge_curve)).
	name('').
	edge_start('#961').
	edge_end('#968').
	edge_geometry('#971').
	same_sense(true).
:- end_object.

:- object('#979',instantiates(edge_curve)).
	name('').
	edge_start('#968').
	edge_end('#975').
	edge_geometry('#978').
	same_sense(true).
:- end_object.

:- object('#986',instantiates(edge_curve)).
	name('').
	edge_start('#975').
	edge_end('#982').
	edge_geometry('#985').
	same_sense(true).
:- end_object.

:- object('#993',instantiates(edge_curve)).
	name('').
	edge_start('#982').
	edge_end('#989').
	edge_geometry('#992').
	same_sense(true).
:- end_object.

:- object('#1000',instantiates(edge_curve)).
	name('').
	edge_start('#989').
	edge_end('#996').
	edge_geometry('#999').
	same_sense(true).
:- end_object.

:- object('#1007',instantiates(edge_curve)).
	name('').
	edge_start('#996').
	edge_end('#1003').
	edge_geometry('#1006').
	same_sense(true).
:- end_object.

:- object('#1014',instantiates(edge_curve)).
	name('').
	edge_start('#1003').
	edge_end('#1010').
	edge_geometry('#1013').
	same_sense(true).
:- end_object.

:- object('#1021',instantiates(edge_curve)).
	name('').
	edge_start('#1010').
	edge_end('#1017').
	edge_geometry('#1020').
	same_sense(true).
:- end_object.

:- object('#1028',instantiates(edge_curve)).
	name('').
	edge_start('#1017').
	edge_end('#1024').
	edge_geometry('#1027').
	same_sense(true).
:- end_object.

:- object('#1035',instantiates(edge_curve)).
	name('').
	edge_start('#1024').
	edge_end('#1031').
	edge_geometry('#1034').
	same_sense(true).
:- end_object.

:- object('#1042',instantiates(edge_curve)).
	name('').
	edge_start('#1031').
	edge_end('#1038').
	edge_geometry('#1041').
	same_sense(true).
:- end_object.

:- object('#1049',instantiates(edge_curve)).
	name('').
	edge_start('#1038').
	edge_end('#1045').
	edge_geometry('#1048').
	same_sense(true).
:- end_object.

:- object('#1056',instantiates(edge_curve)).
	name('').
	edge_start('#1045').
	edge_end('#1052').
	edge_geometry('#1055').
	same_sense(true).
:- end_object.

:- object('#1063',instantiates(edge_curve)).
	name('').
	edge_start('#1052').
	edge_end('#1059').
	edge_geometry('#1062').
	same_sense(true).
:- end_object.

:- object('#1070',instantiates(edge_curve)).
	name('').
	edge_start('#1059').
	edge_end('#1066').
	edge_geometry('#1069').
	same_sense(true).
:- end_object.

:- object('#1077',instantiates(edge_curve)).
	name('').
	edge_start('#1066').
	edge_end('#1073').
	edge_geometry('#1076').
	same_sense(true).
:- end_object.

:- object('#1084',instantiates(edge_curve)).
	name('').
	edge_start('#1073').
	edge_end('#1080').
	edge_geometry('#1083').
	same_sense(true).
:- end_object.

:- object('#1091',instantiates(edge_curve)).
	name('').
	edge_start('#1080').
	edge_end('#1087').
	edge_geometry('#1090').
	same_sense(true).
:- end_object.

:- object('#1098',instantiates(edge_curve)).
	name('').
	edge_start('#1087').
	edge_end('#1094').
	edge_geometry('#1097').
	same_sense(true).
:- end_object.

:- object('#1105',instantiates(edge_curve)).
	name('').
	edge_start('#1094').
	edge_end('#1101').
	edge_geometry('#1104').
	same_sense(true).
:- end_object.

:- object('#1112',instantiates(edge_curve)).
	name('').
	edge_start('#1101').
	edge_end('#1108').
	edge_geometry('#1111').
	same_sense(true).
:- end_object.

:- object('#1119',instantiates(edge_curve)).
	name('').
	edge_start('#1108').
	edge_end('#1115').
	edge_geometry('#1118').
	same_sense(true).
:- end_object.

:- object('#1126',instantiates(edge_curve)).
	name('').
	edge_start('#1115').
	edge_end('#1122').
	edge_geometry('#1125').
	same_sense(true).
:- end_object.

:- object('#1133',instantiates(edge_curve)).
	name('').
	edge_start('#1122').
	edge_end('#1129').
	edge_geometry('#1132').
	same_sense(true).
:- end_object.

:- object('#1140',instantiates(edge_curve)).
	name('').
	edge_start('#1129').
	edge_end('#1136').
	edge_geometry('#1139').
	same_sense(true).
:- end_object.

:- object('#1147',instantiates(edge_curve)).
	name('').
	edge_start('#1136').
	edge_end('#1143').
	edge_geometry('#1146').
	same_sense(true).
:- end_object.

:- object('#1154',instantiates(edge_curve)).
	name('').
	edge_start('#1143').
	edge_end('#1150').
	edge_geometry('#1153').
	same_sense(true).
:- end_object.

:- object('#1161',instantiates(edge_curve)).
	name('').
	edge_start('#1150').
	edge_end('#1157').
	edge_geometry('#1160').
	same_sense(true).
:- end_object.

:- object('#1168',instantiates(edge_curve)).
	name('').
	edge_start('#1157').
	edge_end('#1164').
	edge_geometry('#1167').
	same_sense(true).
:- end_object.

:- object('#1175',instantiates(edge_curve)).
	name('').
	edge_start('#1164').
	edge_end('#1171').
	edge_geometry('#1174').
	same_sense(true).
:- end_object.

:- object('#1182',instantiates(edge_curve)).
	name('').
	edge_start('#1171').
	edge_end('#1178').
	edge_geometry('#1181').
	same_sense(true).
:- end_object.

:- object('#1189',instantiates(edge_curve)).
	name('').
	edge_start('#1178').
	edge_end('#1185').
	edge_geometry('#1188').
	same_sense(true).
:- end_object.

:- object('#1196',instantiates(edge_curve)).
	name('').
	edge_start('#1185').
	edge_end('#1192').
	edge_geometry('#1195').
	same_sense(true).
:- end_object.

:- object('#1203',instantiates(edge_curve)).
	name('').
	edge_start('#1192').
	edge_end('#1199').
	edge_geometry('#1202').
	same_sense(true).
:- end_object.

:- object('#1210',instantiates(edge_curve)).
	name('').
	edge_start('#1199').
	edge_end('#1206').
	edge_geometry('#1209').
	same_sense(true).
:- end_object.

:- object('#1217',instantiates(edge_curve)).
	name('').
	edge_start('#1206').
	edge_end('#1213').
	edge_geometry('#1216').
	same_sense(true).
:- end_object.

:- object('#1224',instantiates(edge_curve)).
	name('').
	edge_start('#1213').
	edge_end('#1220').
	edge_geometry('#1223').
	same_sense(true).
:- end_object.

:- object('#1231',instantiates(edge_curve)).
	name('').
	edge_start('#1220').
	edge_end('#1227').
	edge_geometry('#1230').
	same_sense(true).
:- end_object.

:- object('#1238',instantiates(edge_curve)).
	name('').
	edge_start('#1227').
	edge_end('#1234').
	edge_geometry('#1237').
	same_sense(true).
:- end_object.

:- object('#1245',instantiates(edge_curve)).
	name('').
	edge_start('#1234').
	edge_end('#1241').
	edge_geometry('#1244').
	same_sense(true).
:- end_object.

:- object('#1252',instantiates(edge_curve)).
	name('').
	edge_start('#1241').
	edge_end('#1248').
	edge_geometry('#1251').
	same_sense(true).
:- end_object.

:- object('#1259',instantiates(edge_curve)).
	name('').
	edge_start('#1248').
	edge_end('#1255').
	edge_geometry('#1258').
	same_sense(true).
:- end_object.

:- object('#1266',instantiates(edge_curve)).
	name('').
	edge_start('#1255').
	edge_end('#1262').
	edge_geometry('#1265').
	same_sense(true).
:- end_object.

:- object('#1273',instantiates(edge_curve)).
	name('').
	edge_start('#1262').
	edge_end('#1269').
	edge_geometry('#1272').
	same_sense(true).
:- end_object.

:- object('#1280',instantiates(edge_curve)).
	name('').
	edge_start('#1269').
	edge_end('#1276').
	edge_geometry('#1279').
	same_sense(true).
:- end_object.

:- object('#1287',instantiates(edge_curve)).
	name('').
	edge_start('#1276').
	edge_end('#1283').
	edge_geometry('#1286').
	same_sense(true).
:- end_object.

:- object('#1294',instantiates(edge_curve)).
	name('').
	edge_start('#1283').
	edge_end('#1290').
	edge_geometry('#1293').
	same_sense(true).
:- end_object.

:- object('#1301',instantiates(edge_curve)).
	name('').
	edge_start('#1290').
	edge_end('#1297').
	edge_geometry('#1300').
	same_sense(true).
:- end_object.

:- object('#1308',instantiates(edge_curve)).
	name('').
	edge_start('#1297').
	edge_end('#1304').
	edge_geometry('#1307').
	same_sense(true).
:- end_object.

:- object('#1315',instantiates(edge_curve)).
	name('').
	edge_start('#1304').
	edge_end('#1311').
	edge_geometry('#1314').
	same_sense(true).
:- end_object.

:- object('#1322',instantiates(edge_curve)).
	name('').
	edge_start('#1311').
	edge_end('#1318').
	edge_geometry('#1321').
	same_sense(true).
:- end_object.

:- object('#1329',instantiates(edge_curve)).
	name('').
	edge_start('#1318').
	edge_end('#1325').
	edge_geometry('#1328').
	same_sense(true).
:- end_object.

:- object('#1336',instantiates(edge_curve)).
	name('').
	edge_start('#1325').
	edge_end('#1332').
	edge_geometry('#1335').
	same_sense(true).
:- end_object.

:- object('#1343',instantiates(edge_curve)).
	name('').
	edge_start('#1332').
	edge_end('#1339').
	edge_geometry('#1342').
	same_sense(true).
:- end_object.

:- object('#1350',instantiates(edge_curve)).
	name('').
	edge_start('#1339').
	edge_end('#1346').
	edge_geometry('#1349').
	same_sense(true).
:- end_object.

:- object('#1357',instantiates(edge_curve)).
	name('').
	edge_start('#1346').
	edge_end('#1353').
	edge_geometry('#1356').
	same_sense(true).
:- end_object.

:- object('#1364',instantiates(edge_curve)).
	name('').
	edge_start('#1353').
	edge_end('#1360').
	edge_geometry('#1363').
	same_sense(true).
:- end_object.

:- object('#1371',instantiates(edge_curve)).
	name('').
	edge_start('#1360').
	edge_end('#1367').
	edge_geometry('#1370').
	same_sense(true).
:- end_object.

:- object('#1378',instantiates(edge_curve)).
	name('').
	edge_start('#1367').
	edge_end('#1374').
	edge_geometry('#1377').
	same_sense(true).
:- end_object.

:- object('#1385',instantiates(edge_curve)).
	name('').
	edge_start('#1374').
	edge_end('#1381').
	edge_geometry('#1384').
	same_sense(true).
:- end_object.

:- object('#1390',instantiates(edge_curve)).
	name('').
	edge_start('#1381').
	edge_end('#583').
	edge_geometry('#1389').
	same_sense(true).
:- end_object.

:- object('#1410',instantiates(edge_curve)).
	name('').
	edge_start('#1404').
	edge_end('#1406').
	edge_geometry('#1409').
	same_sense(true).
:- end_object.

:- object('#1415',instantiates(edge_curve)).
	name('').
	edge_start('#1404').
	edge_end('#1381').
	edge_geometry('#1414').
	same_sense(true).
:- end_object.

:- object('#1421',instantiates(edge_curve)).
	name('').
	edge_start('#1406').
	edge_end('#1374').
	edge_geometry('#1420').
	same_sense(true).
:- end_object.

:- object('#1436',instantiates(edge_curve)).
	name('').
	edge_start('#1406').
	edge_end('#1432').
	edge_geometry('#1435').
	same_sense(true).
:- end_object.

:- object('#1443',instantiates(edge_curve)).
	name('').
	edge_start('#1432').
	edge_end('#1367').
	edge_geometry('#1442').
	same_sense(true).
:- end_object.

:- object('#1458',instantiates(edge_curve)).
	name('').
	edge_start('#1432').
	edge_end('#1454').
	edge_geometry('#1457').
	same_sense(true).
:- end_object.

:- object('#1465',instantiates(edge_curve)).
	name('').
	edge_start('#1454').
	edge_end('#1360').
	edge_geometry('#1464').
	same_sense(true).
:- end_object.

:- object('#1480',instantiates(edge_curve)).
	name('').
	edge_start('#1454').
	edge_end('#1476').
	edge_geometry('#1479').
	same_sense(true).
:- end_object.

:- object('#1487',instantiates(edge_curve)).
	name('').
	edge_start('#1476').
	edge_end('#1353').
	edge_geometry('#1486').
	same_sense(true).
:- end_object.

:- object('#1502',instantiates(edge_curve)).
	name('').
	edge_start('#1476').
	edge_end('#1498').
	edge_geometry('#1501').
	same_sense(true).
:- end_object.

:- object('#1509',instantiates(edge_curve)).
	name('').
	edge_start('#1498').
	edge_end('#1346').
	edge_geometry('#1508').
	same_sense(true).
:- end_object.

:- object('#1524',instantiates(edge_curve)).
	name('').
	edge_start('#1498').
	edge_end('#1520').
	edge_geometry('#1523').
	same_sense(true).
:- end_object.

:- object('#1531',instantiates(edge_curve)).
	name('').
	edge_start('#1520').
	edge_end('#1339').
	edge_geometry('#1530').
	same_sense(true).
:- end_object.

:- object('#1546',instantiates(edge_curve)).
	name('').
	edge_start('#1520').
	edge_end('#1542').
	edge_geometry('#1545').
	same_sense(true).
:- end_object.

:- object('#1553',instantiates(edge_curve)).
	name('').
	edge_start('#1542').
	edge_end('#1332').
	edge_geometry('#1552').
	same_sense(true).
:- end_object.

:- object('#1568',instantiates(edge_curve)).
	name('').
	edge_start('#1542').
	edge_end('#1564').
	edge_geometry('#1567').
	same_sense(true).
:- end_object.

:- object('#1575',instantiates(edge_curve)).
	name('').
	edge_start('#1564').
	edge_end('#1325').
	edge_geometry('#1574').
	same_sense(true).
:- end_object.

:- object('#1590',instantiates(edge_curve)).
	name('').
	edge_start('#1564').
	edge_end('#1586').
	edge_geometry('#1589').
	same_sense(true).
:- end_object.

:- object('#1597',instantiates(edge_curve)).
	name('').
	edge_start('#1586').
	edge_end('#1318').
	edge_geometry('#1596').
	same_sense(true).
:- end_object.

:- object('#1612',instantiates(edge_curve)).
	name('').
	edge_start('#1586').
	edge_end('#1608').
	edge_geometry('#1611').
	same_sense(true).
:- end_object.

:- object('#1619',instantiates(edge_curve)).
	name('').
	edge_start('#1608').
	edge_end('#1311').
	edge_geometry('#1618').
	same_sense(true).
:- end_object.

:- object('#1634',instantiates(edge_curve)).
	name('').
	edge_start('#1608').
	edge_end('#1630').
	edge_geometry('#1633').
	same_sense(true).
:- end_object.

:- object('#1641',instantiates(edge_curve)).
	name('').
	edge_start('#1630').
	edge_end('#1304').
	edge_geometry('#1640').
	same_sense(true).
:- end_object.

:- object('#1656',instantiates(edge_curve)).
	name('').
	edge_start('#1630').
	edge_end('#1652').
	edge_geometry('#1655').
	same_sense(true).
:- end_object.

:- object('#1663',instantiates(edge_curve)).
	name('').
	edge_start('#1652').
	edge_end('#1297').
	edge_geometry('#1662').
	same_sense(true).
:- end_object.

:- object('#1678',instantiates(edge_curve)).
	name('').
	edge_start('#1652').
	edge_end('#1674').
	edge_geometry('#1677').
	same_sense(true).
:- end_object.

:- object('#1685',instantiates(edge_curve)).
	name('').
	edge_start('#1674').
	edge_end('#1290').
	edge_geometry('#1684').
	same_sense(true).
:- end_object.

:- object('#1700',instantiates(edge_curve)).
	name('').
	edge_start('#1674').
	edge_end('#1696').
	edge_geometry('#1699').
	same_sense(true).
:- end_object.

:- object('#1707',instantiates(edge_curve)).
	name('').
	edge_start('#1696').
	edge_end('#1283').
	edge_geometry('#1706').
	same_sense(true).
:- end_object.

:- object('#1722',instantiates(edge_curve)).
	name('').
	edge_start('#1696').
	edge_end('#1718').
	edge_geometry('#1721').
	same_sense(true).
:- end_object.

:- object('#1729',instantiates(edge_curve)).
	name('').
	edge_start('#1718').
	edge_end('#1276').
	edge_geometry('#1728').
	same_sense(true).
:- end_object.

:- object('#1744',instantiates(edge_curve)).
	name('').
	edge_start('#1718').
	edge_end('#1740').
	edge_geometry('#1743').
	same_sense(true).
:- end_object.

:- object('#1751',instantiates(edge_curve)).
	name('').
	edge_start('#1740').
	edge_end('#1269').
	edge_geometry('#1750').
	same_sense(true).
:- end_object.

:- object('#1766',instantiates(edge_curve)).
	name('').
	edge_start('#1740').
	edge_end('#1762').
	edge_geometry('#1765').
	same_sense(true).
:- end_object.

:- object('#1773',instantiates(edge_curve)).
	name('').
	edge_start('#1762').
	edge_end('#1262').
	edge_geometry('#1772').
	same_sense(true).
:- end_object.

:- object('#1788',instantiates(edge_curve)).
	name('').
	edge_start('#1762').
	edge_end('#1784').
	edge_geometry('#1787').
	same_sense(true).
:- end_object.

:- object('#1795',instantiates(edge_curve)).
	name('').
	edge_start('#1784').
	edge_end('#1255').
	edge_geometry('#1794').
	same_sense(true).
:- end_object.

:- object('#1810',instantiates(edge_curve)).
	name('').
	edge_start('#1784').
	edge_end('#1806').
	edge_geometry('#1809').
	same_sense(true).
:- end_object.

:- object('#1817',instantiates(edge_curve)).
	name('').
	edge_start('#1806').
	edge_end('#1248').
	edge_geometry('#1816').
	same_sense(true).
:- end_object.

:- object('#1832',instantiates(edge_curve)).
	name('').
	edge_start('#1806').
	edge_end('#1828').
	edge_geometry('#1831').
	same_sense(true).
:- end_object.

:- object('#1839',instantiates(edge_curve)).
	name('').
	edge_start('#1828').
	edge_end('#1241').
	edge_geometry('#1838').
	same_sense(true).
:- end_object.

:- object('#1854',instantiates(edge_curve)).
	name('').
	edge_start('#1828').
	edge_end('#1850').
	edge_geometry('#1853').
	same_sense(true).
:- end_object.

:- object('#1861',instantiates(edge_curve)).
	name('').
	edge_start('#1850').
	edge_end('#1234').
	edge_geometry('#1860').
	same_sense(true).
:- end_object.

:- object('#1876',instantiates(edge_curve)).
	name('').
	edge_start('#1850').
	edge_end('#1872').
	edge_geometry('#1875').
	same_sense(true).
:- end_object.

:- object('#1883',instantiates(edge_curve)).
	name('').
	edge_start('#1872').
	edge_end('#1227').
	edge_geometry('#1882').
	same_sense(true).
:- end_object.

:- object('#1898',instantiates(edge_curve)).
	name('').
	edge_start('#1872').
	edge_end('#1894').
	edge_geometry('#1897').
	same_sense(true).
:- end_object.

:- object('#1905',instantiates(edge_curve)).
	name('').
	edge_start('#1894').
	edge_end('#1220').
	edge_geometry('#1904').
	same_sense(true).
:- end_object.

:- object('#1920',instantiates(edge_curve)).
	name('').
	edge_start('#1894').
	edge_end('#1916').
	edge_geometry('#1919').
	same_sense(true).
:- end_object.

:- object('#1927',instantiates(edge_curve)).
	name('').
	edge_start('#1916').
	edge_end('#1213').
	edge_geometry('#1926').
	same_sense(true).
:- end_object.

:- object('#1942',instantiates(edge_curve)).
	name('').
	edge_start('#1916').
	edge_end('#1938').
	edge_geometry('#1941').
	same_sense(true).
:- end_object.

:- object('#1949',instantiates(edge_curve)).
	name('').
	edge_start('#1938').
	edge_end('#1206').
	edge_geometry('#1948').
	same_sense(true).
:- end_object.

:- object('#1964',instantiates(edge_curve)).
	name('').
	edge_start('#1938').
	edge_end('#1960').
	edge_geometry('#1963').
	same_sense(true).
:- end_object.

:- object('#1971',instantiates(edge_curve)).
	name('').
	edge_start('#1960').
	edge_end('#1199').
	edge_geometry('#1970').
	same_sense(true).
:- end_object.

:- object('#1986',instantiates(edge_curve)).
	name('').
	edge_start('#1960').
	edge_end('#1982').
	edge_geometry('#1985').
	same_sense(true).
:- end_object.

:- object('#1993',instantiates(edge_curve)).
	name('').
	edge_start('#1982').
	edge_end('#1192').
	edge_geometry('#1992').
	same_sense(true).
:- end_object.

:- object('#2008',instantiates(edge_curve)).
	name('').
	edge_start('#1982').
	edge_end('#2004').
	edge_geometry('#2007').
	same_sense(true).
:- end_object.

:- object('#2015',instantiates(edge_curve)).
	name('').
	edge_start('#2004').
	edge_end('#1185').
	edge_geometry('#2014').
	same_sense(true).
:- end_object.

:- object('#2030',instantiates(edge_curve)).
	name('').
	edge_start('#2004').
	edge_end('#2026').
	edge_geometry('#2029').
	same_sense(true).
:- end_object.

:- object('#2037',instantiates(edge_curve)).
	name('').
	edge_start('#2026').
	edge_end('#1178').
	edge_geometry('#2036').
	same_sense(true).
:- end_object.

:- object('#2052',instantiates(edge_curve)).
	name('').
	edge_start('#2026').
	edge_end('#2048').
	edge_geometry('#2051').
	same_sense(true).
:- end_object.

:- object('#2059',instantiates(edge_curve)).
	name('').
	edge_start('#2048').
	edge_end('#1171').
	edge_geometry('#2058').
	same_sense(true).
:- end_object.

:- object('#2074',instantiates(edge_curve)).
	name('').
	edge_start('#2048').
	edge_end('#2070').
	edge_geometry('#2073').
	same_sense(true).
:- end_object.

:- object('#2081',instantiates(edge_curve)).
	name('').
	edge_start('#2070').
	edge_end('#1164').
	edge_geometry('#2080').
	same_sense(true).
:- end_object.

:- object('#2096',instantiates(edge_curve)).
	name('').
	edge_start('#2070').
	edge_end('#2092').
	edge_geometry('#2095').
	same_sense(true).
:- end_object.

:- object('#2103',instantiates(edge_curve)).
	name('').
	edge_start('#2092').
	edge_end('#1157').
	edge_geometry('#2102').
	same_sense(true).
:- end_object.

:- object('#2118',instantiates(edge_curve)).
	name('').
	edge_start('#2092').
	edge_end('#2114').
	edge_geometry('#2117').
	same_sense(true).
:- end_object.

:- object('#2125',instantiates(edge_curve)).
	name('').
	edge_start('#2114').
	edge_end('#1150').
	edge_geometry('#2124').
	same_sense(true).
:- end_object.

:- object('#2140',instantiates(edge_curve)).
	name('').
	edge_start('#2114').
	edge_end('#2136').
	edge_geometry('#2139').
	same_sense(true).
:- end_object.

:- object('#2147',instantiates(edge_curve)).
	name('').
	edge_start('#2136').
	edge_end('#1143').
	edge_geometry('#2146').
	same_sense(true).
:- end_object.

:- object('#2162',instantiates(edge_curve)).
	name('').
	edge_start('#2136').
	edge_end('#2158').
	edge_geometry('#2161').
	same_sense(true).
:- end_object.

:- object('#2169',instantiates(edge_curve)).
	name('').
	edge_start('#2158').
	edge_end('#1136').
	edge_geometry('#2168').
	same_sense(true).
:- end_object.

:- object('#2184',instantiates(edge_curve)).
	name('').
	edge_start('#2158').
	edge_end('#2180').
	edge_geometry('#2183').
	same_sense(true).
:- end_object.

:- object('#2191',instantiates(edge_curve)).
	name('').
	edge_start('#2180').
	edge_end('#1129').
	edge_geometry('#2190').
	same_sense(true).
:- end_object.

:- object('#2206',instantiates(edge_curve)).
	name('').
	edge_start('#2180').
	edge_end('#2202').
	edge_geometry('#2205').
	same_sense(true).
:- end_object.

:- object('#2213',instantiates(edge_curve)).
	name('').
	edge_start('#2202').
	edge_end('#1122').
	edge_geometry('#2212').
	same_sense(true).
:- end_object.

:- object('#2228',instantiates(edge_curve)).
	name('').
	edge_start('#2202').
	edge_end('#2224').
	edge_geometry('#2227').
	same_sense(true).
:- end_object.

:- object('#2235',instantiates(edge_curve)).
	name('').
	edge_start('#2224').
	edge_end('#1115').
	edge_geometry('#2234').
	same_sense(true).
:- end_object.

:- object('#2250',instantiates(edge_curve)).
	name('').
	edge_start('#2224').
	edge_end('#2246').
	edge_geometry('#2249').
	same_sense(true).
:- end_object.

:- object('#2257',instantiates(edge_curve)).
	name('').
	edge_start('#2246').
	edge_end('#1108').
	edge_geometry('#2256').
	same_sense(true).
:- end_object.

:- object('#2272',instantiates(edge_curve)).
	name('').
	edge_start('#2246').
	edge_end('#2268').
	edge_geometry('#2271').
	same_sense(true).
:- end_object.

:- object('#2279',instantiates(edge_curve)).
	name('').
	edge_start('#2268').
	edge_end('#1101').
	edge_geometry('#2278').
	same_sense(true).
:- end_object.

:- object('#2294',instantiates(edge_curve)).
	name('').
	edge_start('#2268').
	edge_end('#2290').
	edge_geometry('#2293').
	same_sense(true).
:- end_object.

:- object('#2301',instantiates(edge_curve)).
	name('').
	edge_start('#2290').
	edge_end('#1094').
	edge_geometry('#2300').
	same_sense(true).
:- end_object.

:- object('#2316',instantiates(edge_curve)).
	name('').
	edge_start('#2290').
	edge_end('#2312').
	edge_geometry('#2315').
	same_sense(true).
:- end_object.

:- object('#2323',instantiates(edge_curve)).
	name('').
	edge_start('#2312').
	edge_end('#1087').
	edge_geometry('#2322').
	same_sense(true).
:- end_object.

:- object('#2338',instantiates(edge_curve)).
	name('').
	edge_start('#2312').
	edge_end('#2334').
	edge_geometry('#2337').
	same_sense(true).
:- end_object.

:- object('#2345',instantiates(edge_curve)).
	name('').
	edge_start('#2334').
	edge_end('#1080').
	edge_geometry('#2344').
	same_sense(true).
:- end_object.

:- object('#2360',instantiates(edge_curve)).
	name('').
	edge_start('#2334').
	edge_end('#2356').
	edge_geometry('#2359').
	same_sense(true).
:- end_object.

:- object('#2367',instantiates(edge_curve)).
	name('').
	edge_start('#2356').
	edge_end('#1073').
	edge_geometry('#2366').
	same_sense(true).
:- end_object.

:- object('#2382',instantiates(edge_curve)).
	name('').
	edge_start('#2356').
	edge_end('#2378').
	edge_geometry('#2381').
	same_sense(true).
:- end_object.

:- object('#2389',instantiates(edge_curve)).
	name('').
	edge_start('#2378').
	edge_end('#1066').
	edge_geometry('#2388').
	same_sense(true).
:- end_object.

:- object('#2404',instantiates(edge_curve)).
	name('').
	edge_start('#2378').
	edge_end('#2400').
	edge_geometry('#2403').
	same_sense(true).
:- end_object.

:- object('#2411',instantiates(edge_curve)).
	name('').
	edge_start('#2400').
	edge_end('#1059').
	edge_geometry('#2410').
	same_sense(true).
:- end_object.

:- object('#2426',instantiates(edge_curve)).
	name('').
	edge_start('#2400').
	edge_end('#2422').
	edge_geometry('#2425').
	same_sense(true).
:- end_object.

:- object('#2433',instantiates(edge_curve)).
	name('').
	edge_start('#2422').
	edge_end('#1052').
	edge_geometry('#2432').
	same_sense(true).
:- end_object.

:- object('#2448',instantiates(edge_curve)).
	name('').
	edge_start('#2422').
	edge_end('#2444').
	edge_geometry('#2447').
	same_sense(true).
:- end_object.

:- object('#2455',instantiates(edge_curve)).
	name('').
	edge_start('#2444').
	edge_end('#1045').
	edge_geometry('#2454').
	same_sense(true).
:- end_object.

:- object('#2470',instantiates(edge_curve)).
	name('').
	edge_start('#2444').
	edge_end('#2466').
	edge_geometry('#2469').
	same_sense(true).
:- end_object.

:- object('#2477',instantiates(edge_curve)).
	name('').
	edge_start('#2466').
	edge_end('#1038').
	edge_geometry('#2476').
	same_sense(true).
:- end_object.

:- object('#2492',instantiates(edge_curve)).
	name('').
	edge_start('#2466').
	edge_end('#2488').
	edge_geometry('#2491').
	same_sense(true).
:- end_object.

:- object('#2499',instantiates(edge_curve)).
	name('').
	edge_start('#2488').
	edge_end('#1031').
	edge_geometry('#2498').
	same_sense(true).
:- end_object.

:- object('#2514',instantiates(edge_curve)).
	name('').
	edge_start('#2488').
	edge_end('#2510').
	edge_geometry('#2513').
	same_sense(true).
:- end_object.

:- object('#2521',instantiates(edge_curve)).
	name('').
	edge_start('#2510').
	edge_end('#1024').
	edge_geometry('#2520').
	same_sense(true).
:- end_object.

:- object('#2536',instantiates(edge_curve)).
	name('').
	edge_start('#2510').
	edge_end('#2532').
	edge_geometry('#2535').
	same_sense(true).
:- end_object.

:- object('#2543',instantiates(edge_curve)).
	name('').
	edge_start('#2532').
	edge_end('#1017').
	edge_geometry('#2542').
	same_sense(true).
:- end_object.

:- object('#2558',instantiates(edge_curve)).
	name('').
	edge_start('#2532').
	edge_end('#2554').
	edge_geometry('#2557').
	same_sense(true).
:- end_object.

:- object('#2565',instantiates(edge_curve)).
	name('').
	edge_start('#2554').
	edge_end('#1010').
	edge_geometry('#2564').
	same_sense(true).
:- end_object.

:- object('#2580',instantiates(edge_curve)).
	name('').
	edge_start('#2554').
	edge_end('#2576').
	edge_geometry('#2579').
	same_sense(true).
:- end_object.

:- object('#2587',instantiates(edge_curve)).
	name('').
	edge_start('#2576').
	edge_end('#1003').
	edge_geometry('#2586').
	same_sense(true).
:- end_object.

:- object('#2602',instantiates(edge_curve)).
	name('').
	edge_start('#2576').
	edge_end('#2598').
	edge_geometry('#2601').
	same_sense(true).
:- end_object.

:- object('#2609',instantiates(edge_curve)).
	name('').
	edge_start('#2598').
	edge_end('#996').
	edge_geometry('#2608').
	same_sense(true).
:- end_object.

:- object('#2624',instantiates(edge_curve)).
	name('').
	edge_start('#2598').
	edge_end('#2620').
	edge_geometry('#2623').
	same_sense(true).
:- end_object.

:- object('#2631',instantiates(edge_curve)).
	name('').
	edge_start('#2620').
	edge_end('#989').
	edge_geometry('#2630').
	same_sense(true).
:- end_object.

:- object('#2646',instantiates(edge_curve)).
	name('').
	edge_start('#2620').
	edge_end('#2642').
	edge_geometry('#2645').
	same_sense(true).
:- end_object.

:- object('#2653',instantiates(edge_curve)).
	name('').
	edge_start('#2642').
	edge_end('#982').
	edge_geometry('#2652').
	same_sense(true).
:- end_object.

:- object('#2668',instantiates(edge_curve)).
	name('').
	edge_start('#2642').
	edge_end('#2664').
	edge_geometry('#2667').
	same_sense(true).
:- end_object.

:- object('#2675',instantiates(edge_curve)).
	name('').
	edge_start('#2664').
	edge_end('#975').
	edge_geometry('#2674').
	same_sense(true).
:- end_object.

:- object('#2690',instantiates(edge_curve)).
	name('').
	edge_start('#2664').
	edge_end('#2686').
	edge_geometry('#2689').
	same_sense(true).
:- end_object.

:- object('#2697',instantiates(edge_curve)).
	name('').
	edge_start('#2686').
	edge_end('#968').
	edge_geometry('#2696').
	same_sense(true).
:- end_object.

:- object('#2712',instantiates(edge_curve)).
	name('').
	edge_start('#2686').
	edge_end('#2708').
	edge_geometry('#2711').
	same_sense(true).
:- end_object.

:- object('#2719',instantiates(edge_curve)).
	name('').
	edge_start('#2708').
	edge_end('#961').
	edge_geometry('#2718').
	same_sense(true).
:- end_object.

:- object('#2734',instantiates(edge_curve)).
	name('').
	edge_start('#2708').
	edge_end('#2730').
	edge_geometry('#2733').
	same_sense(true).
:- end_object.

:- object('#2741',instantiates(edge_curve)).
	name('').
	edge_start('#2730').
	edge_end('#954').
	edge_geometry('#2740').
	same_sense(true).
:- end_object.

:- object('#2756',instantiates(edge_curve)).
	name('').
	edge_start('#2730').
	edge_end('#2752').
	edge_geometry('#2755').
	same_sense(true).
:- end_object.

:- object('#2763',instantiates(edge_curve)).
	name('').
	edge_start('#2752').
	edge_end('#947').
	edge_geometry('#2762').
	same_sense(true).
:- end_object.

:- object('#2778',instantiates(edge_curve)).
	name('').
	edge_start('#2752').
	edge_end('#2774').
	edge_geometry('#2777').
	same_sense(true).
:- end_object.

:- object('#2785',instantiates(edge_curve)).
	name('').
	edge_start('#2774').
	edge_end('#940').
	edge_geometry('#2784').
	same_sense(true).
:- end_object.

:- object('#2800',instantiates(edge_curve)).
	name('').
	edge_start('#2774').
	edge_end('#2796').
	edge_geometry('#2799').
	same_sense(true).
:- end_object.

:- object('#2807',instantiates(edge_curve)).
	name('').
	edge_start('#2796').
	edge_end('#933').
	edge_geometry('#2806').
	same_sense(true).
:- end_object.

:- object('#2822',instantiates(edge_curve)).
	name('').
	edge_start('#2796').
	edge_end('#2818').
	edge_geometry('#2821').
	same_sense(true).
:- end_object.

:- object('#2829',instantiates(edge_curve)).
	name('').
	edge_start('#2818').
	edge_end('#926').
	edge_geometry('#2828').
	same_sense(true).
:- end_object.

:- object('#2844',instantiates(edge_curve)).
	name('').
	edge_start('#2818').
	edge_end('#2840').
	edge_geometry('#2843').
	same_sense(true).
:- end_object.

:- object('#2851',instantiates(edge_curve)).
	name('').
	edge_start('#2840').
	edge_end('#919').
	edge_geometry('#2850').
	same_sense(true).
:- end_object.

:- object('#2866',instantiates(edge_curve)).
	name('').
	edge_start('#2840').
	edge_end('#2862').
	edge_geometry('#2865').
	same_sense(true).
:- end_object.

:- object('#2873',instantiates(edge_curve)).
	name('').
	edge_start('#2862').
	edge_end('#912').
	edge_geometry('#2872').
	same_sense(true).
:- end_object.

:- object('#2888',instantiates(edge_curve)).
	name('').
	edge_start('#2862').
	edge_end('#2884').
	edge_geometry('#2887').
	same_sense(true).
:- end_object.

:- object('#2895',instantiates(edge_curve)).
	name('').
	edge_start('#2884').
	edge_end('#905').
	edge_geometry('#2894').
	same_sense(true).
:- end_object.

:- object('#2910',instantiates(edge_curve)).
	name('').
	edge_start('#2884').
	edge_end('#2906').
	edge_geometry('#2909').
	same_sense(true).
:- end_object.

:- object('#2917',instantiates(edge_curve)).
	name('').
	edge_start('#2906').
	edge_end('#898').
	edge_geometry('#2916').
	same_sense(true).
:- end_object.

:- object('#2932',instantiates(edge_curve)).
	name('').
	edge_start('#2906').
	edge_end('#2928').
	edge_geometry('#2931').
	same_sense(true).
:- end_object.

:- object('#2939',instantiates(edge_curve)).
	name('').
	edge_start('#2928').
	edge_end('#891').
	edge_geometry('#2938').
	same_sense(true).
:- end_object.

:- object('#2954',instantiates(edge_curve)).
	name('').
	edge_start('#2928').
	edge_end('#2950').
	edge_geometry('#2953').
	same_sense(true).
:- end_object.

:- object('#2961',instantiates(edge_curve)).
	name('').
	edge_start('#2950').
	edge_end('#884').
	edge_geometry('#2960').
	same_sense(true).
:- end_object.

:- object('#2976',instantiates(edge_curve)).
	name('').
	edge_start('#2950').
	edge_end('#2972').
	edge_geometry('#2975').
	same_sense(true).
:- end_object.

:- object('#2983',instantiates(edge_curve)).
	name('').
	edge_start('#2972').
	edge_end('#877').
	edge_geometry('#2982').
	same_sense(true).
:- end_object.

:- object('#2998',instantiates(edge_curve)).
	name('').
	edge_start('#2972').
	edge_end('#2994').
	edge_geometry('#2997').
	same_sense(true).
:- end_object.

:- object('#3005',instantiates(edge_curve)).
	name('').
	edge_start('#2994').
	edge_end('#870').
	edge_geometry('#3004').
	same_sense(true).
:- end_object.

:- object('#3020',instantiates(edge_curve)).
	name('').
	edge_start('#2994').
	edge_end('#3016').
	edge_geometry('#3019').
	same_sense(true).
:- end_object.

:- object('#3027',instantiates(edge_curve)).
	name('').
	edge_start('#3016').
	edge_end('#863').
	edge_geometry('#3026').
	same_sense(true).
:- end_object.

:- object('#3042',instantiates(edge_curve)).
	name('').
	edge_start('#3016').
	edge_end('#3038').
	edge_geometry('#3041').
	same_sense(true).
:- end_object.

:- object('#3049',instantiates(edge_curve)).
	name('').
	edge_start('#3038').
	edge_end('#856').
	edge_geometry('#3048').
	same_sense(true).
:- end_object.

:- object('#3064',instantiates(edge_curve)).
	name('').
	edge_start('#3038').
	edge_end('#3060').
	edge_geometry('#3063').
	same_sense(true).
:- end_object.

:- object('#3071',instantiates(edge_curve)).
	name('').
	edge_start('#3060').
	edge_end('#849').
	edge_geometry('#3070').
	same_sense(true).
:- end_object.

:- object('#3086',instantiates(edge_curve)).
	name('').
	edge_start('#3060').
	edge_end('#3082').
	edge_geometry('#3085').
	same_sense(true).
:- end_object.

:- object('#3093',instantiates(edge_curve)).
	name('').
	edge_start('#3082').
	edge_end('#842').
	edge_geometry('#3092').
	same_sense(true).
:- end_object.

:- object('#3108',instantiates(edge_curve)).
	name('').
	edge_start('#3082').
	edge_end('#3104').
	edge_geometry('#3107').
	same_sense(true).
:- end_object.

:- object('#3115',instantiates(edge_curve)).
	name('').
	edge_start('#3104').
	edge_end('#835').
	edge_geometry('#3114').
	same_sense(true).
:- end_object.

:- object('#3130',instantiates(edge_curve)).
	name('').
	edge_start('#3104').
	edge_end('#3126').
	edge_geometry('#3129').
	same_sense(true).
:- end_object.

:- object('#3137',instantiates(edge_curve)).
	name('').
	edge_start('#3126').
	edge_end('#828').
	edge_geometry('#3136').
	same_sense(true).
:- end_object.

:- object('#3152',instantiates(edge_curve)).
	name('').
	edge_start('#3126').
	edge_end('#3148').
	edge_geometry('#3151').
	same_sense(true).
:- end_object.

:- object('#3159',instantiates(edge_curve)).
	name('').
	edge_start('#3148').
	edge_end('#821').
	edge_geometry('#3158').
	same_sense(true).
:- end_object.

:- object('#3174',instantiates(edge_curve)).
	name('').
	edge_start('#3148').
	edge_end('#3170').
	edge_geometry('#3173').
	same_sense(true).
:- end_object.

:- object('#3181',instantiates(edge_curve)).
	name('').
	edge_start('#3170').
	edge_end('#814').
	edge_geometry('#3180').
	same_sense(true).
:- end_object.

:- object('#3196',instantiates(edge_curve)).
	name('').
	edge_start('#3170').
	edge_end('#3192').
	edge_geometry('#3195').
	same_sense(true).
:- end_object.

:- object('#3203',instantiates(edge_curve)).
	name('').
	edge_start('#3192').
	edge_end('#807').
	edge_geometry('#3202').
	same_sense(true).
:- end_object.

:- object('#3218',instantiates(edge_curve)).
	name('').
	edge_start('#3192').
	edge_end('#3214').
	edge_geometry('#3217').
	same_sense(true).
:- end_object.

:- object('#3225',instantiates(edge_curve)).
	name('').
	edge_start('#3214').
	edge_end('#800').
	edge_geometry('#3224').
	same_sense(true).
:- end_object.

:- object('#3240',instantiates(edge_curve)).
	name('').
	edge_start('#3214').
	edge_end('#3236').
	edge_geometry('#3239').
	same_sense(true).
:- end_object.

:- object('#3247',instantiates(edge_curve)).
	name('').
	edge_start('#3236').
	edge_end('#793').
	edge_geometry('#3246').
	same_sense(true).
:- end_object.

:- object('#3262',instantiates(edge_curve)).
	name('').
	edge_start('#3236').
	edge_end('#3258').
	edge_geometry('#3261').
	same_sense(true).
:- end_object.

:- object('#3269',instantiates(edge_curve)).
	name('').
	edge_start('#3258').
	edge_end('#786').
	edge_geometry('#3268').
	same_sense(true).
:- end_object.

:- object('#3284',instantiates(edge_curve)).
	name('').
	edge_start('#3258').
	edge_end('#3280').
	edge_geometry('#3283').
	same_sense(true).
:- end_object.

:- object('#3291',instantiates(edge_curve)).
	name('').
	edge_start('#3280').
	edge_end('#779').
	edge_geometry('#3290').
	same_sense(true).
:- end_object.

:- object('#3306',instantiates(edge_curve)).
	name('').
	edge_start('#3280').
	edge_end('#3302').
	edge_geometry('#3305').
	same_sense(true).
:- end_object.

:- object('#3313',instantiates(edge_curve)).
	name('').
	edge_start('#3302').
	edge_end('#772').
	edge_geometry('#3312').
	same_sense(true).
:- end_object.

:- object('#3328',instantiates(edge_curve)).
	name('').
	edge_start('#3302').
	edge_end('#3324').
	edge_geometry('#3327').
	same_sense(true).
:- end_object.

:- object('#3335',instantiates(edge_curve)).
	name('').
	edge_start('#3324').
	edge_end('#765').
	edge_geometry('#3334').
	same_sense(true).
:- end_object.

:- object('#3350',instantiates(edge_curve)).
	name('').
	edge_start('#3324').
	edge_end('#3346').
	edge_geometry('#3349').
	same_sense(true).
:- end_object.

:- object('#3357',instantiates(edge_curve)).
	name('').
	edge_start('#3346').
	edge_end('#758').
	edge_geometry('#3356').
	same_sense(true).
:- end_object.

:- object('#3372',instantiates(edge_curve)).
	name('').
	edge_start('#3346').
	edge_end('#3368').
	edge_geometry('#3371').
	same_sense(true).
:- end_object.

:- object('#3379',instantiates(edge_curve)).
	name('').
	edge_start('#3368').
	edge_end('#751').
	edge_geometry('#3378').
	same_sense(true).
:- end_object.

:- object('#3394',instantiates(edge_curve)).
	name('').
	edge_start('#3368').
	edge_end('#3390').
	edge_geometry('#3393').
	same_sense(true).
:- end_object.

:- object('#3401',instantiates(edge_curve)).
	name('').
	edge_start('#3390').
	edge_end('#744').
	edge_geometry('#3400').
	same_sense(true).
:- end_object.

:- object('#3416',instantiates(edge_curve)).
	name('').
	edge_start('#3390').
	edge_end('#3412').
	edge_geometry('#3415').
	same_sense(true).
:- end_object.

:- object('#3423',instantiates(edge_curve)).
	name('').
	edge_start('#3412').
	edge_end('#737').
	edge_geometry('#3422').
	same_sense(true).
:- end_object.

:- object('#3438',instantiates(edge_curve)).
	name('').
	edge_start('#3412').
	edge_end('#3434').
	edge_geometry('#3437').
	same_sense(true).
:- end_object.

:- object('#3445',instantiates(edge_curve)).
	name('').
	edge_start('#3434').
	edge_end('#730').
	edge_geometry('#3444').
	same_sense(true).
:- end_object.

:- object('#3460',instantiates(edge_curve)).
	name('').
	edge_start('#3434').
	edge_end('#3456').
	edge_geometry('#3459').
	same_sense(true).
:- end_object.

:- object('#3467',instantiates(edge_curve)).
	name('').
	edge_start('#3456').
	edge_end('#723').
	edge_geometry('#3466').
	same_sense(true).
:- end_object.

:- object('#3482',instantiates(edge_curve)).
	name('').
	edge_start('#3456').
	edge_end('#3478').
	edge_geometry('#3481').
	same_sense(true).
:- end_object.

:- object('#3489',instantiates(edge_curve)).
	name('').
	edge_start('#3478').
	edge_end('#716').
	edge_geometry('#3488').
	same_sense(true).
:- end_object.

:- object('#3504',instantiates(edge_curve)).
	name('').
	edge_start('#3478').
	edge_end('#3500').
	edge_geometry('#3503').
	same_sense(true).
:- end_object.

:- object('#3511',instantiates(edge_curve)).
	name('').
	edge_start('#3500').
	edge_end('#709').
	edge_geometry('#3510').
	same_sense(true).
:- end_object.

:- object('#3526',instantiates(edge_curve)).
	name('').
	edge_start('#3500').
	edge_end('#3522').
	edge_geometry('#3525').
	same_sense(true).
:- end_object.

:- object('#3533',instantiates(edge_curve)).
	name('').
	edge_start('#3522').
	edge_end('#702').
	edge_geometry('#3532').
	same_sense(true).
:- end_object.

:- object('#3548',instantiates(edge_curve)).
	name('').
	edge_start('#3522').
	edge_end('#3544').
	edge_geometry('#3547').
	same_sense(true).
:- end_object.

:- object('#3555',instantiates(edge_curve)).
	name('').
	edge_start('#3544').
	edge_end('#695').
	edge_geometry('#3554').
	same_sense(true).
:- end_object.

:- object('#3570',instantiates(edge_curve)).
	name('').
	edge_start('#3544').
	edge_end('#3566').
	edge_geometry('#3569').
	same_sense(true).
:- end_object.

:- object('#3577',instantiates(edge_curve)).
	name('').
	edge_start('#3566').
	edge_end('#688').
	edge_geometry('#3576').
	same_sense(true).
:- end_object.

:- object('#3592',instantiates(edge_curve)).
	name('').
	edge_start('#3566').
	edge_end('#3588').
	edge_geometry('#3591').
	same_sense(true).
:- end_object.

:- object('#3599',instantiates(edge_curve)).
	name('').
	edge_start('#3588').
	edge_end('#681').
	edge_geometry('#3598').
	same_sense(true).
:- end_object.

:- object('#3614',instantiates(edge_curve)).
	name('').
	edge_start('#3588').
	edge_end('#3610').
	edge_geometry('#3613').
	same_sense(true).
:- end_object.

:- object('#3621',instantiates(edge_curve)).
	name('').
	edge_start('#3610').
	edge_end('#674').
	edge_geometry('#3620').
	same_sense(true).
:- end_object.

:- object('#3636',instantiates(edge_curve)).
	name('').
	edge_start('#3610').
	edge_end('#3632').
	edge_geometry('#3635').
	same_sense(true).
:- end_object.

:- object('#3643',instantiates(edge_curve)).
	name('').
	edge_start('#3632').
	edge_end('#667').
	edge_geometry('#3642').
	same_sense(true).
:- end_object.

:- object('#3658',instantiates(edge_curve)).
	name('').
	edge_start('#3632').
	edge_end('#3654').
	edge_geometry('#3657').
	same_sense(true).
:- end_object.

:- object('#3665',instantiates(edge_curve)).
	name('').
	edge_start('#3654').
	edge_end('#660').
	edge_geometry('#3664').
	same_sense(true).
:- end_object.

:- object('#3680',instantiates(edge_curve)).
	name('').
	edge_start('#3654').
	edge_end('#3676').
	edge_geometry('#3679').
	same_sense(true).
:- end_object.

:- object('#3687',instantiates(edge_curve)).
	name('').
	edge_start('#3676').
	edge_end('#653').
	edge_geometry('#3686').
	same_sense(true).
:- end_object.

:- object('#3702',instantiates(edge_curve)).
	name('').
	edge_start('#3676').
	edge_end('#3698').
	edge_geometry('#3701').
	same_sense(true).
:- end_object.

:- object('#3709',instantiates(edge_curve)).
	name('').
	edge_start('#3698').
	edge_end('#646').
	edge_geometry('#3708').
	same_sense(true).
:- end_object.

:- object('#3724',instantiates(edge_curve)).
	name('').
	edge_start('#3698').
	edge_end('#3720').
	edge_geometry('#3723').
	same_sense(true).
:- end_object.

:- object('#3731',instantiates(edge_curve)).
	name('').
	edge_start('#3720').
	edge_end('#639').
	edge_geometry('#3730').
	same_sense(true).
:- end_object.

:- object('#3746',instantiates(edge_curve)).
	name('').
	edge_start('#3720').
	edge_end('#3742').
	edge_geometry('#3745').
	same_sense(true).
:- end_object.

:- object('#3753',instantiates(edge_curve)).
	name('').
	edge_start('#3742').
	edge_end('#632').
	edge_geometry('#3752').
	same_sense(true).
:- end_object.

:- object('#3768',instantiates(edge_curve)).
	name('').
	edge_start('#3742').
	edge_end('#3764').
	edge_geometry('#3767').
	same_sense(true).
:- end_object.

:- object('#3775',instantiates(edge_curve)).
	name('').
	edge_start('#3764').
	edge_end('#625').
	edge_geometry('#3774').
	same_sense(true).
:- end_object.

:- object('#3790',instantiates(edge_curve)).
	name('').
	edge_start('#3764').
	edge_end('#3786').
	edge_geometry('#3789').
	same_sense(true).
:- end_object.

:- object('#3797',instantiates(edge_curve)).
	name('').
	edge_start('#3786').
	edge_end('#618').
	edge_geometry('#3796').
	same_sense(true).
:- end_object.

:- object('#3812',instantiates(edge_curve)).
	name('').
	edge_start('#3786').
	edge_end('#3808').
	edge_geometry('#3811').
	same_sense(true).
:- end_object.

:- object('#3819',instantiates(edge_curve)).
	name('').
	edge_start('#3808').
	edge_end('#611').
	edge_geometry('#3818').
	same_sense(true).
:- end_object.

:- object('#3834',instantiates(edge_curve)).
	name('').
	edge_start('#3808').
	edge_end('#3830').
	edge_geometry('#3833').
	same_sense(true).
:- end_object.

:- object('#3841',instantiates(edge_curve)).
	name('').
	edge_start('#3830').
	edge_end('#604').
	edge_geometry('#3840').
	same_sense(true).
:- end_object.

:- object('#3856',instantiates(edge_curve)).
	name('').
	edge_start('#3830').
	edge_end('#3852').
	edge_geometry('#3855').
	same_sense(true).
:- end_object.

:- object('#3863',instantiates(edge_curve)).
	name('').
	edge_start('#3852').
	edge_end('#597').
	edge_geometry('#3862').
	same_sense(true).
:- end_object.

:- object('#3878',instantiates(edge_curve)).
	name('').
	edge_start('#3852').
	edge_end('#3874').
	edge_geometry('#3877').
	same_sense(true).
:- end_object.

:- object('#3885',instantiates(edge_curve)).
	name('').
	edge_start('#3874').
	edge_end('#590').
	edge_geometry('#3884').
	same_sense(true).
:- end_object.

:- object('#3900',instantiates(edge_curve)).
	name('').
	edge_start('#3874').
	edge_end('#3896').
	edge_geometry('#3899').
	same_sense(true).
:- end_object.

:- object('#3907',instantiates(edge_curve)).
	name('').
	edge_start('#3896').
	edge_end('#581').
	edge_geometry('#3906').
	same_sense(true).
:- end_object.

:- object('#3922',instantiates(edge_curve)).
	name('').
	edge_start('#3918').
	edge_end('#3896').
	edge_geometry('#3921').
	same_sense(true).
:- end_object.

:- object('#3929',instantiates(edge_curve)).
	name('').
	edge_start('#583').
	edge_end('#3918').
	edge_geometry('#3928').
	same_sense(true).
:- end_object.

:- object('#3942',instantiates(edge_curve)).
	name('').
	edge_start('#3918').
	edge_end('#1404').
	edge_geometry('#3941').
	same_sense(true).
:- end_object.

:- object('#145',instantiates(oriented_edge)).
	name('').
	edge_element('#144').
	orientation(false).
:- end_object.

:- object('#189',instantiates(oriented_edge)).
	name('').
	edge_element('#188').
	orientation(false).
:- end_object.

:- object('#194',instantiates(oriented_edge)).
	name('').
	edge_element('#193').
	orientation(false).
:- end_object.

:- object('#195',instantiates(oriented_edge)).
	name('').
	edge_element('#144').
	orientation(true).
:- end_object.

:- object('#196',instantiates(oriented_edge)).
	name('').
	edge_element('#193').
	orientation(true).
:- end_object.

:- object('#223',instantiates(oriented_edge)).
	name('').
	edge_element('#222').
	orientation(false).
:- end_object.

:- object('#267',instantiates(oriented_edge)).
	name('').
	edge_element('#266').
	orientation(false).
:- end_object.

:- object('#272',instantiates(oriented_edge)).
	name('').
	edge_element('#271').
	orientation(false).
:- end_object.

:- object('#273',instantiates(oriented_edge)).
	name('').
	edge_element('#222').
	orientation(true).
:- end_object.

:- object('#274',instantiates(oriented_edge)).
	name('').
	edge_element('#271').
	orientation(true).
:- end_object.

:- object('#291',instantiates(oriented_edge)).
	name('').
	edge_element('#290').
	orientation(false).
:- end_object.

:- object('#298',instantiates(oriented_edge)).
	name('').
	edge_element('#297').
	orientation(true).
:- end_object.

:- object('#305',instantiates(oriented_edge)).
	name('').
	edge_element('#304').
	orientation(false).
:- end_object.

:- object('#310',instantiates(oriented_edge)).
	name('').
	edge_element('#309').
	orientation(true).
:- end_object.

:- object('#327',instantiates(oriented_edge)).
	name('').
	edge_element('#326').
	orientation(true).
:- end_object.

:- object('#332',instantiates(oriented_edge)).
	name('').
	edge_element('#331').
	orientation(false).
:- end_object.

:- object('#333',instantiates(oriented_edge)).
	name('').
	edge_element('#309').
	orientation(false).
:- end_object.

:- object('#338',instantiates(oriented_edge)).
	name('').
	edge_element('#337').
	orientation(false).
:- end_object.

:- object('#364',instantiates(oriented_edge)).
	name('').
	edge_element('#326').
	orientation(true).
:- end_object.

:- object('#379',instantiates(oriented_edge)).
	name('').
	edge_element('#378').
	orientation(true).
:- end_object.

:- object('#386',instantiates(oriented_edge)).
	name('').
	edge_element('#385').
	orientation(true).
:- end_object.

:- object('#399',instantiates(oriented_edge)).
	name('').
	edge_element('#398').
	orientation(true).
:- end_object.

:- object('#433',instantiates(oriented_edge)).
	name('').
	edge_element('#432').
	orientation(true).
:- end_object.

:- object('#448',instantiates(oriented_edge)).
	name('').
	edge_element('#447').
	orientation(true).
:- end_object.

:- object('#449',instantiates(oriented_edge)).
	name('').
	edge_element('#385').
	orientation(false).
:- end_object.

:- object('#466',instantiates(oriented_edge)).
	name('').
	edge_element('#465').
	orientation(true).
:- end_object.

:- object('#475',instantiates(oriented_edge)).
	name('').
	edge_element('#432').
	orientation(true).
:- end_object.

:- object('#480',instantiates(oriented_edge)).
	name('').
	edge_element('#479').
	orientation(false).
:- end_object.

:- object('#481',instantiates(oriented_edge)).
	name('').
	edge_element('#297').
	orientation(false).
:- end_object.

:- object('#486',instantiates(oriented_edge)).
	name('').
	edge_element('#485').
	orientation(false).
:- end_object.

:- object('#513',instantiates(oriented_edge)).
	name('').
	edge_element('#512').
	orientation(false).
:- end_object.

:- object('#516',instantiates(oriented_edge)).
	name('').
	edge_element('#485').
	orientation(true).
:- end_object.

:- object('#517',instantiates(oriented_edge)).
	name('').
	edge_element('#290').
	orientation(true).
:- end_object.

:- object('#518',instantiates(oriented_edge)).
	name('').
	edge_element('#331').
	orientation(true).
:- end_object.

:- object('#519',instantiates(oriented_edge)).
	name('').
	edge_element('#378').
	orientation(true).
:- end_object.

:- object('#520',instantiates(oriented_edge)).
	name('').
	edge_element('#465').
	orientation(true).
:- end_object.

:- object('#564',instantiates(oriented_edge)).
	name('').
	edge_element('#563').
	orientation(false).
:- end_object.

:- object('#569',instantiates(oriented_edge)).
	name('').
	edge_element('#568').
	orientation(false).
:- end_object.

:- object('#570',instantiates(oriented_edge)).
	name('').
	edge_element('#512').
	orientation(true).
:- end_object.

:- object('#571',instantiates(oriented_edge)).
	name('').
	edge_element('#568').
	orientation(true).
:- end_object.

:- object('#588',instantiates(oriented_edge)).
	name('').
	edge_element('#587').
	orientation(false).
:- end_object.

:- object('#595',instantiates(oriented_edge)).
	name('').
	edge_element('#594').
	orientation(true).
:- end_object.

:- object('#602',instantiates(oriented_edge)).
	name('').
	edge_element('#601').
	orientation(true).
:- end_object.

:- object('#609',instantiates(oriented_edge)).
	name('').
	edge_element('#608').
	orientation(true).
:- end_object.

:- object('#616',instantiates(oriented_edge)).
	name('').
	edge_element('#615').
	orientation(true).
:- end_object.

:- object('#623',instantiates(oriented_edge)).
	name('').
	edge_element('#622').
	orientation(true).
:- end_object.

:- object('#630',instantiates(oriented_edge)).
	name('').
	edge_element('#629').
	orientation(true).
:- end_object.

:- object('#637',instantiates(oriented_edge)).
	name('').
	edge_element('#636').
	orientation(true).
:- end_object.

:- object('#644',instantiates(oriented_edge)).
	name('').
	edge_element('#643').
	orientation(true).
:- end_object.

:- object('#651',instantiates(oriented_edge)).
	name('').
	edge_element('#650').
	orientation(true).
:- end_object.

:- object('#658',instantiates(oriented_edge)).
	name('').
	edge_element('#657').
	orientation(true).
:- end_object.

:- object('#665',instantiates(oriented_edge)).
	name('').
	edge_element('#664').
	orientation(true).
:- end_object.

:- object('#672',instantiates(oriented_edge)).
	name('').
	edge_element('#671').
	orientation(true).
:- end_object.

:- object('#679',instantiates(oriented_edge)).
	name('').
	edge_element('#678').
	orientation(true).
:- end_object.

:- object('#686',instantiates(oriented_edge)).
	name('').
	edge_element('#685').
	orientation(true).
:- end_object.

:- object('#693',instantiates(oriented_edge)).
	name('').
	edge_element('#692').
	orientation(true).
:- end_object.

:- object('#700',instantiates(oriented_edge)).
	name('').
	edge_element('#699').
	orientation(true).
:- end_object.

:- object('#707',instantiates(oriented_edge)).
	name('').
	edge_element('#706').
	orientation(true).
:- end_object.

:- object('#714',instantiates(oriented_edge)).
	name('').
	edge_element('#713').
	orientation(true).
:- end_object.

:- object('#721',instantiates(oriented_edge)).
	name('').
	edge_element('#720').
	orientation(true).
:- end_object.

:- object('#728',instantiates(oriented_edge)).
	name('').
	edge_element('#727').
	orientation(true).
:- end_object.

:- object('#735',instantiates(oriented_edge)).
	name('').
	edge_element('#734').
	orientation(true).
:- end_object.

:- object('#742',instantiates(oriented_edge)).
	name('').
	edge_element('#741').
	orientation(true).
:- end_object.

:- object('#749',instantiates(oriented_edge)).
	name('').
	edge_element('#748').
	orientation(true).
:- end_object.

:- object('#756',instantiates(oriented_edge)).
	name('').
	edge_element('#755').
	orientation(true).
:- end_object.

:- object('#763',instantiates(oriented_edge)).
	name('').
	edge_element('#762').
	orientation(true).
:- end_object.

:- object('#770',instantiates(oriented_edge)).
	name('').
	edge_element('#769').
	orientation(true).
:- end_object.

:- object('#777',instantiates(oriented_edge)).
	name('').
	edge_element('#776').
	orientation(true).
:- end_object.

:- object('#784',instantiates(oriented_edge)).
	name('').
	edge_element('#783').
	orientation(true).
:- end_object.

:- object('#791',instantiates(oriented_edge)).
	name('').
	edge_element('#790').
	orientation(true).
:- end_object.

:- object('#798',instantiates(oriented_edge)).
	name('').
	edge_element('#797').
	orientation(true).
:- end_object.

:- object('#805',instantiates(oriented_edge)).
	name('').
	edge_element('#804').
	orientation(true).
:- end_object.

:- object('#812',instantiates(oriented_edge)).
	name('').
	edge_element('#811').
	orientation(true).
:- end_object.

:- object('#819',instantiates(oriented_edge)).
	name('').
	edge_element('#818').
	orientation(true).
:- end_object.

:- object('#826',instantiates(oriented_edge)).
	name('').
	edge_element('#825').
	orientation(true).
:- end_object.

:- object('#833',instantiates(oriented_edge)).
	name('').
	edge_element('#832').
	orientation(true).
:- end_object.

:- object('#840',instantiates(oriented_edge)).
	name('').
	edge_element('#839').
	orientation(true).
:- end_object.

:- object('#847',instantiates(oriented_edge)).
	name('').
	edge_element('#846').
	orientation(true).
:- end_object.

:- object('#854',instantiates(oriented_edge)).
	name('').
	edge_element('#853').
	orientation(true).
:- end_object.

:- object('#861',instantiates(oriented_edge)).
	name('').
	edge_element('#860').
	orientation(true).
:- end_object.

:- object('#868',instantiates(oriented_edge)).
	name('').
	edge_element('#867').
	orientation(true).
:- end_object.

:- object('#875',instantiates(oriented_edge)).
	name('').
	edge_element('#874').
	orientation(true).
:- end_object.

:- object('#882',instantiates(oriented_edge)).
	name('').
	edge_element('#881').
	orientation(true).
:- end_object.

:- object('#889',instantiates(oriented_edge)).
	name('').
	edge_element('#888').
	orientation(true).
:- end_object.

:- object('#896',instantiates(oriented_edge)).
	name('').
	edge_element('#895').
	orientation(true).
:- end_object.

:- object('#903',instantiates(oriented_edge)).
	name('').
	edge_element('#902').
	orientation(true).
:- end_object.

:- object('#910',instantiates(oriented_edge)).
	name('').
	edge_element('#909').
	orientation(true).
:- end_object.

:- object('#917',instantiates(oriented_edge)).
	name('').
	edge_element('#916').
	orientation(true).
:- end_object.

:- object('#924',instantiates(oriented_edge)).
	name('').
	edge_element('#923').
	orientation(true).
:- end_object.

:- object('#931',instantiates(oriented_edge)).
	name('').
	edge_element('#930').
	orientation(true).
:- end_object.

:- object('#938',instantiates(oriented_edge)).
	name('').
	edge_element('#937').
	orientation(true).
:- end_object.

:- object('#945',instantiates(oriented_edge)).
	name('').
	edge_element('#944').
	orientation(true).
:- end_object.

:- object('#952',instantiates(oriented_edge)).
	name('').
	edge_element('#951').
	orientation(true).
:- end_object.

:- object('#959',instantiates(oriented_edge)).
	name('').
	edge_element('#958').
	orientation(true).
:- end_object.

:- object('#966',instantiates(oriented_edge)).
	name('').
	edge_element('#965').
	orientation(true).
:- end_object.

:- object('#973',instantiates(oriented_edge)).
	name('').
	edge_element('#972').
	orientation(true).
:- end_object.

:- object('#980',instantiates(oriented_edge)).
	name('').
	edge_element('#979').
	orientation(true).
:- end_object.

:- object('#987',instantiates(oriented_edge)).
	name('').
	edge_element('#986').
	orientation(true).
:- end_object.

:- object('#994',instantiates(oriented_edge)).
	name('').
	edge_element('#993').
	orientation(true).
:- end_object.

:- object('#1001',instantiates(oriented_edge)).
	name('').
	edge_element('#1000').
	orientation(true).
:- end_object.

:- object('#1008',instantiates(oriented_edge)).
	name('').
	edge_element('#1007').
	orientation(true).
:- end_object.

:- object('#1015',instantiates(oriented_edge)).
	name('').
	edge_element('#1014').
	orientation(true).
:- end_object.

:- object('#1022',instantiates(oriented_edge)).
	name('').
	edge_element('#1021').
	orientation(true).
:- end_object.

:- object('#1029',instantiates(oriented_edge)).
	name('').
	edge_element('#1028').
	orientation(true).
:- end_object.

:- object('#1036',instantiates(oriented_edge)).
	name('').
	edge_element('#1035').
	orientation(true).
:- end_object.

:- object('#1043',instantiates(oriented_edge)).
	name('').
	edge_element('#1042').
	orientation(true).
:- end_object.

:- object('#1050',instantiates(oriented_edge)).
	name('').
	edge_element('#1049').
	orientation(true).
:- end_object.

:- object('#1057',instantiates(oriented_edge)).
	name('').
	edge_element('#1056').
	orientation(true).
:- end_object.

:- object('#1064',instantiates(oriented_edge)).
	name('').
	edge_element('#1063').
	orientation(true).
:- end_object.

:- object('#1071',instantiates(oriented_edge)).
	name('').
	edge_element('#1070').
	orientation(true).
:- end_object.

:- object('#1078',instantiates(oriented_edge)).
	name('').
	edge_element('#1077').
	orientation(true).
:- end_object.

:- object('#1085',instantiates(oriented_edge)).
	name('').
	edge_element('#1084').
	orientation(true).
:- end_object.

:- object('#1092',instantiates(oriented_edge)).
	name('').
	edge_element('#1091').
	orientation(true).
:- end_object.

:- object('#1099',instantiates(oriented_edge)).
	name('').
	edge_element('#1098').
	orientation(true).
:- end_object.

:- object('#1106',instantiates(oriented_edge)).
	name('').
	edge_element('#1105').
	orientation(true).
:- end_object.

:- object('#1113',instantiates(oriented_edge)).
	name('').
	edge_element('#1112').
	orientation(true).
:- end_object.

:- object('#1120',instantiates(oriented_edge)).
	name('').
	edge_element('#1119').
	orientation(true).
:- end_object.

:- object('#1127',instantiates(oriented_edge)).
	name('').
	edge_element('#1126').
	orientation(true).
:- end_object.

:- object('#1134',instantiates(oriented_edge)).
	name('').
	edge_element('#1133').
	orientation(true).
:- end_object.

:- object('#1141',instantiates(oriented_edge)).
	name('').
	edge_element('#1140').
	orientation(true).
:- end_object.

:- object('#1148',instantiates(oriented_edge)).
	name('').
	edge_element('#1147').
	orientation(true).
:- end_object.

:- object('#1155',instantiates(oriented_edge)).
	name('').
	edge_element('#1154').
	orientation(true).
:- end_object.

:- object('#1162',instantiates(oriented_edge)).
	name('').
	edge_element('#1161').
	orientation(true).
:- end_object.

:- object('#1169',instantiates(oriented_edge)).
	name('').
	edge_element('#1168').
	orientation(true).
:- end_object.

:- object('#1176',instantiates(oriented_edge)).
	name('').
	edge_element('#1175').
	orientation(true).
:- end_object.

:- object('#1183',instantiates(oriented_edge)).
	name('').
	edge_element('#1182').
	orientation(true).
:- end_object.

:- object('#1190',instantiates(oriented_edge)).
	name('').
	edge_element('#1189').
	orientation(true).
:- end_object.

:- object('#1197',instantiates(oriented_edge)).
	name('').
	edge_element('#1196').
	orientation(true).
:- end_object.

:- object('#1204',instantiates(oriented_edge)).
	name('').
	edge_element('#1203').
	orientation(true).
:- end_object.

:- object('#1211',instantiates(oriented_edge)).
	name('').
	edge_element('#1210').
	orientation(true).
:- end_object.

:- object('#1218',instantiates(oriented_edge)).
	name('').
	edge_element('#1217').
	orientation(true).
:- end_object.

:- object('#1225',instantiates(oriented_edge)).
	name('').
	edge_element('#1224').
	orientation(true).
:- end_object.

:- object('#1232',instantiates(oriented_edge)).
	name('').
	edge_element('#1231').
	orientation(true).
:- end_object.

:- object('#1239',instantiates(oriented_edge)).
	name('').
	edge_element('#1238').
	orientation(true).
:- end_object.

:- object('#1246',instantiates(oriented_edge)).
	name('').
	edge_element('#1245').
	orientation(true).
:- end_object.

:- object('#1253',instantiates(oriented_edge)).
	name('').
	edge_element('#1252').
	orientation(true).
:- end_object.

:- object('#1260',instantiates(oriented_edge)).
	name('').
	edge_element('#1259').
	orientation(true).
:- end_object.

:- object('#1267',instantiates(oriented_edge)).
	name('').
	edge_element('#1266').
	orientation(true).
:- end_object.

:- object('#1274',instantiates(oriented_edge)).
	name('').
	edge_element('#1273').
	orientation(true).
:- end_object.

:- object('#1281',instantiates(oriented_edge)).
	name('').
	edge_element('#1280').
	orientation(true).
:- end_object.

:- object('#1288',instantiates(oriented_edge)).
	name('').
	edge_element('#1287').
	orientation(true).
:- end_object.

:- object('#1295',instantiates(oriented_edge)).
	name('').
	edge_element('#1294').
	orientation(true).
:- end_object.

:- object('#1302',instantiates(oriented_edge)).
	name('').
	edge_element('#1301').
	orientation(true).
:- end_object.

:- object('#1309',instantiates(oriented_edge)).
	name('').
	edge_element('#1308').
	orientation(true).
:- end_object.

:- object('#1316',instantiates(oriented_edge)).
	name('').
	edge_element('#1315').
	orientation(true).
:- end_object.

:- object('#1323',instantiates(oriented_edge)).
	name('').
	edge_element('#1322').
	orientation(true).
:- end_object.

:- object('#1330',instantiates(oriented_edge)).
	name('').
	edge_element('#1329').
	orientation(true).
:- end_object.

:- object('#1337',instantiates(oriented_edge)).
	name('').
	edge_element('#1336').
	orientation(true).
:- end_object.

:- object('#1344',instantiates(oriented_edge)).
	name('').
	edge_element('#1343').
	orientation(true).
:- end_object.

:- object('#1351',instantiates(oriented_edge)).
	name('').
	edge_element('#1350').
	orientation(true).
:- end_object.

:- object('#1358',instantiates(oriented_edge)).
	name('').
	edge_element('#1357').
	orientation(true).
:- end_object.

:- object('#1365',instantiates(oriented_edge)).
	name('').
	edge_element('#1364').
	orientation(true).
:- end_object.

:- object('#1372',instantiates(oriented_edge)).
	name('').
	edge_element('#1371').
	orientation(true).
:- end_object.

:- object('#1379',instantiates(oriented_edge)).
	name('').
	edge_element('#1378').
	orientation(true).
:- end_object.

:- object('#1386',instantiates(oriented_edge)).
	name('').
	edge_element('#1385').
	orientation(true).
:- end_object.

:- object('#1391',instantiates(oriented_edge)).
	name('').
	edge_element('#1390').
	orientation(true).
:- end_object.

:- object('#1394',instantiates(oriented_edge)).
	name('').
	edge_element('#563').
	orientation(true).
:- end_object.

:- object('#1411',instantiates(oriented_edge)).
	name('').
	edge_element('#1410').
	orientation(false).
:- end_object.

:- object('#1416',instantiates(oriented_edge)).
	name('').
	edge_element('#1415').
	orientation(true).
:- end_object.

:- object('#1417',instantiates(oriented_edge)).
	name('').
	edge_element('#1385').
	orientation(false).
:- end_object.

:- object('#1422',instantiates(oriented_edge)).
	name('').
	edge_element('#1421').
	orientation(false).
:- end_object.

:- object('#1437',instantiates(oriented_edge)).
	name('').
	edge_element('#1436').
	orientation(false).
:- end_object.

:- object('#1438',instantiates(oriented_edge)).
	name('').
	edge_element('#1421').
	orientation(true).
:- end_object.

:- object('#1439',instantiates(oriented_edge)).
	name('').
	edge_element('#1378').
	orientation(false).
:- end_object.

:- object('#1444',instantiates(oriented_edge)).
	name('').
	edge_element('#1443').
	orientation(false).
:- end_object.

:- object('#1459',instantiates(oriented_edge)).
	name('').
	edge_element('#1458').
	orientation(false).
:- end_object.

:- object('#1460',instantiates(oriented_edge)).
	name('').
	edge_element('#1443').
	orientation(true).
:- end_object.

:- object('#1461',instantiates(oriented_edge)).
	name('').
	edge_element('#1371').
	orientation(false).
:- end_object.

:- object('#1466',instantiates(oriented_edge)).
	name('').
	edge_element('#1465').
	orientation(false).
:- end_object.

:- object('#1481',instantiates(oriented_edge)).
	name('').
	edge_element('#1480').
	orientation(false).
:- end_object.

:- object('#1482',instantiates(oriented_edge)).
	name('').
	edge_element('#1465').
	orientation(true).
:- end_object.

:- object('#1483',instantiates(oriented_edge)).
	name('').
	edge_element('#1364').
	orientation(false).
:- end_object.

:- object('#1488',instantiates(oriented_edge)).
	name('').
	edge_element('#1487').
	orientation(false).
:- end_object.

:- object('#1503',instantiates(oriented_edge)).
	name('').
	edge_element('#1502').
	orientation(false).
:- end_object.

:- object('#1504',instantiates(oriented_edge)).
	name('').
	edge_element('#1487').
	orientation(true).
:- end_object.

:- object('#1505',instantiates(oriented_edge)).
	name('').
	edge_element('#1357').
	orientation(false).
:- end_object.

:- object('#1510',instantiates(oriented_edge)).
	name('').
	edge_element('#1509').
	orientation(false).
:- end_object.

:- object('#1525',instantiates(oriented_edge)).
	name('').
	edge_element('#1524').
	orientation(false).
:- end_object.

:- object('#1526',instantiates(oriented_edge)).
	name('').
	edge_element('#1509').
	orientation(true).
:- end_object.

:- object('#1527',instantiates(oriented_edge)).
	name('').
	edge_element('#1350').
	orientation(false).
:- end_object.

:- object('#1532',instantiates(oriented_edge)).
	name('').
	edge_element('#1531').
	orientation(false).
:- end_object.

:- object('#1547',instantiates(oriented_edge)).
	name('').
	edge_element('#1546').
	orientation(false).
:- end_object.

:- object('#1548',instantiates(oriented_edge)).
	name('').
	edge_element('#1531').
	orientation(true).
:- end_object.

:- object('#1549',instantiates(oriented_edge)).
	name('').
	edge_element('#1343').
	orientation(false).
:- end_object.

:- object('#1554',instantiates(oriented_edge)).
	name('').
	edge_element('#1553').
	orientation(false).
:- end_object.

:- object('#1569',instantiates(oriented_edge)).
	name('').
	edge_element('#1568').
	orientation(false).
:- end_object.

:- object('#1570',instantiates(oriented_edge)).
	name('').
	edge_element('#1553').
	orientation(true).
:- end_object.

:- object('#1571',instantiates(oriented_edge)).
	name('').
	edge_element('#1336').
	orientation(false).
:- end_object.

:- object('#1576',instantiates(oriented_edge)).
	name('').
	edge_element('#1575').
	orientation(false).
:- end_object.

:- object('#1591',instantiates(oriented_edge)).
	name('').
	edge_element('#1590').
	orientation(false).
:- end_object.

:- object('#1592',instantiates(oriented_edge)).
	name('').
	edge_element('#1575').
	orientation(true).
:- end_object.

:- object('#1593',instantiates(oriented_edge)).
	name('').
	edge_element('#1329').
	orientation(false).
:- end_object.

:- object('#1598',instantiates(oriented_edge)).
	name('').
	edge_element('#1597').
	orientation(false).
:- end_object.

:- object('#1613',instantiates(oriented_edge)).
	name('').
	edge_element('#1612').
	orientation(false).
:- end_object.

:- object('#1614',instantiates(oriented_edge)).
	name('').
	edge_element('#1597').
	orientation(true).
:- end_object.

:- object('#1615',instantiates(oriented_edge)).
	name('').
	edge_element('#1322').
	orientation(false).
:- end_object.

:- object('#1620',instantiates(oriented_edge)).
	name('').
	edge_element('#1619').
	orientation(false).
:- end_object.

:- object('#1635',instantiates(oriented_edge)).
	name('').
	edge_element('#1634').
	orientation(false).
:- end_object.

:- object('#1636',instantiates(oriented_edge)).
	name('').
	edge_element('#1619').
	orientation(true).
:- end_object.

:- object('#1637',instantiates(oriented_edge)).
	name('').
	edge_element('#1315').
	orientation(false).
:- end_object.

:- object('#1642',instantiates(oriented_edge)).
	name('').
	edge_element('#1641').
	orientation(false).
:- end_object.

:- object('#1657',instantiates(oriented_edge)).
	name('').
	edge_element('#1656').
	orientation(false).
:- end_object.

:- object('#1658',instantiates(oriented_edge)).
	name('').
	edge_element('#1641').
	orientation(true).
:- end_object.

:- object('#1659',instantiates(oriented_edge)).
	name('').
	edge_element('#1308').
	orientation(false).
:- end_object.

:- object('#1664',instantiates(oriented_edge)).
	name('').
	edge_element('#1663').
	orientation(false).
:- end_object.

:- object('#1679',instantiates(oriented_edge)).
	name('').
	edge_element('#1678').
	orientation(false).
:- end_object.

:- object('#1680',instantiates(oriented_edge)).
	name('').
	edge_element('#1663').
	orientation(true).
:- end_object.

:- object('#1681',instantiates(oriented_edge)).
	name('').
	edge_element('#1301').
	orientation(false).
:- end_object.

:- object('#1686',instantiates(oriented_edge)).
	name('').
	edge_element('#1685').
	orientation(false).
:- end_object.

:- object('#1701',instantiates(oriented_edge)).
	name('').
	edge_element('#1700').
	orientation(false).
:- end_object.

:- object('#1702',instantiates(oriented_edge)).
	name('').
	edge_element('#1685').
	orientation(true).
:- end_object.

:- object('#1703',instantiates(oriented_edge)).
	name('').
	edge_element('#1294').
	orientation(false).
:- end_object.

:- object('#1708',instantiates(oriented_edge)).
	name('').
	edge_element('#1707').
	orientation(false).
:- end_object.

:- object('#1723',instantiates(oriented_edge)).
	name('').
	edge_element('#1722').
	orientation(false).
:- end_object.

:- object('#1724',instantiates(oriented_edge)).
	name('').
	edge_element('#1707').
	orientation(true).
:- end_object.

:- object('#1725',instantiates(oriented_edge)).
	name('').
	edge_element('#1287').
	orientation(false).
:- end_object.

:- object('#1730',instantiates(oriented_edge)).
	name('').
	edge_element('#1729').
	orientation(false).
:- end_object.

:- object('#1745',instantiates(oriented_edge)).
	name('').
	edge_element('#1744').
	orientation(false).
:- end_object.

:- object('#1746',instantiates(oriented_edge)).
	name('').
	edge_element('#1729').
	orientation(true).
:- end_object.

:- object('#1747',instantiates(oriented_edge)).
	name('').
	edge_element('#1280').
	orientation(false).
:- end_object.

:- object('#1752',instantiates(oriented_edge)).
	name('').
	edge_element('#1751').
	orientation(false).
:- end_object.

:- object('#1767',instantiates(oriented_edge)).
	name('').
	edge_element('#1766').
	orientation(false).
:- end_object.

:- object('#1768',instantiates(oriented_edge)).
	name('').
	edge_element('#1751').
	orientation(true).
:- end_object.

:- object('#1769',instantiates(oriented_edge)).
	name('').
	edge_element('#1273').
	orientation(false).
:- end_object.

:- object('#1774',instantiates(oriented_edge)).
	name('').
	edge_element('#1773').
	orientation(false).
:- end_object.

:- object('#1789',instantiates(oriented_edge)).
	name('').
	edge_element('#1788').
	orientation(false).
:- end_object.

:- object('#1790',instantiates(oriented_edge)).
	name('').
	edge_element('#1773').
	orientation(true).
:- end_object.

:- object('#1791',instantiates(oriented_edge)).
	name('').
	edge_element('#1266').
	orientation(false).
:- end_object.

:- object('#1796',instantiates(oriented_edge)).
	name('').
	edge_element('#1795').
	orientation(false).
:- end_object.

:- object('#1811',instantiates(oriented_edge)).
	name('').
	edge_element('#1810').
	orientation(false).
:- end_object.

:- object('#1812',instantiates(oriented_edge)).
	name('').
	edge_element('#1795').
	orientation(true).
:- end_object.

:- object('#1813',instantiates(oriented_edge)).
	name('').
	edge_element('#1259').
	orientation(false).
:- end_object.

:- object('#1818',instantiates(oriented_edge)).
	name('').
	edge_element('#1817').
	orientation(false).
:- end_object.

:- object('#1833',instantiates(oriented_edge)).
	name('').
	edge_element('#1832').
	orientation(false).
:- end_object.

:- object('#1834',instantiates(oriented_edge)).
	name('').
	edge_element('#1817').
	orientation(true).
:- end_object.

:- object('#1835',instantiates(oriented_edge)).
	name('').
	edge_element('#1252').
	orientation(false).
:- end_object.

:- object('#1840',instantiates(oriented_edge)).
	name('').
	edge_element('#1839').
	orientation(false).
:- end_object.

:- object('#1855',instantiates(oriented_edge)).
	name('').
	edge_element('#1854').
	orientation(false).
:- end_object.

:- object('#1856',instantiates(oriented_edge)).
	name('').
	edge_element('#1839').
	orientation(true).
:- end_object.

:- object('#1857',instantiates(oriented_edge)).
	name('').
	edge_element('#1245').
	orientation(false).
:- end_object.

:- object('#1862',instantiates(oriented_edge)).
	name('').
	edge_element('#1861').
	orientation(false).
:- end_object.

:- object('#1877',instantiates(oriented_edge)).
	name('').
	edge_element('#1876').
	orientation(false).
:- end_object.

:- object('#1878',instantiates(oriented_edge)).
	name('').
	edge_element('#1861').
	orientation(true).
:- end_object.

:- object('#1879',instantiates(oriented_edge)).
	name('').
	edge_element('#1238').
	orientation(false).
:- end_object.

:- object('#1884',instantiates(oriented_edge)).
	name('').
	edge_element('#1883').
	orientation(false).
:- end_object.

:- object('#1899',instantiates(oriented_edge)).
	name('').
	edge_element('#1898').
	orientation(false).
:- end_object.

:- object('#1900',instantiates(oriented_edge)).
	name('').
	edge_element('#1883').
	orientation(true).
:- end_object.

:- object('#1901',instantiates(oriented_edge)).
	name('').
	edge_element('#1231').
	orientation(false).
:- end_object.

:- object('#1906',instantiates(oriented_edge)).
	name('').
	edge_element('#1905').
	orientation(false).
:- end_object.

:- object('#1921',instantiates(oriented_edge)).
	name('').
	edge_element('#1920').
	orientation(false).
:- end_object.

:- object('#1922',instantiates(oriented_edge)).
	name('').
	edge_element('#1905').
	orientation(true).
:- end_object.

:- object('#1923',instantiates(oriented_edge)).
	name('').
	edge_element('#1224').
	orientation(false).
:- end_object.

:- object('#1928',instantiates(oriented_edge)).
	name('').
	edge_element('#1927').
	orientation(false).
:- end_object.

:- object('#1943',instantiates(oriented_edge)).
	name('').
	edge_element('#1942').
	orientation(false).
:- end_object.

:- object('#1944',instantiates(oriented_edge)).
	name('').
	edge_element('#1927').
	orientation(true).
:- end_object.

:- object('#1945',instantiates(oriented_edge)).
	name('').
	edge_element('#1217').
	orientation(false).
:- end_object.

:- object('#1950',instantiates(oriented_edge)).
	name('').
	edge_element('#1949').
	orientation(false).
:- end_object.

:- object('#1965',instantiates(oriented_edge)).
	name('').
	edge_element('#1964').
	orientation(false).
:- end_object.

:- object('#1966',instantiates(oriented_edge)).
	name('').
	edge_element('#1949').
	orientation(true).
:- end_object.

:- object('#1967',instantiates(oriented_edge)).
	name('').
	edge_element('#1210').
	orientation(false).
:- end_object.

:- object('#1972',instantiates(oriented_edge)).
	name('').
	edge_element('#1971').
	orientation(false).
:- end_object.

:- object('#1987',instantiates(oriented_edge)).
	name('').
	edge_element('#1986').
	orientation(false).
:- end_object.

:- object('#1988',instantiates(oriented_edge)).
	name('').
	edge_element('#1971').
	orientation(true).
:- end_object.

:- object('#1989',instantiates(oriented_edge)).
	name('').
	edge_element('#1203').
	orientation(false).
:- end_object.

:- object('#1994',instantiates(oriented_edge)).
	name('').
	edge_element('#1993').
	orientation(false).
:- end_object.

:- object('#2009',instantiates(oriented_edge)).
	name('').
	edge_element('#2008').
	orientation(false).
:- end_object.

:- object('#2010',instantiates(oriented_edge)).
	name('').
	edge_element('#1993').
	orientation(true).
:- end_object.

:- object('#2011',instantiates(oriented_edge)).
	name('').
	edge_element('#1196').
	orientation(false).
:- end_object.

:- object('#2016',instantiates(oriented_edge)).
	name('').
	edge_element('#2015').
	orientation(false).
:- end_object.

:- object('#2031',instantiates(oriented_edge)).
	name('').
	edge_element('#2030').
	orientation(false).
:- end_object.

:- object('#2032',instantiates(oriented_edge)).
	name('').
	edge_element('#2015').
	orientation(true).
:- end_object.

:- object('#2033',instantiates(oriented_edge)).
	name('').
	edge_element('#1189').
	orientation(false).
:- end_object.

:- object('#2038',instantiates(oriented_edge)).
	name('').
	edge_element('#2037').
	orientation(false).
:- end_object.

:- object('#2053',instantiates(oriented_edge)).
	name('').
	edge_element('#2052').
	orientation(false).
:- end_object.

:- object('#2054',instantiates(oriented_edge)).
	name('').
	edge_element('#2037').
	orientation(true).
:- end_object.

:- object('#2055',instantiates(oriented_edge)).
	name('').
	edge_element('#1182').
	orientation(false).
:- end_object.

:- object('#2060',instantiates(oriented_edge)).
	name('').
	edge_element('#2059').
	orientation(false).
:- end_object.

:- object('#2075',instantiates(oriented_edge)).
	name('').
	edge_element('#2074').
	orientation(false).
:- end_object.

:- object('#2076',instantiates(oriented_edge)).
	name('').
	edge_element('#2059').
	orientation(true).
:- end_object.

:- object('#2077',instantiates(oriented_edge)).
	name('').
	edge_element('#1175').
	orientation(false).
:- end_object.

:- object('#2082',instantiates(oriented_edge)).
	name('').
	edge_element('#2081').
	orientation(false).
:- end_object.

:- object('#2097',instantiates(oriented_edge)).
	name('').
	edge_element('#2096').
	orientation(false).
:- end_object.

:- object('#2098',instantiates(oriented_edge)).
	name('').
	edge_element('#2081').
	orientation(true).
:- end_object.

:- object('#2099',instantiates(oriented_edge)).
	name('').
	edge_element('#1168').
	orientation(false).
:- end_object.

:- object('#2104',instantiates(oriented_edge)).
	name('').
	edge_element('#2103').
	orientation(false).
:- end_object.

:- object('#2119',instantiates(oriented_edge)).
	name('').
	edge_element('#2118').
	orientation(false).
:- end_object.

:- object('#2120',instantiates(oriented_edge)).
	name('').
	edge_element('#2103').
	orientation(true).
:- end_object.

:- object('#2121',instantiates(oriented_edge)).
	name('').
	edge_element('#1161').
	orientation(false).
:- end_object.

:- object('#2126',instantiates(oriented_edge)).
	name('').
	edge_element('#2125').
	orientation(false).
:- end_object.

:- object('#2141',instantiates(oriented_edge)).
	name('').
	edge_element('#2140').
	orientation(false).
:- end_object.

:- object('#2142',instantiates(oriented_edge)).
	name('').
	edge_element('#2125').
	orientation(true).
:- end_object.

:- object('#2143',instantiates(oriented_edge)).
	name('').
	edge_element('#1154').
	orientation(false).
:- end_object.

:- object('#2148',instantiates(oriented_edge)).
	name('').
	edge_element('#2147').
	orientation(false).
:- end_object.

:- object('#2163',instantiates(oriented_edge)).
	name('').
	edge_element('#2162').
	orientation(false).
:- end_object.

:- object('#2164',instantiates(oriented_edge)).
	name('').
	edge_element('#2147').
	orientation(true).
:- end_object.

:- object('#2165',instantiates(oriented_edge)).
	name('').
	edge_element('#1147').
	orientation(false).
:- end_object.

:- object('#2170',instantiates(oriented_edge)).
	name('').
	edge_element('#2169').
	orientation(false).
:- end_object.

:- object('#2185',instantiates(oriented_edge)).
	name('').
	edge_element('#2184').
	orientation(false).
:- end_object.

:- object('#2186',instantiates(oriented_edge)).
	name('').
	edge_element('#2169').
	orientation(true).
:- end_object.

:- object('#2187',instantiates(oriented_edge)).
	name('').
	edge_element('#1140').
	orientation(false).
:- end_object.

:- object('#2192',instantiates(oriented_edge)).
	name('').
	edge_element('#2191').
	orientation(false).
:- end_object.

:- object('#2207',instantiates(oriented_edge)).
	name('').
	edge_element('#2206').
	orientation(false).
:- end_object.

:- object('#2208',instantiates(oriented_edge)).
	name('').
	edge_element('#2191').
	orientation(true).
:- end_object.

:- object('#2209',instantiates(oriented_edge)).
	name('').
	edge_element('#1133').
	orientation(false).
:- end_object.

:- object('#2214',instantiates(oriented_edge)).
	name('').
	edge_element('#2213').
	orientation(false).
:- end_object.

:- object('#2229',instantiates(oriented_edge)).
	name('').
	edge_element('#2228').
	orientation(false).
:- end_object.

:- object('#2230',instantiates(oriented_edge)).
	name('').
	edge_element('#2213').
	orientation(true).
:- end_object.

:- object('#2231',instantiates(oriented_edge)).
	name('').
	edge_element('#1126').
	orientation(false).
:- end_object.

:- object('#2236',instantiates(oriented_edge)).
	name('').
	edge_element('#2235').
	orientation(false).
:- end_object.

:- object('#2251',instantiates(oriented_edge)).
	name('').
	edge_element('#2250').
	orientation(false).
:- end_object.

:- object('#2252',instantiates(oriented_edge)).
	name('').
	edge_element('#2235').
	orientation(true).
:- end_object.

:- object('#2253',instantiates(oriented_edge)).
	name('').
	edge_element('#1119').
	orientation(false).
:- end_object.

:- object('#2258',instantiates(oriented_edge)).
	name('').
	edge_element('#2257').
	orientation(false).
:- end_object.

:- object('#2273',instantiates(oriented_edge)).
	name('').
	edge_element('#2272').
	orientation(false).
:- end_object.

:- object('#2274',instantiates(oriented_edge)).
	name('').
	edge_element('#2257').
	orientation(true).
:- end_object.

:- object('#2275',instantiates(oriented_edge)).
	name('').
	edge_element('#1112').
	orientation(false).
:- end_object.

:- object('#2280',instantiates(oriented_edge)).
	name('').
	edge_element('#2279').
	orientation(false).
:- end_object.

:- object('#2295',instantiates(oriented_edge)).
	name('').
	edge_element('#2294').
	orientation(false).
:- end_object.

:- object('#2296',instantiates(oriented_edge)).
	name('').
	edge_element('#2279').
	orientation(true).
:- end_object.

:- object('#2297',instantiates(oriented_edge)).
	name('').
	edge_element('#1105').
	orientation(false).
:- end_object.

:- object('#2302',instantiates(oriented_edge)).
	name('').
	edge_element('#2301').
	orientation(false).
:- end_object.

:- object('#2317',instantiates(oriented_edge)).
	name('').
	edge_element('#2316').
	orientation(false).
:- end_object.

:- object('#2318',instantiates(oriented_edge)).
	name('').
	edge_element('#2301').
	orientation(true).
:- end_object.

:- object('#2319',instantiates(oriented_edge)).
	name('').
	edge_element('#1098').
	orientation(false).
:- end_object.

:- object('#2324',instantiates(oriented_edge)).
	name('').
	edge_element('#2323').
	orientation(false).
:- end_object.

:- object('#2339',instantiates(oriented_edge)).
	name('').
	edge_element('#2338').
	orientation(false).
:- end_object.

:- object('#2340',instantiates(oriented_edge)).
	name('').
	edge_element('#2323').
	orientation(true).
:- end_object.

:- object('#2341',instantiates(oriented_edge)).
	name('').
	edge_element('#1091').
	orientation(false).
:- end_object.

:- object('#2346',instantiates(oriented_edge)).
	name('').
	edge_element('#2345').
	orientation(false).
:- end_object.

:- object('#2361',instantiates(oriented_edge)).
	name('').
	edge_element('#2360').
	orientation(false).
:- end_object.

:- object('#2362',instantiates(oriented_edge)).
	name('').
	edge_element('#2345').
	orientation(true).
:- end_object.

:- object('#2363',instantiates(oriented_edge)).
	name('').
	edge_element('#1084').
	orientation(false).
:- end_object.

:- object('#2368',instantiates(oriented_edge)).
	name('').
	edge_element('#2367').
	orientation(false).
:- end_object.

:- object('#2383',instantiates(oriented_edge)).
	name('').
	edge_element('#2382').
	orientation(false).
:- end_object.

:- object('#2384',instantiates(oriented_edge)).
	name('').
	edge_element('#2367').
	orientation(true).
:- end_object.

:- object('#2385',instantiates(oriented_edge)).
	name('').
	edge_element('#1077').
	orientation(false).
:- end_object.

:- object('#2390',instantiates(oriented_edge)).
	name('').
	edge_element('#2389').
	orientation(false).
:- end_object.

:- object('#2405',instantiates(oriented_edge)).
	name('').
	edge_element('#2404').
	orientation(false).
:- end_object.

:- object('#2406',instantiates(oriented_edge)).
	name('').
	edge_element('#2389').
	orientation(true).
:- end_object.

:- object('#2407',instantiates(oriented_edge)).
	name('').
	edge_element('#1070').
	orientation(false).
:- end_object.

:- object('#2412',instantiates(oriented_edge)).
	name('').
	edge_element('#2411').
	orientation(false).
:- end_object.

:- object('#2427',instantiates(oriented_edge)).
	name('').
	edge_element('#2426').
	orientation(false).
:- end_object.

:- object('#2428',instantiates(oriented_edge)).
	name('').
	edge_element('#2411').
	orientation(true).
:- end_object.

:- object('#2429',instantiates(oriented_edge)).
	name('').
	edge_element('#1063').
	orientation(false).
:- end_object.

:- object('#2434',instantiates(oriented_edge)).
	name('').
	edge_element('#2433').
	orientation(false).
:- end_object.

:- object('#2449',instantiates(oriented_edge)).
	name('').
	edge_element('#2448').
	orientation(false).
:- end_object.

:- object('#2450',instantiates(oriented_edge)).
	name('').
	edge_element('#2433').
	orientation(true).
:- end_object.

:- object('#2451',instantiates(oriented_edge)).
	name('').
	edge_element('#1056').
	orientation(false).
:- end_object.

:- object('#2456',instantiates(oriented_edge)).
	name('').
	edge_element('#2455').
	orientation(false).
:- end_object.

:- object('#2471',instantiates(oriented_edge)).
	name('').
	edge_element('#2470').
	orientation(false).
:- end_object.

:- object('#2472',instantiates(oriented_edge)).
	name('').
	edge_element('#2455').
	orientation(true).
:- end_object.

:- object('#2473',instantiates(oriented_edge)).
	name('').
	edge_element('#1049').
	orientation(false).
:- end_object.

:- object('#2478',instantiates(oriented_edge)).
	name('').
	edge_element('#2477').
	orientation(false).
:- end_object.

:- object('#2493',instantiates(oriented_edge)).
	name('').
	edge_element('#2492').
	orientation(false).
:- end_object.

:- object('#2494',instantiates(oriented_edge)).
	name('').
	edge_element('#2477').
	orientation(true).
:- end_object.

:- object('#2495',instantiates(oriented_edge)).
	name('').
	edge_element('#1042').
	orientation(false).
:- end_object.

:- object('#2500',instantiates(oriented_edge)).
	name('').
	edge_element('#2499').
	orientation(false).
:- end_object.

:- object('#2515',instantiates(oriented_edge)).
	name('').
	edge_element('#2514').
	orientation(false).
:- end_object.

:- object('#2516',instantiates(oriented_edge)).
	name('').
	edge_element('#2499').
	orientation(true).
:- end_object.

:- object('#2517',instantiates(oriented_edge)).
	name('').
	edge_element('#1035').
	orientation(false).
:- end_object.

:- object('#2522',instantiates(oriented_edge)).
	name('').
	edge_element('#2521').
	orientation(false).
:- end_object.

:- object('#2537',instantiates(oriented_edge)).
	name('').
	edge_element('#2536').
	orientation(false).
:- end_object.

:- object('#2538',instantiates(oriented_edge)).
	name('').
	edge_element('#2521').
	orientation(true).
:- end_object.

:- object('#2539',instantiates(oriented_edge)).
	name('').
	edge_element('#1028').
	orientation(false).
:- end_object.

:- object('#2544',instantiates(oriented_edge)).
	name('').
	edge_element('#2543').
	orientation(false).
:- end_object.

:- object('#2559',instantiates(oriented_edge)).
	name('').
	edge_element('#2558').
	orientation(false).
:- end_object.

:- object('#2560',instantiates(oriented_edge)).
	name('').
	edge_element('#2543').
	orientation(true).
:- end_object.

:- object('#2561',instantiates(oriented_edge)).
	name('').
	edge_element('#1021').
	orientation(false).
:- end_object.

:- object('#2566',instantiates(oriented_edge)).
	name('').
	edge_element('#2565').
	orientation(false).
:- end_object.

:- object('#2581',instantiates(oriented_edge)).
	name('').
	edge_element('#2580').
	orientation(false).
:- end_object.

:- object('#2582',instantiates(oriented_edge)).
	name('').
	edge_element('#2565').
	orientation(true).
:- end_object.

:- object('#2583',instantiates(oriented_edge)).
	name('').
	edge_element('#1014').
	orientation(false).
:- end_object.

:- object('#2588',instantiates(oriented_edge)).
	name('').
	edge_element('#2587').
	orientation(false).
:- end_object.

:- object('#2603',instantiates(oriented_edge)).
	name('').
	edge_element('#2602').
	orientation(false).
:- end_object.

:- object('#2604',instantiates(oriented_edge)).
	name('').
	edge_element('#2587').
	orientation(true).
:- end_object.

:- object('#2605',instantiates(oriented_edge)).
	name('').
	edge_element('#1007').
	orientation(false).
:- end_object.

:- object('#2610',instantiates(oriented_edge)).
	name('').
	edge_element('#2609').
	orientation(false).
:- end_object.

:- object('#2625',instantiates(oriented_edge)).
	name('').
	edge_element('#2624').
	orientation(false).
:- end_object.

:- object('#2626',instantiates(oriented_edge)).
	name('').
	edge_element('#2609').
	orientation(true).
:- end_object.

:- object('#2627',instantiates(oriented_edge)).
	name('').
	edge_element('#1000').
	orientation(false).
:- end_object.

:- object('#2632',instantiates(oriented_edge)).
	name('').
	edge_element('#2631').
	orientation(false).
:- end_object.

:- object('#2647',instantiates(oriented_edge)).
	name('').
	edge_element('#2646').
	orientation(false).
:- end_object.

:- object('#2648',instantiates(oriented_edge)).
	name('').
	edge_element('#2631').
	orientation(true).
:- end_object.

:- object('#2649',instantiates(oriented_edge)).
	name('').
	edge_element('#993').
	orientation(false).
:- end_object.

:- object('#2654',instantiates(oriented_edge)).
	name('').
	edge_element('#2653').
	orientation(false).
:- end_object.

:- object('#2669',instantiates(oriented_edge)).
	name('').
	edge_element('#2668').
	orientation(false).
:- end_object.

:- object('#2670',instantiates(oriented_edge)).
	name('').
	edge_element('#2653').
	orientation(true).
:- end_object.

:- object('#2671',instantiates(oriented_edge)).
	name('').
	edge_element('#986').
	orientation(false).
:- end_object.

:- object('#2676',instantiates(oriented_edge)).
	name('').
	edge_element('#2675').
	orientation(false).
:- end_object.

:- object('#2691',instantiates(oriented_edge)).
	name('').
	edge_element('#2690').
	orientation(false).
:- end_object.

:- object('#2692',instantiates(oriented_edge)).
	name('').
	edge_element('#2675').
	orientation(true).
:- end_object.

:- object('#2693',instantiates(oriented_edge)).
	name('').
	edge_element('#979').
	orientation(false).
:- end_object.

:- object('#2698',instantiates(oriented_edge)).
	name('').
	edge_element('#2697').
	orientation(false).
:- end_object.

:- object('#2713',instantiates(oriented_edge)).
	name('').
	edge_element('#2712').
	orientation(false).
:- end_object.

:- object('#2714',instantiates(oriented_edge)).
	name('').
	edge_element('#2697').
	orientation(true).
:- end_object.

:- object('#2715',instantiates(oriented_edge)).
	name('').
	edge_element('#972').
	orientation(false).
:- end_object.

:- object('#2720',instantiates(oriented_edge)).
	name('').
	edge_element('#2719').
	orientation(false).
:- end_object.

:- object('#2735',instantiates(oriented_edge)).
	name('').
	edge_element('#2734').
	orientation(false).
:- end_object.

:- object('#2736',instantiates(oriented_edge)).
	name('').
	edge_element('#2719').
	orientation(true).
:- end_object.

:- object('#2737',instantiates(oriented_edge)).
	name('').
	edge_element('#965').
	orientation(false).
:- end_object.

:- object('#2742',instantiates(oriented_edge)).
	name('').
	edge_element('#2741').
	orientation(false).
:- end_object.

:- object('#2757',instantiates(oriented_edge)).
	name('').
	edge_element('#2756').
	orientation(false).
:- end_object.

:- object('#2758',instantiates(oriented_edge)).
	name('').
	edge_element('#2741').
	orientation(true).
:- end_object.

:- object('#2759',instantiates(oriented_edge)).
	name('').
	edge_element('#958').
	orientation(false).
:- end_object.

:- object('#2764',instantiates(oriented_edge)).
	name('').
	edge_element('#2763').
	orientation(false).
:- end_object.

:- object('#2779',instantiates(oriented_edge)).
	name('').
	edge_element('#2778').
	orientation(false).
:- end_object.

:- object('#2780',instantiates(oriented_edge)).
	name('').
	edge_element('#2763').
	orientation(true).
:- end_object.

:- object('#2781',instantiates(oriented_edge)).
	name('').
	edge_element('#951').
	orientation(false).
:- end_object.

:- object('#2786',instantiates(oriented_edge)).
	name('').
	edge_element('#2785').
	orientation(false).
:- end_object.

:- object('#2801',instantiates(oriented_edge)).
	name('').
	edge_element('#2800').
	orientation(false).
:- end_object.

:- object('#2802',instantiates(oriented_edge)).
	name('').
	edge_element('#2785').
	orientation(true).
:- end_object.

:- object('#2803',instantiates(oriented_edge)).
	name('').
	edge_element('#944').
	orientation(false).
:- end_object.

:- object('#2808',instantiates(oriented_edge)).
	name('').
	edge_element('#2807').
	orientation(false).
:- end_object.

:- object('#2823',instantiates(oriented_edge)).
	name('').
	edge_element('#2822').
	orientation(false).
:- end_object.

:- object('#2824',instantiates(oriented_edge)).
	name('').
	edge_element('#2807').
	orientation(true).
:- end_object.

:- object('#2825',instantiates(oriented_edge)).
	name('').
	edge_element('#937').
	orientation(false).
:- end_object.

:- object('#2830',instantiates(oriented_edge)).
	name('').
	edge_element('#2829').
	orientation(false).
:- end_object.

:- object('#2845',instantiates(oriented_edge)).
	name('').
	edge_element('#2844').
	orientation(false).
:- end_object.

:- object('#2846',instantiates(oriented_edge)).
	name('').
	edge_element('#2829').
	orientation(true).
:- end_object.

:- object('#2847',instantiates(oriented_edge)).
	name('').
	edge_element('#930').
	orientation(false).
:- end_object.

:- object('#2852',instantiates(oriented_edge)).
	name('').
	edge_element('#2851').
	orientation(false).
:- end_object.

:- object('#2867',instantiates(oriented_edge)).
	name('').
	edge_element('#2866').
	orientation(false).
:- end_object.

:- object('#2868',instantiates(oriented_edge)).
	name('').
	edge_element('#2851').
	orientation(true).
:- end_object.

:- object('#2869',instantiates(oriented_edge)).
	name('').
	edge_element('#923').
	orientation(false).
:- end_object.

:- object('#2874',instantiates(oriented_edge)).
	name('').
	edge_element('#2873').
	orientation(false).
:- end_object.

:- object('#2889',instantiates(oriented_edge)).
	name('').
	edge_element('#2888').
	orientation(false).
:- end_object.

:- object('#2890',instantiates(oriented_edge)).
	name('').
	edge_element('#2873').
	orientation(true).
:- end_object.

:- object('#2891',instantiates(oriented_edge)).
	name('').
	edge_element('#916').
	orientation(false).
:- end_object.

:- object('#2896',instantiates(oriented_edge)).
	name('').
	edge_element('#2895').
	orientation(false).
:- end_object.

:- object('#2911',instantiates(oriented_edge)).
	name('').
	edge_element('#2910').
	orientation(false).
:- end_object.

:- object('#2912',instantiates(oriented_edge)).
	name('').
	edge_element('#2895').
	orientation(true).
:- end_object.

:- object('#2913',instantiates(oriented_edge)).
	name('').
	edge_element('#909').
	orientation(false).
:- end_object.

:- object('#2918',instantiates(oriented_edge)).
	name('').
	edge_element('#2917').
	orientation(false).
:- end_object.

:- object('#2933',instantiates(oriented_edge)).
	name('').
	edge_element('#2932').
	orientation(false).
:- end_object.

:- object('#2934',instantiates(oriented_edge)).
	name('').
	edge_element('#2917').
	orientation(true).
:- end_object.

:- object('#2935',instantiates(oriented_edge)).
	name('').
	edge_element('#902').
	orientation(false).
:- end_object.

:- object('#2940',instantiates(oriented_edge)).
	name('').
	edge_element('#2939').
	orientation(false).
:- end_object.

:- object('#2955',instantiates(oriented_edge)).
	name('').
	edge_element('#2954').
	orientation(false).
:- end_object.

:- object('#2956',instantiates(oriented_edge)).
	name('').
	edge_element('#2939').
	orientation(true).
:- end_object.

:- object('#2957',instantiates(oriented_edge)).
	name('').
	edge_element('#895').
	orientation(false).
:- end_object.

:- object('#2962',instantiates(oriented_edge)).
	name('').
	edge_element('#2961').
	orientation(false).
:- end_object.

:- object('#2977',instantiates(oriented_edge)).
	name('').
	edge_element('#2976').
	orientation(false).
:- end_object.

:- object('#2978',instantiates(oriented_edge)).
	name('').
	edge_element('#2961').
	orientation(true).
:- end_object.

:- object('#2979',instantiates(oriented_edge)).
	name('').
	edge_element('#888').
	orientation(false).
:- end_object.

:- object('#2984',instantiates(oriented_edge)).
	name('').
	edge_element('#2983').
	orientation(false).
:- end_object.

:- object('#2999',instantiates(oriented_edge)).
	name('').
	edge_element('#2998').
	orientation(false).
:- end_object.

:- object('#3000',instantiates(oriented_edge)).
	name('').
	edge_element('#2983').
	orientation(true).
:- end_object.

:- object('#3001',instantiates(oriented_edge)).
	name('').
	edge_element('#881').
	orientation(false).
:- end_object.

:- object('#3006',instantiates(oriented_edge)).
	name('').
	edge_element('#3005').
	orientation(false).
:- end_object.

:- object('#3021',instantiates(oriented_edge)).
	name('').
	edge_element('#3020').
	orientation(false).
:- end_object.

:- object('#3022',instantiates(oriented_edge)).
	name('').
	edge_element('#3005').
	orientation(true).
:- end_object.

:- object('#3023',instantiates(oriented_edge)).
	name('').
	edge_element('#874').
	orientation(false).
:- end_object.

:- object('#3028',instantiates(oriented_edge)).
	name('').
	edge_element('#3027').
	orientation(false).
:- end_object.

:- object('#3043',instantiates(oriented_edge)).
	name('').
	edge_element('#3042').
	orientation(false).
:- end_object.

:- object('#3044',instantiates(oriented_edge)).
	name('').
	edge_element('#3027').
	orientation(true).
:- end_object.

:- object('#3045',instantiates(oriented_edge)).
	name('').
	edge_element('#867').
	orientation(false).
:- end_object.

:- object('#3050',instantiates(oriented_edge)).
	name('').
	edge_element('#3049').
	orientation(false).
:- end_object.

:- object('#3065',instantiates(oriented_edge)).
	name('').
	edge_element('#3064').
	orientation(false).
:- end_object.

:- object('#3066',instantiates(oriented_edge)).
	name('').
	edge_element('#3049').
	orientation(true).
:- end_object.

:- object('#3067',instantiates(oriented_edge)).
	name('').
	edge_element('#860').
	orientation(false).
:- end_object.

:- object('#3072',instantiates(oriented_edge)).
	name('').
	edge_element('#3071').
	orientation(false).
:- end_object.

:- object('#3087',instantiates(oriented_edge)).
	name('').
	edge_element('#3086').
	orientation(false).
:- end_object.

:- object('#3088',instantiates(oriented_edge)).
	name('').
	edge_element('#3071').
	orientation(true).
:- end_object.

:- object('#3089',instantiates(oriented_edge)).
	name('').
	edge_element('#853').
	orientation(false).
:- end_object.

:- object('#3094',instantiates(oriented_edge)).
	name('').
	edge_element('#3093').
	orientation(false).
:- end_object.

:- object('#3109',instantiates(oriented_edge)).
	name('').
	edge_element('#3108').
	orientation(false).
:- end_object.

:- object('#3110',instantiates(oriented_edge)).
	name('').
	edge_element('#3093').
	orientation(true).
:- end_object.

:- object('#3111',instantiates(oriented_edge)).
	name('').
	edge_element('#846').
	orientation(false).
:- end_object.

:- object('#3116',instantiates(oriented_edge)).
	name('').
	edge_element('#3115').
	orientation(false).
:- end_object.

:- object('#3131',instantiates(oriented_edge)).
	name('').
	edge_element('#3130').
	orientation(false).
:- end_object.

:- object('#3132',instantiates(oriented_edge)).
	name('').
	edge_element('#3115').
	orientation(true).
:- end_object.

:- object('#3133',instantiates(oriented_edge)).
	name('').
	edge_element('#839').
	orientation(false).
:- end_object.

:- object('#3138',instantiates(oriented_edge)).
	name('').
	edge_element('#3137').
	orientation(false).
:- end_object.

:- object('#3153',instantiates(oriented_edge)).
	name('').
	edge_element('#3152').
	orientation(false).
:- end_object.

:- object('#3154',instantiates(oriented_edge)).
	name('').
	edge_element('#3137').
	orientation(true).
:- end_object.

:- object('#3155',instantiates(oriented_edge)).
	name('').
	edge_element('#832').
	orientation(false).
:- end_object.

:- object('#3160',instantiates(oriented_edge)).
	name('').
	edge_element('#3159').
	orientation(false).
:- end_object.

:- object('#3175',instantiates(oriented_edge)).
	name('').
	edge_element('#3174').
	orientation(false).
:- end_object.

:- object('#3176',instantiates(oriented_edge)).
	name('').
	edge_element('#3159').
	orientation(true).
:- end_object.

:- object('#3177',instantiates(oriented_edge)).
	name('').
	edge_element('#825').
	orientation(false).
:- end_object.

:- object('#3182',instantiates(oriented_edge)).
	name('').
	edge_element('#3181').
	orientation(false).
:- end_object.

:- object('#3197',instantiates(oriented_edge)).
	name('').
	edge_element('#3196').
	orientation(false).
:- end_object.

:- object('#3198',instantiates(oriented_edge)).
	name('').
	edge_element('#3181').
	orientation(true).
:- end_object.

:- object('#3199',instantiates(oriented_edge)).
	name('').
	edge_element('#818').
	orientation(false).
:- end_object.

:- object('#3204',instantiates(oriented_edge)).
	name('').
	edge_element('#3203').
	orientation(false).
:- end_object.

:- object('#3219',instantiates(oriented_edge)).
	name('').
	edge_element('#3218').
	orientation(false).
:- end_object.

:- object('#3220',instantiates(oriented_edge)).
	name('').
	edge_element('#3203').
	orientation(true).
:- end_object.

:- object('#3221',instantiates(oriented_edge)).
	name('').
	edge_element('#811').
	orientation(false).
:- end_object.

:- object('#3226',instantiates(oriented_edge)).
	name('').
	edge_element('#3225').
	orientation(false).
:- end_object.

:- object('#3241',instantiates(oriented_edge)).
	name('').
	edge_element('#3240').
	orientation(false).
:- end_object.

:- object('#3242',instantiates(oriented_edge)).
	name('').
	edge_element('#3225').
	orientation(true).
:- end_object.

:- object('#3243',instantiates(oriented_edge)).
	name('').
	edge_element('#804').
	orientation(false).
:- end_object.

:- object('#3248',instantiates(oriented_edge)).
	name('').
	edge_element('#3247').
	orientation(false).
:- end_object.

:- object('#3263',instantiates(oriented_edge)).
	name('').
	edge_element('#3262').
	orientation(false).
:- end_object.

:- object('#3264',instantiates(oriented_edge)).
	name('').
	edge_element('#3247').
	orientation(true).
:- end_object.

:- object('#3265',instantiates(oriented_edge)).
	name('').
	edge_element('#797').
	orientation(false).
:- end_object.

:- object('#3270',instantiates(oriented_edge)).
	name('').
	edge_element('#3269').
	orientation(false).
:- end_object.

:- object('#3285',instantiates(oriented_edge)).
	name('').
	edge_element('#3284').
	orientation(false).
:- end_object.

:- object('#3286',instantiates(oriented_edge)).
	name('').
	edge_element('#3269').
	orientation(true).
:- end_object.

:- object('#3287',instantiates(oriented_edge)).
	name('').
	edge_element('#790').
	orientation(false).
:- end_object.

:- object('#3292',instantiates(oriented_edge)).
	name('').
	edge_element('#3291').
	orientation(false).
:- end_object.

:- object('#3307',instantiates(oriented_edge)).
	name('').
	edge_element('#3306').
	orientation(false).
:- end_object.

:- object('#3308',instantiates(oriented_edge)).
	name('').
	edge_element('#3291').
	orientation(true).
:- end_object.

:- object('#3309',instantiates(oriented_edge)).
	name('').
	edge_element('#783').
	orientation(false).
:- end_object.

:- object('#3314',instantiates(oriented_edge)).
	name('').
	edge_element('#3313').
	orientation(false).
:- end_object.

:- object('#3329',instantiates(oriented_edge)).
	name('').
	edge_element('#3328').
	orientation(false).
:- end_object.

:- object('#3330',instantiates(oriented_edge)).
	name('').
	edge_element('#3313').
	orientation(true).
:- end_object.

:- object('#3331',instantiates(oriented_edge)).
	name('').
	edge_element('#776').
	orientation(false).
:- end_object.

:- object('#3336',instantiates(oriented_edge)).
	name('').
	edge_element('#3335').
	orientation(false).
:- end_object.

:- object('#3351',instantiates(oriented_edge)).
	name('').
	edge_element('#3350').
	orientation(false).
:- end_object.

:- object('#3352',instantiates(oriented_edge)).
	name('').
	edge_element('#3335').
	orientation(true).
:- end_object.

:- object('#3353',instantiates(oriented_edge)).
	name('').
	edge_element('#769').
	orientation(false).
:- end_object.

:- object('#3358',instantiates(oriented_edge)).
	name('').
	edge_element('#3357').
	orientation(false).
:- end_object.

:- object('#3373',instantiates(oriented_edge)).
	name('').
	edge_element('#3372').
	orientation(false).
:- end_object.

:- object('#3374',instantiates(oriented_edge)).
	name('').
	edge_element('#3357').
	orientation(true).
:- end_object.

:- object('#3375',instantiates(oriented_edge)).
	name('').
	edge_element('#762').
	orientation(false).
:- end_object.

:- object('#3380',instantiates(oriented_edge)).
	name('').
	edge_element('#3379').
	orientation(false).
:- end_object.

:- object('#3395',instantiates(oriented_edge)).
	name('').
	edge_element('#3394').
	orientation(false).
:- end_object.

:- object('#3396',instantiates(oriented_edge)).
	name('').
	edge_element('#3379').
	orientation(true).
:- end_object.

:- object('#3397',instantiates(oriented_edge)).
	name('').
	edge_element('#755').
	orientation(false).
:- end_object.

:- object('#3402',instantiates(oriented_edge)).
	name('').
	edge_element('#3401').
	orientation(false).
:- end_object.

:- object('#3417',instantiates(oriented_edge)).
	name('').
	edge_element('#3416').
	orientation(false).
:- end_object.

:- object('#3418',instantiates(oriented_edge)).
	name('').
	edge_element('#3401').
	orientation(true).
:- end_object.

:- object('#3419',instantiates(oriented_edge)).
	name('').
	edge_element('#748').
	orientation(false).
:- end_object.

:- object('#3424',instantiates(oriented_edge)).
	name('').
	edge_element('#3423').
	orientation(false).
:- end_object.

:- object('#3439',instantiates(oriented_edge)).
	name('').
	edge_element('#3438').
	orientation(false).
:- end_object.

:- object('#3440',instantiates(oriented_edge)).
	name('').
	edge_element('#3423').
	orientation(true).
:- end_object.

:- object('#3441',instantiates(oriented_edge)).
	name('').
	edge_element('#741').
	orientation(false).
:- end_object.

:- object('#3446',instantiates(oriented_edge)).
	name('').
	edge_element('#3445').
	orientation(false).
:- end_object.

:- object('#3461',instantiates(oriented_edge)).
	name('').
	edge_element('#3460').
	orientation(false).
:- end_object.

:- object('#3462',instantiates(oriented_edge)).
	name('').
	edge_element('#3445').
	orientation(true).
:- end_object.

:- object('#3463',instantiates(oriented_edge)).
	name('').
	edge_element('#734').
	orientation(false).
:- end_object.

:- object('#3468',instantiates(oriented_edge)).
	name('').
	edge_element('#3467').
	orientation(false).
:- end_object.

:- object('#3483',instantiates(oriented_edge)).
	name('').
	edge_element('#3482').
	orientation(false).
:- end_object.

:- object('#3484',instantiates(oriented_edge)).
	name('').
	edge_element('#3467').
	orientation(true).
:- end_object.

:- object('#3485',instantiates(oriented_edge)).
	name('').
	edge_element('#727').
	orientation(false).
:- end_object.

:- object('#3490',instantiates(oriented_edge)).
	name('').
	edge_element('#3489').
	orientation(false).
:- end_object.

:- object('#3505',instantiates(oriented_edge)).
	name('').
	edge_element('#3504').
	orientation(false).
:- end_object.

:- object('#3506',instantiates(oriented_edge)).
	name('').
	edge_element('#3489').
	orientation(true).
:- end_object.

:- object('#3507',instantiates(oriented_edge)).
	name('').
	edge_element('#720').
	orientation(false).
:- end_object.

:- object('#3512',instantiates(oriented_edge)).
	name('').
	edge_element('#3511').
	orientation(false).
:- end_object.

:- object('#3527',instantiates(oriented_edge)).
	name('').
	edge_element('#3526').
	orientation(false).
:- end_object.

:- object('#3528',instantiates(oriented_edge)).
	name('').
	edge_element('#3511').
	orientation(true).
:- end_object.

:- object('#3529',instantiates(oriented_edge)).
	name('').
	edge_element('#713').
	orientation(false).
:- end_object.

:- object('#3534',instantiates(oriented_edge)).
	name('').
	edge_element('#3533').
	orientation(false).
:- end_object.

:- object('#3549',instantiates(oriented_edge)).
	name('').
	edge_element('#3548').
	orientation(false).
:- end_object.

:- object('#3550',instantiates(oriented_edge)).
	name('').
	edge_element('#3533').
	orientation(true).
:- end_object.

:- object('#3551',instantiates(oriented_edge)).
	name('').
	edge_element('#706').
	orientation(false).
:- end_object.

:- object('#3556',instantiates(oriented_edge)).
	name('').
	edge_element('#3555').
	orientation(false).
:- end_object.

:- object('#3571',instantiates(oriented_edge)).
	name('').
	edge_element('#3570').
	orientation(false).
:- end_object.

:- object('#3572',instantiates(oriented_edge)).
	name('').
	edge_element('#3555').
	orientation(true).
:- end_object.

:- object('#3573',instantiates(oriented_edge)).
	name('').
	edge_element('#699').
	orientation(false).
:- end_object.

:- object('#3578',instantiates(oriented_edge)).
	name('').
	edge_element('#3577').
	orientation(false).
:- end_object.

:- object('#3593',instantiates(oriented_edge)).
	name('').
	edge_element('#3592').
	orientation(false).
:- end_object.

:- object('#3594',instantiates(oriented_edge)).
	name('').
	edge_element('#3577').
	orientation(true).
:- end_object.

:- object('#3595',instantiates(oriented_edge)).
	name('').
	edge_element('#692').
	orientation(false).
:- end_object.

:- object('#3600',instantiates(oriented_edge)).
	name('').
	edge_element('#3599').
	orientation(false).
:- end_object.

:- object('#3615',instantiates(oriented_edge)).
	name('').
	edge_element('#3614').
	orientation(false).
:- end_object.

:- object('#3616',instantiates(oriented_edge)).
	name('').
	edge_element('#3599').
	orientation(true).
:- end_object.

:- object('#3617',instantiates(oriented_edge)).
	name('').
	edge_element('#685').
	orientation(false).
:- end_object.

:- object('#3622',instantiates(oriented_edge)).
	name('').
	edge_element('#3621').
	orientation(false).
:- end_object.

:- object('#3637',instantiates(oriented_edge)).
	name('').
	edge_element('#3636').
	orientation(false).
:- end_object.

:- object('#3638',instantiates(oriented_edge)).
	name('').
	edge_element('#3621').
	orientation(true).
:- end_object.

:- object('#3639',instantiates(oriented_edge)).
	name('').
	edge_element('#678').
	orientation(false).
:- end_object.

:- object('#3644',instantiates(oriented_edge)).
	name('').
	edge_element('#3643').
	orientation(false).
:- end_object.

:- object('#3659',instantiates(oriented_edge)).
	name('').
	edge_element('#3658').
	orientation(false).
:- end_object.

:- object('#3660',instantiates(oriented_edge)).
	name('').
	edge_element('#3643').
	orientation(true).
:- end_object.

:- object('#3661',instantiates(oriented_edge)).
	name('').
	edge_element('#671').
	orientation(false).
:- end_object.

:- object('#3666',instantiates(oriented_edge)).
	name('').
	edge_element('#3665').
	orientation(false).
:- end_object.

:- object('#3681',instantiates(oriented_edge)).
	name('').
	edge_element('#3680').
	orientation(false).
:- end_object.

:- object('#3682',instantiates(oriented_edge)).
	name('').
	edge_element('#3665').
	orientation(true).
:- end_object.

:- object('#3683',instantiates(oriented_edge)).
	name('').
	edge_element('#664').
	orientation(false).
:- end_object.

:- object('#3688',instantiates(oriented_edge)).
	name('').
	edge_element('#3687').
	orientation(false).
:- end_object.

:- object('#3703',instantiates(oriented_edge)).
	name('').
	edge_element('#3702').
	orientation(false).
:- end_object.

:- object('#3704',instantiates(oriented_edge)).
	name('').
	edge_element('#3687').
	orientation(true).
:- end_object.

:- object('#3705',instantiates(oriented_edge)).
	name('').
	edge_element('#657').
	orientation(false).
:- end_object.

:- object('#3710',instantiates(oriented_edge)).
	name('').
	edge_element('#3709').
	orientation(false).
:- end_object.

:- object('#3725',instantiates(oriented_edge)).
	name('').
	edge_element('#3724').
	orientation(false).
:- end_object.

:- object('#3726',instantiates(oriented_edge)).
	name('').
	edge_element('#3709').
	orientation(true).
:- end_object.

:- object('#3727',instantiates(oriented_edge)).
	name('').
	edge_element('#650').
	orientation(false).
:- end_object.

:- object('#3732',instantiates(oriented_edge)).
	name('').
	edge_element('#3731').
	orientation(false).
:- end_object.

:- object('#3747',instantiates(oriented_edge)).
	name('').
	edge_element('#3746').
	orientation(false).
:- end_object.

:- object('#3748',instantiates(oriented_edge)).
	name('').
	edge_element('#3731').
	orientation(true).
:- end_object.

:- object('#3749',instantiates(oriented_edge)).
	name('').
	edge_element('#643').
	orientation(false).
:- end_object.

:- object('#3754',instantiates(oriented_edge)).
	name('').
	edge_element('#3753').
	orientation(false).
:- end_object.

:- object('#3769',instantiates(oriented_edge)).
	name('').
	edge_element('#3768').
	orientation(false).
:- end_object.

:- object('#3770',instantiates(oriented_edge)).
	name('').
	edge_element('#3753').
	orientation(true).
:- end_object.

:- object('#3771',instantiates(oriented_edge)).
	name('').
	edge_element('#636').
	orientation(false).
:- end_object.

:- object('#3776',instantiates(oriented_edge)).
	name('').
	edge_element('#3775').
	orientation(false).
:- end_object.

:- object('#3791',instantiates(oriented_edge)).
	name('').
	edge_element('#3790').
	orientation(false).
:- end_object.

:- object('#3792',instantiates(oriented_edge)).
	name('').
	edge_element('#3775').
	orientation(true).
:- end_object.

:- object('#3793',instantiates(oriented_edge)).
	name('').
	edge_element('#629').
	orientation(false).
:- end_object.

:- object('#3798',instantiates(oriented_edge)).
	name('').
	edge_element('#3797').
	orientation(false).
:- end_object.

:- object('#3813',instantiates(oriented_edge)).
	name('').
	edge_element('#3812').
	orientation(false).
:- end_object.

:- object('#3814',instantiates(oriented_edge)).
	name('').
	edge_element('#3797').
	orientation(true).
:- end_object.

:- object('#3815',instantiates(oriented_edge)).
	name('').
	edge_element('#622').
	orientation(false).
:- end_object.

:- object('#3820',instantiates(oriented_edge)).
	name('').
	edge_element('#3819').
	orientation(false).
:- end_object.

:- object('#3835',instantiates(oriented_edge)).
	name('').
	edge_element('#3834').
	orientation(false).
:- end_object.

:- object('#3836',instantiates(oriented_edge)).
	name('').
	edge_element('#3819').
	orientation(true).
:- end_object.

:- object('#3837',instantiates(oriented_edge)).
	name('').
	edge_element('#615').
	orientation(false).
:- end_object.

:- object('#3842',instantiates(oriented_edge)).
	name('').
	edge_element('#3841').
	orientation(false).
:- end_object.

:- object('#3857',instantiates(oriented_edge)).
	name('').
	edge_element('#3856').
	orientation(false).
:- end_object.

:- object('#3858',instantiates(oriented_edge)).
	name('').
	edge_element('#3841').
	orientation(true).
:- end_object.

:- object('#3859',instantiates(oriented_edge)).
	name('').
	edge_element('#608').
	orientation(false).
:- end_object.

:- object('#3864',instantiates(oriented_edge)).
	name('').
	edge_element('#3863').
	orientation(false).
:- end_object.

:- object('#3879',instantiates(oriented_edge)).
	name('').
	edge_element('#3878').
	orientation(false).
:- end_object.

:- object('#3880',instantiates(oriented_edge)).
	name('').
	edge_element('#3863').
	orientation(true).
:- end_object.

:- object('#3881',instantiates(oriented_edge)).
	name('').
	edge_element('#601').
	orientation(false).
:- end_object.

:- object('#3886',instantiates(oriented_edge)).
	name('').
	edge_element('#3885').
	orientation(false).
:- end_object.

:- object('#3901',instantiates(oriented_edge)).
	name('').
	edge_element('#3900').
	orientation(false).
:- end_object.

:- object('#3902',instantiates(oriented_edge)).
	name('').
	edge_element('#3885').
	orientation(true).
:- end_object.

:- object('#3903',instantiates(oriented_edge)).
	name('').
	edge_element('#594').
	orientation(false).
:- end_object.

:- object('#3908',instantiates(oriented_edge)).
	name('').
	edge_element('#3907').
	orientation(false).
:- end_object.

:- object('#3923',instantiates(oriented_edge)).
	name('').
	edge_element('#3922').
	orientation(true).
:- end_object.

:- object('#3924',instantiates(oriented_edge)).
	name('').
	edge_element('#3907').
	orientation(true).
:- end_object.

:- object('#3925',instantiates(oriented_edge)).
	name('').
	edge_element('#587').
	orientation(true).
:- end_object.

:- object('#3930',instantiates(oriented_edge)).
	name('').
	edge_element('#3929').
	orientation(true).
:- end_object.

:- object('#3943',instantiates(oriented_edge)).
	name('').
	edge_element('#3942').
	orientation(false).
:- end_object.

:- object('#3944',instantiates(oriented_edge)).
	name('').
	edge_element('#3929').
	orientation(false).
:- end_object.

:- object('#3945',instantiates(oriented_edge)).
	name('').
	edge_element('#1390').
	orientation(false).
:- end_object.

:- object('#3946',instantiates(oriented_edge)).
	name('').
	edge_element('#1415').
	orientation(false).
:- end_object.

:- object('#3955',instantiates(oriented_edge)).
	name('').
	edge_element('#3942').
	orientation(true).
:- end_object.

:- object('#3956',instantiates(oriented_edge)).
	name('').
	edge_element('#1410').
	orientation(true).
:- end_object.

:- object('#3957',instantiates(oriented_edge)).
	name('').
	edge_element('#1436').
	orientation(true).
:- end_object.

:- object('#3958',instantiates(oriented_edge)).
	name('').
	edge_element('#1458').
	orientation(true).
:- end_object.

:- object('#3959',instantiates(oriented_edge)).
	name('').
	edge_element('#1480').
	orientation(true).
:- end_object.

:- object('#3960',instantiates(oriented_edge)).
	name('').
	edge_element('#1502').
	orientation(true).
:- end_object.

:- object('#3961',instantiates(oriented_edge)).
	name('').
	edge_element('#1524').
	orientation(true).
:- end_object.

:- object('#3962',instantiates(oriented_edge)).
	name('').
	edge_element('#1546').
	orientation(true).
:- end_object.

:- object('#3963',instantiates(oriented_edge)).
	name('').
	edge_element('#1568').
	orientation(true).
:- end_object.

:- object('#3964',instantiates(oriented_edge)).
	name('').
	edge_element('#1590').
	orientation(true).
:- end_object.

:- object('#3965',instantiates(oriented_edge)).
	name('').
	edge_element('#1612').
	orientation(true).
:- end_object.

:- object('#3966',instantiates(oriented_edge)).
	name('').
	edge_element('#1634').
	orientation(true).
:- end_object.

:- object('#3967',instantiates(oriented_edge)).
	name('').
	edge_element('#1656').
	orientation(true).
:- end_object.

:- object('#3968',instantiates(oriented_edge)).
	name('').
	edge_element('#1678').
	orientation(true).
:- end_object.

:- object('#3969',instantiates(oriented_edge)).
	name('').
	edge_element('#1700').
	orientation(true).
:- end_object.

:- object('#3970',instantiates(oriented_edge)).
	name('').
	edge_element('#1722').
	orientation(true).
:- end_object.

:- object('#3971',instantiates(oriented_edge)).
	name('').
	edge_element('#1744').
	orientation(true).
:- end_object.

:- object('#3972',instantiates(oriented_edge)).
	name('').
	edge_element('#1766').
	orientation(true).
:- end_object.

:- object('#3973',instantiates(oriented_edge)).
	name('').
	edge_element('#1788').
	orientation(true).
:- end_object.

:- object('#3974',instantiates(oriented_edge)).
	name('').
	edge_element('#1810').
	orientation(true).
:- end_object.

:- object('#3975',instantiates(oriented_edge)).
	name('').
	edge_element('#1832').
	orientation(true).
:- end_object.

:- object('#3976',instantiates(oriented_edge)).
	name('').
	edge_element('#1854').
	orientation(true).
:- end_object.

:- object('#3977',instantiates(oriented_edge)).
	name('').
	edge_element('#1876').
	orientation(true).
:- end_object.

:- object('#3978',instantiates(oriented_edge)).
	name('').
	edge_element('#1898').
	orientation(true).
:- end_object.

:- object('#3979',instantiates(oriented_edge)).
	name('').
	edge_element('#1920').
	orientation(true).
:- end_object.

:- object('#3980',instantiates(oriented_edge)).
	name('').
	edge_element('#1942').
	orientation(true).
:- end_object.

:- object('#3981',instantiates(oriented_edge)).
	name('').
	edge_element('#1964').
	orientation(true).
:- end_object.

:- object('#3982',instantiates(oriented_edge)).
	name('').
	edge_element('#1986').
	orientation(true).
:- end_object.

:- object('#3983',instantiates(oriented_edge)).
	name('').
	edge_element('#2008').
	orientation(true).
:- end_object.

:- object('#3984',instantiates(oriented_edge)).
	name('').
	edge_element('#2030').
	orientation(true).
:- end_object.

:- object('#3985',instantiates(oriented_edge)).
	name('').
	edge_element('#2052').
	orientation(true).
:- end_object.

:- object('#3986',instantiates(oriented_edge)).
	name('').
	edge_element('#2074').
	orientation(true).
:- end_object.

:- object('#3987',instantiates(oriented_edge)).
	name('').
	edge_element('#2096').
	orientation(true).
:- end_object.

:- object('#3988',instantiates(oriented_edge)).
	name('').
	edge_element('#2118').
	orientation(true).
:- end_object.

:- object('#3989',instantiates(oriented_edge)).
	name('').
	edge_element('#2140').
	orientation(true).
:- end_object.

:- object('#3990',instantiates(oriented_edge)).
	name('').
	edge_element('#2162').
	orientation(true).
:- end_object.

:- object('#3991',instantiates(oriented_edge)).
	name('').
	edge_element('#2184').
	orientation(true).
:- end_object.

:- object('#3992',instantiates(oriented_edge)).
	name('').
	edge_element('#2206').
	orientation(true).
:- end_object.

:- object('#3993',instantiates(oriented_edge)).
	name('').
	edge_element('#2228').
	orientation(true).
:- end_object.

:- object('#3994',instantiates(oriented_edge)).
	name('').
	edge_element('#2250').
	orientation(true).
:- end_object.

:- object('#3995',instantiates(oriented_edge)).
	name('').
	edge_element('#2272').
	orientation(true).
:- end_object.

:- object('#3996',instantiates(oriented_edge)).
	name('').
	edge_element('#2294').
	orientation(true).
:- end_object.

:- object('#3997',instantiates(oriented_edge)).
	name('').
	edge_element('#2316').
	orientation(true).
:- end_object.

:- object('#3998',instantiates(oriented_edge)).
	name('').
	edge_element('#2338').
	orientation(true).
:- end_object.

:- object('#3999',instantiates(oriented_edge)).
	name('').
	edge_element('#2360').
	orientation(true).
:- end_object.

:- object('#4000',instantiates(oriented_edge)).
	name('').
	edge_element('#2382').
	orientation(true).
:- end_object.

:- object('#4001',instantiates(oriented_edge)).
	name('').
	edge_element('#2404').
	orientation(true).
:- end_object.

:- object('#4002',instantiates(oriented_edge)).
	name('').
	edge_element('#2426').
	orientation(true).
:- end_object.

:- object('#4003',instantiates(oriented_edge)).
	name('').
	edge_element('#2448').
	orientation(true).
:- end_object.

:- object('#4004',instantiates(oriented_edge)).
	name('').
	edge_element('#2470').
	orientation(true).
:- end_object.

:- object('#4005',instantiates(oriented_edge)).
	name('').
	edge_element('#2492').
	orientation(true).
:- end_object.

:- object('#4006',instantiates(oriented_edge)).
	name('').
	edge_element('#2514').
	orientation(true).
:- end_object.

:- object('#4007',instantiates(oriented_edge)).
	name('').
	edge_element('#2536').
	orientation(true).
:- end_object.

:- object('#4008',instantiates(oriented_edge)).
	name('').
	edge_element('#2558').
	orientation(true).
:- end_object.

:- object('#4009',instantiates(oriented_edge)).
	name('').
	edge_element('#2580').
	orientation(true).
:- end_object.

:- object('#4010',instantiates(oriented_edge)).
	name('').
	edge_element('#2602').
	orientation(true).
:- end_object.

:- object('#4011',instantiates(oriented_edge)).
	name('').
	edge_element('#2624').
	orientation(true).
:- end_object.

:- object('#4012',instantiates(oriented_edge)).
	name('').
	edge_element('#2646').
	orientation(true).
:- end_object.

:- object('#4013',instantiates(oriented_edge)).
	name('').
	edge_element('#2668').
	orientation(true).
:- end_object.

:- object('#4014',instantiates(oriented_edge)).
	name('').
	edge_element('#2690').
	orientation(true).
:- end_object.

:- object('#4015',instantiates(oriented_edge)).
	name('').
	edge_element('#2712').
	orientation(true).
:- end_object.

:- object('#4016',instantiates(oriented_edge)).
	name('').
	edge_element('#2734').
	orientation(true).
:- end_object.

:- object('#4017',instantiates(oriented_edge)).
	name('').
	edge_element('#2756').
	orientation(true).
:- end_object.

:- object('#4018',instantiates(oriented_edge)).
	name('').
	edge_element('#2778').
	orientation(true).
:- end_object.

:- object('#4019',instantiates(oriented_edge)).
	name('').
	edge_element('#2800').
	orientation(true).
:- end_object.

:- object('#4020',instantiates(oriented_edge)).
	name('').
	edge_element('#2822').
	orientation(true).
:- end_object.

:- object('#4021',instantiates(oriented_edge)).
	name('').
	edge_element('#2844').
	orientation(true).
:- end_object.

:- object('#4022',instantiates(oriented_edge)).
	name('').
	edge_element('#2866').
	orientation(true).
:- end_object.

:- object('#4023',instantiates(oriented_edge)).
	name('').
	edge_element('#2888').
	orientation(true).
:- end_object.

:- object('#4024',instantiates(oriented_edge)).
	name('').
	edge_element('#2910').
	orientation(true).
:- end_object.

:- object('#4025',instantiates(oriented_edge)).
	name('').
	edge_element('#2932').
	orientation(true).
:- end_object.

:- object('#4026',instantiates(oriented_edge)).
	name('').
	edge_element('#2954').
	orientation(true).
:- end_object.

:- object('#4027',instantiates(oriented_edge)).
	name('').
	edge_element('#2976').
	orientation(true).
:- end_object.

:- object('#4028',instantiates(oriented_edge)).
	name('').
	edge_element('#2998').
	orientation(true).
:- end_object.

:- object('#4029',instantiates(oriented_edge)).
	name('').
	edge_element('#3020').
	orientation(true).
:- end_object.

:- object('#4030',instantiates(oriented_edge)).
	name('').
	edge_element('#3042').
	orientation(true).
:- end_object.

:- object('#4031',instantiates(oriented_edge)).
	name('').
	edge_element('#3064').
	orientation(true).
:- end_object.

:- object('#4032',instantiates(oriented_edge)).
	name('').
	edge_element('#3086').
	orientation(true).
:- end_object.

:- object('#4033',instantiates(oriented_edge)).
	name('').
	edge_element('#3108').
	orientation(true).
:- end_object.

:- object('#4034',instantiates(oriented_edge)).
	name('').
	edge_element('#3130').
	orientation(true).
:- end_object.

:- object('#4035',instantiates(oriented_edge)).
	name('').
	edge_element('#3152').
	orientation(true).
:- end_object.

:- object('#4036',instantiates(oriented_edge)).
	name('').
	edge_element('#3174').
	orientation(true).
:- end_object.

:- object('#4037',instantiates(oriented_edge)).
	name('').
	edge_element('#3196').
	orientation(true).
:- end_object.

:- object('#4038',instantiates(oriented_edge)).
	name('').
	edge_element('#3218').
	orientation(true).
:- end_object.

:- object('#4039',instantiates(oriented_edge)).
	name('').
	edge_element('#3240').
	orientation(true).
:- end_object.

:- object('#4040',instantiates(oriented_edge)).
	name('').
	edge_element('#3262').
	orientation(true).
:- end_object.

:- object('#4041',instantiates(oriented_edge)).
	name('').
	edge_element('#3284').
	orientation(true).
:- end_object.

:- object('#4042',instantiates(oriented_edge)).
	name('').
	edge_element('#3306').
	orientation(true).
:- end_object.

:- object('#4043',instantiates(oriented_edge)).
	name('').
	edge_element('#3328').
	orientation(true).
:- end_object.

:- object('#4044',instantiates(oriented_edge)).
	name('').
	edge_element('#3350').
	orientation(true).
:- end_object.

:- object('#4045',instantiates(oriented_edge)).
	name('').
	edge_element('#3372').
	orientation(true).
:- end_object.

:- object('#4046',instantiates(oriented_edge)).
	name('').
	edge_element('#3394').
	orientation(true).
:- end_object.

:- object('#4047',instantiates(oriented_edge)).
	name('').
	edge_element('#3416').
	orientation(true).
:- end_object.

:- object('#4048',instantiates(oriented_edge)).
	name('').
	edge_element('#3438').
	orientation(true).
:- end_object.

:- object('#4049',instantiates(oriented_edge)).
	name('').
	edge_element('#3460').
	orientation(true).
:- end_object.

:- object('#4050',instantiates(oriented_edge)).
	name('').
	edge_element('#3482').
	orientation(true).
:- end_object.

:- object('#4051',instantiates(oriented_edge)).
	name('').
	edge_element('#3504').
	orientation(true).
:- end_object.

:- object('#4052',instantiates(oriented_edge)).
	name('').
	edge_element('#3526').
	orientation(true).
:- end_object.

:- object('#4053',instantiates(oriented_edge)).
	name('').
	edge_element('#3548').
	orientation(true).
:- end_object.

:- object('#4054',instantiates(oriented_edge)).
	name('').
	edge_element('#3570').
	orientation(true).
:- end_object.

:- object('#4055',instantiates(oriented_edge)).
	name('').
	edge_element('#3592').
	orientation(true).
:- end_object.

:- object('#4056',instantiates(oriented_edge)).
	name('').
	edge_element('#3614').
	orientation(true).
:- end_object.

:- object('#4057',instantiates(oriented_edge)).
	name('').
	edge_element('#3636').
	orientation(true).
:- end_object.

:- object('#4058',instantiates(oriented_edge)).
	name('').
	edge_element('#3658').
	orientation(true).
:- end_object.

:- object('#4059',instantiates(oriented_edge)).
	name('').
	edge_element('#3680').
	orientation(true).
:- end_object.

:- object('#4060',instantiates(oriented_edge)).
	name('').
	edge_element('#3702').
	orientation(true).
:- end_object.

:- object('#4061',instantiates(oriented_edge)).
	name('').
	edge_element('#3724').
	orientation(true).
:- end_object.

:- object('#4062',instantiates(oriented_edge)).
	name('').
	edge_element('#3746').
	orientation(true).
:- end_object.

:- object('#4063',instantiates(oriented_edge)).
	name('').
	edge_element('#3768').
	orientation(true).
:- end_object.

:- object('#4064',instantiates(oriented_edge)).
	name('').
	edge_element('#3790').
	orientation(true).
:- end_object.

:- object('#4065',instantiates(oriented_edge)).
	name('').
	edge_element('#3812').
	orientation(true).
:- end_object.

:- object('#4066',instantiates(oriented_edge)).
	name('').
	edge_element('#3834').
	orientation(true).
:- end_object.

:- object('#4067',instantiates(oriented_edge)).
	name('').
	edge_element('#3856').
	orientation(true).
:- end_object.

:- object('#4068',instantiates(oriented_edge)).
	name('').
	edge_element('#3878').
	orientation(true).
:- end_object.

:- object('#4069',instantiates(oriented_edge)).
	name('').
	edge_element('#3900').
	orientation(true).
:- end_object.

:- object('#4070',instantiates(oriented_edge)).
	name('').
	edge_element('#3922').
	orientation(false).
:- end_object.

:- object('#4073',instantiates(oriented_edge)).
	name('').
	edge_element('#266').
	orientation(true).
:- end_object.

:- object('#4076',instantiates(oriented_edge)).
	name('').
	edge_element('#337').
	orientation(true).
:- end_object.

:- object('#4077',instantiates(oriented_edge)).
	name('').
	edge_element('#304').
	orientation(true).
:- end_object.

:- object('#4078',instantiates(oriented_edge)).
	name('').
	edge_element('#479').
	orientation(true).
:- end_object.

:- object('#4079',instantiates(oriented_edge)).
	name('').
	edge_element('#447').
	orientation(true).
:- end_object.

:- object('#4080',instantiates(oriented_edge)).
	name('').
	edge_element('#398').
	orientation(true).
:- end_object.

:- object('#4083',instantiates(oriented_edge)).
	name('').
	edge_element('#188').
	orientation(true).
:- end_object.

:- object('#146',instantiates(edge_loop)).
	name('').
	edge_list(['#145']).
:- end_object.

:- object('#197',instantiates(edge_loop)).
	name('').
	edge_list(['#189','#194','#195','#196']).
:- end_object.

:- object('#224',instantiates(edge_loop)).
	name('').
	edge_list(['#223']).
:- end_object.

:- object('#275',instantiates(edge_loop)).
	name('').
	edge_list(['#267','#272','#273','#274']).
:- end_object.

:- object('#311',instantiates(edge_loop)).
	name('').
	edge_list(['#291','#298','#305','#310']).
:- end_object.

:- object('#339',instantiates(edge_loop)).
	name('').
	edge_list(['#327','#332','#333','#338']).
:- end_object.

:- object('#400',instantiates(edge_loop)).
	name('').
	edge_list(['#364','#379','#386','#399']).
:- end_object.

:- object('#467',instantiates(edge_loop)).
	name('').
	edge_list(['#433','#448','#449','#466']).
:- end_object.

:- object('#487',instantiates(edge_loop)).
	name('').
	edge_list(['#475','#480','#481','#486']).
:- end_object.

:- object('#514',instantiates(edge_loop)).
	name('').
	edge_list(['#513']).
:- end_object.

:- object('#521',instantiates(edge_loop)).
	name('').
	edge_list(['#516','#517','#518','#519','#520']).
:- end_object.

:- object('#572',instantiates(edge_loop)).
	name('').
	edge_list(['#564','#569','#570','#571']).
:- end_object.

:- object('#1392',instantiates(edge_loop)).
	name('').
	edge_list(['#588','#595','#602','#609','#616','#623','#630','#637','#644','#651','#658','#665','#672','#679','#686','#693','#700','#707','#714','#721','#728','#735','#742','#749','#756','#763','#770','#777','#784','#791','#798','#805','#812','#819','#826','#833','#840','#847','#854','#861','#868','#875','#882','#889','#896','#903','#910','#917','#924','#931','#938','#945','#952','#959','#966','#973','#980','#987','#994','#1001','#1008','#1015','#1022','#1029','#1036','#1043','#1050','#1057','#1064','#1071','#1078','#1085','#1092','#1099','#1106','#1113','#1120','#1127','#1134','#1141','#1148','#1155','#1162','#1169','#1176','#1183','#1190','#1197','#1204','#1211','#1218','#1225','#1232','#1239','#1246','#1253','#1260','#1267','#1274','#1281','#1288','#1295','#1302','#1309','#1316','#1323','#1330','#1337','#1344','#1351','#1358','#1365','#1372','#1379','#1386','#1391']).
:- end_object.

:- object('#1395',instantiates(edge_loop)).
	name('').
	edge_list(['#1394']).
:- end_object.

:- object('#1423',instantiates(edge_loop)).
	name('').
	edge_list(['#1411','#1416','#1417','#1422']).
:- end_object.

:- object('#1445',instantiates(edge_loop)).
	name('').
	edge_list(['#1437','#1438','#1439','#1444']).
:- end_object.

:- object('#1467',instantiates(edge_loop)).
	name('').
	edge_list(['#1459','#1460','#1461','#1466']).
:- end_object.

:- object('#1489',instantiates(edge_loop)).
	name('').
	edge_list(['#1481','#1482','#1483','#1488']).
:- end_object.

:- object('#1511',instantiates(edge_loop)).
	name('').
	edge_list(['#1503','#1504','#1505','#1510']).
:- end_object.

:- object('#1533',instantiates(edge_loop)).
	name('').
	edge_list(['#1525','#1526','#1527','#1532']).
:- end_object.

:- object('#1555',instantiates(edge_loop)).
	name('').
	edge_list(['#1547','#1548','#1549','#1554']).
:- end_object.

:- object('#1577',instantiates(edge_loop)).
	name('').
	edge_list(['#1569','#1570','#1571','#1576']).
:- end_object.

:- object('#1599',instantiates(edge_loop)).
	name('').
	edge_list(['#1591','#1592','#1593','#1598']).
:- end_object.

:- object('#1621',instantiates(edge_loop)).
	name('').
	edge_list(['#1613','#1614','#1615','#1620']).
:- end_object.

:- object('#1643',instantiates(edge_loop)).
	name('').
	edge_list(['#1635','#1636','#1637','#1642']).
:- end_object.

:- object('#1665',instantiates(edge_loop)).
	name('').
	edge_list(['#1657','#1658','#1659','#1664']).
:- end_object.

:- object('#1687',instantiates(edge_loop)).
	name('').
	edge_list(['#1679','#1680','#1681','#1686']).
:- end_object.

:- object('#1709',instantiates(edge_loop)).
	name('').
	edge_list(['#1701','#1702','#1703','#1708']).
:- end_object.

:- object('#1731',instantiates(edge_loop)).
	name('').
	edge_list(['#1723','#1724','#1725','#1730']).
:- end_object.

:- object('#1753',instantiates(edge_loop)).
	name('').
	edge_list(['#1745','#1746','#1747','#1752']).
:- end_object.

:- object('#1775',instantiates(edge_loop)).
	name('').
	edge_list(['#1767','#1768','#1769','#1774']).
:- end_object.

:- object('#1797',instantiates(edge_loop)).
	name('').
	edge_list(['#1789','#1790','#1791','#1796']).
:- end_object.

:- object('#1819',instantiates(edge_loop)).
	name('').
	edge_list(['#1811','#1812','#1813','#1818']).
:- end_object.

:- object('#1841',instantiates(edge_loop)).
	name('').
	edge_list(['#1833','#1834','#1835','#1840']).
:- end_object.

:- object('#1863',instantiates(edge_loop)).
	name('').
	edge_list(['#1855','#1856','#1857','#1862']).
:- end_object.

:- object('#1885',instantiates(edge_loop)).
	name('').
	edge_list(['#1877','#1878','#1879','#1884']).
:- end_object.

:- object('#1907',instantiates(edge_loop)).
	name('').
	edge_list(['#1899','#1900','#1901','#1906']).
:- end_object.

:- object('#1929',instantiates(edge_loop)).
	name('').
	edge_list(['#1921','#1922','#1923','#1928']).
:- end_object.

:- object('#1951',instantiates(edge_loop)).
	name('').
	edge_list(['#1943','#1944','#1945','#1950']).
:- end_object.

:- object('#1973',instantiates(edge_loop)).
	name('').
	edge_list(['#1965','#1966','#1967','#1972']).
:- end_object.

:- object('#1995',instantiates(edge_loop)).
	name('').
	edge_list(['#1987','#1988','#1989','#1994']).
:- end_object.

:- object('#2017',instantiates(edge_loop)).
	name('').
	edge_list(['#2009','#2010','#2011','#2016']).
:- end_object.

:- object('#2039',instantiates(edge_loop)).
	name('').
	edge_list(['#2031','#2032','#2033','#2038']).
:- end_object.

:- object('#2061',instantiates(edge_loop)).
	name('').
	edge_list(['#2053','#2054','#2055','#2060']).
:- end_object.

:- object('#2083',instantiates(edge_loop)).
	name('').
	edge_list(['#2075','#2076','#2077','#2082']).
:- end_object.

:- object('#2105',instantiates(edge_loop)).
	name('').
	edge_list(['#2097','#2098','#2099','#2104']).
:- end_object.

:- object('#2127',instantiates(edge_loop)).
	name('').
	edge_list(['#2119','#2120','#2121','#2126']).
:- end_object.

:- object('#2149',instantiates(edge_loop)).
	name('').
	edge_list(['#2141','#2142','#2143','#2148']).
:- end_object.

:- object('#2171',instantiates(edge_loop)).
	name('').
	edge_list(['#2163','#2164','#2165','#2170']).
:- end_object.

:- object('#2193',instantiates(edge_loop)).
	name('').
	edge_list(['#2185','#2186','#2187','#2192']).
:- end_object.

:- object('#2215',instantiates(edge_loop)).
	name('').
	edge_list(['#2207','#2208','#2209','#2214']).
:- end_object.

:- object('#2237',instantiates(edge_loop)).
	name('').
	edge_list(['#2229','#2230','#2231','#2236']).
:- end_object.

:- object('#2259',instantiates(edge_loop)).
	name('').
	edge_list(['#2251','#2252','#2253','#2258']).
:- end_object.

:- object('#2281',instantiates(edge_loop)).
	name('').
	edge_list(['#2273','#2274','#2275','#2280']).
:- end_object.

:- object('#2303',instantiates(edge_loop)).
	name('').
	edge_list(['#2295','#2296','#2297','#2302']).
:- end_object.

:- object('#2325',instantiates(edge_loop)).
	name('').
	edge_list(['#2317','#2318','#2319','#2324']).
:- end_object.

:- object('#2347',instantiates(edge_loop)).
	name('').
	edge_list(['#2339','#2340','#2341','#2346']).
:- end_object.

:- object('#2369',instantiates(edge_loop)).
	name('').
	edge_list(['#2361','#2362','#2363','#2368']).
:- end_object.

:- object('#2391',instantiates(edge_loop)).
	name('').
	edge_list(['#2383','#2384','#2385','#2390']).
:- end_object.

:- object('#2413',instantiates(edge_loop)).
	name('').
	edge_list(['#2405','#2406','#2407','#2412']).
:- end_object.

:- object('#2435',instantiates(edge_loop)).
	name('').
	edge_list(['#2427','#2428','#2429','#2434']).
:- end_object.

:- object('#2457',instantiates(edge_loop)).
	name('').
	edge_list(['#2449','#2450','#2451','#2456']).
:- end_object.

:- object('#2479',instantiates(edge_loop)).
	name('').
	edge_list(['#2471','#2472','#2473','#2478']).
:- end_object.

:- object('#2501',instantiates(edge_loop)).
	name('').
	edge_list(['#2493','#2494','#2495','#2500']).
:- end_object.

:- object('#2523',instantiates(edge_loop)).
	name('').
	edge_list(['#2515','#2516','#2517','#2522']).
:- end_object.

:- object('#2545',instantiates(edge_loop)).
	name('').
	edge_list(['#2537','#2538','#2539','#2544']).
:- end_object.

:- object('#2567',instantiates(edge_loop)).
	name('').
	edge_list(['#2559','#2560','#2561','#2566']).
:- end_object.

:- object('#2589',instantiates(edge_loop)).
	name('').
	edge_list(['#2581','#2582','#2583','#2588']).
:- end_object.

:- object('#2611',instantiates(edge_loop)).
	name('').
	edge_list(['#2603','#2604','#2605','#2610']).
:- end_object.

:- object('#2633',instantiates(edge_loop)).
	name('').
	edge_list(['#2625','#2626','#2627','#2632']).
:- end_object.

:- object('#2655',instantiates(edge_loop)).
	name('').
	edge_list(['#2647','#2648','#2649','#2654']).
:- end_object.

:- object('#2677',instantiates(edge_loop)).
	name('').
	edge_list(['#2669','#2670','#2671','#2676']).
:- end_object.

:- object('#2699',instantiates(edge_loop)).
	name('').
	edge_list(['#2691','#2692','#2693','#2698']).
:- end_object.

:- object('#2721',instantiates(edge_loop)).
	name('').
	edge_list(['#2713','#2714','#2715','#2720']).
:- end_object.

:- object('#2743',instantiates(edge_loop)).
	name('').
	edge_list(['#2735','#2736','#2737','#2742']).
:- end_object.

:- object('#2765',instantiates(edge_loop)).
	name('').
	edge_list(['#2757','#2758','#2759','#2764']).
:- end_object.

:- object('#2787',instantiates(edge_loop)).
	name('').
	edge_list(['#2779','#2780','#2781','#2786']).
:- end_object.

:- object('#2809',instantiates(edge_loop)).
	name('').
	edge_list(['#2801','#2802','#2803','#2808']).
:- end_object.

:- object('#2831',instantiates(edge_loop)).
	name('').
	edge_list(['#2823','#2824','#2825','#2830']).
:- end_object.

:- object('#2853',instantiates(edge_loop)).
	name('').
	edge_list(['#2845','#2846','#2847','#2852']).
:- end_object.

:- object('#2875',instantiates(edge_loop)).
	name('').
	edge_list(['#2867','#2868','#2869','#2874']).
:- end_object.

:- object('#2897',instantiates(edge_loop)).
	name('').
	edge_list(['#2889','#2890','#2891','#2896']).
:- end_object.

:- object('#2919',instantiates(edge_loop)).
	name('').
	edge_list(['#2911','#2912','#2913','#2918']).
:- end_object.

:- object('#2941',instantiates(edge_loop)).
	name('').
	edge_list(['#2933','#2934','#2935','#2940']).
:- end_object.

:- object('#2963',instantiates(edge_loop)).
	name('').
	edge_list(['#2955','#2956','#2957','#2962']).
:- end_object.

:- object('#2985',instantiates(edge_loop)).
	name('').
	edge_list(['#2977','#2978','#2979','#2984']).
:- end_object.

:- object('#3007',instantiates(edge_loop)).
	name('').
	edge_list(['#2999','#3000','#3001','#3006']).
:- end_object.

:- object('#3029',instantiates(edge_loop)).
	name('').
	edge_list(['#3021','#3022','#3023','#3028']).
:- end_object.

:- object('#3051',instantiates(edge_loop)).
	name('').
	edge_list(['#3043','#3044','#3045','#3050']).
:- end_object.

:- object('#3073',instantiates(edge_loop)).
	name('').
	edge_list(['#3065','#3066','#3067','#3072']).
:- end_object.

:- object('#3095',instantiates(edge_loop)).
	name('').
	edge_list(['#3087','#3088','#3089','#3094']).
:- end_object.

:- object('#3117',instantiates(edge_loop)).
	name('').
	edge_list(['#3109','#3110','#3111','#3116']).
:- end_object.

:- object('#3139',instantiates(edge_loop)).
	name('').
	edge_list(['#3131','#3132','#3133','#3138']).
:- end_object.

:- object('#3161',instantiates(edge_loop)).
	name('').
	edge_list(['#3153','#3154','#3155','#3160']).
:- end_object.

:- object('#3183',instantiates(edge_loop)).
	name('').
	edge_list(['#3175','#3176','#3177','#3182']).
:- end_object.

:- object('#3205',instantiates(edge_loop)).
	name('').
	edge_list(['#3197','#3198','#3199','#3204']).
:- end_object.

:- object('#3227',instantiates(edge_loop)).
	name('').
	edge_list(['#3219','#3220','#3221','#3226']).
:- end_object.

:- object('#3249',instantiates(edge_loop)).
	name('').
	edge_list(['#3241','#3242','#3243','#3248']).
:- end_object.

:- object('#3271',instantiates(edge_loop)).
	name('').
	edge_list(['#3263','#3264','#3265','#3270']).
:- end_object.

:- object('#3293',instantiates(edge_loop)).
	name('').
	edge_list(['#3285','#3286','#3287','#3292']).
:- end_object.

:- object('#3315',instantiates(edge_loop)).
	name('').
	edge_list(['#3307','#3308','#3309','#3314']).
:- end_object.

:- object('#3337',instantiates(edge_loop)).
	name('').
	edge_list(['#3329','#3330','#3331','#3336']).
:- end_object.

:- object('#3359',instantiates(edge_loop)).
	name('').
	edge_list(['#3351','#3352','#3353','#3358']).
:- end_object.

:- object('#3381',instantiates(edge_loop)).
	name('').
	edge_list(['#3373','#3374','#3375','#3380']).
:- end_object.

:- object('#3403',instantiates(edge_loop)).
	name('').
	edge_list(['#3395','#3396','#3397','#3402']).
:- end_object.

:- object('#3425',instantiates(edge_loop)).
	name('').
	edge_list(['#3417','#3418','#3419','#3424']).
:- end_object.

:- object('#3447',instantiates(edge_loop)).
	name('').
	edge_list(['#3439','#3440','#3441','#3446']).
:- end_object.

:- object('#3469',instantiates(edge_loop)).
	name('').
	edge_list(['#3461','#3462','#3463','#3468']).
:- end_object.

:- object('#3491',instantiates(edge_loop)).
	name('').
	edge_list(['#3483','#3484','#3485','#3490']).
:- end_object.

:- object('#3513',instantiates(edge_loop)).
	name('').
	edge_list(['#3505','#3506','#3507','#3512']).
:- end_object.

:- object('#3535',instantiates(edge_loop)).
	name('').
	edge_list(['#3527','#3528','#3529','#3534']).
:- end_object.

:- object('#3557',instantiates(edge_loop)).
	name('').
	edge_list(['#3549','#3550','#3551','#3556']).
:- end_object.

:- object('#3579',instantiates(edge_loop)).
	name('').
	edge_list(['#3571','#3572','#3573','#3578']).
:- end_object.

:- object('#3601',instantiates(edge_loop)).
	name('').
	edge_list(['#3593','#3594','#3595','#3600']).
:- end_object.

:- object('#3623',instantiates(edge_loop)).
	name('').
	edge_list(['#3615','#3616','#3617','#3622']).
:- end_object.

:- object('#3645',instantiates(edge_loop)).
	name('').
	edge_list(['#3637','#3638','#3639','#3644']).
:- end_object.

:- object('#3667',instantiates(edge_loop)).
	name('').
	edge_list(['#3659','#3660','#3661','#3666']).
:- end_object.

:- object('#3689',instantiates(edge_loop)).
	name('').
	edge_list(['#3681','#3682','#3683','#3688']).
:- end_object.

:- object('#3711',instantiates(edge_loop)).
	name('').
	edge_list(['#3703','#3704','#3705','#3710']).
:- end_object.

:- object('#3733',instantiates(edge_loop)).
	name('').
	edge_list(['#3725','#3726','#3727','#3732']).
:- end_object.

:- object('#3755',instantiates(edge_loop)).
	name('').
	edge_list(['#3747','#3748','#3749','#3754']).
:- end_object.

:- object('#3777',instantiates(edge_loop)).
	name('').
	edge_list(['#3769','#3770','#3771','#3776']).
:- end_object.

:- object('#3799',instantiates(edge_loop)).
	name('').
	edge_list(['#3791','#3792','#3793','#3798']).
:- end_object.

:- object('#3821',instantiates(edge_loop)).
	name('').
	edge_list(['#3813','#3814','#3815','#3820']).
:- end_object.

:- object('#3843',instantiates(edge_loop)).
	name('').
	edge_list(['#3835','#3836','#3837','#3842']).
:- end_object.

:- object('#3865',instantiates(edge_loop)).
	name('').
	edge_list(['#3857','#3858','#3859','#3864']).
:- end_object.

:- object('#3887',instantiates(edge_loop)).
	name('').
	edge_list(['#3879','#3880','#3881','#3886']).
:- end_object.

:- object('#3909',instantiates(edge_loop)).
	name('').
	edge_list(['#3901','#3902','#3903','#3908']).
:- end_object.

:- object('#3931',instantiates(edge_loop)).
	name('').
	edge_list(['#3923','#3924','#3925','#3930']).
:- end_object.

:- object('#3947',instantiates(edge_loop)).
	name('').
	edge_list(['#3943','#3944','#3945','#3946']).
:- end_object.

:- object('#4071',instantiates(edge_loop)).
	name('').
	edge_list(['#3955','#3956','#3957','#3958','#3959','#3960','#3961','#3962','#3963','#3964','#3965','#3966','#3967','#3968','#3969','#3970','#3971','#3972','#3973','#3974','#3975','#3976','#3977','#3978','#3979','#3980','#3981','#3982','#3983','#3984','#3985','#3986','#3987','#3988','#3989','#3990','#3991','#3992','#3993','#3994','#3995','#3996','#3997','#3998','#3999','#4000','#4001','#4002','#4003','#4004','#4005','#4006','#4007','#4008','#4009','#4010','#4011','#4012','#4013','#4014','#4015','#4016','#4017','#4018','#4019','#4020','#4021','#4022','#4023','#4024','#4025','#4026','#4027','#4028','#4029','#4030','#4031','#4032','#4033','#4034','#4035','#4036','#4037','#4038','#4039','#4040','#4041','#4042','#4043','#4044','#4045','#4046','#4047','#4048','#4049','#4050','#4051','#4052','#4053','#4054','#4055','#4056','#4057','#4058','#4059','#4060','#4061','#4062','#4063','#4064','#4065','#4066','#4067','#4068','#4069','#4070']).
:- end_object.

:- object('#4074',instantiates(edge_loop)).
	name('').
	edge_list(['#4073']).
:- end_object.

:- object('#4081',instantiates(edge_loop)).
	name('').
	edge_list(['#4076','#4077','#4078','#4079','#4080']).
:- end_object.

:- object('#4084',instantiates(edge_loop)).
	name('').
	edge_list(['#4083']).
:- end_object.

:- object('#147',instantiates(face_outer_bound)).
	name('').
	bound('#146').
	orientation(true).
:- end_object.

:- object('#198',instantiates(face_outer_bound)).
	name('').
	bound('#197').
	orientation(true).
:- end_object.

:- object('#225',instantiates(face_outer_bound)).
	name('').
	bound('#224').
	orientation(true).
:- end_object.

:- object('#276',instantiates(face_outer_bound)).
	name('').
	bound('#275').
	orientation(true).
:- end_object.

:- object('#312',instantiates(face_outer_bound)).
	name('').
	bound('#311').
	orientation(true).
:- end_object.

:- object('#340',instantiates(face_outer_bound)).
	name('').
	bound('#339').
	orientation(true).
:- end_object.

:- object('#401',instantiates(face_outer_bound)).
	name('').
	bound('#400').
	orientation(false).
:- end_object.

:- object('#468',instantiates(face_outer_bound)).
	name('').
	bound('#467').
	orientation(false).
:- end_object.

:- object('#488',instantiates(face_outer_bound)).
	name('').
	bound('#487').
	orientation(true).
:- end_object.

:- object('#515',instantiates(face_outer_bound)).
	name('').
	bound('#514').
	orientation(true).
:- end_object.

:- object('#573',instantiates(face_outer_bound)).
	name('').
	bound('#572').
	orientation(true).
:- end_object.

:- object('#1393',instantiates(face_outer_bound)).
	name('').
	bound('#1392').
	orientation(true).
:- end_object.

:- object('#1424',instantiates(face_outer_bound)).
	name('').
	bound('#1423').
	orientation(true).
:- end_object.

:- object('#1446',instantiates(face_outer_bound)).
	name('').
	bound('#1445').
	orientation(true).
:- end_object.

:- object('#1468',instantiates(face_outer_bound)).
	name('').
	bound('#1467').
	orientation(true).
:- end_object.

:- object('#1490',instantiates(face_outer_bound)).
	name('').
	bound('#1489').
	orientation(true).
:- end_object.

:- object('#1512',instantiates(face_outer_bound)).
	name('').
	bound('#1511').
	orientation(true).
:- end_object.

:- object('#1534',instantiates(face_outer_bound)).
	name('').
	bound('#1533').
	orientation(true).
:- end_object.

:- object('#1556',instantiates(face_outer_bound)).
	name('').
	bound('#1555').
	orientation(true).
:- end_object.

:- object('#1578',instantiates(face_outer_bound)).
	name('').
	bound('#1577').
	orientation(true).
:- end_object.

:- object('#1600',instantiates(face_outer_bound)).
	name('').
	bound('#1599').
	orientation(true).
:- end_object.

:- object('#1622',instantiates(face_outer_bound)).
	name('').
	bound('#1621').
	orientation(true).
:- end_object.

:- object('#1644',instantiates(face_outer_bound)).
	name('').
	bound('#1643').
	orientation(true).
:- end_object.

:- object('#1666',instantiates(face_outer_bound)).
	name('').
	bound('#1665').
	orientation(true).
:- end_object.

:- object('#1688',instantiates(face_outer_bound)).
	name('').
	bound('#1687').
	orientation(true).
:- end_object.

:- object('#1710',instantiates(face_outer_bound)).
	name('').
	bound('#1709').
	orientation(true).
:- end_object.

:- object('#1732',instantiates(face_outer_bound)).
	name('').
	bound('#1731').
	orientation(true).
:- end_object.

:- object('#1754',instantiates(face_outer_bound)).
	name('').
	bound('#1753').
	orientation(true).
:- end_object.

:- object('#1776',instantiates(face_outer_bound)).
	name('').
	bound('#1775').
	orientation(true).
:- end_object.

:- object('#1798',instantiates(face_outer_bound)).
	name('').
	bound('#1797').
	orientation(true).
:- end_object.

:- object('#1820',instantiates(face_outer_bound)).
	name('').
	bound('#1819').
	orientation(true).
:- end_object.

:- object('#1842',instantiates(face_outer_bound)).
	name('').
	bound('#1841').
	orientation(true).
:- end_object.

:- object('#1864',instantiates(face_outer_bound)).
	name('').
	bound('#1863').
	orientation(true).
:- end_object.

:- object('#1886',instantiates(face_outer_bound)).
	name('').
	bound('#1885').
	orientation(true).
:- end_object.

:- object('#1908',instantiates(face_outer_bound)).
	name('').
	bound('#1907').
	orientation(true).
:- end_object.

:- object('#1930',instantiates(face_outer_bound)).
	name('').
	bound('#1929').
	orientation(true).
:- end_object.

:- object('#1952',instantiates(face_outer_bound)).
	name('').
	bound('#1951').
	orientation(true).
:- end_object.

:- object('#1974',instantiates(face_outer_bound)).
	name('').
	bound('#1973').
	orientation(true).
:- end_object.

:- object('#1996',instantiates(face_outer_bound)).
	name('').
	bound('#1995').
	orientation(true).
:- end_object.

:- object('#2018',instantiates(face_outer_bound)).
	name('').
	bound('#2017').
	orientation(true).
:- end_object.

:- object('#2040',instantiates(face_outer_bound)).
	name('').
	bound('#2039').
	orientation(true).
:- end_object.

:- object('#2062',instantiates(face_outer_bound)).
	name('').
	bound('#2061').
	orientation(true).
:- end_object.

:- object('#2084',instantiates(face_outer_bound)).
	name('').
	bound('#2083').
	orientation(true).
:- end_object.

:- object('#2106',instantiates(face_outer_bound)).
	name('').
	bound('#2105').
	orientation(true).
:- end_object.

:- object('#2128',instantiates(face_outer_bound)).
	name('').
	bound('#2127').
	orientation(true).
:- end_object.

:- object('#2150',instantiates(face_outer_bound)).
	name('').
	bound('#2149').
	orientation(true).
:- end_object.

:- object('#2172',instantiates(face_outer_bound)).
	name('').
	bound('#2171').
	orientation(true).
:- end_object.

:- object('#2194',instantiates(face_outer_bound)).
	name('').
	bound('#2193').
	orientation(true).
:- end_object.

:- object('#2216',instantiates(face_outer_bound)).
	name('').
	bound('#2215').
	orientation(true).
:- end_object.

:- object('#2238',instantiates(face_outer_bound)).
	name('').
	bound('#2237').
	orientation(true).
:- end_object.

:- object('#2260',instantiates(face_outer_bound)).
	name('').
	bound('#2259').
	orientation(true).
:- end_object.

:- object('#2282',instantiates(face_outer_bound)).
	name('').
	bound('#2281').
	orientation(true).
:- end_object.

:- object('#2304',instantiates(face_outer_bound)).
	name('').
	bound('#2303').
	orientation(true).
:- end_object.

:- object('#2326',instantiates(face_outer_bound)).
	name('').
	bound('#2325').
	orientation(true).
:- end_object.

:- object('#2348',instantiates(face_outer_bound)).
	name('').
	bound('#2347').
	orientation(true).
:- end_object.

:- object('#2370',instantiates(face_outer_bound)).
	name('').
	bound('#2369').
	orientation(true).
:- end_object.

:- object('#2392',instantiates(face_outer_bound)).
	name('').
	bound('#2391').
	orientation(true).
:- end_object.

:- object('#2414',instantiates(face_outer_bound)).
	name('').
	bound('#2413').
	orientation(true).
:- end_object.

:- object('#2436',instantiates(face_outer_bound)).
	name('').
	bound('#2435').
	orientation(true).
:- end_object.

:- object('#2458',instantiates(face_outer_bound)).
	name('').
	bound('#2457').
	orientation(true).
:- end_object.

:- object('#2480',instantiates(face_outer_bound)).
	name('').
	bound('#2479').
	orientation(true).
:- end_object.

:- object('#2502',instantiates(face_outer_bound)).
	name('').
	bound('#2501').
	orientation(true).
:- end_object.

:- object('#2524',instantiates(face_outer_bound)).
	name('').
	bound('#2523').
	orientation(true).
:- end_object.

:- object('#2546',instantiates(face_outer_bound)).
	name('').
	bound('#2545').
	orientation(true).
:- end_object.

:- object('#2568',instantiates(face_outer_bound)).
	name('').
	bound('#2567').
	orientation(true).
:- end_object.

:- object('#2590',instantiates(face_outer_bound)).
	name('').
	bound('#2589').
	orientation(true).
:- end_object.

:- object('#2612',instantiates(face_outer_bound)).
	name('').
	bound('#2611').
	orientation(true).
:- end_object.

:- object('#2634',instantiates(face_outer_bound)).
	name('').
	bound('#2633').
	orientation(true).
:- end_object.

:- object('#2656',instantiates(face_outer_bound)).
	name('').
	bound('#2655').
	orientation(true).
:- end_object.

:- object('#2678',instantiates(face_outer_bound)).
	name('').
	bound('#2677').
	orientation(true).
:- end_object.

:- object('#2700',instantiates(face_outer_bound)).
	name('').
	bound('#2699').
	orientation(true).
:- end_object.

:- object('#2722',instantiates(face_outer_bound)).
	name('').
	bound('#2721').
	orientation(true).
:- end_object.

:- object('#2744',instantiates(face_outer_bound)).
	name('').
	bound('#2743').
	orientation(true).
:- end_object.

:- object('#2766',instantiates(face_outer_bound)).
	name('').
	bound('#2765').
	orientation(true).
:- end_object.

:- object('#2788',instantiates(face_outer_bound)).
	name('').
	bound('#2787').
	orientation(true).
:- end_object.

:- object('#2810',instantiates(face_outer_bound)).
	name('').
	bound('#2809').
	orientation(true).
:- end_object.

:- object('#2832',instantiates(face_outer_bound)).
	name('').
	bound('#2831').
	orientation(true).
:- end_object.

:- object('#2854',instantiates(face_outer_bound)).
	name('').
	bound('#2853').
	orientation(true).
:- end_object.

:- object('#2876',instantiates(face_outer_bound)).
	name('').
	bound('#2875').
	orientation(true).
:- end_object.

:- object('#2898',instantiates(face_outer_bound)).
	name('').
	bound('#2897').
	orientation(true).
:- end_object.

:- object('#2920',instantiates(face_outer_bound)).
	name('').
	bound('#2919').
	orientation(true).
:- end_object.

:- object('#2942',instantiates(face_outer_bound)).
	name('').
	bound('#2941').
	orientation(true).
:- end_object.

:- object('#2964',instantiates(face_outer_bound)).
	name('').
	bound('#2963').
	orientation(true).
:- end_object.

:- object('#2986',instantiates(face_outer_bound)).
	name('').
	bound('#2985').
	orientation(true).
:- end_object.

:- object('#3008',instantiates(face_outer_bound)).
	name('').
	bound('#3007').
	orientation(true).
:- end_object.

:- object('#3030',instantiates(face_outer_bound)).
	name('').
	bound('#3029').
	orientation(true).
:- end_object.

:- object('#3052',instantiates(face_outer_bound)).
	name('').
	bound('#3051').
	orientation(true).
:- end_object.

:- object('#3074',instantiates(face_outer_bound)).
	name('').
	bound('#3073').
	orientation(true).
:- end_object.

:- object('#3096',instantiates(face_outer_bound)).
	name('').
	bound('#3095').
	orientation(true).
:- end_object.

:- object('#3118',instantiates(face_outer_bound)).
	name('').
	bound('#3117').
	orientation(true).
:- end_object.

:- object('#3140',instantiates(face_outer_bound)).
	name('').
	bound('#3139').
	orientation(true).
:- end_object.

:- object('#3162',instantiates(face_outer_bound)).
	name('').
	bound('#3161').
	orientation(true).
:- end_object.

:- object('#3184',instantiates(face_outer_bound)).
	name('').
	bound('#3183').
	orientation(true).
:- end_object.

:- object('#3206',instantiates(face_outer_bound)).
	name('').
	bound('#3205').
	orientation(true).
:- end_object.

:- object('#3228',instantiates(face_outer_bound)).
	name('').
	bound('#3227').
	orientation(true).
:- end_object.

:- object('#3250',instantiates(face_outer_bound)).
	name('').
	bound('#3249').
	orientation(true).
:- end_object.

:- object('#3272',instantiates(face_outer_bound)).
	name('').
	bound('#3271').
	orientation(true).
:- end_object.

:- object('#3294',instantiates(face_outer_bound)).
	name('').
	bound('#3293').
	orientation(true).
:- end_object.

:- object('#3316',instantiates(face_outer_bound)).
	name('').
	bound('#3315').
	orientation(true).
:- end_object.

:- object('#3338',instantiates(face_outer_bound)).
	name('').
	bound('#3337').
	orientation(true).
:- end_object.

:- object('#3360',instantiates(face_outer_bound)).
	name('').
	bound('#3359').
	orientation(true).
:- end_object.

:- object('#3382',instantiates(face_outer_bound)).
	name('').
	bound('#3381').
	orientation(true).
:- end_object.

:- object('#3404',instantiates(face_outer_bound)).
	name('').
	bound('#3403').
	orientation(true).
:- end_object.

:- object('#3426',instantiates(face_outer_bound)).
	name('').
	bound('#3425').
	orientation(true).
:- end_object.

:- object('#3448',instantiates(face_outer_bound)).
	name('').
	bound('#3447').
	orientation(true).
:- end_object.

:- object('#3470',instantiates(face_outer_bound)).
	name('').
	bound('#3469').
	orientation(true).
:- end_object.

:- object('#3492',instantiates(face_outer_bound)).
	name('').
	bound('#3491').
	orientation(true).
:- end_object.

:- object('#3514',instantiates(face_outer_bound)).
	name('').
	bound('#3513').
	orientation(true).
:- end_object.

:- object('#3536',instantiates(face_outer_bound)).
	name('').
	bound('#3535').
	orientation(true).
:- end_object.

:- object('#3558',instantiates(face_outer_bound)).
	name('').
	bound('#3557').
	orientation(true).
:- end_object.

:- object('#3580',instantiates(face_outer_bound)).
	name('').
	bound('#3579').
	orientation(true).
:- end_object.

:- object('#3602',instantiates(face_outer_bound)).
	name('').
	bound('#3601').
	orientation(true).
:- end_object.

:- object('#3624',instantiates(face_outer_bound)).
	name('').
	bound('#3623').
	orientation(true).
:- end_object.

:- object('#3646',instantiates(face_outer_bound)).
	name('').
	bound('#3645').
	orientation(true).
:- end_object.

:- object('#3668',instantiates(face_outer_bound)).
	name('').
	bound('#3667').
	orientation(true).
:- end_object.

:- object('#3690',instantiates(face_outer_bound)).
	name('').
	bound('#3689').
	orientation(true).
:- end_object.

:- object('#3712',instantiates(face_outer_bound)).
	name('').
	bound('#3711').
	orientation(true).
:- end_object.

:- object('#3734',instantiates(face_outer_bound)).
	name('').
	bound('#3733').
	orientation(true).
:- end_object.

:- object('#3756',instantiates(face_outer_bound)).
	name('').
	bound('#3755').
	orientation(true).
:- end_object.

:- object('#3778',instantiates(face_outer_bound)).
	name('').
	bound('#3777').
	orientation(true).
:- end_object.

:- object('#3800',instantiates(face_outer_bound)).
	name('').
	bound('#3799').
	orientation(true).
:- end_object.

:- object('#3822',instantiates(face_outer_bound)).
	name('').
	bound('#3821').
	orientation(true).
:- end_object.

:- object('#3844',instantiates(face_outer_bound)).
	name('').
	bound('#3843').
	orientation(true).
:- end_object.

:- object('#3866',instantiates(face_outer_bound)).
	name('').
	bound('#3865').
	orientation(true).
:- end_object.

:- object('#3888',instantiates(face_outer_bound)).
	name('').
	bound('#3887').
	orientation(true).
:- end_object.

:- object('#3910',instantiates(face_outer_bound)).
	name('').
	bound('#3909').
	orientation(true).
:- end_object.

:- object('#3932',instantiates(face_outer_bound)).
	name('').
	bound('#3931').
	orientation(true).
:- end_object.

:- object('#3948',instantiates(face_outer_bound)).
	name('').
	bound('#3947').
	orientation(true).
:- end_object.

:- object('#4072',instantiates(face_outer_bound)).
	name('').
	bound('#4071').
	orientation(true).
:- end_object.

:- object('#148',instantiates(advanced_face)).
	name('').
	bounds(['#147']).
	face_geometry('#126').
	same_sense(true).
:- end_object.

:- object('#199',instantiates(advanced_face)).
	name('').
	bounds(['#198']).
	face_geometry('#170').
	same_sense(true).
:- end_object.

:- object('#226',instantiates(advanced_face)).
	name('').
	bounds(['#225']).
	face_geometry('#204').
	same_sense(true).
:- end_object.

:- object('#277',instantiates(advanced_face)).
	name('').
	bounds(['#276']).
	face_geometry('#248').
	same_sense(true).
:- end_object.

:- object('#313',instantiates(advanced_face)).
	name('').
	bounds(['#312']).
	face_geometry('#282').
	same_sense(true).
:- end_object.

:- object('#341',instantiates(advanced_face)).
	name('').
	bounds(['#340']).
	face_geometry('#318').
	same_sense(true).
:- end_object.

:- object('#402',instantiates(advanced_face)).
	name('').
	bounds(['#401']).
	face_geometry('#363').
	same_sense(false).
:- end_object.

:- object('#469',instantiates(advanced_face)).
	name('').
	bounds(['#468']).
	face_geometry('#424').
	same_sense(false).
:- end_object.

:- object('#489',instantiates(advanced_face)).
	name('').
	bounds(['#488']).
	face_geometry('#474').
	same_sense(true).
:- end_object.

:- object('#523',instantiates(advanced_face)).
	name('').
	bounds(['#515','#522']).
	face_geometry('#494').
	same_sense(true).
:- end_object.

:- object('#574',instantiates(advanced_face)).
	name('').
	bounds(['#573']).
	face_geometry('#545').
	same_sense(true).
:- end_object.

:- object('#1397',instantiates(advanced_face)).
	name('').
	bounds(['#1393','#1396']).
	face_geometry('#579').
	same_sense(true).
:- end_object.

:- object('#1425',instantiates(advanced_face)).
	name('').
	bounds(['#1424']).
	face_geometry('#1402').
	same_sense(true).
:- end_object.

:- object('#1447',instantiates(advanced_face)).
	name('').
	bounds(['#1446']).
	face_geometry('#1430').
	same_sense(true).
:- end_object.

:- object('#1469',instantiates(advanced_face)).
	name('').
	bounds(['#1468']).
	face_geometry('#1452').
	same_sense(true).
:- end_object.

:- object('#1491',instantiates(advanced_face)).
	name('').
	bounds(['#1490']).
	face_geometry('#1474').
	same_sense(true).
:- end_object.

:- object('#1513',instantiates(advanced_face)).
	name('').
	bounds(['#1512']).
	face_geometry('#1496').
	same_sense(true).
:- end_object.

:- object('#1535',instantiates(advanced_face)).
	name('').
	bounds(['#1534']).
	face_geometry('#1518').
	same_sense(true).
:- end_object.

:- object('#1557',instantiates(advanced_face)).
	name('').
	bounds(['#1556']).
	face_geometry('#1540').
	same_sense(true).
:- end_object.

:- object('#1579',instantiates(advanced_face)).
	name('').
	bounds(['#1578']).
	face_geometry('#1562').
	same_sense(true).
:- end_object.

:- object('#1601',instantiates(advanced_face)).
	name('').
	bounds(['#1600']).
	face_geometry('#1584').
	same_sense(true).
:- end_object.

:- object('#1623',instantiates(advanced_face)).
	name('').
	bounds(['#1622']).
	face_geometry('#1606').
	same_sense(true).
:- end_object.

:- object('#1645',instantiates(advanced_face)).
	name('').
	bounds(['#1644']).
	face_geometry('#1628').
	same_sense(true).
:- end_object.

:- object('#1667',instantiates(advanced_face)).
	name('').
	bounds(['#1666']).
	face_geometry('#1650').
	same_sense(true).
:- end_object.

:- object('#1689',instantiates(advanced_face)).
	name('').
	bounds(['#1688']).
	face_geometry('#1672').
	same_sense(true).
:- end_object.

:- object('#1711',instantiates(advanced_face)).
	name('').
	bounds(['#1710']).
	face_geometry('#1694').
	same_sense(true).
:- end_object.

:- object('#1733',instantiates(advanced_face)).
	name('').
	bounds(['#1732']).
	face_geometry('#1716').
	same_sense(true).
:- end_object.

:- object('#1755',instantiates(advanced_face)).
	name('').
	bounds(['#1754']).
	face_geometry('#1738').
	same_sense(true).
:- end_object.

:- object('#1777',instantiates(advanced_face)).
	name('').
	bounds(['#1776']).
	face_geometry('#1760').
	same_sense(true).
:- end_object.

:- object('#1799',instantiates(advanced_face)).
	name('').
	bounds(['#1798']).
	face_geometry('#1782').
	same_sense(true).
:- end_object.

:- object('#1821',instantiates(advanced_face)).
	name('').
	bounds(['#1820']).
	face_geometry('#1804').
	same_sense(true).
:- end_object.

:- object('#1843',instantiates(advanced_face)).
	name('').
	bounds(['#1842']).
	face_geometry('#1826').
	same_sense(true).
:- end_object.

:- object('#1865',instantiates(advanced_face)).
	name('').
	bounds(['#1864']).
	face_geometry('#1848').
	same_sense(true).
:- end_object.

:- object('#1887',instantiates(advanced_face)).
	name('').
	bounds(['#1886']).
	face_geometry('#1870').
	same_sense(true).
:- end_object.

:- object('#1909',instantiates(advanced_face)).
	name('').
	bounds(['#1908']).
	face_geometry('#1892').
	same_sense(true).
:- end_object.

:- object('#1931',instantiates(advanced_face)).
	name('').
	bounds(['#1930']).
	face_geometry('#1914').
	same_sense(true).
:- end_object.

:- object('#1953',instantiates(advanced_face)).
	name('').
	bounds(['#1952']).
	face_geometry('#1936').
	same_sense(true).
:- end_object.

:- object('#1975',instantiates(advanced_face)).
	name('').
	bounds(['#1974']).
	face_geometry('#1958').
	same_sense(true).
:- end_object.

:- object('#1997',instantiates(advanced_face)).
	name('').
	bounds(['#1996']).
	face_geometry('#1980').
	same_sense(true).
:- end_object.

:- object('#2019',instantiates(advanced_face)).
	name('').
	bounds(['#2018']).
	face_geometry('#2002').
	same_sense(true).
:- end_object.

:- object('#2041',instantiates(advanced_face)).
	name('').
	bounds(['#2040']).
	face_geometry('#2024').
	same_sense(true).
:- end_object.

:- object('#2063',instantiates(advanced_face)).
	name('').
	bounds(['#2062']).
	face_geometry('#2046').
	same_sense(true).
:- end_object.

:- object('#2085',instantiates(advanced_face)).
	name('').
	bounds(['#2084']).
	face_geometry('#2068').
	same_sense(true).
:- end_object.

:- object('#2107',instantiates(advanced_face)).
	name('').
	bounds(['#2106']).
	face_geometry('#2090').
	same_sense(true).
:- end_object.

:- object('#2129',instantiates(advanced_face)).
	name('').
	bounds(['#2128']).
	face_geometry('#2112').
	same_sense(true).
:- end_object.

:- object('#2151',instantiates(advanced_face)).
	name('').
	bounds(['#2150']).
	face_geometry('#2134').
	same_sense(true).
:- end_object.

:- object('#2173',instantiates(advanced_face)).
	name('').
	bounds(['#2172']).
	face_geometry('#2156').
	same_sense(true).
:- end_object.

:- object('#2195',instantiates(advanced_face)).
	name('').
	bounds(['#2194']).
	face_geometry('#2178').
	same_sense(true).
:- end_object.

:- object('#2217',instantiates(advanced_face)).
	name('').
	bounds(['#2216']).
	face_geometry('#2200').
	same_sense(true).
:- end_object.

:- object('#2239',instantiates(advanced_face)).
	name('').
	bounds(['#2238']).
	face_geometry('#2222').
	same_sense(true).
:- end_object.

:- object('#2261',instantiates(advanced_face)).
	name('').
	bounds(['#2260']).
	face_geometry('#2244').
	same_sense(true).
:- end_object.

:- object('#2283',instantiates(advanced_face)).
	name('').
	bounds(['#2282']).
	face_geometry('#2266').
	same_sense(true).
:- end_object.

:- object('#2305',instantiates(advanced_face)).
	name('').
	bounds(['#2304']).
	face_geometry('#2288').
	same_sense(true).
:- end_object.

:- object('#2327',instantiates(advanced_face)).
	name('').
	bounds(['#2326']).
	face_geometry('#2310').
	same_sense(true).
:- end_object.

:- object('#2349',instantiates(advanced_face)).
	name('').
	bounds(['#2348']).
	face_geometry('#2332').
	same_sense(true).
:- end_object.

:- object('#2371',instantiates(advanced_face)).
	name('').
	bounds(['#2370']).
	face_geometry('#2354').
	same_sense(true).
:- end_object.

:- object('#2393',instantiates(advanced_face)).
	name('').
	bounds(['#2392']).
	face_geometry('#2376').
	same_sense(true).
:- end_object.

:- object('#2415',instantiates(advanced_face)).
	name('').
	bounds(['#2414']).
	face_geometry('#2398').
	same_sense(true).
:- end_object.

:- object('#2437',instantiates(advanced_face)).
	name('').
	bounds(['#2436']).
	face_geometry('#2420').
	same_sense(true).
:- end_object.

:- object('#2459',instantiates(advanced_face)).
	name('').
	bounds(['#2458']).
	face_geometry('#2442').
	same_sense(true).
:- end_object.

:- object('#2481',instantiates(advanced_face)).
	name('').
	bounds(['#2480']).
	face_geometry('#2464').
	same_sense(true).
:- end_object.

:- object('#2503',instantiates(advanced_face)).
	name('').
	bounds(['#2502']).
	face_geometry('#2486').
	same_sense(true).
:- end_object.

:- object('#2525',instantiates(advanced_face)).
	name('').
	bounds(['#2524']).
	face_geometry('#2508').
	same_sense(true).
:- end_object.

:- object('#2547',instantiates(advanced_face)).
	name('').
	bounds(['#2546']).
	face_geometry('#2530').
	same_sense(true).
:- end_object.

:- object('#2569',instantiates(advanced_face)).
	name('').
	bounds(['#2568']).
	face_geometry('#2552').
	same_sense(true).
:- end_object.

:- object('#2591',instantiates(advanced_face)).
	name('').
	bounds(['#2590']).
	face_geometry('#2574').
	same_sense(true).
:- end_object.

:- object('#2613',instantiates(advanced_face)).
	name('').
	bounds(['#2612']).
	face_geometry('#2596').
	same_sense(true).
:- end_object.

:- object('#2635',instantiates(advanced_face)).
	name('').
	bounds(['#2634']).
	face_geometry('#2618').
	same_sense(true).
:- end_object.

:- object('#2657',instantiates(advanced_face)).
	name('').
	bounds(['#2656']).
	face_geometry('#2640').
	same_sense(true).
:- end_object.

:- object('#2679',instantiates(advanced_face)).
	name('').
	bounds(['#2678']).
	face_geometry('#2662').
	same_sense(true).
:- end_object.

:- object('#2701',instantiates(advanced_face)).
	name('').
	bounds(['#2700']).
	face_geometry('#2684').
	same_sense(true).
:- end_object.

:- object('#2723',instantiates(advanced_face)).
	name('').
	bounds(['#2722']).
	face_geometry('#2706').
	same_sense(true).
:- end_object.

:- object('#2745',instantiates(advanced_face)).
	name('').
	bounds(['#2744']).
	face_geometry('#2728').
	same_sense(true).
:- end_object.

:- object('#2767',instantiates(advanced_face)).
	name('').
	bounds(['#2766']).
	face_geometry('#2750').
	same_sense(true).
:- end_object.

:- object('#2789',instantiates(advanced_face)).
	name('').
	bounds(['#2788']).
	face_geometry('#2772').
	same_sense(true).
:- end_object.

:- object('#2811',instantiates(advanced_face)).
	name('').
	bounds(['#2810']).
	face_geometry('#2794').
	same_sense(true).
:- end_object.

:- object('#2833',instantiates(advanced_face)).
	name('').
	bounds(['#2832']).
	face_geometry('#2816').
	same_sense(true).
:- end_object.

:- object('#2855',instantiates(advanced_face)).
	name('').
	bounds(['#2854']).
	face_geometry('#2838').
	same_sense(true).
:- end_object.

:- object('#2877',instantiates(advanced_face)).
	name('').
	bounds(['#2876']).
	face_geometry('#2860').
	same_sense(true).
:- end_object.

:- object('#2899',instantiates(advanced_face)).
	name('').
	bounds(['#2898']).
	face_geometry('#2882').
	same_sense(true).
:- end_object.

:- object('#2921',instantiates(advanced_face)).
	name('').
	bounds(['#2920']).
	face_geometry('#2904').
	same_sense(true).
:- end_object.

:- object('#2943',instantiates(advanced_face)).
	name('').
	bounds(['#2942']).
	face_geometry('#2926').
	same_sense(true).
:- end_object.

:- object('#2965',instantiates(advanced_face)).
	name('').
	bounds(['#2964']).
	face_geometry('#2948').
	same_sense(true).
:- end_object.

:- object('#2987',instantiates(advanced_face)).
	name('').
	bounds(['#2986']).
	face_geometry('#2970').
	same_sense(true).
:- end_object.

:- object('#3009',instantiates(advanced_face)).
	name('').
	bounds(['#3008']).
	face_geometry('#2992').
	same_sense(true).
:- end_object.

:- object('#3031',instantiates(advanced_face)).
	name('').
	bounds(['#3030']).
	face_geometry('#3014').
	same_sense(true).
:- end_object.

:- object('#3053',instantiates(advanced_face)).
	name('').
	bounds(['#3052']).
	face_geometry('#3036').
	same_sense(true).
:- end_object.

:- object('#3075',instantiates(advanced_face)).
	name('').
	bounds(['#3074']).
	face_geometry('#3058').
	same_sense(true).
:- end_object.

:- object('#3097',instantiates(advanced_face)).
	name('').
	bounds(['#3096']).
	face_geometry('#3080').
	same_sense(true).
:- end_object.

:- object('#3119',instantiates(advanced_face)).
	name('').
	bounds(['#3118']).
	face_geometry('#3102').
	same_sense(true).
:- end_object.

:- object('#3141',instantiates(advanced_face)).
	name('').
	bounds(['#3140']).
	face_geometry('#3124').
	same_sense(true).
:- end_object.

:- object('#3163',instantiates(advanced_face)).
	name('').
	bounds(['#3162']).
	face_geometry('#3146').
	same_sense(true).
:- end_object.

:- object('#3185',instantiates(advanced_face)).
	name('').
	bounds(['#3184']).
	face_geometry('#3168').
	same_sense(true).
:- end_object.

:- object('#3207',instantiates(advanced_face)).
	name('').
	bounds(['#3206']).
	face_geometry('#3190').
	same_sense(true).
:- end_object.

:- object('#3229',instantiates(advanced_face)).
	name('').
	bounds(['#3228']).
	face_geometry('#3212').
	same_sense(true).
:- end_object.

:- object('#3251',instantiates(advanced_face)).
	name('').
	bounds(['#3250']).
	face_geometry('#3234').
	same_sense(true).
:- end_object.

:- object('#3273',instantiates(advanced_face)).
	name('').
	bounds(['#3272']).
	face_geometry('#3256').
	same_sense(true).
:- end_object.

:- object('#3295',instantiates(advanced_face)).
	name('').
	bounds(['#3294']).
	face_geometry('#3278').
	same_sense(true).
:- end_object.

:- object('#3317',instantiates(advanced_face)).
	name('').
	bounds(['#3316']).
	face_geometry('#3300').
	same_sense(true).
:- end_object.

:- object('#3339',instantiates(advanced_face)).
	name('').
	bounds(['#3338']).
	face_geometry('#3322').
	same_sense(true).
:- end_object.

:- object('#3361',instantiates(advanced_face)).
	name('').
	bounds(['#3360']).
	face_geometry('#3344').
	same_sense(true).
:- end_object.

:- object('#3383',instantiates(advanced_face)).
	name('').
	bounds(['#3382']).
	face_geometry('#3366').
	same_sense(true).
:- end_object.

:- object('#3405',instantiates(advanced_face)).
	name('').
	bounds(['#3404']).
	face_geometry('#3388').
	same_sense(true).
:- end_object.

:- object('#3427',instantiates(advanced_face)).
	name('').
	bounds(['#3426']).
	face_geometry('#3410').
	same_sense(true).
:- end_object.

:- object('#3449',instantiates(advanced_face)).
	name('').
	bounds(['#3448']).
	face_geometry('#3432').
	same_sense(true).
:- end_object.

:- object('#3471',instantiates(advanced_face)).
	name('').
	bounds(['#3470']).
	face_geometry('#3454').
	same_sense(true).
:- end_object.

:- object('#3493',instantiates(advanced_face)).
	name('').
	bounds(['#3492']).
	face_geometry('#3476').
	same_sense(true).
:- end_object.

:- object('#3515',instantiates(advanced_face)).
	name('').
	bounds(['#3514']).
	face_geometry('#3498').
	same_sense(true).
:- end_object.

:- object('#3537',instantiates(advanced_face)).
	name('').
	bounds(['#3536']).
	face_geometry('#3520').
	same_sense(true).
:- end_object.

:- object('#3559',instantiates(advanced_face)).
	name('').
	bounds(['#3558']).
	face_geometry('#3542').
	same_sense(true).
:- end_object.

:- object('#3581',instantiates(advanced_face)).
	name('').
	bounds(['#3580']).
	face_geometry('#3564').
	same_sense(true).
:- end_object.

:- object('#3603',instantiates(advanced_face)).
	name('').
	bounds(['#3602']).
	face_geometry('#3586').
	same_sense(true).
:- end_object.

:- object('#3625',instantiates(advanced_face)).
	name('').
	bounds(['#3624']).
	face_geometry('#3608').
	same_sense(true).
:- end_object.

:- object('#3647',instantiates(advanced_face)).
	name('').
	bounds(['#3646']).
	face_geometry('#3630').
	same_sense(true).
:- end_object.

:- object('#3669',instantiates(advanced_face)).
	name('').
	bounds(['#3668']).
	face_geometry('#3652').
	same_sense(true).
:- end_object.

:- object('#3691',instantiates(advanced_face)).
	name('').
	bounds(['#3690']).
	face_geometry('#3674').
	same_sense(true).
:- end_object.

:- object('#3713',instantiates(advanced_face)).
	name('').
	bounds(['#3712']).
	face_geometry('#3696').
	same_sense(true).
:- end_object.

:- object('#3735',instantiates(advanced_face)).
	name('').
	bounds(['#3734']).
	face_geometry('#3718').
	same_sense(true).
:- end_object.

:- object('#3757',instantiates(advanced_face)).
	name('').
	bounds(['#3756']).
	face_geometry('#3740').
	same_sense(true).
:- end_object.

:- object('#3779',instantiates(advanced_face)).
	name('').
	bounds(['#3778']).
	face_geometry('#3762').
	same_sense(true).
:- end_object.

:- object('#3801',instantiates(advanced_face)).
	name('').
	bounds(['#3800']).
	face_geometry('#3784').
	same_sense(true).
:- end_object.

:- object('#3823',instantiates(advanced_face)).
	name('').
	bounds(['#3822']).
	face_geometry('#3806').
	same_sense(true).
:- end_object.

:- object('#3845',instantiates(advanced_face)).
	name('').
	bounds(['#3844']).
	face_geometry('#3828').
	same_sense(true).
:- end_object.

:- object('#3867',instantiates(advanced_face)).
	name('').
	bounds(['#3866']).
	face_geometry('#3850').
	same_sense(true).
:- end_object.

:- object('#3889',instantiates(advanced_face)).
	name('').
	bounds(['#3888']).
	face_geometry('#3872').
	same_sense(true).
:- end_object.

:- object('#3911',instantiates(advanced_face)).
	name('').
	bounds(['#3910']).
	face_geometry('#3894').
	same_sense(true).
:- end_object.

:- object('#3933',instantiates(advanced_face)).
	name('').
	bounds(['#3932']).
	face_geometry('#3916').
	same_sense(true).
:- end_object.

:- object('#3949',instantiates(advanced_face)).
	name('').
	bounds(['#3948']).
	face_geometry('#3938').
	same_sense(true).
:- end_object.

:- object('#4086',instantiates(advanced_face)).
	name('').
	bounds(['#4072','#4075','#4082','#4085']).
	face_geometry('#3954').
	same_sense(true).
:- end_object.

:- object('#170',instantiates(b_spline_surface_with_knots,rational_b_spline_surface)).
	:- alias(b_spline_surface_with_knots,attr_spec/4,b_spline_surface_with_knots_attr_spec/4).
	:- alias(rational_b_spline_surface,attr_spec/4,rational_b_spline_surface_attr_spec/4).
	attr_spec(N,T,S,K) :- ::b_spline_surface_with_knots_attr_spec(N,T,S,K).
	attr_spec(N,T,S,K) :- ::rational_b_spline_surface_attr_spec(N,T,S,K).
	:- alias(b_spline_surface_with_knots,domain_rule/2,b_spline_surface_with_knots_domain_rule/2).
	:- alias(rational_b_spline_surface,domain_rule/2,rational_b_spline_surface_domain_rule/2).
	domain_rule(S,R) :- ::b_spline_surface_with_knots_domain_rule(S,R).
	domain_rule(S,R) :- ::rational_b_spline_surface_domain_rule(S,R).
	u_degree(2).
	v_degree(1).
	control_points_list([['#149','#156'],['#150','#157'],['#151','#158'],['#152','#159'],['#153','#160'],['#154','#161'],['#155','#162']]).
	surface_form('cylindrical_surf').
	u_closed(true).
	v_closed(false).
	self_intersect(unknown).
	u_multiplicities([3,2,2,3]).
	v_multiplicities([2,2]).
	u_knots([  0.00000000e+00,  3.33333333e-01,  6.66666667e-01,  1.00000000e+00]).
	v_knots([  0.00000000e+00,  1.00000000e+00]).
	knot_spec('unspecified').
	weights_data([[  1.00000000e+00,  1.00000000e+00],[  5.00000000e-01,  5.00000000e-01],[  1.00000000e+00,  1.00000000e+00],[  5.00000000e-01,  5.00000000e-01],[  1.00000000e+00,  1.00000000e+00],[  5.00000000e-01,  5.00000000e-01],[  1.00000000e+00,  1.00000000e+00]]).
	name('').
:- end_object.

:- object('#248',instantiates(b_spline_surface_with_knots,rational_b_spline_surface)).
	:- alias(b_spline_surface_with_knots,attr_spec/4,b_spline_surface_with_knots_attr_spec/4).
	:- alias(rational_b_spline_surface,attr_spec/4,rational_b_spline_surface_attr_spec/4).
	attr_spec(N,T,S,K) :- ::b_spline_surface_with_knots_attr_spec(N,T,S,K).
	attr_spec(N,T,S,K) :- ::rational_b_spline_surface_attr_spec(N,T,S,K).
	:- alias(b_spline_surface_with_knots,domain_rule/2,b_spline_surface_with_knots_domain_rule/2).
	:- alias(rational_b_spline_surface,domain_rule/2,rational_b_spline_surface_domain_rule/2).
	domain_rule(S,R) :- ::b_spline_surface_with_knots_domain_rule(S,R).
	domain_rule(S,R) :- ::rational_b_spline_surface_domain_rule(S,R).
	u_degree(2).
	v_degree(1).
	control_points_list([['#227','#234'],['#228','#235'],['#229','#236'],['#230','#237'],['#231','#238'],['#232','#239'],['#233','#240']]).
	surface_form('cylindrical_surf').
	u_closed(true).
	v_closed(false).
	self_intersect(unknown).
	u_multiplicities([3,2,2,3]).
	v_multiplicities([2,2]).
	u_knots([  0.00000000e+00,  3.33333333e-01,  6.66666667e-01,  1.00000000e+00]).
	v_knots([  0.00000000e+00,  1.00000000e+00]).
	knot_spec('unspecified').
	weights_data([[  1.00000000e+00,  1.00000000e+00],[  5.00000000e-01,  5.00000000e-01],[  1.00000000e+00,  1.00000000e+00],[  5.00000000e-01,  5.00000000e-01],[  1.00000000e+00,  1.00000000e+00],[  5.00000000e-01,  5.00000000e-01],[  1.00000000e+00,  1.00000000e+00]]).
	name('').
:- end_object.

:- object('#363',instantiates(b_spline_surface_with_knots,rational_b_spline_surface)).
	:- alias(b_spline_surface_with_knots,attr_spec/4,b_spline_surface_with_knots_attr_spec/4).
	:- alias(rational_b_spline_surface,attr_spec/4,rational_b_spline_surface_attr_spec/4).
	attr_spec(N,T,S,K) :- ::b_spline_surface_with_knots_attr_spec(N,T,S,K).
	attr_spec(N,T,S,K) :- ::rational_b_spline_surface_attr_spec(N,T,S,K).
	:- alias(b_spline_surface_with_knots,domain_rule/2,b_spline_surface_with_knots_domain_rule/2).
	:- alias(rational_b_spline_surface,domain_rule/2,rational_b_spline_surface_domain_rule/2).
	domain_rule(S,R) :- ::b_spline_surface_with_knots_domain_rule(S,R).
	domain_rule(S,R) :- ::rational_b_spline_surface_domain_rule(S,R).
	u_degree(2).
	v_degree(1).
	control_points_list([['#342','#349'],['#343','#350'],['#344','#351'],['#345','#352'],['#346','#353'],['#347','#354'],['#348','#355']]).
	surface_form('cylindrical_surf').
	u_closed(true).
	v_closed(false).
	self_intersect(unknown).
	u_multiplicities([3,2,2,3]).
	v_multiplicities([2,2]).
	u_knots([  0.00000000e+00,  3.33333333e-01,  6.66666667e-01,  1.00000000e+00]).
	v_knots([  0.00000000e+00,  1.00000000e+00]).
	knot_spec('unspecified').
	weights_data([[  1.00000000e+00,  1.00000000e+00],[  5.00000000e-01,  5.00000000e-01],[  1.00000000e+00,  1.00000000e+00],[  5.00000000e-01,  5.00000000e-01],[  1.00000000e+00,  1.00000000e+00],[  5.00000000e-01,  5.00000000e-01],[  1.00000000e+00,  1.00000000e+00]]).
	name('').
:- end_object.

:- object('#424',instantiates(b_spline_surface_with_knots,rational_b_spline_surface)).
	:- alias(b_spline_surface_with_knots,attr_spec/4,b_spline_surface_with_knots_attr_spec/4).
	:- alias(rational_b_spline_surface,attr_spec/4,rational_b_spline_surface_attr_spec/4).
	attr_spec(N,T,S,K) :- ::b_spline_surface_with_knots_attr_spec(N,T,S,K).
	attr_spec(N,T,S,K) :- ::rational_b_spline_surface_attr_spec(N,T,S,K).
	:- alias(b_spline_surface_with_knots,domain_rule/2,b_spline_surface_with_knots_domain_rule/2).
	:- alias(rational_b_spline_surface,domain_rule/2,rational_b_spline_surface_domain_rule/2).
	domain_rule(S,R) :- ::b_spline_surface_with_knots_domain_rule(S,R).
	domain_rule(S,R) :- ::rational_b_spline_surface_domain_rule(S,R).
	u_degree(2).
	v_degree(1).
	control_points_list([['#403','#410'],['#404','#411'],['#405','#412'],['#406','#413'],['#407','#414'],['#408','#415'],['#409','#416']]).
	surface_form('cylindrical_surf').
	u_closed(true).
	v_closed(false).
	self_intersect(unknown).
	u_multiplicities([3,2,2,3]).
	v_multiplicities([2,2]).
	u_knots([  0.00000000e+00,  3.33333333e-01,  6.66666667e-01,  1.00000000e+00]).
	v_knots([  0.00000000e+00,  1.00000000e+00]).
	knot_spec('unspecified').
	weights_data([[  1.00000000e+00,  1.00000000e+00],[  5.00000000e-01,  5.00000000e-01],[  1.00000000e+00,  1.00000000e+00],[  5.00000000e-01,  5.00000000e-01],[  1.00000000e+00,  1.00000000e+00],[  5.00000000e-01,  5.00000000e-01],[  1.00000000e+00,  1.00000000e+00]]).
	name('').
:- end_object.

:- object('#545',instantiates(b_spline_surface_with_knots,rational_b_spline_surface)).
	:- alias(b_spline_surface_with_knots,attr_spec/4,b_spline_surface_with_knots_attr_spec/4).
	:- alias(rational_b_spline_surface,attr_spec/4,rational_b_spline_surface_attr_spec/4).
	attr_spec(N,T,S,K) :- ::b_spline_surface_with_knots_attr_spec(N,T,S,K).
	attr_spec(N,T,S,K) :- ::rational_b_spline_surface_attr_spec(N,T,S,K).
	:- alias(b_spline_surface_with_knots,domain_rule/2,b_spline_surface_with_knots_domain_rule/2).
	:- alias(rational_b_spline_surface,domain_rule/2,rational_b_spline_surface_domain_rule/2).
	domain_rule(S,R) :- ::b_spline_surface_with_knots_domain_rule(S,R).
	domain_rule(S,R) :- ::rational_b_spline_surface_domain_rule(S,R).
	u_degree(2).
	v_degree(1).
	control_points_list([['#524','#531'],['#525','#532'],['#526','#533'],['#527','#534'],['#528','#535'],['#529','#536'],['#530','#537']]).
	surface_form('cylindrical_surf').
	u_closed(true).
	v_closed(false).
	self_intersect(unknown).
	u_multiplicities([3,2,2,3]).
	v_multiplicities([2,2]).
	u_knots([  0.00000000e+00,  3.33333333e-01,  6.66666667e-01,  1.00000000e+00]).
	v_knots([  0.00000000e+00,  1.00000000e+00]).
	knot_spec('unspecified').
	weights_data([[  1.00000000e+00,  1.00000000e+00],[  5.00000000e-01,  5.00000000e-01],[  1.00000000e+00,  1.00000000e+00],[  5.00000000e-01,  5.00000000e-01],[  1.00000000e+00,  1.00000000e+00],[  5.00000000e-01,  5.00000000e-01],[  1.00000000e+00,  1.00000000e+00]]).
	name('').
:- end_object.

:- object('#192',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#190','#191']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#270',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#268','#269']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#289',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#287','#288']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#296',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#294','#295']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#303',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#301','#302']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#308',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#306','#307']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#325',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#323','#324']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#431',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#429','#430']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#567',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#565','#566']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#586',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#584','#585']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#593',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#591','#592']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#600',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#598','#599']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#607',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#605','#606']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#614',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#612','#613']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#621',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#619','#620']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#628',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#626','#627']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#635',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#633','#634']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#642',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#640','#641']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#649',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#647','#648']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#656',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#654','#655']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#663',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#661','#662']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#670',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#668','#669']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#677',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#675','#676']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#684',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#682','#683']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#691',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#689','#690']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#698',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#696','#697']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#705',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#703','#704']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#712',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#710','#711']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#719',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#717','#718']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#726',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#724','#725']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#733',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#731','#732']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#740',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#738','#739']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#747',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#745','#746']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#754',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#752','#753']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#761',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#759','#760']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#768',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#766','#767']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#775',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#773','#774']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#782',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#780','#781']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#789',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#787','#788']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#796',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#794','#795']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#803',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#801','#802']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#810',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#808','#809']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#817',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#815','#816']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#824',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#822','#823']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#831',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#829','#830']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#838',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#836','#837']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#845',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#843','#844']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#852',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#850','#851']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#859',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#857','#858']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#866',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#864','#865']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#873',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#871','#872']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#880',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#878','#879']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#887',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#885','#886']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#894',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#892','#893']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#901',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#899','#900']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#908',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#906','#907']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#915',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#913','#914']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#922',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#920','#921']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#929',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#927','#928']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#936',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#934','#935']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#943',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#941','#942']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#950',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#948','#949']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#957',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#955','#956']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#964',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#962','#963']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#971',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#969','#970']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#978',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#976','#977']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#985',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#983','#984']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#992',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#990','#991']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#999',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#997','#998']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1006',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1004','#1005']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1013',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1011','#1012']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1020',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1018','#1019']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1027',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1025','#1026']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1034',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1032','#1033']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1041',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1039','#1040']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1048',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1046','#1047']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1055',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1053','#1054']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1062',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1060','#1061']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1069',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1067','#1068']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1076',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1074','#1075']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1083',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1081','#1082']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1090',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1088','#1089']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1097',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1095','#1096']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1104',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1102','#1103']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1111',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1109','#1110']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1118',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1116','#1117']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1125',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1123','#1124']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1132',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1130','#1131']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1139',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1137','#1138']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1146',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1144','#1145']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1153',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1151','#1152']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1160',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1158','#1159']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1167',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1165','#1166']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1174',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1172','#1173']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1181',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1179','#1180']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1188',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1186','#1187']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1195',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1193','#1194']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1202',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1200','#1201']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1209',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1207','#1208']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1216',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1214','#1215']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1223',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1221','#1222']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1230',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1228','#1229']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1237',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1235','#1236']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1244',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1242','#1243']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1251',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1249','#1250']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1258',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1256','#1257']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1265',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1263','#1264']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1272',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1270','#1271']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1279',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1277','#1278']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1286',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1284','#1285']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1293',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1291','#1292']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1300',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1298','#1299']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1307',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1305','#1306']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1314',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1312','#1313']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1321',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1319','#1320']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1328',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1326','#1327']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1335',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1333','#1334']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1342',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1340','#1341']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1349',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1347','#1348']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1356',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1354','#1355']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1363',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1361','#1362']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1370',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1368','#1369']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1377',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1375','#1376']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1384',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1382','#1383']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1389',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1387','#1388']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1409',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1407','#1408']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1414',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1412','#1413']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1420',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1418','#1419']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1435',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1433','#1434']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1442',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1440','#1441']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1457',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1455','#1456']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1464',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1462','#1463']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1479',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1477','#1478']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1486',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1484','#1485']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1501',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1499','#1500']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1508',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1506','#1507']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1523',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1521','#1522']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1530',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1528','#1529']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1545',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1543','#1544']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1552',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1550','#1551']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1567',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1565','#1566']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1574',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1572','#1573']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1589',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1587','#1588']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1596',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1594','#1595']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1611',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1609','#1610']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1618',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1616','#1617']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1633',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1631','#1632']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1640',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1638','#1639']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1655',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1653','#1654']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1662',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1660','#1661']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1677',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1675','#1676']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1684',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1682','#1683']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1699',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1697','#1698']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1706',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1704','#1705']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1721',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1719','#1720']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1728',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1726','#1727']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1743',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1741','#1742']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1750',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1748','#1749']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1765',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1763','#1764']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1772',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1770','#1771']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1787',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1785','#1786']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1794',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1792','#1793']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1809',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1807','#1808']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1816',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1814','#1815']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1831',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1829','#1830']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1838',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1836','#1837']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1853',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1851','#1852']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1860',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1858','#1859']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1875',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1873','#1874']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1882',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1880','#1881']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1897',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1895','#1896']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1904',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1902','#1903']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1919',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1917','#1918']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1926',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1924','#1925']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1941',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1939','#1940']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1948',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1946','#1947']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1963',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1961','#1962']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1970',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1968','#1969']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1985',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1983','#1984']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#1992',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#1990','#1991']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2007',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2005','#2006']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2014',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2012','#2013']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2029',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2027','#2028']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2036',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2034','#2035']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2051',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2049','#2050']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2058',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2056','#2057']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2073',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2071','#2072']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2080',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2078','#2079']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2095',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2093','#2094']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2102',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2100','#2101']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2117',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2115','#2116']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2124',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2122','#2123']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2139',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2137','#2138']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2146',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2144','#2145']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2161',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2159','#2160']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2168',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2166','#2167']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2183',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2181','#2182']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2190',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2188','#2189']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2205',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2203','#2204']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2212',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2210','#2211']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2227',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2225','#2226']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2234',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2232','#2233']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2249',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2247','#2248']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2256',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2254','#2255']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2271',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2269','#2270']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2278',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2276','#2277']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2293',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2291','#2292']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2300',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2298','#2299']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2315',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2313','#2314']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2322',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2320','#2321']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2337',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2335','#2336']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2344',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2342','#2343']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2359',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2357','#2358']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2366',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2364','#2365']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2381',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2379','#2380']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2388',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2386','#2387']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2403',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2401','#2402']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2410',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2408','#2409']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2425',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2423','#2424']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2432',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2430','#2431']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2447',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2445','#2446']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2454',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2452','#2453']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2469',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2467','#2468']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2476',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2474','#2475']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2491',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2489','#2490']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2498',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2496','#2497']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2513',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2511','#2512']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2520',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2518','#2519']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2535',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2533','#2534']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2542',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2540','#2541']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2557',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2555','#2556']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2564',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2562','#2563']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2579',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2577','#2578']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2586',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2584','#2585']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2601',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2599','#2600']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2608',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2606','#2607']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2623',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2621','#2622']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2630',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2628','#2629']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2645',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2643','#2644']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2652',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2650','#2651']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2667',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2665','#2666']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2674',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2672','#2673']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2689',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2687','#2688']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2696',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2694','#2695']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2711',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2709','#2710']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2718',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2716','#2717']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2733',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2731','#2732']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2740',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2738','#2739']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2755',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2753','#2754']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2762',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2760','#2761']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2777',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2775','#2776']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2784',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2782','#2783']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2799',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2797','#2798']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2806',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2804','#2805']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2821',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2819','#2820']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2828',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2826','#2827']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2843',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2841','#2842']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2850',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2848','#2849']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2865',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2863','#2864']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2872',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2870','#2871']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2887',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2885','#2886']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2894',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2892','#2893']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2909',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2907','#2908']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2916',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2914','#2915']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2931',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2929','#2930']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2938',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2936','#2937']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2953',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2951','#2952']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2960',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2958','#2959']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2975',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2973','#2974']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2982',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2980','#2981']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#2997',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#2995','#2996']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3004',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3002','#3003']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3019',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3017','#3018']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3026',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3024','#3025']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3041',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3039','#3040']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3048',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3046','#3047']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3063',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3061','#3062']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3070',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3068','#3069']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3085',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3083','#3084']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3092',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3090','#3091']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3107',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3105','#3106']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3114',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3112','#3113']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3129',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3127','#3128']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3136',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3134','#3135']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3151',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3149','#3150']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3158',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3156','#3157']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3173',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3171','#3172']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3180',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3178','#3179']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3195',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3193','#3194']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3202',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3200','#3201']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3217',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3215','#3216']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3224',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3222','#3223']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3239',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3237','#3238']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3246',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3244','#3245']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3261',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3259','#3260']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3268',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3266','#3267']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3283',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3281','#3282']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3290',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3288','#3289']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3305',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3303','#3304']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3312',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3310','#3311']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3327',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3325','#3326']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3334',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3332','#3333']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3349',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3347','#3348']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3356',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3354','#3355']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3371',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3369','#3370']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3378',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3376','#3377']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3393',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3391','#3392']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3400',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3398','#3399']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3415',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3413','#3414']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3422',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3420','#3421']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3437',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3435','#3436']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3444',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3442','#3443']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3459',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3457','#3458']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3466',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3464','#3465']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3481',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3479','#3480']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3488',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3486','#3487']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3503',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3501','#3502']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3510',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3508','#3509']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3525',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3523','#3524']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3532',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3530','#3531']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3547',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3545','#3546']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3554',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3552','#3553']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3569',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3567','#3568']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3576',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3574','#3575']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3591',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3589','#3590']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3598',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3596','#3597']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3613',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3611','#3612']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3620',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3618','#3619']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3635',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3633','#3634']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3642',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3640','#3641']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3657',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3655','#3656']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3664',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3662','#3663']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3679',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3677','#3678']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3686',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3684','#3685']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3701',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3699','#3700']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3708',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3706','#3707']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3723',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3721','#3722']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3730',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3728','#3729']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3745',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3743','#3744']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3752',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3750','#3751']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3767',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3765','#3766']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3774',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3772','#3773']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3789',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3787','#3788']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3796',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3794','#3795']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3811',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3809','#3810']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3818',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3816','#3817']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3833',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3831','#3832']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3840',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3838','#3839']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3855',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3853','#3854']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3862',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3860','#3861']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3877',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3875','#3876']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3884',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3882','#3883']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3899',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3897','#3898']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3906',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3904','#3905']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3921',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3919','#3920']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3928',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3926','#3927']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#3941',instantiates(quasi_uniform_curve)).
	name('').
	degree(1).
	control_points_list(['#3939','#3940']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
:- end_object.

:- object('#330',instantiates(b_spline_curve_with_knots)).
	name('').
	degree(1).
	control_points_list(['#328','#329']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
	knot_multiplicities([2,2]).
	knots([  0.00000000e+00,  5.93670963e-01]).
	knot_spec('unspecified').
:- end_object.

:- object('#336',instantiates(b_spline_curve_with_knots)).
	name('').
	degree(1).
	control_points_list(['#334','#335']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
	knot_multiplicities([2,2]).
	knots([  4.06329037e-01,  1.00000000e+00]).
	knot_spec('unspecified').
:- end_object.

:- object('#384',instantiates(b_spline_curve_with_knots)).
	name('').
	degree(1).
	control_points_list(['#382','#383']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
	knot_multiplicities([2,2]).
	knots([  0.00000000e+00,  1.63961090e-01]).
	knot_spec('unspecified').
:- end_object.

:- object('#478',instantiates(b_spline_curve_with_knots)).
	name('').
	degree(1).
	control_points_list(['#476','#477']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
	knot_multiplicities([2,2]).
	knots([  0.00000000e+00,  4.78478548e-01]).
	knot_spec('unspecified').
:- end_object.

:- object('#484',instantiates(b_spline_curve_with_knots)).
	name('').
	degree(1).
	control_points_list(['#482','#483']).
	curve_form('polyline_form').
	closed_curve(false).
	self_intersect(unknown).
	knot_multiplicities([2,2]).
	knots([  5.21521452e-01,  1.00000000e+00]).
	knot_spec('unspecified').
:- end_object.

:- object('#522',instantiates(face_bound)).
	name('').
	bound('#521').
	orientation(true).
:- end_object.

:- object('#1396',instantiates(face_bound)).
	name('').
	bound('#1395').
	orientation(true).
:- end_object.

:- object('#4075',instantiates(face_bound)).
	name('').
	bound('#4074').
	orientation(true).
:- end_object.

:- object('#4082',instantiates(face_bound)).
	name('').
	bound('#4081').
	orientation(true).
:- end_object.

:- object('#4085',instantiates(face_bound)).
	name('').
	bound('#4084').
	orientation(true).
:- end_object.

:- object('#4087',instantiates(closed_shell)).
	name('').
	cfs_faces(['#148','#199','#226','#277','#313','#341','#402','#469','#489','#523','#574','#1397','#1425','#1447','#1469','#1491','#1513','#1535','#1557','#1579','#1601','#1623','#1645','#1667','#1689','#1711','#1733','#1755','#1777','#1799','#1821','#1843','#1865','#1887','#1909','#1931','#1953','#1975','#1997','#2019','#2041','#2063','#2085','#2107','#2129','#2151','#2173','#2195','#2217','#2239','#2261','#2283','#2305','#2327','#2349','#2371','#2393','#2415','#2437','#2459','#2481','#2503','#2525','#2547','#2569','#2591','#2613','#2635','#2657','#2679','#2701','#2723','#2745','#2767','#2789','#2811','#2833','#2855','#2877','#2899','#2921','#2943','#2965','#2987','#3009','#3031','#3053','#3075','#3097','#3119','#3141','#3163','#3185','#3207','#3229','#3251','#3273','#3295','#3317','#3339','#3361','#3383','#3405','#3427','#3449','#3471','#3493','#3515','#3537','#3559','#3581','#3603','#3625','#3647','#3669','#3691','#3713','#3735','#3757','#3779','#3801','#3823','#3845','#3867','#3889','#3911','#3933','#3949','#4086']).
:- end_object.

:- object('#4088',instantiates(manifold_solid_brep)).
	name('').
	outer('#4087').
:- end_object.

:- object('#4089',instantiates(advanced_brep_shape_representation)).
	name('').
	items(['#4088']).
	context_of_items('#121').
:- end_object.

