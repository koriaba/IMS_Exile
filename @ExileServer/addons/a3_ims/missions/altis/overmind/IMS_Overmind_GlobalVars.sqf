/*
    IMS_Fortress_GlobalVars.sqf
    Written by Salutesh
    www.reality-gaming.eu
	
*/

// Add hold action to tablet object.
[IMS_ScriptObject_OvermindTablet, "Pick up Tablet", "use", "_this distance _target < 5", {remoteExec ["IMS_Overmind_Tablet_ActionScript", 0, true];}, [], 2, true] call IMS_fnc_AddHoldAction;

// Lock the Keypad for action change condition.
//IMS_ScriptObject_OvermindKeypad1 setVariable ["ExileIsLocked", -1, true];
//IMS_ScriptObject_OvermindKeypad2 setVariable ["ExileIsLocked", -1, true];

// Add textures to keypads.
IMS_ScriptObject_OvermindKeypad1 setObjectTextureGlobal [0, "textures\keypad.paa"];
IMS_ScriptObject_OvermindKeypad2 setObjectTextureGlobal [0, "textures\keypad.paa"];

// Close com center terminal.
[IMS_ScriptObject_OvermindTerminal, 0] remoteExec ["BIS_fnc_dataTerminalAnimate", -2, true];
[IMS_ScriptObject_OvermindTerminal,"green","green","green"] call BIS_fnc_DataTerminalColor;

// Define the research terrain building.
private _researchBuilding = ((nearestobjects [[16017.2,17042,-0.0274544], ["Land_Dome_Big_F"], 50]) select 0);
// Lock the research building.
_researchBuilding setVariable ["bis_disabled_Door_1" , 1, true];
_researchBuilding setVariable ["bis_disabled_Door_2" , 1, true];
_researchBuilding setVariable ["bis_disabled_Door_3" , 1, true];

// Lock area gates.
IMS_ScriptObject_OvermindGate1 setVariable ["ExileIsLocked", -1, true];
IMS_ScriptObject_OvermindGate2 setVariable ["ExileIsLocked", -1, true];

// Alarm Sound
IMS_Overmind_AlarmEvent = {
	{_x say "air_raid"} foreach [IMS_ScriptObject_OvermindSpeaker1,IMS_ScriptObject_OvermindSpeaker2,IMS_ScriptObject_OvermindSpeaker3,IMS_ScriptObject_OvermindSpeaker4];
	sleep 10;
	{_x say "air_raid"} foreach [IMS_ScriptObject_OvermindSpeaker1,IMS_ScriptObject_OvermindSpeaker2,IMS_ScriptObject_OvermindSpeaker3,IMS_ScriptObject_OvermindSpeaker4];
	sleep 10;
	{_x say "air_raid"} foreach [IMS_ScriptObject_OvermindSpeaker1,IMS_ScriptObject_OvermindSpeaker2,IMS_ScriptObject_OvermindSpeaker3,IMS_ScriptObject_OvermindSpeaker4];
	sleep 10;
	{_x say "air_raid"} foreach [IMS_ScriptObject_OvermindSpeaker1,IMS_ScriptObject_OvermindSpeaker2,IMS_ScriptObject_OvermindSpeaker3,IMS_ScriptObject_OvermindSpeaker4];
	sleep 10;
	{_x say "air_raid"} foreach [IMS_ScriptObject_OvermindSpeaker1,IMS_ScriptObject_OvermindSpeaker2,IMS_ScriptObject_OvermindSpeaker3,IMS_ScriptObject_OvermindSpeaker4];
	sleep 10;
	{_x say "air_raid"} foreach [IMS_ScriptObject_OvermindSpeaker1,IMS_ScriptObject_OvermindSpeaker2,IMS_ScriptObject_OvermindSpeaker3,IMS_ScriptObject_OvermindSpeaker4];
	sleep 10;
	{_x say "air_raid"} foreach [IMS_ScriptObject_OvermindSpeaker1,IMS_ScriptObject_OvermindSpeaker2,IMS_ScriptObject_OvermindSpeaker3,IMS_ScriptObject_OvermindSpeaker4];
	sleep 10;
	{_x say "air_raid"} foreach [IMS_ScriptObject_OvermindSpeaker1,IMS_ScriptObject_OvermindSpeaker2,IMS_ScriptObject_OvermindSpeaker3,IMS_ScriptObject_OvermindSpeaker4];
	sleep 10;
	{_x say "air_raid"} foreach [IMS_ScriptObject_OvermindSpeaker1,IMS_ScriptObject_OvermindSpeaker2,IMS_ScriptObject_OvermindSpeaker3,IMS_ScriptObject_OvermindSpeaker4];
	sleep 10;
	{_x say "air_raid"} foreach [IMS_ScriptObject_OvermindSpeaker1,IMS_ScriptObject_OvermindSpeaker2,IMS_ScriptObject_OvermindSpeaker3,IMS_ScriptObject_OvermindSpeaker4];
	sleep 10;
	{_x say "air_raid"} foreach [IMS_ScriptObject_OvermindSpeaker1,IMS_ScriptObject_OvermindSpeaker2,IMS_ScriptObject_OvermindSpeaker3,IMS_ScriptObject_OvermindSpeaker4];
	sleep 10;
	{_x say "air_raid"} foreach [IMS_ScriptObject_OvermindSpeaker1,IMS_ScriptObject_OvermindSpeaker2,IMS_ScriptObject_OvermindSpeaker3,IMS_ScriptObject_OvermindSpeaker4];
	sleep 10;
	{_x say "air_raid"} foreach [IMS_ScriptObject_OvermindSpeaker1,IMS_ScriptObject_OvermindSpeaker2,IMS_ScriptObject_OvermindSpeaker3,IMS_ScriptObject_OvermindSpeaker4];
	sleep 10;
	{_x say "air_raid"} foreach [IMS_ScriptObject_OvermindSpeaker1,IMS_ScriptObject_OvermindSpeaker2,IMS_ScriptObject_OvermindSpeaker3,IMS_ScriptObject_OvermindSpeaker4];
	sleep 10;
	{_x say "air_raid"} foreach [IMS_ScriptObject_OvermindSpeaker1,IMS_ScriptObject_OvermindSpeaker2,IMS_ScriptObject_OvermindSpeaker3,IMS_ScriptObject_OvermindSpeaker4];
	sleep 10;
	{_x say "air_raid"} foreach [IMS_ScriptObject_OvermindSpeaker1,IMS_ScriptObject_OvermindSpeaker2,IMS_ScriptObject_OvermindSpeaker3,IMS_ScriptObject_OvermindSpeaker4];
	sleep 10;
	{_x say "air_raid"} foreach [IMS_ScriptObject_OvermindSpeaker1,IMS_ScriptObject_OvermindSpeaker2,IMS_ScriptObject_OvermindSpeaker3,IMS_ScriptObject_OvermindSpeaker4];
	sleep 10;
	{_x say "air_raid"} foreach [IMS_ScriptObject_OvermindSpeaker1,IMS_ScriptObject_OvermindSpeaker2,IMS_ScriptObject_OvermindSpeaker3,IMS_ScriptObject_OvermindSpeaker4];
	sleep 10;
	{_x say "air_raid"} foreach [IMS_ScriptObject_OvermindSpeaker1,IMS_ScriptObject_OvermindSpeaker2,IMS_ScriptObject_OvermindSpeaker3,IMS_ScriptObject_OvermindSpeaker4];
};

