--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "ItemWeaponExtinguisher";
ITEM.cost = 500;
ITEM.model = "models/weapons/w_fire_extinguisher.mdl";
ITEM.weight = 2.5;
ITEM.access = "v";
ITEM.uniqueID = "weapon_extinguisher";
ITEM.business = true;
ITEM.description = "ItemWeaponExtinguisherDesc";
ITEM.isAttachment = false;
ITEM.hasFlashlight = false;

ITEM:Register();
