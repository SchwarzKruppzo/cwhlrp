--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "ItemWeaponCrowbar";
ITEM.cost = 500;
ITEM.model = "models/weapons/w_crowbarb.mdl";
ITEM.weight = 2.5;
ITEM.access = "v";
ITEM.uniqueID = "wep_hl_crowbar";
ITEM.business = true;
ITEM.description = "ItemWeaponCrowbarDesc";
ITEM.isAttachment = false;
ITEM.hasFlashlight = false;

ITEM:Register();
