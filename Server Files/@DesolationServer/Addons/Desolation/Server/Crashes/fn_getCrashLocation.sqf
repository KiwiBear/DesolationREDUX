/*
 * Desolation Redux
 * http://desolationredux.com/
 * © 2016 Desolation Dev Team
 * 
 * This work is licensed under the Arma Public License Share Alike (APL-SA) + Bohemia monetization rights.
 * To view a copy of this license, visit:
 * https://www.bistudio.com/community/licenses/arma-public-license-share-alike/
 * https://www.bistudio.com/monetization/
 */

_crashtype = _this select 0;
_maxSearchDist = _this select 1;

//_spawnLocations = [];

/*
//Depreciated
_variableNameLocations = format ["DS_HeliCrash_%1_locations",_crashtype];
_desiredLocations = missionNamespace getVariable _variableNameLocations;
*/
_mapPos = [true, false] call DS_fnc_GenRandMapPos;
_mapPos
