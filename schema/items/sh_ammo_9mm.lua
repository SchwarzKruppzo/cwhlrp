--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local ITEM = Clockwork.item:New("ammo_base");

ITEM.name = "ItemAmmo9MM";
ITEM.cost = 200;
ITEM.model = "models/weapons/w_9mmclip.mdl";
ITEM.weight = 0.6;
ITEM.access = "V";
ITEM.uniqueID = "ammo_pistol";
ITEM.business = true;
ITEM.ammoClass = "pistol";
ITEM.ammoAmount = 17;
ITEM.maxAmmo = 24;
ITEM.description = "ItemAmmo9MMDesc";

ITEM:Register();
