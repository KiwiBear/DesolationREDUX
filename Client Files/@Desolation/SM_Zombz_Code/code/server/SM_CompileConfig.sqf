/**
 * The Forsaken Survivors Community
 * www.theforsakensurvivors.co.uk
 * © 2016 The Forsaken Survivors Community
 *
 * This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License.
 * To view a copy of this license, visit https://creativecommons.org/licenses/by-sa/4.0/
 */

SM_Debug = ["SM_Debug", false] call SM_ConfigFetch;
SM_ZombieCleanupDeath = ["SM_ZombieCleanupDeath", 150] call SM_ConfigFetch;
SM_ZombieWaveCount = ["SM_ZombieWaveCount", 5] call SM_ConfigFetch;
SM_ZombieItemCount = ["SM_ZombieItemCount", 5] call SM_ConfigFetch;
SM_ZombieSpawnDelay = ["SM_ZombieSpawnDelay", 60] call SM_ConfigFetch;
SM_ZombieMaxDistance = ["SM_ZombieMaxDistance", 150] call SM_ConfigFetch;
SM_ZombieMinDistance = ["SM_ZombieMinDistance", 25] call SM_ConfigFetch;
SM_ZombieCleanup = ["SM_ZombieCleanup", 60] call SM_ConfigFetch;
SM_ZombieCleanupDistance = ["SM_ZombieCleanupDistance", 300] call SM_ConfigFetch;
SM_MaxZombies = ["SM_MaxZombies", 200] call SM_ConfigFetch;
SM_ZombiesPerPlayer = ["SM_ZombiesPerPlayer", 10] call SM_ConfigFetch;
SM_ZombieHealth = ["SM_ZombieHealth", 0.7] call SM_ConfigFetch;
SM_GiveZombiePoptabs = ["SM_GiveZombiePoptabs", true] call SM_ConfigFetch;
SM_MaxPoptabs = ["SM_MaxPoptabs", 50] call SM_ConfigFetch;
SM_PoptabChanceHigh = ["SM_PoptabChanceHigh", 100] call SM_ConfigFetch;
SM_PopTabsChanceLow = ["SM_PopTabsChanceLow", 65] call SM_ConfigFetch;
SM_GivePlayerRespect = ["SM_GivePlayerRespect", true] call SM_ConfigFetch;
SM_MaxRespect = ["SM_MaxRespect", 50] call SM_ConfigFetch;
SM_MaxChanceOfLoot = ["SM_MaxChanceOfLoot", 100] call SM_ConfigFetch;
SM_MinChanceOfLoot = ["SM_MinChanceOfLoot", 85] call SM_ConfigFetch;
SM_MaxItemDrop = ["SM_MaxItemDrop", 3] call SM_ConfigFetch;
SM_ZombieClasses = ["SM_ZombieClasses", []] call SM_ConfigFetch;
SM_Zombie_GlowingFace = ["SM_Zombie_GlowingFace", true] call SM_ConfigFetch;
SM_Zombie_SpawnInGround = ["SM_Zombie_SpawnInGround", true] call SM_ConfigFetch;
SM_ExplodingHeadEnabled = ["SM_ExplodingHeadEnabled", false] call SM_ConfigFetch;
SM_MaxZombiesInHorde = ["SM_MaxZombiesInHorde", 69] call SM_ConfigFetch;
SM_SpawnHordeChance = ["SM_SpawnHordeChance", 2.5] call SM_ConfigFetch;
SM_HordesEnabled = ["SM_HordesEnabled", true] call SM_ConfigFetch;
SM_HordeSpawnDelay = ["SM_HordeSpawnDelay", 120] call SM_ConfigFetch;
SM_HordeMarkerCleanup = ["SM_HordeMarkerCleanup", 120] call SM_ConfigFetch;
SM_MinZombiesInHorde = ["SM_MinZombiesInHorde", 10] call SM_ConfigFetch;
SM_ZombieSpawnMaxDistanceFromPosition = ["SM_ZombieSpawnMaxDistanceFromPosition", 15] call SM_ConfigFetch;
SM_HordeSpawnMaxDistanceFromPosition = ["SM_HordeSpawnMaxDistanceFromPosition", 35] call SM_ConfigFetch;
SM_ZombieSpawnMaxDistanceFromPositionTown = ["SM_ZombieSpawnMaxDistanceFromPositionTown", 10] call SM_ConfigFetch;
SM_ZombieSpawnMinDistanceFromPositionTown = ["SM_ZombieSpawnMinDistanceFromPositionTown", 5] call SM_ConfigFetch;
SM_ZombieMinDistanceTown = ["SM_ZombieMinDistanceTown", 25] call SM_ConfigFetch;
SM_ZombieMaxDistanceTown = ["SM_ZombieMaxDistanceTown", 100] call SM_ConfigFetch;
SM_ZombiesPerWave = ["SM_ZombiesPerWave", 5] call SM_ConfigFetch;
SM_HordeMarkerEnabled = ["SM_HordeMarkerEnabled", true] call SM_ConfigFetch;
SM_HordeNotificationEnabled = ["SM_HordeNotificationEnabled", true] call SM_ConfigFetch;
SM_DespawnZombieOrKill = ["SM_DespawnZombieOrKill", true] call SM_ConfigFetch;
SM_HordeNotificationText = ["SM_HordeNotificationText", ""] call SM_ConfigFetch;
SM_HordeMarkerType = ["SM_HordeMarkerType", 1] call SM_ConfigFetch;
SM_HordeMarkerCleanupEnabled = ["SM_HordeMarkerCleanupEnabled", true] call SM_ConfigFetch;
SM_HordeMarkerText = ["SM_HordeMarkerText", ""] call SM_ConfigFetch;
SM_HordeMarkerStyle = ["SM_HordeMarkerStyle", ""] call SM_ConfigFetch;
SM_HordeMarkerColor = ["SM_HordeMarkerColor", ""] call SM_ConfigFetch;
SM_ZombiesPerWaveTown = ["SM_ZombiesPerWaveTown", 7] call SM_ConfigFetch;
SM_ZombiesPerPlayerInTown = ["SM_ZombiesPerPlayerInTown", 15] call SM_ConfigFetch;
SM_SearchForTownRadius = ["SM_SearchForTownRadius", 1000] call SM_ConfigFetch;
SM_TownSearchTypes = ["SM_TownSearchTypes", []] call SM_ConfigFetch;

