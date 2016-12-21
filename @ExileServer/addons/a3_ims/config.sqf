/*
	Main IMS Config File
	Written by Salutesh
	www.reality-gaming.eu
*/

/* --- Mission System Settings --- */
	IMS_MissionLogs 					= true;	// Enable or disable IMS log messages.
	IMS_AI_DynamicSimulation			= false; // [WIP] Enable Arma 3 dynamic simulation support for IMS. See more here: https://community.bistudio.com/wiki/Arma_3_Dynamic_Simulation 
	
/* --- Debug Options --- */
/* --- Aircraft Patrol Debug Options --- */	
	IMS_DEBUG_MAPCENTER 				= false;
	IMS_DEBUG_NEARESTLOCATIONS 			= false;
	IMS_DEBUG_STARTINGPOSITIONS 		= false;
	IMS_DEBUG_PATROLWAYPOINTS 			= false;
	
	/* --- General Supply-Crate Settings --- */
	/* --- FOR ALL MISSIONS ON ALL MAPS --- */		
		IMS_SupplyWeapons 					= ["SMG_05_F","hgun_PDW2000_F","hgun_ACPC2_F","hgun_P07_F","arifle_ARX_ghex_F","hgun_Pistol_heavy_02_F","hgun_Rook40_F","arifle_MXC_khk_F"];
		IMS_SupplyMedics					= ["Exile_Item_InstaDoc","Exile_Item_Bandage"];
	
	/* --- The Fortress Mission Settings --- */
	/* --- TANOA AND CHERNARUS MAP ONLY --- */
		IMS_Fortress_MissionActive				= true;	//Enable or disable the Fotress Mission:
		IMS_Fortress_SaticMission_Arr			= 0;																												
		/* 
			IMS_FortressSaticMission_Arr NOTE:
			This value has to be set to succsesfull complete the DMS Mission part without killing all NPCs. 	
			The value depents on the load order of static DMS missions. 
			If the Fortress mission is your second static mission the value is 1, if its the only active static mission or the first the value is 0. 
			You can cange the load order of missions in the DMS map config file. 
		*/
	
		IMS_Fortress_Timer						= 180;	//Time in seconds for the bomb timer. This is just a option for testing things and for reduce/delay the timer.
	
		/* --- Loot Crate Settings --- */
		IMS_Fortress_LootWeapons				= ["srifle_GM6_ghex_F","srifle_DMR_07_hex_F","srifle_LRR_tna_F","SMG_05_F","arifle_MX_SW_khk_F","LMG_03_F","arifle_ARX_ghex_F","arifle_MXC_khk_F"];	// Loot Weapons in the crate after Fortress Mission success.
		IMS_Fortress_LootAmmoAmount				= 3;	// Amount of magazines for every Weapon in IMS_FortressLootWeapons for the crate.
		IMS_Fortress_MedicalItems				= ["Exile_Item_InstaDoc","Exile_Item_Bandage"];	// Madical Items in the crate after Fortress Mission success.
		IMS_Fortress_GearItems					= [];	// Gear Items in the crate after Fortress Mission success.
		IMS_Fortress_PoptabsLoot				= 25000;	// Ammount of Poptabs in the crate on Fortress mission success set to 0 to disable this option.
	
		/* --- Vehicle Spawn Settings --- */
		IMS_Fortress_VehicleLoot				= true;	// Enable/disable vehicle loot spawn on Fortress mission success.
		IMS_Fortress_VehicleLootClass			= "Exile_Car_Ifrit";	// Vehicle Class that spawns if IMS_FortressVehicleLoot is true.
		
	/* --- Overmind Mission Settings --- */
	/* --- ALTIS MAP ONLY --- */
		IMS_Overmind_MissionActive				= true;	// Enable or disable the Overmind Mission:
		IMS_Overmind_SaticMission_Arr			= 0;	// READ NOTES!																							
		/* 
			IMS_FortressSaticMission_Arr NOTE:
			This value has to be set to succsesfull complete the DMS Mission part without killing all NPCs. 	
			The value depents on the load order of static DMS missions. 
			If the Overmind mission is your second static mission the value is 1, if its the only active static mission or the first the value is 0. 
			You can cange the load order of missions in the DMS map config file. 
		*/
		
		IMS_Overmind_Timer						= 180;	// Time in seconds for the bomb timer. This is just a option for testing things and for reduce/delay the timer.
		
		/* --- Loot Crate Settings --- */
		IMS_Overmind_LootWeapons				= ["srifle_GM6_ghex_F","srifle_DMR_07_hex_F","srifle_LRR_tna_F","SMG_05_F","arifle_MX_SW_khk_F","LMG_03_F","arifle_ARX_ghex_F","arifle_MXC_khk_F"];	// Loot Weapons in the crate after Overmind Mission success.
		IMS_Overmind_LootAmmoAmount				= 3;	// Amount of magazines for every Weapon in IMS_FortressLootWeapons for the crate.
		IMS_Overmind_MedicalItems				= ["Exile_Item_InstaDoc","Exile_Item_Bandage"];	// Madical Items in the crate after Overmind Mission success.
		IMS_Overmind_GearItems					= [];	// Gear Items in the crate after Overmind Mission success.
		IMS_Overmind_PoptabsLoot				= 25000;	// Ammount of Poptabs in the crate on Overmind mission success set to 0 to disable this option.
	
		/* --- Vehicle Spawn Settings --- */
		IMS_Overmind_VehicleLoot				= true;	// Enable/disable vehicle loot spawn on Overmind mission success.
		IMS_Overmind_VehicleLootClass			= "Exile_Car_Ifrit";	// Vehicle Class that spawns if IMS_OvermindVehicleLoot is true.

/* ---------------------------------------------------------------- */
/* DO NOT EDIT BELOW THIS LINE IF YOU DONT KNOW WHAT YOU ARE DOING! */
/* ---------------------------------------------------------------- */
if (IMS_AI_DynamicSimulation) then 
{
	// Enable the Dynamic Simulation system.
	enableDynamicSimulation true;
	// Sets activation Dynamic Simulation distance for given group category.
	"Group" setDynamicSimulationDistance 50;
};

// Add public Variables to Server enviroment.
publicVariable "IMS_Fortress_Timer";