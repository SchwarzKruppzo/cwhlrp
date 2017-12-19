--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local ITEM = Clockwork.item:New("ammo_base");

ITEM.name = "ItemAmmoMP5Grenade";
ITEM.cost = 1000;
ITEM.model = "models/weapons/w_argrenade.mdl";
ITEM.weight = 2;
ITEM.access = "V";
ITEM.uniqueID = "ammo_argrenade";
ITEM.business = true;
ITEM.ammoClass = "MP5GrenadeAmmo";
ITEM.ammoAmount = 1;
ITEM.maxAmmo = 5;
ITEM.description = "ItemAmmoMP5GrenadeDesc";

ITEM:Register();
