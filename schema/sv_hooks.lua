--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

function Schema:ClockworkInitPostEntity()
	-- Some fixes.
	local COMMAND = Clockwork.command:FindByID("RankDemote");
	if (COMMAND) then
		COMMAND.OnRun = function(command, player, arguments)
			local target = Clockwork.player:FindByID(arguments[1]);

			if (!target) then
				Clockwork.player:Notify(player, {"NotValidCharacter", arguments[1]});
				return;
			end;

			local isForced = tobool(arguments[2]);

			if (isForced) then
				if (player:IsAdmin()) then
					local lowestRank, rankTable = Clockwork.faction:GetLowestRank(target:GetFaction());
					local targetRank, targetRankTable = Clockwork.player:GetFactionRank(target);

					if (istable(rankTable) and targetRankTable.position and targetRankTable.position != rankTable.position) then
						local rank, rankTable = target:GetFactionRank();
						Clockwork.player:SetFactionRank(target, Clockwork.faction:GetLowerRank(target:GetFaction(), rankTable));
						local newRank, newRankTable = target:GetFactionRank();

						Clockwork.player:NotifyAll({"PlayerForceDemoted", player:Name(), target:Name(), {newRank}});
					else
						Clockwork.player:Notify(player, {"YouCannotDemotePlayer"})
					end;
				else
					Clockwork.player:Notify(player, {"ForceDemoteAdminNeeded"});
				end;
			else
				if (player:GetFaction() == target:GetFaction()) then
					if (Clockwork.player:CanDemote(player, target)) then
						local rank, rankTable = target:GetFactionRank();
						Clockwork.player:SetFactionRank(target, Clockwork.faction:GetLowerRank(target:GetFaction(), rankTable));
						local newRank, newRankTable = target:GetFactionRank();

						Clockwork.player:NotifyAll({"PlayerForceDemoted", player:Name(), target:Name(), {newRank}});
					else
						Clockwork.player:Notify(player, {"DemotePermsNeeded"});
					end;
				else
					Clockwork.player:Notify(player, {"DemoteFactionOnly"});
				end;
			end;
		end;
	end;

	local COMMAND = Clockwork.command:FindByID("RankPromote");
	if (COMMAND) then
		COMMAND.OnRun = function(command, player, arguments)
			local target = Clockwork.player:FindByID(arguments[1]);

			if (!target) then
				Clockwork.player:Notify(player, {"NotValidCharacter", arguments[1]});
				return;
			end;

			local isForced = tobool(arguments[2]);

			if (isForced) then
				if (player:IsAdmin()) then
					local highestRank, rankTable = Clockwork.faction:GetHighestRank(target:GetFaction());
					local targetRank, targetRankTable = Clockwork.player:GetFactionRank(target);

					if (istable(rankTable) and targetRankTable.position and targetRankTable.position != rankTable.position) then
						local rank, rankTable = target:GetFactionRank();
						Clockwork.player:SetFactionRank(target, Clockwork.faction:GetHigherRank(target:GetFaction(), rankTable));
						local newRank, newRankTable = target:GetFactionRank();

						Clockwork.player:NotifyAll({"PlayerForcePromoted", player:Name(), target:Name(), {newRank}});
					else
						Clockwork.player:Notify(player, {"YouCannotPromotePlayer"});
					end;
				else
					Clockwork.player:Notify(player, {"ForcePromoteAdminNeeded"});
				end;
			else
				if (player:GetFaction() == target:GetFaction()) then
					if (Clockwork.player:CanPromote(player, target)) then
						local rank, rankTable = target:GetFactionRank();
						Clockwork.player:SetFactionRank(target, Clockwork.faction:GetHigherRank(target:GetFaction(), rankTable));
						local newRank, newRankTable = target:GetFactionRank();

						Clockwork.player:NotifyAll({"PlayerPromotedPlayer", player:Name(), target:Name(), {newRank}});
					else
						Clockwork.player:Notify(player, {"PromotePermsNeeded"});
					end;
				else
					Clockwork.player:Notify(player, {"PromoteFactionOnly"});
				end;
			end;
		end;
	end;

	self:LoadSodaMachines();
