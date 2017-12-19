--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local ATTRIBUTE = Clockwork.attribute:New();

ATTRIBUTE.name = "AttNameINT";
ATTRIBUTE.maximum = 125;
ATTRIBUTE.uniqueID = "int";
ATTRIBUTE.description = "AttDescINT";
ATTRIBUTE.isOnCharScreen = true;

ATB_INTELLECT = Clockwork.attribute:Register(ATTRIBUTE);
