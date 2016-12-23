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

params ["_zombieAgent","_soundLast","_target"];

if ((animationState _zombieAgent) isEqualTo "unconscious") exitWith { _soundLast };

if ((diag_ticktime - _soundLast) >= SM_ZombieSoundDelayAggressive) then
{
	_aggressive = selectRandom _aggressiveArray; 
	[_zombieAgent, _aggressive] remoteExecCall ["Say3D", -2];
	_soundLast = diag_ticktime;
};

doStop _zombieAgent;

_zombieAgent setDir (_zombieAgent getDir _target);

_attackAnim = selectRandom 
[
	"ZombieStandingAttack1",
	"ZombieStandingAttack2",
	"ZombieStandingAttack3",
	"ZombieStandingAttack4",
	"ZombieStandingAttack5",
	"ZombieStandingAttack6",
	"ZombieStandingAttack7",
	"ZombieStandingAttack8",
	"ZombieStandingAttack9",
	"ZombieStandingAttack10"
];

[_zombieAgent, _attackAnim] remoteExecCall ["switchMove", -2];

_attack = selectRandom _attackArray;
[_zombieAgent, _attack] remoteExecCall ["Say3D", -2];

_soundLast
