--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local PLUGIN = PLUGIN;

function PLUGIN:ClockworkAddSharedVars(globalVars, playerVars)
	playerVars:Number("hunger", true);
	playerVars:Number("thirst", true);
end;

Clockwork.kernel:IncludePrefixed("cl_hooks.lua");
Clockwork.kernel:IncludePrefixed("sv_hooks.lua");
