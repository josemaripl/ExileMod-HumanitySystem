/**
 * ExileServer_object_player_event_onMpKilled
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
GR8's Humanity System v1.3

*/
private["_victim","_killer","_victimPosition","_addDeathStat","_addKillStat","_normalkill","_killerRespectPoints","_fragAttributes","_player","_grpvictim","_grpkiller","_log","_lastVictims","_victimUID","_vehicleRole","_vehicle","_lastKillAt","_killStack","_distance","_distanceBonus","_flagNextToKiller","_homieBonus","_flagNextToVictim","_raidBonus","_overallRespectChange","_newKillerScore","_killMessage","_newKillerFrags","_newVictimDeaths","_killerHumanity","_victimHumanity"];
if (!isServer || hasInterface) exitWith {};
_victim = _this select 0;
_killer = _this select 1;
if( isNull _victim ) exitWith {};
_victim setVariable ["ExileDiedAt", time];
if !(isPlayer _victim) exitWith {};
_victimPosition = getPos _victim;
format["insertPlayerHistory:%1:%2:%3:%4:%5", getPlayerUID _victim, name _victim, _victimPosition select 0, _victimPosition select 1, _victimPosition select 2] call ExileServer_system_database_query_fireAndForget;
format["deletePlayer:%1", _victim getVariable ["ExileDatabaseId", -1]] call ExileServer_system_database_query_fireAndForget;
_victim setVariable ["ExileIsDead", true];
_victim setVariable ["ExileName", name _victim, true];
_killerHumanity = _killer getVariable ["ExileHumanity",0];
_victimHumanity = _victim getVariable ["ExileHumanity",0];
_victim call ExileServer_object_flies_spawn;
_addDeathStat = true;
_addKillStat = true;
_normalkill = true;
_killerRespectPoints = [];
_fragAttributes = [];
if (_victim isEqualTo _killer) then
{
	["systemChatRequest", [format["%1 commited suicide!", (name _victim)]]] call ExileServer_object_player_event_killFeed;
}
else 
{
	if (vehicle _victim isEqualTo _killer) then
	{
		["systemChatRequest", [format["%1 crashed to death!", (name _victim)]]] call ExileServer_object_player_event_killfeed;
	}
	else 
	{
		if (isNull _killer) then
		{
			["systemChatRequest", [format["%1 died for an unknown reason!", (name _victim)]]] call ExileServer_object_player_event_killfeed;
		}
		else 
		{
			_player = objNull;
			if (isPlayer _killer) then 
			{
				if ((typeOf _killer) isEqualTo "Exile_Unit_Player") then
				{
					_player = _killer;	
				}
				else 
				{
					_uid = getPlayerUID _killer;
					{
						if ((getPlayerUID _x) isEqualTo _uid) exitWith 
						{
							_player = _x;
						};
					}
					forEach allPlayers;
				};
			}
			else 
			{
				if (isUAVConnected _killer) then 
				{
					_player = (UAVControl _killer) select 0;
				};
			};
			if !(isNull _player) then
			{
				_killer = _player;
				if(_killerHumanity < -5000) then {
					// Killer = Bandit
					if(_victimHumanity < -5000) then {
						// Victim = Bandit
						_fragAttributes pushBack "Bandit Kill";
						_killerRespectPoints pushBack ["BANDIT KILL", (getNumber (configFile >> "CfgSettings" >> "Humanity" >> "Frags" >> "BanditXBandit"))];
					} else {
						if(_victimHumanity > 5000) then {
							// Victim = Hero
							_fragAttributes pushBack "Hero Kill";
							_killerRespectPoints pushBack ["HERO KILL", (getNumber (configFile >> "CfgSettings" >> "Humanity" >> "Frags" >> "BanditXHero"))];
						} else {
							// Victim = survivor
							_fragAttributes pushBack "Survivor Kill";
							_killerRespectPoints pushBack ["SURVIVOR KILL", (getNumber (configFile >> "CfgSettings" >> "Humanity" >> "Frags" >> "BanditXSurvivor"))];

						};
					};
				} else {
					if(_killerHumanity > 5000) then {
						// Killer = Hero
						if(_victimHumanity < -5000) then {
							// Victim = Bandit
							_fragAttributes pushBack "Bandit Kill";
							_killerRespectPoints pushBack ["BANDIT KILL", (getNumber (configFile >> "CfgSettings" >> "Humanity" >> "Frags" >> "HeroXBandit"))];
						} else {
							if(_victimHumanity > 5000) then {
								// Victim = Hero
								_fragAttributes pushBack "Hero Kill";
								_killerRespectPoints pushBack ["HERO KILL", (getNumber (configFile >> "CfgSettings" >> "Humanity" >> "Frags" >> "HeroXHero"))];
							} else {
								// Victim = survivor
								_fragAttributes pushBack "Survivor Kill";
								_killerRespectPoints pushBack ["SURVIVOR KILL", (getNumber (configFile >> "CfgSettings" >> "Humanity" >> "Frags" >> "HeroXSurvivor"))];
							};
							_killer setVariable ["humanKills",(_kilHumans + 1),true];
						};
					} else {
						// Killer = Survivor
						if(_victimHumanity < -5000) then {
							// Victim = Bandit
							_fragAttributes pushBack "Bandit Kill";
							_killerRespectPoints pushBack ["BANDIT KILL", (getNumber (configFile >> "CfgSettings" >> "Humanity" >> "Frags" >> "SurvivorXBandit"))];
						} else {
							if(_victimHumanity > 5000) then {
								// Victim = Hero
								_fragAttributes pushBack "Hero Kill";
								_killerRespectPoints pushBack ["HERO KILL", (getNumber (configFile >> "CfgSettings" >> "Humanity" >> "Frags" >> "SurvivorXHero"))];
							} else {
								// Victim = survivor
								_fragAttributes pushBack "Survivor Kill";
								_killerRespectPoints pushBack ["SURVIVOR KILL", (getNumber (configFile >> "CfgSettings" >> "Humanity" >> "Frags" >> "SurvivorXSurvivor"))];
							};
						};
					};
				};
				_overallRespectChange = 0;
				{
					_overallRespectChange = _overallRespectChange + (_x select 1);
				}
				forEach _killerRespectPoints;
				_newKillerScore = _killer getVariable ["ExileHumanity", 0];
				_newKillerScore = _newKillerScore + _overallRespectChange;
				_killer setVariable ["ExileHumanity", _newKillerScore];
				format["setAccountHumanity:%1:%2", _newKillerScore,getPlayerUID _killer] call ExileServer_system_database_query_fireAndForget;
				if(_normalkill)then
				{
					_killMessage = format ["%1 was killed by %2", (name _victim), (name _killer)];
					if !(count _fragAttributes isEqualTo 0) then
					{
						_killMessage = _killMessage + " (" + (_fragAttributes joinString ", ") + ")";
					};
					["systemChatRequest", [_killMessage]] call ExileServer_object_player_event_killfeed;
					if (_addKillStat isEqualTo true) then
					{
						_newKillerFrags = _killer getVariable ["ExileKills", 0];
						_newKillerFrags = _newKillerFrags + 1;
						_killer setVariable ["ExileKills", _newKillerFrags];
						format["addAccountKill:%1", getPlayerUID _killer] call ExileServer_system_database_query_fireAndForget;
					};
				};
				[_killer, "showFragRequest", [_killerRespectPoints]] call ExileServer_system_network_send_to;
				_killer call ExileServer_object_player_sendStatsUpdate;
			}
			else 
			{
				["systemChatRequest", [format["%1 was killed by an NPC! (%2m Distance)", (name _victim), floor(_victim distance _killer)]]] call ExileServer_object_player_event_killfeed;
			};
		};
	};
};
if (_addDeathStat isEqualTo true) then
{
	_newVictimDeaths = _victim getVariable ["ExileDeaths", 0];
	_newVictimDeaths = _newVictimDeaths + 1;
	_victim setVariable ["ExileDeaths", _newVictimDeaths];
	format["addAccountDeath:%1", getPlayerUID _victim] call ExileServer_system_database_query_fireAndForget;
	_victim call ExileServer_object_player_sendStatsUpdate;
};
[_victim] joinSilent ExileGraveyardGroup;
true