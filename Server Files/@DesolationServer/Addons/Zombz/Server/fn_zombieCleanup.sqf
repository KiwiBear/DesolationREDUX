/*
Desolation Redux
2016 Desolation Dev Team

License info here and copyright symbol above
*/

/*
	Author: StokesMagee
	Project: DSR_SM_Zombz
	Description: SM_Zombz desolation redux edition.
*/

_zombies = bis_functions_mainscope getVariable ["SM_DeadZombies", []];

// This should only happen if there are no zombies left on the map!
if (_zombies isEqualTo []) exitWith { true };

_deleted = [];
{
	_zombieAgent = objectFromNetId (_x select 0);

	if !(isNull _zombieAgent) then
	{
		_diedAt = _x select 1;
		if ((diag_tickTime - _diedAt) >= 420) then
		{
			// Delete the loot the zombie had.
			_lootWeaponHolder = _x select 2;
			if !(isNull _lootWeaponHolder) then
			{
				deleteVehicle _lootWeaponHolder;
			};

			// Delete the zombie.
			deleteVehicle _zombieAgent;

			_deleted pushBack _forEachIndex;
		};
	};
} forEach _zombies;

if (_deleted isEqualTo []) exitWith { true };

{
	_zombies deleteAt (_x - _forEachIndex);
} forEach _deleted;

bis_functions_mainscope setVariable ["SM_DeadZombies", _zombies];

true
