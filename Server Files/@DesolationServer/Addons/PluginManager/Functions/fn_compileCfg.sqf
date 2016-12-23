params["_initOrder"];
private["_MasterObject","_cfg","_config","_tag","_cfgName","_data"];
_MasterObject = bis_functions_mainscope;

_request = ["GetCfgFile",[["configfiles",_initOrder]]] call DB_fnc_buildIORequest;
diag_log _request;
_configEntries = call compile ([_request] call DB_fnc_sendRequest);

_cfg = configFile >> "Plugins";
{
	_cfgName = _x;
	_config = _cfg >> _cfgName;
	_tag = GetText(_config >> "tag");
	_data = _configEntries select _forEachIndex;
	
	diag_log format["<PluginManager>: Broadcasting %1 config entry(s) for %2",count(_data),_cfgName];
	{
		_x set[0,(_x select 0) + "_" + _tag];
		_x pushBack true;
		_MasterObject setVariable _x;
	} forEach _data;
} forEach _initOrder;

