--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local ITEM = Clockwork.item:New();

ITEM.name = "ItemFlashlight";
ITEM.cost = 150;
ITEM.model = "models/lagmite/lagmite.mdl";
ITEM.weight = 0.8;
ITEM.access = "v";
ITEM.uniqueID = "flashlight";
ITEM.business = true;
ITEM.description = "ItemFlashlightDesc";

ITEM:Register();