end;

function Schema:PostSaveData()
	self:SaveSodaMachines();
end;

function Schema:GetPlayerDefaultInventory(player, character, inventory)

end;

function Schema:PlayerThink(player, curTime, infoTable)
	player.nextPlayerSecond = player.nextPlayerSecond or curTime;

	if (curTime > player.nextPlayerSecond) then
		Clockwork.plugin:Call("OnePlayerSecond", player, curTime, infoTable)
		player.nextPlayerSecond = curTime + 1;
	end;
end;

function Schema:PostPlayerSpawn(player, lightSpawn, changeClass, firstSpawn)
	if (player:GetSharedVar("IsCuffed")) then
		self:CuffPlayer(player, true);
	end;

	if (player:GetFaction() == FACTION_SECURITY) then
		player:SetArmor(100);
	end;
end;

function Schema:DoPlayerDeath(player, attacker, damageInfo)
	self:CuffPlayer(player, false, true);
end;

function Schema:PlayerDoesRecognisePlayer(player, target, status, isAccurate, realValue)
	if (target:GetFaction() == FACTION_ADMIN) then
		return true;
	end;
end;

function Schema:PlayerCharacterLoaded(player)
	local class = player:GetCharacterData("Class");

	if class and Clockwork.class:FindByID(class) then
		Clockwork.class:Set(player, class);
	end

	player:SetSharedVar("IsCuffed", false);
end;

function Schema:GetCuffTime(player)
	return 7 - Clockwork.attributes:Fraction(player, ATB_AGILITY, 5, 5);
end;

function Schema:ShowSpare1(player)
	local itemTable = player:FindItemByID("cuffs");

	if (!itemTable) then
		Clockwork.player:Notify(player, {"YouDoNotOwnACuffs"});

		return;
	end;

	Clockwork.player:RunClockworkCommand(player, "InvAction", "use", itemTable("uniqueID"), tostring(itemTable("itemID")));
end;

function Schema:ShowSpare2(player)
	Clockwork.player:RunClockworkCommand(player, "CharSearch");
end;

function Schema:KeyPress(player, key)
	if (key == IN_USE) then
		local uncuffTime = self:GetCuffTime(player);
		local target = player:GetEyeTraceNoCursor().Entity;
		local entity = target;

		if (IsValid(target)) then
			target = Clockwork.entity:GetPlayer(target);

			if (target and !player:GetSharedVar("IsCuffed")) then
				if (target:GetShootPos():Distance( player:GetShootPos() ) <= 192) then
					if (target:GetSharedVar("IsCuffed")) then
						Clockwork.player:SetAction(player, "uncuff", uncuffTime);

						Clockwork.player:EntityConditionTimer(player, target, entity, uncuffTime, 192, function()
							return player:Alive() and !player:IsRagdolled() and !player:GetSharedVar("IsCuffed");
						end, function(success)
							if (success) then
								self:CuffPlayer(target, false);

								player:GiveItem(Clockwork.item:CreateInstance("cuffs"), true);

								player:ProgressAttribute(ATB_AGILITY, 15, true);
							end;

							Clockwork.player:SetAction(player, "uncuff", false);
						end);
					end;
				end;
			end;
		end;
	end;
end;

function Schema:PlayerUse(player, entity)
	local overlayText = entity:GetNetworkedString("GModOverlayText");
	local curTime = CurTime();
	local faction = player:GetFaction();

	if (player:GetSharedVar("IsCuffed")) then
		if (entity:IsVehicle()) then
			if (Clockwork.entity:IsChairEntity(entity) or Clockwork.entity:IsPodEntity(entity)) then
				return;
			end;
		end;

		if (!player.nextCuffNotify or player.nextCuffNotify < CurTime()) then
			Clockwork.player:Notify(player, {"CannotDoThisWhenCuffed"});

			player.nextCuffNotify = CurTime() + 2;
		end;

		return false;
	end;
