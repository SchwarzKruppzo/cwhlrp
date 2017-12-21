--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "ItemWeapon357";
ITEM.cost = 2000;
ITEM.model = "models/weapons/w_357b.mdl";
ITEM.weight = 1.25;
ITEM.access = "V";
ITEM.uniqueID = "wep_hl_357";
ITEM.business = true;
ITEM.description = "ItemWeapon357Desc";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;
ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Pelvis";
ITEM.attachmentOffsetAngles = Angle(180, 110, -90);
ITEM.attachmentOffsetVector = Vector(2, 6, -7);

ITEM:Register();
