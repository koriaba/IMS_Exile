/*
    File: fn_InteractionNpcCreate.sqf
    Written by Salutesh
    www.reality-gaming.eu
    
    Description:
	
	COMMING SOON
	
*/

private["_npcClassName","_npcFace","_animations","_position", "_holdActionTitle", "_holdActionIcon", "_holdActionEvent", "_npc","_npcName","_animationCount"];
_npcClassName = _this select 0;
_npcFace = _this select 1;
_animations = _this select 2;
_position = _this select 3;
_direction = _this select 4;
_holdActionTitle = _this select 5;
_holdActionIcon = _this select 6;
_holdActionEvent = _this select 7;
_npcName = _this select 8;
_scriptName = format ["IMS_InteractionNpc_%1",_npcName];
_npc = _npcClassName createVehicle [0,0,0];
_npc setVariable ["BIS_enableRandomization", false];
_npc setVariable ["BIS_fnc_animalBehaviour_disable", true];
_npc disableAI "ANIM";
_npc disableAI "MOVE";
_npc disableAI "FSM";
_npc disableAI "AUTOTARGET";
_npc disableAI "TARGET";
_npc disableAI "CHECKVISIBLE";
_npc allowDamage false; 
_npc removeAllEventHandlers "HandleDamage";
_npc setFace _npcFace;
_npc setPos _position;
_npc setDir _direction;
_npc switchMove (_animations select 0);
_animationCount = count _animations;
if (_animationCount > 1) then
{
	_npc setVariable ["IMS_Animations", _animations];
	_npc addEventHandler ["AnimDone", {[_this] remoteExec ["IMS_fnc_InteractionNpcOnAnimationDone", 0, true]}];
};

[_npc, _holdActionTitle, _holdActionIcon, "_this distance _target < 5", _holdActionEvent, [], 2, true] call IMS_fnc_AddHoldAction;

missionNamespace setVariable [_scriptName, _npc, true];
publicVariable _scriptName;

_npc
