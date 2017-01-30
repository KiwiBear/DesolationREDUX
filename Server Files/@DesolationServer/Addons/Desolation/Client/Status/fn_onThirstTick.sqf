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


_dThirst = 1/18; //--- (100 total thirst) (30 min till dehyration)

DS_var_lastDrank = DS_var_lastDrank + 1;

_iconAnim = 0;

if(DS_var_lastDrank > 3600) then { // 1 hour grace period
	DS_var_Thirst = DS_var_Thirst - _dThirst;
	_iconAnim = 1;
	if(!DS_var_isDehydrating) then {
		DS_var_isDehydrating = true;
	};
} else {
	if(DS_var_isDehydrating) then {
		DS_var_isDehydrating = false;
	};
};
if(_iconAnim == 0 && DS_var_Thirst == 100) then {
	_iconAnim = 2;
};

if(_iconAnim == 0) then {
	//-- hide thirst icon
	_ctrl = uiNamespace getVariable ["THIRST_ICON",controlNull];
	if(!isNull _ctrl) then {
		if (ctrlShown _ctrl) then {
			_ctrl ctrlShow false;
		};
	};
};
if(_iconAnim == 1) then {
	//flash thirst icon
	_ctrl = uiNamespace getVariable ["THIRST_ICON",controlNull];
	if(!isNull _ctrl) then {
		_ctrl ctrlShow !(ctrlShown _ctrl);
	};
};
if(_iconAnim == 2) then {
	//-- show thirst icon
	_ctrl = uiNamespace getVariable ["THIRST_ICON",controlNull];
	if(!isNull _ctrl) then {
		if (!ctrlShown _ctrl) then {
			_ctrl ctrlShow true;
		};
	};
};