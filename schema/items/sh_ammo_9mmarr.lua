--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local ITEM = Clockwork.item:New("ammo_base");

ITEM.name = "ItemAmmo9MMAR";
ITEM.cost = 300;
ITEM.model = "models/weapons/w_9mmarclip.mdl";
ITEM.weight = 0.8;
ITEM.access = "V";
ITEM.uniqueID = "ammo_smg1";
ITEM.business = true;
ITEM.ammoClass = "smg1";
ITEM.ammoAmount = 25;
ITEM.maxAmmo = 50;
ITEM.description = "ItemAmmo9MMARDesc";

ITEM:Register();
