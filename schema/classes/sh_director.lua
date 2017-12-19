--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local CLASS = Clockwork.class:New("ClassDirector");

CLASS.color = Color(147, 216, 226, 255);
CLASS.wages = 100;
CLASS.isDefault = true;
CLASS.factions = {FACTION_DIRECTOR};
CLASS.wagesName = "Salary";
CLASS.description = "";
CLASS.defaultPhysDesc = "Wearing a clean brown suit.";

CLASS_DIRECTOR = CLASS:Register();
