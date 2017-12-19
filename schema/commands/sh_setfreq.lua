--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local COMMAND = Clockwork.command:New("SetFreq");

COMMAND.tip = "Set your radio frequency.";
COMMAND.flags = CMD_DEFAULT;
COMMAND.arguments = 1;

function COMMAND:OnRun(player, arguments)
	local frequency = arguments[1];

	if (string.find(frequency, "^%d%d%d%.%d$")) then
		local start, finish, decimal = string.match(frequency, "(%d)%d(%d)%.(%d)");

		start = tonumber(start);
		finish = tonumber(finish);
		decimal = tonumber(decimal);

		if (start == 1 and finish > 0 and finish < 10 and decimal > 0 and decimal < 10) then
			player:SetCharacterData("Frequency", frequency);

			Clockwork.player:Notify(player, {"YouSetYourRadioFrequencyTo", frequency});
		else
			Clockwork.player:Notify(player, {"RadioArgumentsMustBeBetween"});
		end;
	else
		Clockwork.player:Notify(player, {"RadioArgumentsMustBeLike"});
	end;
end;

COMMAND:Register();
