--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local CLASS = Clockwork.class:New("ClassMedicalStaff");

CLASS.color = Color(196, 107, 190, 255);
CLASS.wages = 10;
CLASS.isDefault = true;
CLASS.factions = {FACTION_MEDIC};
CLASS.wagesName = "Salary";
CLASS.description = "";
CLASS.defaultPhysDesc = "Wearing casual clothes.";

CLASS_MEDIC = CLASS:Register();
