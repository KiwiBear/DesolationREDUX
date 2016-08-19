/**
 * Pre-Initialization
 *
 * www.DonkeyPunch.INFO
 * © 2015 DirtySanchez
 *
 * 
 */

private ['_code', '_function', '_file'];

{
    _code = '';
    _function = _x select 0;
    _file = _x select 1;

    _code = compileFinal (preprocessFileLineNumbers _file);                    

    missionNamespace setVariable [_function, _code];
}
forEach 
[
	['DS_fnc_objectPackUp', 'DS_desolationredux\functions\DS_fnc_objectPackUp.sqf'],
	['DS_fnc_sleepingTakeNap', 'DS_desolationredux\functions\DS_fnc_sleepingTakeNap.sqf'],
	['DS_fnc_onInventoryOpen', 'DS_desolationredux\functions\DS_fnc_onInventoryOpen.sqf']
];