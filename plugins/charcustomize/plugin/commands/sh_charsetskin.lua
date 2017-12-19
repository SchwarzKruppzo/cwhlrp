--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local COMMAND = Clockwork.command:New("OutfitSetSkin");
COMMAND.tip = "Set a character skin";
COMMAND.text = "<string Name> <number Skin>";
COMMAND.flags = bit.bor(CMD_DEFAULT);
COMMAND.arguments = 2;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);

	if target then
		if (Clockwork.player:HasFlags(player, "a") or Clockwork.player:HasFlags(player, "o")) then
			local skin = 0;
			if (arguments[2] != "") then
				skin = tonumber(arguments[2]);
			end;

			target:SetCharacterData("Skin", skin);
			target:SetSkin(skin);

			Clockwork.player:Notify(player, "You have changed character's skin successfull.");
		else
			Clockwork.player:Notify(player, "Access denied.");
		end;
	else
		Clockwork.player:Notify(player, {"NotValidCharacter", arguments[1]});
	end;
end;

COMMAND:Register();
