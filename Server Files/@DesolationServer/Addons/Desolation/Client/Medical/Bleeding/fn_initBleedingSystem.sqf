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
DS_var_damagedBy = [];

/*
_unit setVariable ["DS_var_BleedSources",[],true];
_unit setVariable ["DS_var_BleedSourcesInfo",[],true];
*/
{
	_bsources = _x getVariable["BLEED_SOURCES",[]];
	
	_unit = _x;
	{
		_gSelect = _x select 0;
		_gLevel = _x select 1;
		_gOffset = _x select 2;
	
		[_unit,_gLevel,_gSelect,_gOffset] call DS_fnc_createBleedSource;
	} forEach _bsources;
	
} forEach allPlayers;