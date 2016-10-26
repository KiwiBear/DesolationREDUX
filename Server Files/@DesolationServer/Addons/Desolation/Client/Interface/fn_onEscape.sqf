/*
	fn_onEscape

	Desolation Redux
	2016 Desolation Dev Team

	License info here and copyright symbol above
*/
params["_display"];

_lastTime = missionNamespace getVariable ["DS_var_escapeTimer",diag_tickTime];
if(diag_tickTime >= _lastTime) then {
	missionNamespace setVariable ["DS_var_escapeTimer",diag_tickTime+60];
	call ds_fnc_saveData;
};

if(isNil {_display}) exitWith {systemchat "ESCAPE DISPLAY NIL";};
if(isNull _display) exitWith {systemchat "ESCAPE DISPLAY NULL";};

_ctrl = _display displayCtrl 103;
_ctrl ctrlEnable false;
_ctrl = _display displayCtrl 1002;
_ctrl ctrlEnable false;
_ctrl = _display displayCtrl 1010;
_ctrl ctrlEnable false;