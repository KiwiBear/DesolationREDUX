/*
	fn_initClient

	Desolation Redux
	2016 Desolation Dev Team

	License info here and copyright symbol above
*/
_enabled = call compile (["Enabled","DS"] call BASE_fnc_getCfgValue);
if(!_enabled) exitWith {diag_log "DESOLATION IS NOT ENABLED, THE PLUGIN WILL NOT RUN";};

0 cutRsc ["background","PLAIN",0];
0 fadeSound 0;
0 fadeMusic 0;

call ds_fnc_initInvHandler;
call ds_fnc_initHealthSys;

//asks the server to spawn us
[player] remoteExec ["DS_fnc_requestSpawn", 2];
