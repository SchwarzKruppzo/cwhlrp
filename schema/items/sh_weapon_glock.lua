--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "ItemWeaponGlock";
ITEM.cost = 1000;
ITEM.model = "models/weapons/w_glock.mdl";
ITEM.weight = 1;
ITEM.access = "V";
ITEM.uniqueID = "wep_hl_glock";
ITEM.business = true;
ITEM.description = "ItemWeaponGlockDesc";
ITEM.isAttachment = true;
ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Pelvis";
ITEM.attachmentOffsetAngles = Angle(180, 180, -90);
ITEM.attachmentOffsetVector = Vector(0, 3, -7);

ITEM:Register();
