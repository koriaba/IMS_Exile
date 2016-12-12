/*
	"Overmind" v1.0 Static Mission Altis for DMS Exile
	Needed a3_ims addon by Salutesh to work as it should.
	
	Created by Salutesh
	www.reality-gaming.eu
	
*/

// For logging purposes
_num = DMS_MissionCount;


// Set mission side (only "bandit" is supported for now)
_side = "bandit";

_pos = [16073.2,16995.6,0];

if ([_pos,DMS_StaticMinPlayerDistance] call DMS_fnc_IsPlayerNearby) exitWith {"delay"};


// Set general mission difficulty
_difficulty = "hardcore";


// Create AI
_AICount = 2;

// Create first group.
_group1 = createGroup (missionNamespace getVariable [format ["DMS_%1Side",_side],EAST]);

_unit1 = [_group1, [15948.3,16985.7,0], "assault", _difficulty, _side, "solidier", []] call DMS_fnc_SpawnAISoldier;
_unit2 = [_group1, [15946.7,17001.6,0], "assault", _difficulty, _side, "solidier", []] call DMS_fnc_SpawnAISoldier;

// Testing
_group1 enableDynamicSimulation true;

// Remove all previous waypoints for the first group.
for "_i" from count (waypoints _group) to 1 step -1 do
{
	deleteWaypoint ((waypoints _group) select _i);
};

// Let the Ai dont move from there positions.
doStop (units _group);

// Define mission-spawned AI Units
_missionAIUnits =
[
	_group1 		// We only spawned the single group for this mission
];

// Define the group reinforcements
_groupReinforcementsInfo = [];

// Define mission-spawned objects and loot values
_missionObjs =
[
	[],	
	[],
	[]
];


// Define Mission Start message
_msgStart = ['#FFFF00', "A heavily guarded base has been located on the salt flats! There are reports they have a large weapon cache..."];

// Define Mission Win message
_msgWIN = ['#0080ff',"Convicts have successfully assaulted the base on the salt flats and secured the cache!"];

// Define Mission Lose message
_msgLOSE = ['#FF0000',"Seems like the guards got bored and left the base, taking the cache with them..."];

// Define mission name (for map marker and logging)
_missionName = "[IMS] Overmind";

// Create Markers
_markers =
[
	_pos,
	_missionName,
	_difficulty
] call DMS_fnc_CreateMarker;

(_markers select 1) setMarkerSize [750,750];

// Record time here (for logging purposes, otherwise you could just put "diag_tickTime" into the "DMS_AddMissionToMonitor" parameters directly)
_time = diag_tickTime;

// Parse and add mission info to missions monitor
_added =
[
	_pos,
	[
		[
			"kill",
			_group
		],
		[
			"playerNear",
			[_pos,100]
		]
	],
	_groupReinforcementsInfo,
	[
		_time,
		DMS_StaticMissionTimeOut call DMS_fnc_SelectRandomVal
	],
	_missionAIUnits,
	_missionObjs,
	[_missionName,_msgWIN,_msgLOSE],
	_markers,
	_side,
	_difficulty,
	[]
] call DMS_fnc_AddMissionToMonitor_Static;

// Check to see if it was added correctly, otherwise delete the stuff
if !(_added) exitWith
{
	diag_log format ["DMS ERROR :: Attempt to set up mission %1 with invalid parameters for DMS_fnc_AddMissionToMonitor_Static! Deleting mission objects and resetting DMS_MissionCount.",_missionName];

	// Delete the markers directly
	{deleteMarker _x;} forEach _markers;


	// Reset the mission count
	DMS_MissionCount = DMS_MissionCount - 1;
};


// Notify players
[_missionName,_msgStart] call DMS_fnc_BroadcastMissionStatus;



if (DMS_DEBUG) then
{
	(format ["MISSION: (%1) :: Mission #%2 started at %3 with %4 AI units and %5 difficulty at time %6",_missionName,_num,_pos,_AICount,_difficulty,_time]) call DMS_fnc_DebugLog;
};
