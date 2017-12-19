--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local ATTRIBUTE = Clockwork.attribute:New();

ATTRIBUTE.name = "AttNameLCK";
ATTRIBUTE.maximum = 125;
ATTRIBUTE.uniqueID = "lck";
ATTRIBUTE.description = "AttDescLCK";
ATTRIBUTE.isOnCharScreen = true;

ATB_LUCK = Clockwork.attribute:Register(ATTRIBUTE);
