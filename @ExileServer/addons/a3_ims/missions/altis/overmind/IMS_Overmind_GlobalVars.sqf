/*
    IMS_Fortress_GlobalVars.sqf
    Written by Salutesh
    www.reality-gaming.eu
	
*/

// Add hold action to tablet object.
[IMS_ScriptObject_OvermindTablet, "Pick up Tablet", "use", "_this distance _target < 5", {remoteExec ["IMS_Overmind_Tablet_ActionScript", 0, true];}, [], 2, true] call IMS_fnc_AddHoldAction;
// Lock the Keypad for action change condition.
IMS_ScriptObject_OvermindKeypad1 setVariable ["ExileIsLocked", -1, true];
IMS_ScriptObject_OvermindKeypad2 setVariable ["ExileIsLocked", -1, true];
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