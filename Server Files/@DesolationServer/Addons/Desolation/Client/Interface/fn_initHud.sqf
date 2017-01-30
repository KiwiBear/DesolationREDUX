

disableserialization;
100 cutRsc ["DS_HUD","PLAIN"];
_display = uiNamespace getVariable ["ds_hud_display",displayNull];
if(isNull _display) exitWith {diag_log "Fatal Error: Failed to load DS_HUD";};

_bloodIcon = _display displayCtrl 10;
_thirstIcon = _display displayCtrl 11;
_hungerIcon = _display displayCtrl 12;
_boneIcon = _display displayCtrl 13;
_infectionIcon = _display displayCtrl 14;

_bloodIcon ctrlShow false;
_thirstIcon ctrlShow false;
_hungerIcon ctrlShow false;
_boneIcon ctrlShow false;
_infectionIcon ctrlShow false;

uiNamespace setVariable ["BLOOD_ICON",_bloodIcon];
uiNamespace setVariable ["THIRST_ICON",_thirstIcon];
uiNamespace setVariable ["HUNGER_ICON",_hungerIcon];
uiNamespace setVariable ["BONE_ICON",_boneIcon];
uiNamespace setVariable ["INFECTION_ICON",_infectionIcon];