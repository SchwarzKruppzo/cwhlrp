--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local ITEM = Clockwork.item:New("ammo_base");

ITEM.name = "ItemAmmo357";
ITEM.cost = 400;
ITEM.model = "models/weapons/w_357ammobox.mdl";
ITEM.weight = 1;
ITEM.access = "V";
ITEM.uniqueID = "ammo_357";
ITEM.business = true;
ITEM.ammoClass = "357";
ITEM.ammoAmount = 6;
ITEM.maxAmmo = 12;
ITEM.description = "ItemAmmo357Desc";

ITEM:Register();
