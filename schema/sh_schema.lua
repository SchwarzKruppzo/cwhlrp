--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

Clockwork.kernel:IncludePrefixed("cl_hooks.lua");
Clockwork.kernel:IncludePrefixed("cl_schema.lua");
Clockwork.kernel:IncludePrefixed("cl_theme.lua");
Clockwork.kernel:IncludePrefixed("sh_hooks.lua");
Clockwork.kernel:IncludePrefixed("sv_hooks.lua");
Clockwork.kernel:IncludePrefixed("sv_schema.lua");

Clockwork.option:SetKey("default_date", {month = 1, year = 1998, day = 1});
Clockwork.option:SetKey("default_time", {minute = 0, hour = 0, day = 1});

Clockwork.option:SetKey("intro_image", "example/example");
Clockwork.option:SetKey("schema_logo", "hl1rp/hl1rp_logobig");
Clockwork.option:SetKey("gradient", "hl1rp/gradient_bg");

Clockwork.option:SetKey("menu_music", "music/hl1_song3.mp3");
Clockwork.option:SetKey("model_shipment", "models/props_junk/cardboard_box002a.mdl");
Clockwork.option:SetKey("format_cash", "%a %n");
Clockwork.option:SetKey("name_cash", "Dollars");
Clockwork.option:SetKey("model_cash", "models/props_lab/box01a.mdl");

Clockwork.config:ShareKey("intro_text_big");
Clockwork.config:ShareKey("intro_text_small");

Clockwork.quiz:SetEnabled(false);

-- Clockwork.flag:Add("e", "Example Flag", "Access to an example flag.");

Clockwork.player:AddCharacterData("FactionRank", NWTYPE_STRING, nil);

-- Fix for framework functions
function Clockwork.player:CanPromote(player, target)
	local stringRank, rank = Clockwork.player:GetFactionRank(player);

	if (rank) then
		if (rank.canPromote) then
			local stringTargetRank, targetRank = Clockwork.player:GetFactionRank(target);
			local highestRank, rankTable = Clockwork.faction:GetHighestRank(player:GetFaction());

			if (targetRank.position and targetRank.position != rankTable.position) then
				return (rankTable.position <= targetRank.position);
			end;
		end;
	end;
end;

function Clockwork.player:CanDemote(player, target)
	local stringRank, rank = Clockwork.player:GetFactionRank(player);

	if (rank) then
		if (rank.canDemote) then
			local stringTargetRank, targetRank = Clockwork.player:GetFactionRank(target);
			local lowestRank, rankTable = Clockwork.faction:GetLowestRank(player:GetFaction());

			if (targetRank.position and targetRank.position != rankTable.position) then
				return (rankTable.position >= targetRank.position);
			end;
		end;
	end;
end;

function Clockwork.class:IsGenderValid(faction, gender)
	local classTable = self:FindByID(faction);

	if (classTable and (gender == GENDER_MALE or gender == GENDER_FEMALE)) then
		if (!classTable.singleGender or gender == classTable.singleGender) then
			return true;
		end;
	end;
end;

function Clockwork.class:IsModelValid(faction, gender, model)
	if (gender and model) then
		local classTable = self:FindByID(faction);

		if (classTable and table.HasValue(classTable.models[string.lower(gender)], model)) then
			return true;
		end;
	end;
end;
