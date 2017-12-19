--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local ATTRIBUTE = Clockwork.attribute:New();

ATTRIBUTE.name = "AttNameSTR";
ATTRIBUTE.maximum = 125;
ATTRIBUTE.uniqueID = "str";
ATTRIBUTE.description = "AttDescSTR";
ATTRIBUTE.isOnCharScreen = true;

ATB_STRENGTH = Clockwork.attribute:Register(ATTRIBUTE);
