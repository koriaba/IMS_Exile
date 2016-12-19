/*
	IMS_fnc_AddHoldAction
	Created by Salutesh
	Based on GOM_CB by Grumpy Old Man

	Added air raid sirens to various buildings (fully autonomous) and bomb falling sounds.
	The bombing will start at the location and move to a random direction.
	Maximum values are 48 bombs, 250 meters to prevent the script from bombing the entire map.
	
	Usage:
	[
		_positionCenter,	
		_bombAmount,					// [NUMBER]: Amount of bombs droped in the area. 
		_distance,						// [NUMBER]: Distance in meters that can be bombed.		
		_direction						// [NUMBER]: Direction degree of bombed area.
	] call IMS_fnc_CarpetBombing.
	
*/

params [["_bomblocation",getposatl player],["_amount",20],["_distance",100],["_direction",random 360]];

_amount = _amount min 48;
_distance = _distance min 250;

_GOM_CB_type = selectRandom ["Bo_GBU12_LGB","Bo_Mk82_MI08","Bomb_03_F","Bomb_04_F"];

_debug = false;

_firstImpactPos = _bomblocation getPos [(_distance / 2),_direction + 180];



_bomb = "";
_posincrement = (_amount / _distance) * 10;
_altincrease = 0;
_relpos = [_bomblocation,_posincrement,_direction] call BIS_fnc_relPos;

_nul = [_firstImpactPos] spawn {

    params ["_bomblocation"];

    _airraidsirens = nearestobjects [_bomblocation,["Land_BellTower_01_V1_F","Land_BellTower_01_V2_F","Land_BellTower_02_V1_F","Land_BellTower_02_V2_F","Land_Cargo_HQ_V1_F","Land_Cargo_HQ_V2_F","Land_Cargo_HQ_V3_F","Land_Chapel_Small_V1_F","Land_Chapel_Small_V2_F","Land_Chapel_V1_F","Land_Chapel_V2_F","Land_Church_01_V1_F","Land_Loudspeakers_F"],1500];

    for "_i" from 0 to 8 do {

        {_x say "air_raid"} foreach _airraidsirens;

        sleep 8.6;

    };

};

sleep random [20,30,40];
_randomsound = selectRandom ["BattlefieldJet1_3D","BattlefieldJet2_3D","BattlefieldJet3_3D"];

if (player distance _bomblocation < 1500) then {
	_playerUnits = _bomblocation nearEntities ["Exile_Unit_Player", 250];
	[_randomsound, 0] remoteExec ["BIS_fnc_playSound", _playerUnits, true];

	_soundsleep = getnumber (configfile >> "CfgSounds" >> _randomsound >> "duration");

	sleep (_soundsleep + 2);
};

_relpos = _firstImpactPos;

for "_i" from 1 to _amount do {
	_randomnumb = random [-20,0,20];
	_bomb = _GOM_CB_type createvehicle ([(_relpos select 0) + _randomnumb,(_relpos select 1) + random 5,(_relpos select 2)+ 1500 + 	_altincrease]);

	_posincrement = _posincrement + (15 + random 25);
	_relpos = _firstImpactPos getPos [_posincrement,_direction];

	if (_debug) then {
		_helper = "Sign_Arrow_Large_F" createvehicle [getposATL _bomb select 0, getposATL _bomb select 1,0];
	};

	_altincrease = _altincrease + (75 + random 35);
	_bomb setVectorDirAndUp [[0,0,-1],[0,0.8,0]];

	_nul = [_bomb] spawn {
		_bomb = _this select 0;
		waituntil {getposATL _bomb select 2 <= 700};
		_soundarray = ["Shell1","Shell2","Shell3","Shell4"];
		_soundpos = [getposATL _bomb select 0, getposATL _bomb select 1,0];
		_helper = "Land_Battery_F" createvehicle _soundpos;
		_helper hideobject true;
		_helper say selectRandom _soundarray;
		waituntil {!alive _bomb};
		deletevehicle _helper;
	};
};