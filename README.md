Kill Messages By GR8
=============

Dayz Style Humanity System is coming to ExileMod ! This script was made to replace respect with Humanity based gameplay. Humanity is an in-game statistic that determines whether a player is a survivor, a bandit, or a hero, as well as being a general indicator of how well a player interacts with others. A player starts off with a humanity of 2500. A humanity of at least 5000 will give a player the hero status. Conversely, a humanity of 0 or below will give a player the bandit status. A player will gain humanity upon killing bandits, and will lose humanity by injuring or killing survivors or heroes.

This System runs alongside the respect system and does not replace it. However, If you like, you can disable respect completely.

Screenshots
--------------------------
![Screenshot1](http://i.imgur.com/2YMCOAX.jpg)
Missing screenshot of kill message (if anyone can supply, that would be gr8 :D )

Installation
--------------------------

* Download [`HumanitySystem`](https://github.com/Gr8z/ExileMod-HumanitySystem/archive/master.zip)
* Copy **GR8Humanity** folder into your mission PBO.
* Open your **config.cpp** in your mission PBO.
* Look for:
```
class CfgClans
```
* Add this above:
```
#include "GR8Humanity\cfg\CfgNetworkMessages.hpp" // GR8's Humanity
```
* Look for:
```
class CfgExileCustomCode 
{
```
* Replace it with:
```
// GR8's Humanity System
#include "GR8Humanity\cfg\CfgExileCustomCode.hpp"
```
* Open your **exile_server_config.pbo\config.cpp**
* Look for:
```
///////////////////////////////////////////////////////////////////////
// KILLFEED MAN!
///////////////////////////////////////////////////////////////////////
```
* Add this above:
```
	
	///////////////////////////////////////////////////////////////////////
	// HUMANITY (Humanity System By GR8)
	///////////////////////////////////////////////////////////////////////
	class Humanity
	{
		/**
		 * Humanity Gain Loss of kills
		 *
		 * Combination of different types of Kills
		 * Left Side of the X is killer
		 * and the Right side of the X is victim
		 */
		class Frags
		{
			SurvivorXSurvivor = -250; // Survivor Kills a Survivor
			SurvivorXHero = -500; // Survivor kills a Hero
			SurvivorXBandit = 500; // Survivor Kills a Bandit

			HeroXSurvivor = -750; // Hero Kills a Survivor
			HeroXHero = -500; // Hero kills a Hero
			HeroXBandit = 1000; // Hero Kills a Bandit

			BanditXSurvivor = -250; // Bandit Kills a Survivor
			BanditXHero = -1000; // Bandit kills a Hero
			BanditXBandit = 500; // Bandit Kills a Bandit
		};
	};
```
* Open your **@ExileServer\extDB\sql_custom_v2\exile.ini**
* Look for:
```
SQL1_1 = SELECT a.money, a.score, a.kills, a.deaths, a.clan_id, c.name FROM account a LEFT JOIN clan c ON c.id = a.clan_id WHERE a.uid = ?
```
* Replace it with:
```
SQL1_1 = SELECT a.money, a.score, a.humanity, a.kills, a.deaths, a.clan_id, c.name FROM account a LEFT JOIN clan c ON c.id = a.clan_id WHERE a.uid = ?
```
* Look for:
```
OUTPUT = 1,2,3,4,5,6-STRING
```
* Replace it with:
```
OUTPUT = 1,2,3,4,5,6,7-STRING
```
* Look for:
```
[getAccountMoney]
```
* Add above:
```

[getAccountHumanity]
SQL1_1 = SELECT humanity FROM account WHERE uid = ?
Number of Inputs = 1
SQL1_INPUTS = 1 
OUTPUT = 1

[setAccountHumanity]
SQL1_1 = UPDATE account SET humanity = ? WHERE uid = ?
Number of Inputs = 2
SQL1_INPUTS = 1,2 

[modifyAccountHumanity]
SQL1_1 = UPDATE account SET humanity = humanity + ? WHERE uid = ?
Number of Inputs = 2
SQL1_INPUTS = 1,2 

```
* Look for:
```
[loadPlayer]
SQL1_1 = SELECT p.id,
SQL1_2 = p.name,
SQL1_3 = p.account_uid,
SQL1_4 = p.damage,
SQL1_5 = p.hunger,
SQL1_6 = p.thirst,
SQL1_7 = p.alcohol,
SQL1_8 = p.oxygen_remaining,
SQL1_9 = p.bleeding_remaining,
SQL1_10 = p.hitpoints,
SQL1_11 = p.direction,
SQL1_12 = p.position_x,
SQL1_13 = p.position_y,
SQL1_14 = p.position_z,
SQL1_15 = p.assigned_items,
SQL1_16 = p.backpack,
SQL1_17 = p.backpack_items,
SQL1_18 = p.backpack_magazines,
SQL1_19 = p.backpack_weapons,
SQL1_20 = p.current_weapon,
SQL1_21 = p.goggles,
SQL1_22 = p.handgun_items,
SQL1_23 = p.handgun_weapon,
SQL1_24 = p.headgear,
SQL1_25 = p.binocular,
SQL1_26 = p.loaded_magazines,
SQL1_27 = p.primary_weapon,
SQL1_28 = p.primary_weapon_items,
SQL1_29 = p.secondary_weapon,
SQL1_30 = p.secondary_weapon_items,
SQL1_31 = p.uniform,
SQL1_32 = p.uniform_items,
SQL1_33 = p.uniform_magazines,
SQL1_34 = p.uniform_weapons,
SQL1_35 = p.vest,
SQL1_36 = p.vest_items,
SQL1_37 = p.vest_magazines,
SQL1_38 = p.vest_weapons,
SQL1_39 = a.money,
SQL1_40 = a.score,
SQL1_41 = a.kills,
SQL1_42 = a.deaths,
SQL1_43 = c.name
SQL1_44 = FROM player p
SQL1_45 = INNER JOIN account a
SQL1_46 = ON a.uid = p.account_uid 
SQL1_47 = LEFT JOIN clan c 
SQL1_48 = ON c.id = a.clan_id
SQL1_49 = WHERE p.account_uid = ?
Number of Inputs = 1
SQL1_INPUTS = 1
OUTPUT = 1,2-STRING,3-STRING,4,5,6,7,8,9,10,11,12,13,14,15,16-STRING,17,18,19,20-STRING,21-STRING,22,23-STRING,24-STRING,25-STRING,26,27-STRING,28,29-STRING,30,31-STRING,32,33,34,35-STRING,36,37,38,39,40,41,42,43-STRING
```
* Replace it with:
```
[loadPlayer]
SQL1_1 = SELECT p.id,
SQL1_2 = p.name,
SQL1_3 = p.account_uid,
SQL1_4 = p.damage,
SQL1_5 = p.hunger,
SQL1_6 = p.thirst,
SQL1_7 = p.alcohol,
SQL1_8 = p.oxygen_remaining,
SQL1_9 = p.bleeding_remaining,
SQL1_10 = p.hitpoints,
SQL1_11 = p.direction,
SQL1_12 = p.position_x,
SQL1_13 = p.position_y,
SQL1_14 = p.position_z,
SQL1_15 = p.assigned_items,
SQL1_16 = p.backpack,
SQL1_17 = p.backpack_items,
SQL1_18 = p.backpack_magazines,
SQL1_19 = p.backpack_weapons,
SQL1_20 = p.current_weapon,
SQL1_21 = p.goggles,
SQL1_22 = p.handgun_items,
SQL1_23 = p.handgun_weapon,
SQL1_24 = p.headgear,
SQL1_25 = p.binocular,
SQL1_26 = p.loaded_magazines,
SQL1_27 = p.primary_weapon,
SQL1_28 = p.primary_weapon_items,
SQL1_29 = p.secondary_weapon,
SQL1_30 = p.secondary_weapon_items,
SQL1_31 = p.uniform,
SQL1_32 = p.uniform_items,
SQL1_33 = p.uniform_magazines,
SQL1_34 = p.uniform_weapons,
SQL1_35 = p.vest,
SQL1_36 = p.vest_items,
SQL1_37 = p.vest_magazines,
SQL1_38 = p.vest_weapons,
SQL1_39 = a.money,
SQL1_40 = a.score,
SQL1_41 = a.humanity,
SQL1_42 = a.kills,
SQL1_43 = a.deaths,
SQL1_44 = c.name
SQL1_45 = FROM player p
SQL1_46 = INNER JOIN account a
SQL1_47 = ON a.uid = p.account_uid 
SQL1_48 = LEFT JOIN clan c 
SQL1_49 = ON c.id = a.clan_id
SQL1_50 = WHERE p.account_uid = ?
Number of Inputs = 1
SQL1_INPUTS = 1
OUTPUT = 1,2-STRING,3-STRING,4,5,6,7,8,9,10,11,12,13,14,15,16-STRING,17,18,19,20-STRING,21-STRING,22,23-STRING,24-STRING,25-STRING,26,27-STRING,28,29-STRING,30,31-STRING,32,33,34,35-STRING,36,37,38,39,40,41,42,43,44-STRING
```
* Open your Exile Database in a Database Editor (HeidiSQL, PHPMYADMIN, etc)
* Execute the following in your **exile** database:
```
ALTER TABLE `account`
	ADD COLUMN `humanity` INT(11) NOT NULL DEFAULT '2500' AFTER `score`;
```

That is it ! If you want, you may remove the bambi protection from the exile settings, You can also remove the respect gained from trading. Lastly, You will also need to modify base upgrade to use pop tabs instead of respect.
