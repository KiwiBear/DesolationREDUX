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

/*
	Automatically swap people talking in side chat into direct chat
*/
params["_player"];

_player setUnitRecoilCoefficient (call compile (["Recoil","RSM"] call BASE_fnc_getCfgValue));
_player setCustomAimCoef (call compile (["Sway_Multiplier","RSM"] call BASE_fnc_getCfgValue));