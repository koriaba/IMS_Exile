/*
	IMS_fnc_SpawnAIGroup_Guards
	Created by eraser1 and modified by Salutesh


	Spawns a group of AI with a given AI count at the provided list of location(s), with a given waypoints, difficulty, class, and side.

	Usage:
	[
		[
			_position1,			// ARRAY (positionATL): Potential location for AI to spawn #1.
			_position2,			// ARRAY (positionATL): Potential location for AI to spawn #2.
			...
			_positionN			// ARRAY (positionATL): Potential location for AI to spawn #N.
		],
		[
			_direction1,		// NUMBER: #1 faceing direction of AI.
			_direction2,		// NUMBER: #2 faceing direction of AI.
			...
			_directionN			// NUMBER: #N faceing direction of AI.
		],
		_count,					// SCALAR (Integer > 0): Number of AI.
		_difficulty,			// STRING: AI Difficulty: "random","hardcore","difficult","moderate", or "easy".
		_class,					// STRING: AI Class: "random","assault","MG","sniper" or "unarmed" OR [_class,_launcherType].
		_side 					// STRING: Only "bandit" is supported atm.
		_customGearSet			// (OPTIONAL) ARRAY: Manually defined AI gear. Refer to functional documentation of fn_SpawnAISoldier.sqf for more info: https://github.com/Defent/DMS_Exile/blob/master/%40ExileServer/addons/a3_dms/scripts/fn_SpawnAISoldier.sqf
	] call IMS_fnc_SpawnAIGroup_Patrol;

	Returns AI Group
*/

if !(params
[
	"_positions",
	"_directions",
	"_count",
	"_difficulty",
	"_class",
	"_side"
])
exitWith
{
	diag_log format ["IMS ERROR :: Calling IMS_SpawnAIGroup_Guards with invalid parameters: %1",_this];
	grpNull
};

private _positionsCount = count _positions;

if (_positionsCount<1) exitWith
{
	diag_log format ["IMS ERROR :: Calling IMS_SpawnAIGroup_Guards with an empty list of positions! _this: %1",_this];
	grpNull
};

private _directionsCount = count _directions;

if (_directionsCount<1) exitWith
{
	diag_log format ["IMS ERROR :: Calling IMS_SpawnAIGroup_Guards with an empty list of directions! _this: %1",_this];
	grpNull
};

if (_count < 1) exitWith
{
	diag_log format ["IMS ERROR :: Calling IMS_SpawnAIGroup_Guards with less than 1 _count! _this: %1",_this];
	grpNull
};

if (IMS_DEBUG) then
{
	(format["SpawnAIGroup_Guards :: Spawning %1 %2 %3 AI at positions %4 with %5 difficulty.",_count,_class,_side,_positions,_difficulty]) call IMS_fnc_DebugLog;
};


private _launcherType = "";

// if soldier have AT/AA weapons
if (_class isEqualType []) then
{
	_launcherType	= _class select 1;
	_class			= _class select 0;
};


_customGearSet = [];

if (_class == "custom") then
{
	if ((count _this)>5) then
	{
		_customGearSet = _this select 5;
	}
	else
	{
		diag_log format["IMS ERROR :: Calling IMS_fnc_SpawnAIGroup_Patrol with custom class without defining _customGearSet! Setting _class to ""random"" _this: %1",_this];
		_class = "random";
	};
};

private _group = createGroup (missionNamespace getVariable [format ["DMS_%1Side",_side],EAST]);

// Lock locality until all units are spawned
_group setVariable ["DMS_LockLocality",true];
_group setVariable ["DMS_SpawnedGroup",true];
_group setVariable ["DMS_Group_Side", _side];

for "_i" from 1 to _count do
{
	private _unit = [_group,_positions select (_i % _positionsCount),_directions select (_i % _directionsCount),_class,_difficulty,_side,"Soldier",_customGearSet] call IMS_fnc_SpawnAIGuard;
};

// An AI will definitely spawn with a launcher if you define type
if (DMS_ai_use_launchers || {!(_launcherType isEqualTo "")}) then
{
	if (_launcherType isEqualTo "") then
	{
		_launcherType = "AT";
	};

	private _units = units _group;
	private _launchers = missionNamespace getVariable [format ["DMS_AI_wep_launchers_%1",_launcherType],DMS_AI_wep_launchers_AT];

	for "_i" from 0 to ((DMS_ai_launchers_per_group min _count)-1) do
	{
		if ((random 100)<DMS_ai_use_launchers_chance) then
		{
			private _unit = _units select _i;

			private _launcher = selectRandom _launchers;

			removeBackpackGlobal _unit;
			_unit addBackpack "B_Carryall_mcamo";

			[_unit, _launcher, DMS_AI_launcher_ammo_count] call DMS_fnc_addWeapon;

			_unit setVariable ["DMS_AI_Launcher",_launcher];

			if (IMS_DEBUG) then
			{
				(format["SpawnAIGroup_Guards :: Giving %1 a %2 launcher with %3 rockets",_unit,_launcher,DMS_AI_launcher_ammo_count]) call IMS_fnc_DebugLog;
			};
		};
	};
};

_group setCombatMode "RED";
_group setBehaviour "AWARE";
_group selectLeader ((units _group) select 0);


// Remove all previous waypoints from group.
for "_i" from count (waypoints _group) to 1 step -1 do
{
	deleteWaypoint ((waypoints _group) select _i);
};

createGuardedPoint [EAST, _positions select 0, -1, objNull];
_wp = _group addWaypoint [_positions select 0,0];
_wp setWaypointType "GUARD";

// [WIP]
// Add group to dynamic simulation system if option is true.
if (IMS_AI_DynamicSimulation) then
{
	_group enableDynamicSimulation true;
};

// Unlock locality now that we're done with the group
_group setVariable ["DMS_LockLocality",false];

diag_log format ["IMS_SpawnAIGroup_Guards :: Spawned %1 AI using positions parameter: %2.",_count,_positions];

_group
