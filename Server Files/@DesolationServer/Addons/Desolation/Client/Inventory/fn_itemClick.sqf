/*
	fn_itemClick

	Desolation Redux
	2016 Desolation Dev Team

	License info here and copyright symbol above
*/
disableSerialization;
params["_params"];
call dsr_fnc_closebuttons;
_display = findDisplay 602;
if(isNull _display) exitWith {systemchat "ERROR: displayNull";};
_ctrl = _display displayCtrl 1020;
if(isNull _ctrl) exitWith {systemchat "ERROR: ctrlNull";};
_pos = ctrlPosition _ctrl;

_buttonY = _pos select 1;
_buttonX = (_pos select 0) + (_pos select 2) + 0.005;

_ctrl = _params select 0;
_item = _params select 1;
if(isNull _ctrl) exitWith {systemchat "ERROR: ctrlNull 2";};


_classname = _ctrl lbData _item;
_itemtext = _ctrl lbText _item;
	
_actions = configFile >> "CfgMagazines" >> _classname >> "Actions";
_bIndex = 0;
_buttons = [];
if(isClass _actions) then {
	for "_i" from 0 to count(_actions)-1 do {
		_action = _actions select _i;
		if(isClass _action) then {
			_aText = getText(_action >> "text");
			_index = _aText find "%itemname%";
			_sub1 = _aText select [0,_index];
			_sub2 = _aText select [_index+10];
			_aText = _sub1 + _itemtext + _sub2;
			
			_condition = getText(_action >> "condition");
			_action = getText(_action >> "action");
			if(call compile _condition) then {
				_bY = _buttonY + (0.042*_bIndex);
				_bH = 0.04;
				_bW = 0.16;
				_bX = _buttonX;
				_bIndex = _bIndex + 1;
				_ctrl = _display ctrlCreate ["RscButton",-1];
				_ctrl ctrlSetPosition [_bX,_bY,_bW,_bH];
				_ctrl ctrlSetText _aText;
				_ctrl buttonSetAction ("[] spawn dsr_fnc_closebuttons;" + _action);
				_ctrl ctrlCommit 0;
				
				_buttons pushBack _ctrl;
			};
		};
	};
};
_bY = _buttonY + (0.042*_bIndex);
_bH = 0.04;
_bW = 0.16;
_bX = _buttonX;
_bIndex = _bIndex + 1;
_ctrl = _display ctrlCreate ["RscButton",-1];
_ctrl ctrlSetPosition [_bX,_bY,_bW,_bH];
_ctrl ctrlSetText "Exit";
_ctrl buttonSetAction ("[] spawn dsr_fnc_closebuttons;");
_ctrl ctrlCommit 0;
_buttons pushBack _ctrl;
uinamespace setVariable ["dsr_var_itemButtons",_buttons];