
:- initialization((
	current_logtalk_flag(report, Value),
	set_logtalk_flag(report, off),
	logtalk_load([library(hierarchies_loader), library(types_loader)], [reload(skip)]),
	set_logtalk_flag(report, Value),
	logtalk_load([xml, type_checking, hook, base_classes, base_types, types_203], [reload(skip)]),
	logtalk_load(entities_203, [hook(hook), reload(skip)]),
	logtalk_load(validated, [reload(skip)]),
	logtalk_load([parametric_203, functions_203, rules_203]),
	logtalk_load(data_model, [xmldocs(off), report(off)])
	)).
