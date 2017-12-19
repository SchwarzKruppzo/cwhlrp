--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local ATTRIBUTE = Clockwork.attribute:New();

ATTRIBUTE.name = "AttNameAGT";
ATTRIBUTE.maximum = 125;
ATTRIBUTE.uniqueID = "agt";
ATTRIBUTE.description = "AttDescAGT";
ATTRIBUTE.isOnCharScreen = true;

ATB_AGILITY = Clockwork.attribute:Register(ATTRIBUTE);
