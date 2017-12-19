--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local ATTRIBUTE = Clockwork.attribute:New();

ATTRIBUTE.name = "AttNameEND";
ATTRIBUTE.maximum = 125;
ATTRIBUTE.uniqueID = "end";
ATTRIBUTE.description = "AttDescEND";
ATTRIBUTE.isOnCharScreen = true;

ATB_ENDURANCE = Clockwork.attribute:Register(ATTRIBUTE);
