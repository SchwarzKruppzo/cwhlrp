--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local COMMAND = Clockwork.command:New("CharCuff");

COMMAND.tip = "Cuff/Uncuff a character.";
COMMAND.text = "<string Name>";
COMMAND.access = "a";
COMMAND.arguments = 1;
COMMAND.optionalArguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);

	if (!Clockwork.command:FindByID("InvCuff")) then
		player:Notify({"CuffCommandNotFound"});
		return;
	end;

	if (target) then
		if (target:GetSharedVar("IsCuffed")) then
			Schema:TiePlayer(target, false);

			player:Notify({"YouHaveUncuffedPlayer"});
			target:Notify({"YouWereUncuffedByPlayer"});
		else
			Schema:TiePlayer(target, true);

			player:Notify({"YouHaveCuffPlayer"});
			target:Notify({"YouWereCuffedByPlayer"});
		end
	else
		player:Notify({"NotValidPlayer", arguments[1]});
	end
end;

COMMAND:Register();
