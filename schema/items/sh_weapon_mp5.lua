--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "ItemWeaponMP5";
ITEM.cost = 2000;
ITEM.model = "models/weapons/w_mp5b.mdl";
ITEM.weight = 2.5;
ITEM.access = "V";
ITEM.uniqueID = "wep_hl_mp5";
ITEM.business = true;
ITEM.description = "ItemWeaponMP5Desc";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;
ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(-90, 0, 25);
ITEM.attachmentOffsetVector = Vector(-4, 8.25, -2);

ITEM:Register();
