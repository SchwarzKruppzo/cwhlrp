--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local COMMAND = Clockwork.command:New("Announce");

COMMAND.tip = "Broadcast a message to all Black Mesa personnel.";
COMMAND.text = "<string Text>";
COMMAND.flags = bit.bor(CMD_DEFAULT, CMD_FALLENOVER);
COMMAND.arguments = 1;

function COMMAND:OnRun(player, arguments)
	if (player:GetFaction() == FACTION_ADMIN or player:Team() == ROLE_MAINTENANCEVISOR) then
		local text = table.concat(arguments, " ");

		if (text == "") then
			Clockwork.player:Notify(player, {"NotEnoughText"});

			return;
		end;

		Schema:SayAnnounce(player, text);
	else
		Clockwork.player:Notify(player, {"YouAreNotAdministrator"});
	end;
end;

COMMAND:Register();
