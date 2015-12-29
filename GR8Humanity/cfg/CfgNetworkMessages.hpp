/*

Made By GR8
GR8's Humanity System v1.0

*/

class CfgNetworkMessages {
	class startSessionRequest {
		module = "system_session";
		parameters[] = {STRING};
	};
	
	class startSessionResponse {
		module = "system_session";
		parameters[] = {STRING};
	};
	
	class updateSessionRequest {
		module = "system_session";
		parameters[] = {STRING};
	};
	
	class switchMoveRequest {
		module = "object_player";
		parameters[] = {STRING, STRING};
	};
	
	class updateStatsRequest {
		module = "object_player";
		parameters[] = {STRING, STRING, STRING, SCALAR, SCALAR};
	};
	
	class showFragRequest {
		module = "gui";
		parameters[] = {ARRAY};
	};
	
	class hasPlayerRequest {
		module = "object_player";
		parameters[] = {};
	};
	
	class hasPlayerResponse {
		module = "object_player";
		parameters[] = {BOOL};
	};
	
	class createPlayerRequest {
		module = "object_player";
		parameters[] = {STRING};
	};
	
	class createPlayerResponse {
		module = "object_player";
		parameters[] = {OBJECT, STRING, STRING, STRING, STRING, SCALAR, SCALAR, SCALAR, SCALAR, SCALAR, SCALAR, STRING, SCALAR};
	};
	
	class loadPlayerRequest {
		module = "object_player";
		parameters[] = {};
	};
	
	class loadPlayerResponse {
		module = "object_player";
		parameters[] = {STRING, STRING, STRING, STRING, SCALAR, SCALAR, SCALAR, SCALAR, SCALAR, STRING};
	};
	
	class updatePlayerIncapacitatedRequest {
		module = "object_player";
		parameters[] = {BOOL};
	};
	
	class savePlayerRequest {
		module = "object_player";
		parameters[] = {SCALAR, SCALAR, SCALAR};
	};
	
	class setPlayerMoneyRequest {
		module = "object_player";
		parameters[] = {SCLAR};
	};
	
	class chopTreeRequest {
		module = "object_tree";
		parameters[] = {STRING};
	};
	
	class chopBushRequest {
		module = "object_bush";
		parameters[] = {STRING};
	};
	
	class systemChatRequest {
		module = "gui";
		parameters[] = {STRING};
	};
	
	class advancedHintRequest {
		module = "gui";
		parameters[] = {STRING};
	};
	
	class standardHintRequest {
		module = "gui";
		parameters[] = {STRING};
	};
	
	class notificationRequest {
		module = "gui_notification";
		parameters[] = {STRING, ARRAY};
	};
	
	class dynamicTextRequest {
		module = "gui";
		parameters[] = {STRING, SCALAR, SCALAR, STRING};
	};
	
	class resetPlayerRequest {
		module = "object_player";
		parameters[] = {};
	};
	
	class buildConstructionRequest {
		module = "object_construction";
		parameters[] = {STRING, ARRAY};
	};
	
	class payTerritoryProtectionMoneyRequest {
		module = "system_territory";
		parameters[] = {STRING, SCALAR};
	};
	
	class payTerritoryProtectionMoneyResponse {
		module = "system_territory";
		parameters[] = {STRING, STRING};
	};
	
	class buildTerritoryRequest {
		module = "object_construction";
		parameters[] = {STRING, ARRAY, STRING, STRING};
	};
	
	class constructionResponse {
		module = "object_construction";
		parameters[] = {STRING};
	};
	
	class swapConstructionRequest {
		module = "object_construction";
		parameters[] = {STRING, STRING, ARRAY};
	};
	
	class deconstructConstructionRequest {
		module = "object_construction";
		parameters[] = {STRING};
	};
	
	class moveConstructionRequest {
		module = "object_construction";
		parameters[] = {STRING};
	};
	
	class constructionMoveResponse {
		module = "object_construction";
		parameters[] = {BOOL, STRING};
	};
	
	class upgradeConstructionRequest {
		module = "object_construction";
		parameters[] = {OBJECT};
	};
	
	class upgradeConstructionResponse {
		module = "object_construction";
		parameters[] = {OBJECT};
	};
	
	class flipVehRequest {
		module = "object_vehicle";
		parameters[] = {STRING};
	};
	
	class pushVehicleRequest {
		module = "object_vehicle";
		parameters[] = {STRING, SCALAR, SCALAR, STRING};
	};
	
	class rotateVehicleRequest {
		module = "object_vehicle";
		parameters[] = {STRING, SCALAR};
	};
	
	class lockVehicleRequest {
		module = "object_vehicle";
		parameters[] = {STRING, BOOL};
	};
	
	class lockResponse {
		module = "object_vehicle";
		parameters[] = {STRING, BOOL, STRING, STRING, SCALAR};
	};
	
	class toggleFloodLightRequest {
		module = "object_floodLight";
		parameters[] = {STRING, SCALAR};
	};
	
	class connectionTest {
		module = "object_player";
		parameters[] = {BOOL};
	};
	
	class purchaseVehicleRequest {
		module = "system_trading";
		parameters[] = {STRING, STRING};
	};
	
	class purchaseVehicleResponse {
		module = "system_trading";
		parameters[] = {SCALAR, STRING, STRING};
	};
	
	class vehicleSaveRequest {
		module = "system_vehicleSaveQueue";
		parameters[] = {STRING};
	};
	
	class purchaseVehicleSkinRequest {
		module = "system_trading";
		parameters[] = {STRING, STRING};
	};
	