// Jet Sounds
IMS_Overmind_JetSoundEvent = {
	playSound "BattlefieldJet1_3D";
	sleep 3;
	playSound "BattlefieldJet2_3D";
	sleep 3;
	playSound "BattlefieldJet3_3D";
};

// Bombing Event
IMS_Overmind_BombEvent = {
	[[15974.2,17038.6,0],50,5,2] remoteExec ["IMS_fnc_EndBombing",0,true];
	sleep 5;
	[[16059.2,17090.9,0],50,5,2] remoteExec ["IMS_fnc_EndBombing",0,true];	
	sleep 5;
	[[16154,17057.7,0],50,5,2] remoteExec ["IMS_fnc_EndBombing",0,true];	
	sleep 5;
	[[16125.2,16962.9,0],50,5,2] remoteExec ["IMS_fnc_EndBombing",0,true];
	sleep 5;
	[[16074.7,16877.4,0],50,5,2] remoteExec ["IMS_fnc_EndBombing",0,true];
	sleep 5;
	[[16009.6,16951.4,0],50,5,2] remoteExec ["IMS_fnc_EndBombing",0,true];
};

// DMS Mission Handling
IMS_Overmind_DMSCompletionEvent = {
	// End the DMS mission The Fortress after raid event completion.
	// This grabs the array that contains information about the mission.
	// If you want to use this script on a static mission, then replace "DMS_Mission_Arr" with "DMS_StaticMission_Arr".
	private _missionInfo = DMS_StaticMission_Arr select IMS_Overmind_SaticMission_Arr;
	{
		_x setDamage 1;				// Kill all units
	} forEach ((_missionInfo select 4) call DMS_fnc_GetAllUnits);
	// AI groups/units are stored in the 3rd index of each mission.
	// The DMS function returns an array of all units, so we can loop over them and kill them.

	// The mission completion info is stored in the 1st index of each mission.
	// This wipes any previous completion info and replaces it with the "external" completion type, which is specifically for cases like this
	// where you want to trigger a mission completion "externally" using a script.
	_missionInfo set [1, [["external",true]]];	
};

publicVariable "IMS_Overmind_AlarmEvent";
publicVariable "IMS_Overmind_JetSoundEvent";