end;

function Schema:PlayerCanUseCommand(player, commandTable, arguments)
	if (player:GetSharedVar("IsCuffed")) then
		local blacklisted = {
			"OrderShipment",
			"Announce",
			"Request",
			"Radio"
		};

		if (table.HasValue(blacklisted, commandTable.name)) then
			Clockwork.player:Notify(player, {"CannotDoThisWhenCuffed"});

			return false;
		end;
	end;
end;

function Schema:PlayerSwitchFlashlight(player, on)
	if (on and (player:GetSharedVar("IsCuffed"))) then
		return false;
	end;
end;

function Schema:PlayerCanDropItem(player, itemTable, noMessage)
	if (player:GetSharedVar("IsCuffed")) then
		if (!noMessage) then
			Clockwork.player:Notify(player, {"CannotDoThisWhenCuffed"});
		end;

		return false;
	end;
end;

function Schema:PlayerCanDestroyItem(player, itemTable, noMessage)
	if (player:GetSharedVar("IsCuffed") != 0) then
		if (!noMessage) then
			Clockwork.player:Notify(player, {"CannotDoThisWhenCuffed"});
		end;

		return false;
	end;
end;

function Schema:PlayerCanUseItem(player, itemTable, noMessage)
	if (player:GetSharedVar("IsCuffed")) then
		if (!noMessage) then
			Clockwork.player:Notify(player, {"CannotDoThisWhenCuffed"});
		end;

		return false;
	end;
end;

function Schema:PlayerCanRadio(player, text, listeners, eavesdroppers)
	if (player:HasItemByID("handheld_radio")) then
		if (!player:GetCharacterData("Frequency")) then
			Clockwork.player:Notify(player, {"NeedToSetFrequencyFirst"});

			return false;
		end;
	else
		Clockwork.player:Notify(player, {"YouDoNotOwnARadio"});

		return false;
	end;
end;

function Schema:PlayerAdjustRadioInfo(player, info)
	for k, v in ipairs(_player.GetAll()) do
		if (v:HasInitialized() and v:HasItemByID("handheld_radio")) then
			if (v:GetCharacterData("Frequency") == player:GetCharacterData("Frequency")) then
				if (!v:GetSharedVar("IsCuffed")) then
					info.listeners[v] = v;
				end;
			end;
		end;
	end;
end;

function Schema:ChatBoxMessageAdded(info)
	if (info.class == "ic") then
		local eavesdroppers = {};
		local talkRadius = Clockwork.config:Get("talk_radius"):Get();
		local listeners = {};
		local players = _player.GetAll();
		local data = {};

		if (IsValid(data.entity) and data.frequency != "") then
			for k, v in ipairs(players) do
				if (v:HasInitialized() and v:Alive() and !v:IsRagdolled(RAGDOLL_FALLENOVER)) then
					if ((v:GetCharacterData("Frequency") == data.frequency and v:GetSharedVar("IsTied") == 0
					and v:HasItemByID("handheld_radio")) or info.speaker == v) then
						listeners[v] = v;
					elseif (v:GetPos():Distance(data.position) <= talkRadius) then
						eavesdroppers[v] = v;
					end;
				end;
			end;

			if (table.Count(listeners) > 0) then
				Clockwork.chatBox:Add(listeners, info.speaker, "radio", info.text);
			end;

			if (table.Count(eavesdroppers) > 0) then
				Clockwork.chatBox:Add(eavesdroppers, info.speaker, "radio_eavesdrop", info.text);
			end;

			table.Merge(info.listeners, listeners);
			table.Merge(info.listeners, eavesdroppers);
		end;
	end;
end;
