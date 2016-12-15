/*

[
	"I_officer_F",																											// STRING: Unit class name.
	"WhiteHead_11",																											// STRING: Unit face class name.
	["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],	// ARRAY: Unit animation classes.
	[3780.82,8960.52,0.101166],																								// ARRAY: Unit position.
	157.522,																												// NUMBER: Unit direction.
	"Talk to Officer",																										// STRING: Units hold action title.
	"talk",																													// STRING: Hold action type.
	"_this distance _target < 5",																							// STRING: Hold action condition.
	{remoteExec ["IMS_Overmind_Npc_ActionScript", 0, true];}																// STRING: Hold action event script/code.
	"OvermindQuestgiver"																									// STRING: Units name.
]

*/

[
	["I_officer_F", "WhiteHead_11", ["Acts_LyingWounded_loop1","Acts_LyingWounded_loop2","Acts_LyingWounded_loop3"], [15919.4,17014.6,0.00143909], 212.122, "Talk to Officer", "talk", "_this distance _target < 5", {remoteExec ["IMS_Overmind_Npc_ActionScript",0,true];}, "OvermindQuestgiver"]
]
