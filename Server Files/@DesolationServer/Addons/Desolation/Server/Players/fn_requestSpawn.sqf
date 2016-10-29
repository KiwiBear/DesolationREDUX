/*
	Desolation Redux
	2016 Desolation Dev Team

	License info here and copyright symbol above
*/
private["_playerObj","_dbCallback"];
//--- player is requesting to spawn in, ask the database how they should do it
_playerObj = _this select 0;
_playerObj setVariable ["DDATA",_this select 1];

_dbCallback = "DS_fnc_dbOnSpawnResponse";
["spawnPlayer",_dbCallback,[_playerObj]] call DS_fnc_dbRequest; //--- send request to database