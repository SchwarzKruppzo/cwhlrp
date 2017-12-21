--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

function Schema:GetCinematicIntroInfo()
	return {
		credits = L("SchemaDevelopedBy", self:GetAuthor()),
		title = Clockwork.config:Get("intro_text_big"):Get(),
		text = Clockwork.config:Get("intro_text_small"):Get()
	};
end;

function Schema:GetPlayerScoreboardClass(player)
	local faction = Clockwork.faction:FindByID(player:GetFaction());

	if (faction.scoreboardClass) then
		return L(faction.scoreboardClass);
	end;
end;

function Schema:ScoreboardSortClassPlayers(class, a, b)

end;

function Schema:PlayerSetDefaultColorModify(colorModify)

end;

function Schema:PlayerDoesRecognisePlayer(player, status, isAccurate, realValue)
	if (player:GetFaction() == FACTION_SECURITY or player:GetFaction() == FACTION_ADMIN) then
		return true;
	end;
end;

function Schema:DestroyTargetPlayerText(player, targetPlayerText)
	targetPlayerText:Destroy("PHYSDESC");
end;

function Schema:GetTargetPlayerText(player, targetPlayerText)
	local classID = player:Team();
	local classColor = team.GetColor(classID);
	local className = team.GetName(classID);
	local rank = player:GetCharacterData("FactionRank");
	local showRank = true;
	local faction = Clockwork.faction:FindByID(player:GetFaction());
	if (faction.ranks and faction.ranks[rank]) then
		if (faction.ranks[rank].show == false) then
			showRank = false;
		end;
	end;

	if (rank and rank != "" and showRank) then
		targetPlayerText:Add("RANK", L(rank), classColor);
	elseif (!showRank) then
		targetPlayerText:Add("CLASS", L(className), classColor);
	end;

	local targetIDTextFont = Clockwork.option:GetFont("target_id_text");
	local physDescTable = {};
	local thirdPerson = "PerHim";

	if (player:GetGender() == GENDER_FEMALE) then
		thirdPerson = "PerHer";
	end;

	if (player:Alive() and !Clockwork.player:DoesRecognise(player, RECOGNISE_PARTIAL)) then
		targetPlayerText:Add("PHYSDESC2", L("DoNotRecognise", L(thirdPerson)));
	end;
end;

function Schema:DestroyPlayerInfoText(playerInfoText)
	playerInfoText:DestroySub("CLASS");
end;

function Schema:GetPlayerInfoText(playerInfoText)
	local rank = Clockwork.Client:GetCharacterData("FactionRank");
	local showRank = true;
	local faction = Clockwork.faction:FindByID(Clockwork.Client:GetFaction());
	if (faction and faction.ranks and faction.ranks[rank]) then
		if (faction.ranks[rank].show == false) then
			showRank = false;
		end;
	end;

	if (rank and showRank) then
		playerInfoText:AddSub("RANK", L("PlayerRankText", L(rank)));
	else
		playerInfoText:AddSub("CLASS", team.GetName(Clockwork.Client:Team()), 1);
	end;
end;

function Schema:GetScreenTextInfo()
	local blackFadeAlpha = Clockwork.kernel:GetBlackFadeAlpha();
	if (Clockwork.Client:GetSharedVar("IsCuffed")) then
		return {
			alpha = 255 - blackFadeAlpha,
			title = L("YouHaveBeenCuffedCenter")
		};
	end;
end;

function Schema:DrawTargetPlayerStatus(target, alpha, x, y)
	local informationColor = Clockwork.option:GetColor("information");
	local mainStatus;
	local uncuffText;
	local action = Clockwork.player:GetAction(target);

	if (target:Alive()) then
		if (action == "die") then
			mainStatus = "StatusCriticalCondition";
		end;

		if (target:Health() < 50) then
			mainStatus = "StatusInjured";
		end

		if (target:GetRagdollState() == RAGDOLL_KNOCKEDOUT) then
			mainStatus = "StatusUnconscious";
		end;

		if (target:GetSharedVar("IsCuffed")) then
			if (Clockwork.player:GetAction(Clockwork.Client) == "uncuff") then
				mainStatus = "StatusBeingUncuff";
			else
				local untieText;

				if (target:GetShootPos():Distance(Clockwork.Client:GetShootPos()) <= 192) then
					if (!Clockwork.Client:GetSharedVar("IsCuffed")) then
						mainStatus = "PressUseToUncuff";

						uncuffText = true;
					end;
				end;

				if (!uncuffText) then
					mainStatus = "StatusBeenCuffed";
				end;
			end;
		elseif (Clockwork.player:GetAction(Clockwork.Client) == "cuff") then
			mainStatus = "StatusBeingCuffed";
		end;

		if (mainStatus) then
			y = Clockwork.kernel:DrawInfo(Clockwork.kernel:ParseData(L(mainStatus)), x, y, informationColor, alpha);
		end;

		return y;
	end;
end;

function Schema:DestroyBars(bars)
	bars:Destroy("HEALTH");
	bars:Destroy("ARMOR");
end;

function Schema:GetBars(bars)
	local health = math.Clamp(Clockwork.Client:Health(), 0, Clockwork.Client:GetMaxHealth());
	local armor = math.Clamp(Clockwork.Client:Armor(), 0, Clockwork.Client:GetMaxArmor());

	if (!self.armor) then
		self.armor = armor;
	else
		self.armor = math.Approach(self.armor, armor, 1);
	end;
	if (!self.health) then
		self.health = health;
	else
		self.health = math.Approach(self.health, health, 1);
	end;

	if (health > 0) then
		bars:Add("HP", Color(231, 75, 54, 255), L("BarHealth"), self.health, Clockwork.Client:GetMaxHealth(), self.health < 10, 5);
	end;
	if (armor > 0) then
		bars:Add("AP", Color(201, 166, 120, 255), L("BarArmor"), self.armor, Clockwork.Client:GetMaxArmor(), self.health < 10, 4);
	end;
end;
