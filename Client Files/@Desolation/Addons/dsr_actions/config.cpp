class CfgPatches
{
	class dsr_actions
	{
		fileName = "dsr_actions.pbo";
		requiredAddons[] = {};
		requiredVersion = 0.1;
		units[] = {};
		weapons[] = {};
		vehicles[] = {};
		author[]= {"Desolation Redux Dev Team"};
	};
};

//--- base item actions
class Action_Drink { // drinks
	text = "Drink %itemname%";
	condition = "!(isNil 'ds_fnc_drink') && !isNil 'ds_var_thirst'"; //TODO more conditions
	action = "[_classname] spawn ds_fnc_drink";
};
class Action_Eat { // foods
	text = "Eat %itemname%";
	condition = "!(isNil 'ds_fnc_eat') && !isNil 'ds_var_hunger'"; //TODO more conditions
	action = "[_classname] spawn ds_fnc_eat";
};
class Action_Use { // use item
	text = "Use %itemname%";
	condition = "false"; //TODO more conditions
	action = "hint 'use not defined';";
};

class Action_Fill { // use item
	text = "Fill %itemname%";
	condition = "false"; //TODO more conditions
	action = "hint 'use not defined';";
};
class Action_FillWater { // fill with water
	text = "Fill %itemname%";
	condition = "(_classname find '_empty' != 0) && !(isNil 'ds_fnc_fillwater') && (toLower(_cursor) in (missionNamespace getVariable ['DS_VAR_WATER_FILLUP_STATIONS',['Land_WaterCooler_01_new_F','Land_WaterCooler_01_old_F','and_WaterPump_01_F','Land_WaterTank_01_F','Land_WaterTank_02_F','Land_WaterTank_03_F','Land_WaterTank_04_F','Land_WaterTank_F']]))";
	action = "[_classname] spawn ds_fnc_fillwater";
};
class Action_FillHydrocarbon { // fill propane or butane
	text = "Fill %itemname%";
	condition = "(_classname find '_empty' != 0) && !(isNil 'ds_fnc_fillhcarbon')";
	action = "[_classname] spawn ds_fnc_fillhcarbon";
};

class CfgMagazines {
	//--- food
	class dsr_item_beans {
		class Actions {
			class Eat : Action_Eat {};
		};
	};
	class dsr_item_cereal {
		class Actions {
			class Eat : Action_Eat {};
		};
	};
	class dsr_item_powderedmilk {
		class Actions {
			class Eat : Action_Eat {};
		};
	};
	class dsr_item_rice {
		class Actions {
			class Eat : Action_Eat {};
		};
	};
	class dsr_item_bacon {
		class Actions {
			class Eat : Action_Eat {};
		};
	};
	//--- drinks
	class dsr_item_waterbottle_full {
		class Actions {
			class Drink : Action_Drink {};
		};
	};
	class dsr_item_waterbottle_dirty {
		class Actions {
			class Drink : Action_Drink {};
		};
	};
	class dsr_item_waterbottle_empty {
		class Actions {
			class Fill : Action_FillWater {};
		};
	};
	class dsr_item_canteen_full {
		class Actions {
			class Drink : Action_Drink {};
		};
	};
	class dsr_item_canteen_dirty {
		class Actions {
			class Drink : Action_Drink {};
		};
	};
	class dsr_item_canteen_empty {
		class Actions {
			class Fill : Action_FillWater {};
		};
	};
	class dsr_item_spirit {
		class Actions {
			class Drink : Action_Drink {};
		};
	};
	class dsr_item_franta {
		class Actions {
			class Drink : Action_Drink {};
		};
	};
	class dsr_item_rustyspirit {
		class Actions {
			class Drink : Action_Drink {};
		};
	};
	//--- medical
	class dsr_item_antibiotic {
		class Actions {
			class Use : Action_Use {
				condition = "!(isNil 'ds_fnc_useantibotic')";
				action = "[] spawn ds_fnc_useantibotic";
			};
		};
	};
	class dsr_item_bandage {
		class Actions {
			class Use : Action_Use {
				condition = "!(isNil 'ds_fnc_usebandage')";
				action = "[] spawn ds_fnc_usebandage";
			};
		};
	};
	class dsr_item_bloodbag_empty {
		class Actions {
			class Fill : Action_Fill {
				condition = "!(isNil 'ds_fnc_fillblood')";
				action = "[] spawn ds_fnc_fillblood";
			};
		};
	};
	class dsr_item_bloodbag_full {
		class Actions {
			class Use : Action_Use {
				condition = "!(isNil 'ds_fnc_useblood') && !isNil 'ds_var_blood'";
				action = "[] spawn ds_fnc_useblood";
			};
			class Drink : Action_Drink {};
		};
	};
	class dsr_item_defibrillator {
		class Actions {
			class Use : Action_Use {
				condition = "!(isNil 'ds_fnc_usedefib') && cursorObject isKindOf 'man' && !isPlayer cursorObject && !alive cursorObject";
				action = "[] spawn ds_fnc_usedefib";
			};
		};
	};
	class dsr_item_disinfectant {
		class Actions {
			class Use : Action_Use {
				condition = "!(isNil 'ds_fnc_usedisinfectant')";
				action = "[] spawn ds_fnc_usedisinfectant";
			};
		};
	};
	class dsr_item_handwarmer {
		class Actions {
			class Use : Action_Use {
				condition = "!(isNil 'ds_fnc_usehandwarmer')";
				action = "[] spawn ds_fnc_usehandwarmer";
			};
		};
	};
	class dsr_item_painkillers {
		class Actions {
			class Use : Action_Use {
				condition = "!(isNil 'ds_fnc_usepainkillers')";
				action = "[] spawn ds_fnc_usepainkillers";
			};
		};
	};
	class dsr_item_vitamins {
		class Actions {
			class Use : Action_Use {
				condition = "!(isNil 'ds_fnc_usevitamins')";
				action = "[] spawn ds_fnc_usevitamins";
			};
		};
	};
	class dsr_item_waterpurificationtablets {
		class Actions {
			class Use : Action_Use {
				condition = "!(isNil 'ds_fnc_usewpt')";
				action = "[] spawn ds_fnc_usewpt";
			};
		};
	};
	//--- tools
	class dsr_item_butane_empty {
		class Actions {
			class Fill : Action_FillHydrocarbon {};
		};
	};
	class dsr_item_propane_empty {
		class Actions {
			class Fill : Action_FillHydrocarbon {};
		};
	};
	class dsr_item_matches {
		class Actions {
			class Use : Action_Use {
				condition = "!(isNil 'ds_fnc_lightfire')";
				action = "[] spawn ds_fnc_lightfire";
			};
		};
	};
	
	//--- other
	class dsr_item_bucket_empty {
		class Actions {
			class Fill : Action_FillWater {};
		};
	};
};