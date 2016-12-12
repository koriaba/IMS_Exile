/*
	IMS_fnc_SetGroupBehavior
	Created by eraser1 modified by Salutesh

	Usage:
	[
		_group,							// GROUP or OBJECT: Group or unit whose behavior is to be changed.
		_difficulty,					// STRING: Difficulty of the AI
		_behavior						// (OPTIONAL) STRING: AI Behavior. Refer to: https://community.bistudio.com/wiki/setBehaviour
	] call IMS_fnc_SetGroupBehavior;

	Returns true if the call was completed
*/

if !(params
[
	"_group",
	"_difficulty"
])
then
{
	diag_log format ["IMS ERROR :: Calling IMS_fnc_SetGroupBehavior with invalid params: %1",_this];
};

private _exit = false;

try
{
	if (isNull _group) throw "_group is null!";

	if (_group isEqualType objNull) then
	{
		if !(alive _group) throw "_group is a dead object!";

		_group = group _group;
	};
}
catch
{
	_exit = true;
	if (IMS_DEBUG) then
	{
		format["SetGroupBehavior :: Exiting function because %1", _exception] call IMS_fnc_DebugLog;
	};
};

if (_exit) exitWith {false};


private _behavior = if ((count _this)>3) then {_this select 3;} else {"COMBAT"};


_group setCombatMode "RED";
_group setBehaviour _behavior;


_difficulty =
	switch (toLower _difficulty) do
	{
		case "random":
		{
			selectRandom DMS_ai_skill_random;
		};

		case "randomdifficult":
		{
			selectRandom DMS_ai_skill_randomDifficult;
		};

		case "randomeasy":
		{
			selectRandom DMS_ai_skill_randomEasy;
		};

		case "randomintermediate":
		{
			selectRandom DMS_ai_skill_randomIntermediate;
		};

		default
		{
		    _difficulty;
		};
	};

// Remove all previous waypoints from group
for "_i" from count (waypoints _group) to 1 step -1 do
{
	deleteWaypoint ((waypoints _group) select _i);
};


true
