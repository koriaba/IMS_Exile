/*
    IMS_raidHoldActionScripts.sqf
    Written by Salutesh
    www.reality-gaming.eu
    
    Description: 
	Event scripts for the hold actions. 

*/

IMS_Overmind_Terminal_ActionScript2 = {
	// Define mission player units.
	private _playerUnits = ([16060,16962.4,0] nearEntities ["Exile_Unit_Player", 250]);
	// Remove hold action.
	[IMS_ScriptObject_OvermindTerminal, 0] remoteExec ["bis_fnc_holdActionRemove", 0, true];
	sleep 3;
	// Close terminal.
	[IMS_ScriptObject_OvermindTerminal, 0] remoteExec ["BIS_fnc_dataTerminalAnimate", -2, true];
	[IMS_ScriptObject_OvermindTerminal,"red","red","red"] call BIS_fnc_DataTerminalColor;
	// Notify player with toast.
	[] remoteExec ["IMS_Overmind_Toast2_Terminal", _playerUnits, true];
};

IMS_Overmind_Terminal_ActionScript1 = {
	// Define mission player units.
	private _playerUnits = ([16060,16962.4,0] nearEntities ["Exile_Unit_Player", 250]);
	// Remove hold action
	[IMS_ScriptObject_OvermindTerminal, 0] remoteExec ["bis_fnc_holdActionRemove", 0, true];
	// Animate the terminal
	[IMS_ScriptObject_OvermindTerminal,"purple","orange","purple"] call BIS_fnc_DataTerminalColor;
	[IMS_ScriptObject_OvermindTerminal, 3] call BIS_fnc_dataTerminalAnimate;
	// Notify player with toast.
	[] remoteExec ["IMS_Overmind_Toast1_Terminal", _playerUnits, true];
	// Add hold action to com center terminal.
	[IMS_ScriptObject_OvermindTerminal, "Transfer data", "use", "_this distance _target < 5", {remoteExec ["IMS_Overmind_Terminal_ActionScript2", 0, true];},[], 2, true] call IMS_fnc_AddHoldAction;
};

IMS_Overmind_Keyboard_ActionScript = {
	// Define mission player units.
	private _playerUnits = ([16060,16962.4,0] nearEntities ["Exile_Unit_Player", 250]);
	// Remove hold action
	[IMS_ScriptObject_OvermindKeyboard, 0] remoteExec ["bis_fnc_holdActionRemove", 0, true];
	// Set screens object texture (rly buggy at the moment).
	IMS_ScriptObject_OvermindMainScreen setObjectTextureGlobal [0, "textures\exile_os_download.jpg"];
	sleep 5;
	IMS_ScriptObject_OvermindMainScreen setObjectTextureGlobal [0, "textures\exile_os_download_20.jpg"];
	sleep 5;
	IMS_ScriptObject_OvermindMainScreen setObjectTextureGlobal [0, "textures\exile_os_download_40.jpg"];
	sleep 5;
	IMS_ScriptObject_OvermindMainScreen setObjectTextureGlobal [0, "textures\exile_os_download_60.jpg"];
	sleep 5;
	IMS_ScriptObject_OvermindMainScreen setObjectTextureGlobal [0, "textures\exile_os_download_80.jpg"];
	sleep 5;
	IMS_ScriptObject_OvermindMainScreen setObjectTextureGlobal [0, "textures\exile_os_download_100.jpg"];
	sleep 5;
	// Notify player with toast.
	[] remoteExec ["IMS_Overmind_Toast_Keyboard", _playerUnits, true];
	// Add hold action to com center terminal.
	[IMS_ScriptObject_OvermindTerminal, "Activate terminal", "use", "_this distance _target < 5", {remoteExec ["IMS_Overmind_Terminal_ActionScript1", 0, true];},[], 2, true] call IMS_fnc_AddHoldAction;
};

IMS_Overmind_PC_ActionScript = {
	// Define mission player units.
	private _playerUnits = ([16060,16962.4,0] nearEntities ["Exile_Unit_Player", 250]);
	// Remove hold action
	[IMS_ScriptObject_OvermindPC, 0] remoteExec ["bis_fnc_holdActionRemove", 0, true];
	sleep 3;
	// Set screens object texture (rly buggy at the moment).
	IMS_ScriptObject_OvermindScreen1 setObjectTextureGlobal [0, "textures\exile_os.jpg"];
	IMS_ScriptObject_OvermindScreen2 setObjectTextureGlobal [0, "textures\exile_os.jpg"];
	IMS_ScriptObject_OvermindMainScreen setObjectTextureGlobal [0, "textures\exile_os.jpg"];
	// Add hold action to com center computer.
	[IMS_ScriptObject_OvermindKeyboard, "Upload data", "use", "_this distance _target < 5", {remoteExec ["IMS_Overmind_Keyboard_ActionScript", 0, true];},[], 2, true] call IMS_fnc_AddHoldAction;
	// Notify player with toast.
	[] remoteExec ["IMS_Overmind_Toast_PC", _playerUnits, true];
};

