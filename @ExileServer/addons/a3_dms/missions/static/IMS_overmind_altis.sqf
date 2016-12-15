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

// Reinforcements values
_AIMaxReinforcementsWaves = 1;
_AIMaxReinforcements = 5;
_AIdelay = 10;

// Create first AI Group
_AICount1 = 2;
_AISoldierSpawnLocations1 = [
	[15949,16986.8,0],
	[15948.5,17002.6,0]
];
_AISoldierSpawnDirections1 = [
	180,
	180
];

_group1 = [_AISoldierSpawnLocations1,_AICount1,_difficulty,"assault",_side] call IMS_fnc_SpawnAIGroup_MultiPos;

// Create second AI Group
_AICount2 = 3;
_AISoldierSpawnLocations2 = [
	[15969.9,16989,0],
	[15974.9,16989.3,0],
	[15977.8,16998.2,0]
];
_group2 = [_AISoldierSpawnLocations2,_AICount2,_difficulty,"assault",_side] call IMS_fnc_SpawnAIGroup_MultiPos;

// Create third AI Group
_AICount3 = 3;
_AISoldierSpawnLocations3 = [
	[15938.8,17031.9,3.17192],
	[15935.9,17038.9,3.11339],
	[15936.7,17032.9,0.623365]
];
_group3 = [_AISoldierSpawnLocations3,_AICount3,_difficulty,"assault",_side] call IMS_fnc_SpawnAIGroup_MultiPos;

// Create fourth AI Group
_AICount4 = 3;
_AISoldierSpawnLocations4 = [
	[15912.3,17056.1,4.16695],
	[15921.9,17060.7,0],
	[15923.2,17049.9,0]
];
_group4 = [_AISoldierSpawnLocations4,_AICount4,_difficulty,"assault",_side] call IMS_fnc_SpawnAIGroup_MultiPos;

// Define mission-spawned AI Units
_missionAIUnits =
[
	[_group1,_group2,_group3,_group4]
];

// Define the group reinforcements
_groupReinforcementsInfo =
[
	[
		_group1,								// pass the group
		[
			[
				_AIMaxReinforcementsWaves,		// Amount of reinfocements waves (defined in difficulty selection). 
				0
			],
			[
				_AIMaxReinforcements,			// Maximum units that can be given as reinforcements (defined in difficulty selection).
				0
			]
		],
		[
			_AIdelay,							// The delay between reinforcements. >> you can change this in difficulty settings
			diag_tickTime
		],
		[16073.2,16995.6,0],
		"random",
		_difficulty,
		_side,
		"heli_troopers",								// STRING: How the AI group should be managed. Supported types: "playernear", "maintain", "reinforce", "increasing_resistance", "armed_vehicle"
		[
			1,											// SCALAR: If the AI Group has fewer than "_AICount" living units, then the group will receive reinforcements.
	        "false",               						// BOOLEAN: Whether or not to eject Fire-From-Vehicle (FFV) gunners.
	        5,                    						// SCALAR: Maximum number of AI to eject from the aircraft. Set to a really high # to ignore (like 999).
	        "false",               						// BOOLEAN: Whether or not to keep the heli flying around as a gunship.
	        [16073.2,16995.6,0],               			// OBJECT or ARRAY (OPTIONAL - Position2D or 3D): The location to drop the reinforcements at. The drop point will default to the group leader.
			"Exile_Chopper_Huey_Armed_Desert"         	// STRING (OPTIONAL): The classname of the heli to spawn.
		]
	]
];

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
			[_group1,_group2,_group3,_group4]
		],
		[
			"playerNear",
			[_pos,200]
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
	[[],[]]
] call DMS_fnc_AddMissionToMonitor_Static;


// Add the index array to the mission to call a mission comlpetion after player has succesfully complete the mission.
// Just needed if players dont kill all AI.
IMS_Overmind_MissionIndex = (count DMS_StaticMission_Arr) - 1;

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
