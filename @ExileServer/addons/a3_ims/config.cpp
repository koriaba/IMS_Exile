/*
	IMS Server Addon Configuration
	Written by Salutesh
	www.reality-gaming.eu
*/

class CfgPatches
{
	class a3_ims
	{
		units[] = {};
		weapons[] = {};
		a3_IMS_version = "December 23, 2016";
		requiredVersion = 1.66;
		requiredAddons[] = {"exile_client","exile_server_config","a3_dms"};
	};
};

class CfgFunctions
{
	class IMS
	{	
		tag = "IMS";
		class Master
		{
			file = "\x\addons\ims";
			class IMS_preInit 									{preInit = 1;};
			class IMS_postInit 									{postInit = 1;};
		};
		class Functions
		{
			file = "\x\addons\ims\functions";
			class AddHoldAction 								{};
			class CarpetBombing									{};
			class CreateMarker									{};	
			class DebugLog										{};
			class EndBombing 									{};
			class HideTerrainObject								{};
			class ImportFromExileEdenPlugin 					{};
			class ImportFromExileEdenPluginInteraction 			{};
			class ImportFromExileEdenPluginScripted 			{};
			class ImportFromExileEdenPluginSimple 				{};
			class ImportFromExileEdenPluginSimpleInteraction 	{};
			class ImportInteractionCrates						{};
			class ImportInteractionNpcs							{};
			class InteractionNpcCreate 							{};
			class InteractionNpcOnAnimationDone 				{};
			class LootDrop 										{};
			class SetGroupBehavior								{};
			class SpawnAIGroup_Guards							{};
			class SpawnAIGroup_Patrol							{};
			class SpawnAIGroup_MultiPos							{};
			class SpawnAIGuard									{};
			class SpawnAISoldier								{};
			class SpawnNonPersistentVehicle						{};
			class SpawnPersistentVehicle						{};
		};
	};
};
