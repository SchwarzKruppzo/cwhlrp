--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local COMMAND = Clockwork.command:New("InvCuff");

COMMAND.tip = "Use a cuffs from your inventory.";
COMMAND.flags = CMD_DEFAULT;

function COMMAND:OnRun(player, arguments)
	local itemTable = player:FindItemByID("cuffs");

	if (!itemTable) then
		Clockwork.player:Notify(player, {"YouDoNotOwnACuffs"});

		return;
	end;

	Clockwork.player:RunClockworkCommand(player, "InvAction", "use", itemTable("uniqueID"), tostring(itemTable("itemID")));
end;

COMMAND:Register();