IMS_Overmind_Generator_ActionScript = {
	// Define mission player units.
	private _playerUnits = ([16060,16962.4,0] nearEntities ["Exile_Unit_Player", 250]);
	// Remove hold action
	[IMS_ScriptObject_OvermindGenerator, 0] remoteExec ["bis_fnc_holdActionRemove", 0, true];
	sleep 3;
	// Add hold action to com center computer.
	[IMS_ScriptObject_OvermindPC, "Start Computer", "use", "_this distance _target < 5", {remoteExec ["IMS_Overmind_PC_ActionScript", 0, true];},[], 2, true] call IMS_fnc_AddHoldAction;
	// Notify player with toast.
	[] remoteExec ["IMS_Overmind_Toast_Generator", _playerUnits, true];
};

IMS_Overmind_Laptop_ActionScript2 = {
	// Define mission player units.
	private _playerUnits = ([16060,16962.4,0] nearEntities ["Exile_Unit_Player", 250]);
	// Remove hold action
	[IMS_ScriptObject_OvermindLaptop, 0] remoteExec ["bis_fnc_holdActionRemove", 0, true];
	// Add hold action to com center generator.
	[IMS_ScriptObject_OvermindGenerator, "Start Generator", "use", "_this distance _target < 5", {remoteExec ["IMS_Overmind_Generator_ActionScript", 0, true];},[], 2, true] call IMS_fnc_AddHoldAction;
	// Notify player with toast.
	[] remoteExec ["IMS_Overmind_Toast3_Laptop", _playerUnits, true];
};

IMS_Overmind_Laptop_ActionScript1 = {
	// Define mission player units.
	private _playerUnits = ([16060,16962.4,0] nearEntities ["Exile_Unit_Player", 250]);
	// Notify player with toast.
	[] remoteExec ["IMS_Overmind_Toast1_Laptop", _playerUnits, true];
	// Set screens object texture (rly buggy at the moment).
	IMS_ScriptObject_OvermindLaptop setObjectTextureGlobal [0, "textures\exile_os_download.jpg"];
	sleep 5;
	IMS_ScriptObject_OvermindLaptop setObjectTextureGlobal [0, "textures\exile_os_download_20.jpg"];
	sleep 5;
	IMS_ScriptObject_OvermindLaptop setObjectTextureGlobal [0, "textures\exile_os_download_40.jpg"];
	sleep 5;
	IMS_ScriptObject_OvermindLaptop setObjectTextureGlobal [0, "textures\exile_os_download_60.jpg"];
	sleep 5;
	IMS_ScriptObject_OvermindLaptop setObjectTextureGlobal [0, "textures\exile_os_download_80.jpg"];
	sleep 5;
	IMS_ScriptObject_OvermindLaptop setObjectTextureGlobal [0, "textures\exile_os_download_100.jpg"];
	sleep 5;
	// Remove first hold action
	[IMS_ScriptObject_OvermindLaptop, 0] remoteExec ["bis_fnc_holdActionRemove", 0, true];
	// Add second hold action to laptop object.
	[IMS_ScriptObject_OvermindLaptop, "Pick up data", "use", "_this distance _target < 5", {remoteExec ["IMS_Overmind_Laptop_ActionScript2", 0, true];}, [], 2, true] call IMS_fnc_AddHoldAction;
	// Notify player with toast.
	[] remoteExec ["IMS_Overmind_Toast2_Laptop", _playerUnits, true];
};

IMS_Overmind_Unlock_ActionScript = {
	// Define mission player units.
	private _playerUnits = ([16060,16962.4,0] nearEntities ["Exile_Unit_Player", 250]);
	// Define resarch terrain building.
	private _researchBuilding = ((nearestobjects [[16017.2,17042,-0.0274544], ["Land_Dome_Big_F"], 50]) select 0);
	// Open the building doors.
	_researchBuilding animateSource ["Door_2_source", 1];
	_researchBuilding animateSource ["Door_3_source", 1];
	_researchBuilding animateSource ["Door_1A_source", 1];
	_researchBuilding animateSource ["Door_1B_source", 1];
	_researchBuilding setVariable ["bis_disabled_Door_1" , 0, true];
	_researchBuilding setVariable ["bis_disabled_Door_2" , 0, true];
	_researchBuilding setVariable ["bis_disabled_Door_3" , 0, true];
	IMS_ScriptObject_OvermindKeypad1 setVariable ["ExileIsLocked", 0, true];
	IMS_ScriptObject_OvermindKeypad2 setVariable ["ExileIsLocked", 0, true];
	// Notify player with toast.
	[] remoteExec ["IMS_Overmind_Toast_Unlocked", _playerUnits, true];
};

