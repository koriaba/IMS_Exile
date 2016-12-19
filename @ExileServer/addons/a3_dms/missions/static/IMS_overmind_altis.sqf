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

// Spawn AI groups.
_group1 = [[[15951.2,16985.9,0],[15948.9,17000.8,0]],[291.578,242.644],2,_difficulty,"random",_side] call IMS_fnc_SpawnAIGroup_Guards;
_group2 = [[[15977.4,16993.8,0],[15975,16989.2,0],[15977.5,16998.5,0]],[270.652,276.123,262.945],3,_difficulty,"random",_side] call IMS_fnc_SpawnAIGroup_Guards;
_group3 = [[[15958.8,17062.2,0],[15958.6,17064.3,0],[15960.4,17063.4,0]],[[15959.4,17062,0],[15960.8,17048.4,0],[15972.4,17044.6,0],[15970.6,17022.3,0],[15943.4,17022.7,0],[15950.6,17046.5,0]],3,_difficulty,"assault",_side] call IMS_fnc_SpawnAIGroup_Patrol;
_group4 = [[[15938.6,17032.2,3.17204],[15932.4,17027,3.06874],[15935.2,17038.6,3.07873]],[94.088,158.764,16.264],3,_difficulty,"random",_side] call IMS_fnc_SpawnAIGroup_Guards;
_group5 = [[[16015.7,17113.9,0],[16014,17115.1,0],[16015.8,17116,0]],[[16015.1,17115.1,0],[16021.9,17096.4,0],[16001.2,17084.6,0],[15991.2,17100.1,0]],3,_difficulty,"assault",_side] call IMS_fnc_SpawnAIGroup_Patrol;
_group6 = [[[16038,17119,3.09179],[16032.7,17123.9,3.04245],[16043.7,17123.4,3.15075]],[187.115,240.548,112.673],3,_difficulty,"random",_side] call IMS_fnc_SpawnAIGroup_Guards;
_group7 = [[[16065.9,17134.1,0],[16082.9,17133.7,0]],[197.285,239.343],2,_difficulty,"random",_side] call IMS_fnc_SpawnAIGroup_Guards;
_group8 = [[[16216.1,17038.2,0],[16218.6,17038.7,0],[16215.9,17035.1,0],[16218.6,17035.8,0]],[[16216.6,17037.8,0],[16178.3,17074.8,0],[16161.9,17099.1,0],[16111.6,17115,0],[16101.2,17128.4,0],[16079.6,17115.6,0],[16111.6,17115,0],[16161.9,17099.1,0],[16200.3,17036.9,0],[16206.9,17025.5,0]],4,_difficulty,"assault",_side] call IMS_fnc_SpawnAIGroup_Patrol;

// Define mission-spawned AI Units
_missionAIUnits =
[
	[_group1,_group2,_group3,_group4,_group5,_group6,_group7,_group8]
];

// Define the group reinforcements
_groupReinforcementsInfo =
[
	[
		_group8,								// pass the group
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
			2,											// SCALAR: If the AI Group has fewer than "_AICount" living units, then the group will receive reinforcements.
	        "true",               						// BOOLEAN: Whether or not to eject Fire-From-Vehicle (FFV) gunners.
	        5,                    						// SCALAR: Maximum number of AI to eject from the aircraft. Set to a really high # to ignore (like 999).
	        "true",               						// BOOLEAN: Whether or not to keep the heli flying around as a gunship.
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
			[_group1,_group2,_group3,_group4,_group5,_group6,_group7,_group8]
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
