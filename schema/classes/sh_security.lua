--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local CLASS = Clockwork.class:New("ClassSecurityOfficer");

CLASS.color = Color(77, 152, 226, 255);
CLASS.wages = 10;
CLASS.isDefault = true;
CLASS.factions = {FACTION_SECURITY};
CLASS.wagesName = "Salary";
CLASS.description = "";
CLASS.defaultPhysDesc = "Wearing a security uniform and a radio.";

CLASS_SECURITY = CLASS:Register();