IMS_Overmind_Lock_ActionScript = {
	// Define mission player units.
	private _playerUnits = ([16060,16962.4,0] nearEntities ["Exile_Unit_Player", 250]);
	// Define resarch terrain building.
	private _researchBuilding = ((nearestobjects [[16017.2,17042,-0.0274544], ["Land_Dome_Big_F"], 50]) select 0);
	// Close the building doors.
	_researchBuilding animateSource ["Door_2_source", 0];
	_researchBuilding animateSource ["Door_3_source", 0];
	_researchBuilding animateSource ["Door_1A_source", 0];
	_researchBuilding animateSource ["Door_1B_source", 0];
	_researchBuilding setVariable ["bis_disabled_Door_1" , 1, true];
	_researchBuilding setVariable ["bis_disabled_Door_2" , 1, true];
	_researchBuilding setVariable ["bis_disabled_Door_3" , 1, true];
	IMS_ScriptObject_OvermindKeypad1 setVariable ["ExileIsLocked", -1, true];
	IMS_ScriptObject_OvermindKeypad2 setVariable ["ExileIsLocked", -1, true];
	// Notify player with toast.
	[] remoteExec ["IMS_Overmind_Toast_Locked", _playerUnits, true];
};

IMS_Overmind_Tablet_ActionScript = {
	// Define mission player units.
	private _playerUnits = ([16060,16962.4,0] nearEntities ["Exile_Unit_Player", 250]);
	// Remove hold action from tablet object.
	[IMS_ScriptObject_OvermindTablet, 0] remoteExec ["bis_fnc_holdActionRemove", 0, true];
	// Delete the tablet object.
	deleteVehicle IMS_ScriptObject_OvermindTablet;
	// Add hold actions to research building keypad objects.
	[IMS_ScriptObject_OvermindKeypad1, "Unlock", "unlock", "((IMS_ScriptObject_OvermindKeypad1 getvariable ['ExileIsLocked',1]) isEqualTo -1)", {remoteExec ["IMS_Overmind_Unlock_ActionScript", 0, true];},[], 2, false] call IMS_fnc_AddHoldAction;
	[IMS_ScriptObject_OvermindKeypad1, "Lock", "lock", "((IMS_ScriptObject_OvermindKeypad1 getvariable ['ExileIsLocked',1]) isEqualTo 0)", {remoteExec ["IMS_Overmind_Lock_ActionScript", 0, true];},[], 2, false] call IMS_fnc_AddHoldAction;
	[IMS_ScriptObject_OvermindKeypad2, "Unlock", "unlock", "((IMS_ScriptObject_OvermindKeypad2 getvariable ['ExileIsLocked',1]) isEqualTo -1)", {remoteExec ["IMS_Overmind_Unlock_ActionScript", 0, true];},[], 2, false] call IMS_fnc_AddHoldAction;
	[IMS_ScriptObject_OvermindKeypad2, "Lock", "lock", "((IMS_ScriptObject_OvermindKeypad2 getvariable ['ExileIsLocked',1]) isEqualTo 0)", {remoteExec ["IMS_Overmind_Lock_ActionScript", 0, true];},[], 2, false] call IMS_fnc_AddHoldAction;
	// Add hold action to research laptop object.
	[IMS_ScriptObject_OvermindLaptop, "Get research data", "hack", "_this distance _target < 5", {remoteExec ["IMS_Overmind_Laptop_ActionScript1", 0, true];},[], 2, true] call IMS_fnc_AddHoldAction;
	IMS_ScriptObject_OvermindLaptop setObjectTextureGlobal [0, "textures\exile_os.jpg"];
	// Notify player with toast.
	[] remoteExec ["IMS_Overmind_Toast_Tablet", _playerUnits, true];
};

IMS_Overmind_Npc_ActionScript = {
	// Define mission player units.
	private _playerUnits = ([16060,16962.4,0] nearEntities ["Exile_Unit_Player", 250]);
	// Create the first mission task.
	[] remoteExec ["IMS_Overmind_TaskEvent_1", _playerUnits, true];
	// Notify player with toast.
	[] remoteExec ["IMS_Overmind_Toast_Npc", _playerUnits, true];
	sleep 3;
	IMS_InteractionNpc_OvermindQuestgiver removeAllEventHandlers "AnimDone";
	IMS_InteractionNpc_OvermindQuestgiver allowDamage true;
	IMS_InteractionNpc_OvermindQuestgiver setDamage 1;
	sleep 3;
	// Notify player with toast.
	[] remoteExec ["IMS_Toast_NewTask", _playerUnits, true];
};