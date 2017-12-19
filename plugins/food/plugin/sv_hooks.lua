--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

Clockwork.player:AddCharacterData("hunger", NWTYPE_NUMBER, 100, true);
Clockwork.player:AddCharacterData("thirst", NWTYPE_NUMBER, 100, true);

function PLUGIN:PostPlayerSpawn(player, lightSpawn, changeClass, firstSpawn)
	local hunger = player:GetCharacterData("hunger", 100);
	local thirst = player:GetCharacterData("thirst", 100);

	player:SetCharacterData("hunger", hunger);
	player:SetCharacterData("thirst", thirst);
end;

function PLUGIN:PlayerCharacterCreated(player, character)
	character.data["hunger"] = 100;
	character.data["thirst"] = 100;
end;

function PLUGIN:PlayerSetSharedVars(player, curTime)
	player:SetSharedVar("hunger", player:GetCharacterData("hunger", 100));
	player:SetSharedVar("thirst", player:GetCharacterData("thirst", 100));
end;

function PLUGIN:OnePlayerSecond(player, curTime, infoTable)
	if (player:Alive()) then
		local hunger = player:GetCharacterData("hunger", 100);
		local thirst = player:GetCharacterData("thirst", 100);
		local faction = player:GetFaction();
		local notNeed = false or Clockwork.player:GetFactionTable(player).dontNeedFood;

		if (notNeed) then
			return;
		end;

		if !player.nextHunger or curTime >= player.nextHunger then
			local sec = 120;
			player:SetCharacterData("hunger", math.Clamp(hunger - 1, 0, 100));
			player.nextHunger = curTime + sec;
		end;

		if !player.nextThirst or curTime >= player.nextThirst then
			local sec = 100;
			player:SetCharacterData("thirst", math.Clamp(thirst - 1, 0, 100));
			player.nextThirst = curTime + sec;
		end;
	end;
end;

function PLUGIN:PlayerShouldStaminaRegenerate(player)
	local notNeed = false or Clockwork.player:GetFactionTable(player).dontNeedFood;
	local hunger = player:GetCharacterData("hunger", 100);

	if !notNeed then
		if (hunger <= 20) then
			return false;
		end;
	end;
end;
