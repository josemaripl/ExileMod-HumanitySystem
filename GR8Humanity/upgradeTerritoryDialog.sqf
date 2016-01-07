/**
 * ExileClient_gui_upgradeTerritoryDialog_show
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
private["_currentLevel","_territoryPrice","_territoryRange","_territoryLevels","_display","_respectControl","_radiusControl","_levelControl","_upgradeButton"];
disableSerialization;
createDialog "RscExileUpgradeTerritoryDialog";
_currentLevel = _this select 0;
_territoryPrice = _this select 1;
_territoryRange = _this select 2;
_territoryLevels = _this select 3;
_display = uiNameSpace getVariable ["RscExileUpgradeTerritoryDialog", displayNull];
_respectControl = _display displayCtrl 4000;
_radiusControl = _display displayCtrl 4002;
_levelControl = _display displayCtrl 4003;
_upgradeButton = _display displayCtrl 4001;
if(_currentLevel isEqualTo _territoryLevels)then
{
	_respectControl ctrlSetStructuredText parseText format ["<t size='1.4'>%1 MAX LEVEL</t>",_territoryPrice];
	_radiusControl ctrlSetStructuredText parseText format ["<t size='1.4'>%1m MAX LEVEL</t>",_territoryRange];
	_levelControl ctrlSetStructuredText parseText format ["<t size='1.4'>%1/%2 MAX LEVEL</t>",_currentLevel,_territoryLevels];
	_upgradeButton ctrlEnable false;
}
else
{
	_respectControl ctrlSetStructuredText parseText format ["<img image='\exile_assets\texture\ui\poptab_notification_ca.paa' size='1' shadow='true' /><t size='1.4'> %1</t>",_territoryPrice];
	_radiusControl ctrlSetStructuredText parseText format ["<t size='1.4'>%1m</t>",_territoryRange];
	_levelControl ctrlSetStructuredText parseText format ["<t size='1.4'>%1/%2</t>",_currentLevel + 1,_territoryLevels];
	if(ExileClientPlayerMoney < _territoryPrice)then
	{
		_upgradeButton ctrlEnable false;
	};
};
true call ExileClient_gui_postProcessing_toggleDialogBackgroundBlur;
true
