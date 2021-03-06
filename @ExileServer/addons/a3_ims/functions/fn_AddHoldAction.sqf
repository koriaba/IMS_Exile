/*
	IMS_fnc_AddHoldAction
	Created by Salutesh

	This function will simply reduce the amount of parameters that are needed to execute the BIS_fnc_holdActionAdd function.
	This function will create a hold action with given parameters to the given target.
	Target can be a object, npc or vehicle (nothing else tested yet).
	
	Usage:
	[
		_object,														// [STRING]: Object target.
		_label, 														// [STRING]: Hold action title.
		_type,															// [STRING]: Hold action type. Currently possible types: data, launcher, pc, crate, charge, connect]. This will change the icon of the hold action that is linked to the given name.
		_active,														// [STRING]: Condition to show.
		_args,															// [STRING]: Arguments.
		_completeCode,													// [CODE]: Code executed on hold action completion.
		_duration,														// [NUMBER]: Time duration in seconds. The hold action circle filled up depending on this value.
		_remove															// [BOOLEAN]: Remove the action on completion. true = yes / false = no
	] call IMS_fnc_AddHoldAction;
	
*/
params [["_object", player], ["_label", "Search"], ["_type", "search"], ["_active", "true"], ["_completeCode", {hint 'Nothing found'}], ["_args", []], ["_duration", 2], ["_remove", "true"]];

// Change icon based on _type input.
_idleIcon = switch (_type) do {
	case "inspect": {"icons\holdAction_inspect.paa"};
	case "use": {"icons\holdAction_use.paa"};
	case "deactivate": {"icons\holdAction_deactivate.paa"};
	case "hack": {"icons\holdAction_hack.paa"};
	case "pincode": {"icons\holdAction_pincode.paa"};
	case "mission": {"icons\holdAction_mission.paa"};
	case "talk": {"icons\holdAction_talk.paa"};
	case "read": {"icons\holdAction_read.paa"};
	case "supply": {"icons\holdAction_supply.paa"};
	case "lock": {"icons\holdAction_lock.paa"};
	case "unlock": {"icons\holdAction_unlock.paa"};
	default {"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa"};		
};

// Create the hold action with given parameters.
[
/* 0 object */							_object,
/* 1 action title */					_label,
/* 2 idle icon */						_idleIcon,
/* 3 progress icon */					_idleIcon,
/* 4 condition to show */				_active,
/* 5 condition for action */			"true",
/* 6 code executed on start */			{},
/* 7 code executed per tick */			{},
/* 8 code executed on completion */		_completeCode,
/* 9 code executed on interruption */	{},
/* 10 arguments */						_args,
/* 11 action duration */				_duration,
/* 12 priority */						0,
/* 13 remove on completion */			_remove,
/* 14 show unconscious */				false
] remoteExec ["BIS_fnc_holdActionAdd",[0,-2] select isDedicated,true];