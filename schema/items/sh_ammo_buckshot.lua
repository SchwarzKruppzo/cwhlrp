--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local ITEM = Clockwork.item:New("ammo_base");

ITEM.name = "ItemAmmoBuckshot";
ITEM.cost = 300;
ITEM.model = "models/weapons/w_shotbox.mdl";
ITEM.weight = 1;
ITEM.access = "V";
ITEM.uniqueID = "ammo_buckshot";
ITEM.business = true;
ITEM.ammoClass = "buckshot";
ITEM.ammoAmount = 16;
ITEM.maxAmmo = 32;
ITEM.description = "ItemAmmoBuckshotDesc.";

ITEM:Register();
