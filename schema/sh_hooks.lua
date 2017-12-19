--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

function Schema:ClockworkAddSharedVars(globalVars, playerVars)
	globalVars:Bool("CommFailed");
	playerVars:Bool("IsCuffed");
	playerVars:String("Clearances");
end;

function Schema:PlayerSpray(player)
	return true;
end;

function Schema:PlayerStorageShouldClose(player, storage)
	local entity = player:GetStorageEntity();

	if (player.searching and entity:IsPlayer() and !entity:GetSharedVar("IsCuffed")) then
		return true;
	end;
end;