SM_ExileEnabled = isClass (configFile >> "CfgPatches" >> "exile_client");
SM_EpochEnabled = isClass (configFile >> "CfgPatches" >> "A3_epoch_code");

SM_LootArray = call 
{
	if (SM_ExileEnabled) exitWith { ["SM_LootItemsExile", []] call SM_ConfigFetch };
	if (SM_EpochEnabled) exitWith { ["SM_LootItemsEpoch", []] call SM_ConfigFetch };
	["SM_LootItems", []] call SM_ConfigFetch
};
SM_MaxCrypto = ["SM_MaxCrypto", 50] call SM_ConfigFetch;
SM_GiveCrpyto = ["SM_GiveCrpyto", true] call SM_ConfigFetch;
SM_UserSafezoneCheckMarkerObjects = ["SM_UserSafezoneCheckMarkerObjects", ""] call SM_ConfigFetch;
SM_UserSafezoneCheck = ["SM_UserSafezoneCheck", false] call SM_ConfigFetch;
SM_UserSafezoneCheckType = ["SM_UserSafezoneCheckType", 1] call SM_ConfigFetch;
SM_UserSafezoneCheckDistance = ["SM_UserSafezoneCheckDistance", 50] call SM_ConfigFetch;
SM_UserBaseCheck = ["SM_UserBaseCheck", false] call SM_ConfigFetch;
SM_UserBaseCheckMarkerObjects = ["SM_UserBaseCheckMarkerObjects", ""] call SM_ConfigFetch;
SM_UserBaseCheckType = ["SM_UserBaseCheckType", 1] call SM_ConfigFetch;
SM_UserBaseCheckDistance = ["SM_UserBaseCheckDistance", 50] call SM_ConfigFetch;
SM_NotificationEnabled = ["SM_NotificationEnabled", true] call SM_ConfigFetch;
SM_ZombieGutsLength = ["SM_ZombieGutsLength", 300] call SM_ConfigFetch;
SM_ShuffleArrayDelay = ["SM_ShuffleArrayDelay", 300] call SM_ConfigFetch;
SM_FacesArray = ["SM_FacesArray", []] call SM_ConfigFetch;
SM_FaceFemaleArray = ["SM_FaceFemaleArray", []] call SM_ConfigFetch;
SM_ZombieZones = ["SM_ZombieZones", []] call SM_ConfigFetch;
SM_ZombieZonesEnabled = ["SM_ZombieZonesEnabled", false] call SM_ConfigFetch;
SM_ZombiesCanSpawnRandomly = ["SM_ZombiesCanSpawnRandomly", false] call SM_ConfigFetch;
SM_RespawnDelayForPlayerEnabled = ["SM_RespawnDelayForPlayerEnabled", true] call SM_ConfigFetch;
SM_RespawnDelayForPlayer = ["SM_RespawnDelayForPlayer", 300] call SM_ConfigFetch;
SM_ZombieSpawnMinDistanceFromPosition = ["SM_ZombieSpawnMinDistanceFromPosition", 5] call SM_ConfigFetch;
SM_HordeSpawnMinDistanceFromPosition = ["SM_HordeSpawnMinDistanceFromPosition", 5] call SM_ConfigFetch;
SM_RespawnDelayForPlayerTown = ["SM_RespawnDelayForPlayerTown", 420] call SM_ConfigFetch;
SM_ZombieClassesTown = ["SM_ZombieClassesTown", []] call SM_ConfigFetch;
SM_TownSearchEnabled = ["SM_TownSearchEnabled", false] call SM_ConfigFetch;
SM_DisableZombieSpawnsUntilInNewZoneEnabled = ["SM_DisableZombieSpawnsUntilInNewZoneEnabled", false] call SM_ConfigFetch;
SM_HordeZonesEnabled = ["SM_HordeZonesEnabled", false] call SM_ConfigFetch;
SM_HordeUseZombieZones = ["SM_HordeUseZombieZones", false] call SM_ConfigFetch;
SM_HordeZones = ["SM_HordeZones", []] call SM_ConfigFetch;
SM_HordeCanSpawnRandomly = ["SM_HordeCanSpawnRandomly", false] call SM_ConfigFetch;
SM_HordeMinDistanceTown = ["SM_HordeMinDistanceTown", 5] call SM_ConfigFetch;
SM_HordeMaxDistanceTown = ["SM_HordeMaxDistanceTown", 100] call SM_ConfigFetch;
SM_HordeSpawnMinDistanceFromPositionTown = ["SM_HordeSpawnMinDistanceFromPositionTown", 5] call SM_ConfigFetch;
SM_HordeSpawnMaxDistanceFromPositionTown = ["SM_HordeSpawnMaxDistanceFromPositionTown", 100] call SM_ConfigFetch;
SM_MaxZombiesInHordeTown = ["SM_MaxZombiesInHordeTown", 50] call SM_ConfigFetch;
SM_MinZombiesInHordeTown = ["SM_MinZombiesInHordeTown", 5] call SM_ConfigFetch;
SM_HordeClassesTown = ["SM_HordeClassesTown", []] call SM_ConfigFetch;
SM_HordeClasses = ["SM_HordeClasses", []] call SM_ConfigFetch;
SM_HordeMinDistance = ["SM_HordeMinDistance", 10] call SM_ConfigFetch;
SM_HordeMaxDistance = ["SM_HordeMaxDistance", 150] call SM_ConfigFetch;
_side = "";
switch (toLower (["SM_ZombieSide", "civilian"] call SM_ConfigFetch)) do 
{
	case "west": { _side = west; }; 
	case "east": { _side = east; }; 
	case "independent": { _side = independent; };
	case "civilian": { _side = civilian; };
	default { _side = ""};
};
if (_side isEqualTo "") then
{
	_side = east;
};
SM_ZombieSide = _side;

true
