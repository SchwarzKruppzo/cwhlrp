--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "ItemWeaponSPAS12";
ITEM.cost = 3000;
ITEM.model = "models/weapons/w_shotgunb.mdl";
ITEM.weight = 4;
ITEM.access = "V";
ITEM.uniqueID = "wep_hl_spas12";
ITEM.business = true;
ITEM.description = "ItemWeaponSPAS12Desc";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;
ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
ITEM.attachmentOffsetAngles = Angle(0, 0, 5);
ITEM.attachmentOffsetVector = Vector(0,5.5,-4);

ITEM:Register();
