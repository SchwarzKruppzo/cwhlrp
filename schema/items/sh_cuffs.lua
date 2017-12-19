--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local ITEM = Clockwork.item:New();

ITEM.name = "ItemCuffs";
ITEM.uniqueID = "cuffs";
ITEM.cost = 100;
ITEM.model = "models/katharsmodels/handcuffs/handcuffs-1.mdl";
ITEM.weight = 0.2;
ITEM.access = "v";
ITEM.useText = "ItemCuffsUse";
ITEM.factions = {FACTION_SECURITY};
ITEM.business = true;
ITEM.description = "ItemCuffsDesc";

function ITEM:OnUse(player, itemEntity)
	if (player.isCuffing) then
		Clockwork.player:Notify(player, {"AlreadyCuffingCharacter"});

		return false;
	else
		local trace = player:GetEyeTraceNoCursor();
		local target = Clockwork.entity:GetPlayer(trace.Entity);
		local cuffTime = Schema:GetCuffTime(player);

		if (target) then
			if (!target:GetSharedVar("IsCuffed")) then
				if (target:GetShootPos():Distance( player:GetShootPos() ) <= 192) then
					if (target:GetAimVector():DotProduct(player:GetAimVector()) > 0 or target:IsRagdolled()) then
						Clockwork.player:SetAction(player, "cuff", cuffTime);

						Clockwork.player:EntityConditionTimer(player, target, trace.Entity, cuffTime, 192, function()
							if (player:Alive() and !player:IsRagdolled() and !target:GetSharedVar("IsCuffed") and target:GetAimVector():DotProduct(player:GetAimVector()) > 0) then
								return true;
							end;
						end, function(success)
							if (success) then
								player.isCuffing = nil;

								PLUGIN:CuffPlayer(target, true, nil);

								player:TakeItem(self);
								player:ProgressAttribute(ATB_AGILITY, 15, true);
							else
								player.isCuffing = nil;
							end;

							Clockwork.player:SetAction(player, "cuff", false);
						end);
					else
						Clockwork.player:Notify(player, {"CannotCuffThoseFacingYou"});

						return false;
					end;

					player.isCuffing = true;

					Clockwork.player:SetMenuOpen(player, false);

					return false;
				else
					Clockwork.player:Notify(player, {"CharacterTooFarAway"});

					return false;
				end;
			else
				Clockwork.player:Notify(player, {"CharacterAlreadyCuffed"});

				return false;
			end;
		else
			Clockwork.player:Notify(player, {"MustLookAtValidTarget"});

			return false;
		end;
	end;
	return false;
end;

function ITEM:OnDrop(player, position)
	if (player.isCuffing) then
		Clockwork.player:Notify(player, {"YouAreCurrentlyCuffing"});

		return false;
	end;
end;

ITEM:Register();
