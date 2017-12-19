--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local PLUGIN = PLUGIN;

function PLUGIN:PlayerSwitchFlashlight(player, on)
	if (on and !self:PlayerHasFlashlight(player)) then
		return false;
	end;
end;

function PLUGIN:PlayerThink(player, curTime, infoTable)
	if (player:FlashlightIsOn()) then
		if (!self:PlayerHasFlashlight(player)) then
			player:Flashlight(false);
		end;
	end;
end;
