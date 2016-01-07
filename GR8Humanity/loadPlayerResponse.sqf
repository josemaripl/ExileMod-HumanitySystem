 /**
 * ExileClient_object_player_network_loadPlayerResponse
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
GR8's Humanity System v1.4

*/
private["_playerNetID","_moneyString","_scoreString","_humanityString","_kills","_deaths","_hunger","_thirst","_alcohol","_clanName","_player"];
_this spawn 
{
	_playerNetID = _this select 0;
	_moneyString = _this select 1;
	_scoreString = _this select 2;
	_humanityString = _this select 3;
	_kills = _this select 4;
	_deaths = _this select 5;
	_hunger = _this select 6;
	_thirst = _this select 7;
	_alcohol = _this select 8;
	_clanName = _this select 9;
	uiSleep 3;
	_player = objectFromNetId _playerNetID;
	[_player, _hunger, _thirst, _alcohol] call ExileClient_object_player_respawn;
	ExileClientPlayerMoney = parseNumber _moneyString;
	ExileClientPlayerScore = parseNumber _scoreString;
	ExileClientPlayerHumanity = parseNumber _humanityString;

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

	ExileClientPlayerKills = _kills;
	ExileClientPlayerDeaths = _deaths;
	ExileClientClanName = _clanName;
	ExileClientPlayerIsBambi = false;
	ExileClientPlayerBambiStateExpiresAt = 0;
	if !(ExileClientPartyID isEqualTo -1) then
	{
		[player] joinSilent (groupFromNetId ExileClientPartyID);
	};
};
true