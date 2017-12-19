--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local COMMAND = Clockwork.command:New("OutfitSetBodygroups");
COMMAND.tip = "Set a character bodygroups";
COMMAND.text = "<string Name> <string Bodygroups 0000000000>";
COMMAND.flags = bit.bor(CMD_DEFAULT);
COMMAND.arguments = 2;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);
	local bodygroups = tostring(arguments[2]);

	if (target) then
		if (Clockwork.player:HasFlags(player, "a") or Clockwork.player:HasFlags(player, "o")) then
			target:SetCharacterData("BGroups", bodygroups);
			cwCharCustomize:Format(target, bodygroups);

			Clockwork.player:Notify(player, "You have changed character's bodygroups successfull.");
		else
			if (target == player) then
				target:SetCharacterData("BGroups", bodygroups);
				cwCharCustomize:Format(target, bodygroups);

				Clockwork.player:Notify(player, "You have changed your own bodygroups successfull.");
			end;
		end;
	else
		Clockwork.player:Notify(player, {"NotValidCharacter", arguments[1]});
	end;
end;

COMMAND:Register();
