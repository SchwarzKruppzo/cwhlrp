--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local COMMAND = Clockwork.command:New("CharSearch");

COMMAND.tip = "Search a character if they are tied.";
COMMAND.flags = CMD_DEFAULT;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.entity:GetPlayer(player:GetEyeTraceNoCursor().Entity);

	if (target) then
		if (target:GetShootPos():Distance(player:GetShootPos()) <= 192) then
			if (!player:GetSharedVar("IsCuffed")) then
				if (target:GetSharedVar("IsCuffed")) then
					if (target:GetVelocity():Length() == 0) then
						if (!player.cwSearching) then
							target.cwBeingSearched = true;
							player.cwSearching = target;

							Clockwork.storage:Open(player, {
								name = Clockwork.player:FormatRecognisedText(player, "%s", target),
								weight = target:GetMaxWeight(),
								entity = target,
								distance = 192,
								cash = target:GetCash(),
								inventory = target:GetInventory(),
								OnClose = function(player, storageTable, entity)
									player.cwSearching = nil;

									if (IsValid(entity)) then
										entity.cwBeingSearched = nil;
									end;
								end,
								OnTakeItem = function(player, storageTable, itemTable)

								end,
								OnGiveItem = function(player, storageTable, itemTable)

								end
							});
						else
							Clockwork.player:Notify(player, {"YouAreAlreadySearchingCharacter"});
						end;
					else
						Clockwork.player:Notify(player, {"CannotSearchMovingCharacter"});
					end;
				else
					Clockwork.player:Notify(player, {"CharacterIsNotCuffed"});
				end;
			else
				Clockwork.player:Notify(player, {"YouCannotDoThatRightNow"});
			end;
		else
			Clockwork.player:Notify(player, {"TargetIsTooFarAway"});
		end;
	else
		Clockwork.player:Notify(player, {"MustLookAtValidTarget"});
	end;
end;

COMMAND:Register();
