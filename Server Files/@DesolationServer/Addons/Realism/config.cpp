class CfgPatches
{
	class Realism {};
};
class Plugins
{
	class Realism
	{
		name = "Improved Realism";
		desc = "Makes the game feel more realistic. Adds sound effects and makes the player feel less military trained.";
		tag = "RSM";
	};
}
class CfgFunctions
{
	class RSM
	{
		class Client 
		{
			file = "Realism\Client";
			isclient = 1;
			class initRealism {};
		};
	};
};