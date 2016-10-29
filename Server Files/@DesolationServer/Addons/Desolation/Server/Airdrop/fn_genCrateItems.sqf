/*
	Desolation Redux
	2016 Desolation Dev Team

	License info here and copyright symbol above
*/
_config = configFile >> "CfgAirdropSpawns";
_config = _config select floor(random(count(_config)));

_weapons = getArray(_config >> "weapons");
_magazines = getArray(_config >> "magazines");
_items = getArray(_config >> "items");
_backpacks = getArray(_config >> "backpacks");

_selection = [];
if(count(_weapons) > 0) then {_selection pushback [1,_weapons];};
if(count(_magazines) > 0) then {_selection pushback [2,_magazines];};
if(count(_items) > 0) then {_selection pushback [3,_items];};
if(count(_backpacks) > 0) then {_selection pushback [4,_backpacks];};



_out = [getText(_config >> "name"),[],[],[],[]];
for "_i" from 0 to 4+ceil(random(4)) do {
	if(_selection isEqualTo []) exitWith {};

	_index = floor(random(count(_selection)));
	
	_array = _selection select _index;
	
	_outIndex = _array select 0;
	_itemList = _array select 1;
	
	_item = _itemList deleteAt floor(random(count(_itemList)));
	if(_itemList isEqualTo []) then {
		_selection deleteAt _index;
	} else {
		_array set[1,_itemList];
		_selection set[_index,_array];
	};
	
	_outArray = _out select _outIndex;
	_outArray pushback _item;
	_out set[_outIndex,_outArray];
};
_out;