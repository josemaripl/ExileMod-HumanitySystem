 /**
 * ExileClient_object_player_network_createPlayerResponse
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 /*

Modified By GR8
GR8's Humanity System v1.0

*/
private["_player","_chuteNetID","_spawnType","_chute","_corpseGroup"];
_player = _this select 0;
_chuteNetID = _this select 1;
_spawnType = _this select 12;
if !(_chuteNetID isEqualTo "") then
{
	_chute = objectFromNetId _chuteNetID;
}
else
{
	_chute = objNull;
};
[_player, _chute, _spawnType] call ExileClient_object_player_spawn;
ExileClientPlayerMoney = parseNumber (_this select 2);
ExileClientPlayerScore = parseNumber (_this select 3);
ExileClientPlayerHumanity = parseNumber (_this select 4);

switch (true) do 
{   
    case (ExileClientPlayerHumanity < -5000):
    {
		ExileClientPlayerHumanityStatus = "Bandit";  
	};
	case (ExileClientPlayerHumanity > 5000):
    {
		ExileClientPlayerHumanityStatus = "Hero";  
    };
	default
    {	
		ExileClientPlayerHumanityStatus = "Survivor";
	};
};

ExileClientPlayerKills = _this select 5;
ExileClientPlayerDeaths = _this select 6;
ExileClientClanName = _this select 11;
if !(ExileClientPartyID isEqualTo -1) then
{
	if !(isNull ExileClientLastDiedPlayerObject) then
	{	
		_corpseGroup = createGroup independent;
		[ExileClientLastDiedPlayerObject] joinSilent _corpseGroup;
	};
	[player] joinSilent (groupFromNetId ExileClientPartyID);
};
(_this select 10) call ExileClient_object_player_bambiStateBegin;
true