--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local CLASS = Clockwork.class:New("ClassScientist");

CLASS.color = Color(255, 200, 50);
CLASS.wages = 10;
CLASS.isDefault = true;
CLASS.factions = {FACTION_SCIENTIST};
CLASS.wagesName = "Salary";
CLASS.description = "";
CLASS.defaultPhysDesc = "Wearing a labcoat and a ID badge.";

CLASS_SCIENTIST = CLASS:Register();
