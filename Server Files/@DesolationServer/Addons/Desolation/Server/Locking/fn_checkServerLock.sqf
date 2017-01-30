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

 
_password = bis_functions_mainscope getVariable ["ServerCommandPassword_DS", ""];
if(DS_var_finishedVehicles && DS_var_finishedLoot && SM_var_finishedZombies) then {
	bis_functions_mainscope setVariable ["ServerCommandPassword_DS",nil,true]; //--- wipe security vulnerability 
	_password serverCommand "#unlock";
	diag_log "SERVER LOCKING > UNLOCKED";
	
	
	_password spawn {
		params["_password"];
		
		uiSleep (3600*4)-(60*5);
		["Server restarting in 5 minutes.\nPlease log out soon"] remoteExecCall ["hint",allPlayers];
		uiSleep 60*4;
		["Server restarting in 60 seconds.\nPlease log out now"] remoteExecCall ["hint",allPlayers];
		uiSleep 60;
		
		// prevent new players from connecting
		diag_log  "Shutdown > Locking Server";
		_password serverCommand "#lock";
		
		// kick existing players
		diag_log  "Shutdown > Kicking Players";
		{
			_password serverCommand ("#kick " + str(owner _x));
		} forEach allPlayers;
		
		// wait for all disconnects to process
		uiSleep 10; 
		
		// save vehicles
		diag_log  "Shutdown > Waiting for vehicle monitor to exit";
		waitUntil{!DS_var_savingVehicles};
		DS_var_runVehicleMon = false;
		diag_log  "Shutdown > Saving Vehicles";
		_newArray1 = [];
		_newArray2 = [];
		{
			_uuid = DS_var_VehicleUUIDS select _forEachIndex;
			if (isNull _x || !(alive _x)) then {
				["destroyVehicle","",[_uuid,objNull]] call DS_fnc_dbRequest;
				if(!isNull _x) then {
					detach _x;
					deleteVehicle _x;
				};
			} else {
				["updateVehicle","",[_x]] call DS_fnc_dbRequest;
			};
		} forEach (DS_var_Vehicles);
		
		// shutdown server
		diag_log  "Shutdown > Done"
		_password serverCommand "#shutdown";
		
	};
};