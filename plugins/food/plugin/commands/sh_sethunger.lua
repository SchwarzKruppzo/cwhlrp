--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local COMMAND = Clockwork.command:New("CharSetHunger");

COMMAND.tip = "Set a player's hunger level.";
COMMAND.text = "<string Name> <number Amount>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "o";
COMMAND.arguments = 2;

function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);
	local amount = arguments[2];

	if (!amount) then
		amount = 100;
	end;

	if (target) then
		target:SetCharacterData("hunger", tonumber(amount));

		if (player != target) then
			Clockwork.player:Notify(target, player:Name().." has set your hunger to "..amount..".");
			Clockwork.player:Notify(player, "You have set "..target:Name().."'s hunger to "..amount..".");
		else
			Clockwork.player:Notify(player, "You have set your own Hunger to "..amount..".");
		end;
	else
		player:Notify({"NotValidPlayer", arguments[1]});
	end;
end;

COMMAND:Register();
