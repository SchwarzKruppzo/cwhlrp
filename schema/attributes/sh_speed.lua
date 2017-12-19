--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local ATTRIBUTE = Clockwork.attribute:New();

ATTRIBUTE.name = "AttNameSPD";
ATTRIBUTE.maximum = 125;
ATTRIBUTE.uniqueID = "spd";
ATTRIBUTE.description = "AttDescSPD";
ATTRIBUTE.isOnCharScreen = true;

ATB_SPEED = Clockwork.attribute:Register(ATTRIBUTE);
