/**
 * ExileClient_gui_traderDialog_event_onStoreListBoxSelectionChanged
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
private["_listBox","_index","_dialog","_purchaseButton","_quantityDropdown","_inventoryLoadLabel","_inventoryLoadValue","_itemClassName","_inventoryDropdown","_selectedInventoryDropdownIndex",
"_currentContainerType","_canBuyItem","_tradingResult","_salesPrice","_itemInformation","_itemType","_containerNetID","_containerVehicle","_inventoryListBox","_humanity","_heroItems","_banditItems",
"_heroCategories","_heroItemsAll","_banditCategories","_banditItemsAll"];
disableSerialization;
if !(uiNameSpace getVariable ["RscExileTraderDialogIsInitialized", false]) exitWith {};
_listBox = _this select 0;
_index = _this select 1;
_dialog = uiNameSpace getVariable ["RscExileTraderDialog", displayNull];
_purchaseButton = _dialog displayCtrl 4010;
_quantityDropdown = _dialog displayCtrl 4011;
_inventoryLoadLabel = _dialog displayCtrl 4013;
_inventoryLoadValue = _dialog displayCtrl 4014;
_inventoryLoadLabel ctrlSetTextColor [1, 1, 1, 1];
_inventoryLoadValue ctrlSetTextColor [1, 1, 1, 1];
_humanity = ExileClientPlayerHumanityStatus;
if (_index > -1) then
{
	_itemClassName = _listBox lbData _index;
	_itemClassName call ExileClient_gui_traderDialog_updateItemStats;
	_inventoryDropdown = _dialog displayCtrl 4004;
	_selectedInventoryDropdownIndex = lbCurSel _inventoryDropdown;
	_currentContainerType = _inventoryDropdown lbValue _selectedInventoryDropdownIndex;
	_canBuyItem = true;
	_tradingResult = 0;
	_heroItemsAll = [""];
	_banditItemsAll = [""];
	try 
	{
		_salesPrice = getNumber(missionConfigFile >> "CfgExileArsenal" >> _itemClassName >> "price");
		_heroCategories = getArray(missionConfigFile >> "CfgTraders" >> "Exile_Trader_CommunityCustoms" >> "categories");
		_banditCategories = getArray(missionConfigFile >> "CfgTraders" >> "Exile_Trader_CommunityCustoms2" >> "categories");

		{
			_heroItems = getArray(missionConfigFile >> "CfgTraderCategories" >> _x >> "items");
			_heroItemsAll = _heroItemsAll + _heroItems;
		} forEach _heroCategories;

		{
			_banditItems = getArray(missionConfigFile >> "CfgTraderCategories" >> _x >> "items");
			_banditItemsAll = _banditItemsAll + _banditItems;
		} forEach _banditCategories;

		switch (true) do 
		{
			case ((_humanity == "Survivor") && (_itemClassName in (_heroItemsAll+_banditItemsAll))):
			{
				throw 5;
			};
			case ((_humanity == "Hero") && (_itemClassName in _banditItemsAll)):
			{
				throw 5;
			};
			case ((_humanity == "Bandit") && (_itemClassName in _heroItemsAll)):
			{
				throw 5;
			};
			default{};				
		};

		if (_salesPrice > ExileClientPlayerMoney) then 
		{
			throw 5;
		};
		switch (_currentContainerType) do
		{
			case 1:
			{
				_itemInformation = [_itemClassName] call BIS_fnc_itemType;
				_itemType = _itemInformation select 1;
				if !([player, _itemClassName] call ExileClient_util_playerCargo_canAdd) then
				{
					throw 9;
				};
			};
			case 2:
			{	
				if !(player canAddItemToUniform _itemClassName) then 
				{
					throw 9;
				};
			};
			case 3:
			{
				if !(player canAddItemToVest _itemClassName) then 
				{
					throw 9;
				};
			};
			case 4:
			{
				if !(player canAddItemToBackpack _itemClassName) then 
				{
					throw 9;
				};
			};
			default 
			{
				_containerNetID = _inventoryDropdown lbData _selectedInventoryDropdownIndex;
				_containerVehicle = objectFromNetId _containerNetID;
				if (_containerVehicle isEqualTo objNull) then 
				{
					throw 8;
				};
				if !([_containerVehicle, _itemClassName] call ExileClient_util_containerCargo_canAdd) then 
				{
					throw 9;
				};
			};
		};
	}
	catch
	{
		_tradingResult = _exception;
		_canBuyItem = false;
	};
	if (ExileClientIsWaitingForServerTradeResponse) then
	{
		_canBuyItem = false;
	};
	if (_canBuyItem) then 
	{
		_purchaseButton ctrlEnable true;
		_quantityDropdown ctrlEnable true;	
	}
	else 
	{
		if (_tradingResult isEqualTo 9) then
		{
			_inventoryLoadLabel ctrlSetTextColor [0.91, 0, 0, 0.6];
			_inventoryLoadValue ctrlSetTextColor [0.91, 0, 0, 0.6];
		};
		_purchaseButton ctrlEnable false;
		_quantityDropdown ctrlEnable false;
	};
	_inventoryListBox = _dialog displayCtrl 4005;
	_inventoryListBox lbSetCurSel -1;
}
else 
{
	_purchaseButton ctrlEnable false;
	_quantityDropdown ctrlEnable false;
};
true