	class purchaseVehicleSkinResponse {
		module = "system_trading";
		parameters[] = {SCALAR, STRING};
	};
	
	class endBambiStateRequest {
		module = "object_player";
		parameters[] = {};
	};
	
	class purchaseItemRequest {
		module = "system_trading";
		parameters[] = {STRING, SCALAR, SCALAR, STRING};
	};
	
	class purchaseItemResponse {
		module = "system_trading";
		parameters[] = {SCALAR, STRING, STRING, SCALAR, SCALAR, STRING};
	};
	
	class sellItemRequest {
		module = "system_trading";
		parameters[] = {STRING, SCALAR, SCALAR, STRING};
	};
	
	class sellItemResponse {
		module = "system_trading";
		parameters[] = {SCALAR, STRING, STRING, SCALAR, SCALAR, STRING, STRING};
	};
	
	class lockToggle {
		module = "object_lock";
		parameters[] = {STRING, STRING, BOOL};
	};
	
	class setPin {
		module = "object_lock";
		parameters[] = {STRING, STRING, STRING};
	};
	
	class setPinResponse {
		module = "object_lock";
		parameters[] = {ARRAY, STRING, STRING};
	};
	
	class packRequest {
		module = "object_container";
		parameters[] = {STRING, STRING};
	};
	
	class setFuelRequest {
		module = "object_vehicle";
		parameters[] = {STRING, SCALAR};
	};
	
	class registerClanRequest {
		module = "system_clan";
		parameters[] = {STRING};
	};
	
	class registerClanResponse {
		module = "system_clan";
		parameters[] = {SCALAR, STRING, STRING};
	};
	
	class inviteToPartyRequest {
		module = "system_party";
		parameters[] = {STRING};
	};
	
	class joinPartyRequest {
		module = "system_party";
		parameters[] = {STRING};
	};
	
	class kickFromPartyRequest {
		module = "system_party";
		parameters[] = {};
	};
	
	class announceTerritoryRequest {
		module = "system_territory";
		parameters[] = {STRING};
	};
	
	class addToTerritoryRequest {
		module = "system_territory";
		parameters[] = {STRING, STRING};
	};
	
	class removeFromTerritoryRequest {
		module = "system_territory";
		parameters[] = {STRING, STRING};
	};
	
	class moderationTerritoryRequest {
		module = "system_territory";
		parameters[] = {STRING, STRING, BOOL};
	};
	
	class sendMoneyRequest {
		module = "system_trading";
		parameters[] = {STRING, STRING};
	};
	
	class moneySentRequest {
		module = "system_trading";
		parameters[] = {STRING, STRING};
	};
	
	class moneyReceivedRequest {
		module = "system_trading";
		parameters[] = {STRING, STRING};
	};
	
	class purchaseTerritory {
		module = "system_territory";
		parameters[] = {};
	};
	
	class purchaseTerritoryResponse {
		module = "system_territory";
		parameters[] = {SCALAR};
	};
	
	class requestTerritoryUpgradeDialog {
		module = "system_territory";
		parameters[] = {OBJECT};
	};
	
	class addLockRequest {
		module = "object_construction";
		parameters[] = {OBJECT, STRING};
	};
	
	class addLockResponse {
		module = "object_construction";
		parameters[] = {STRING};
	};
	
	class territoryUpgradeDialogResponse {
		module = "gui_upgradeTerritoryDialog";
		parameters[] = {SCALAR};
	};
	
	class territoryUpgradeRequest {
		module = "system_territory";
		parameters[] = {OBJECT};
	};
	
	class deleteGroupPlz {
		module = "system";
		parameters[] = {GROUP};
	};
	
	class wasteDumpRequest {
		module = "system_trading";
		parameters[] = {STRING, SCALAR};
	};
	
	class wasteDumpResponse {
		module = "system_trading";
		parameters[] = {SCALAR, STRING, STRING};
	};
	
	class beginTakeAllRequest {
		module = "object_player";
		parameters[] = {STRING};
	};
	
	class beginTakeAllResponse {
		module = "object_player";
		parameters[] = {STRING};
	};
	
	class endTakeAllRequest {
		module = "object_player";
		parameters[] = {STRING};
	};
	
	class scanCodeLockRequest {
		module = "object_lock";
		parameters[] = {STRING};
	};
	
	class scanCodeLockResponse {
		module = "object_lock";
		parameters[] = {STRING};
	};
	
	class enableSimulationRequest {
		module = "system_simulationMonitor";
		parameters[] = {STRING};
	};
	
	class attachSupplyBoxRequest {
		module = "object_supplyBox";
		parameters[] = {STRING};
	};
	
	class detachSupplyBoxRequest {
		module = "object_supplyBox";
		parameters[] = {STRING};
	};
	
	class handcuffRequest {
		module = "object_handcuffs";
		parameters[] = {STRING};
	};
	
	class handcuffResponse {
		module = "object_handcuffs";
		parameters[] = {STRING};
	};
	
	class freeRequest {
		module = "object_handcuffs";
		parameters[] = {STRING};
	};
	
	class freeResponse {
		module = "object_handcuffs";
		parameters[] = {STRING};
	};
	
	class breakFreeRequest {
		module = "object_handcuffs";
		parameters[] = {};
	};
	
	class breakFreeResponse {
		module = "object_handcuffs";
		parameters[] = {STRING};
	};
	
	class updateMyPartyMarkerRequest {
		module = "system_party";
		parameters[] = {BOOL, ARRAY};
	};
	
	class updatePartyMarkerRequest {
		module = "system_party";
		parameters[] = {STRING, BOOL, ARRAY};
	};
};

// BY GR8