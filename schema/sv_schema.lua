--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

Clockwork.config:Add("intro_text_small", "Lambda Complex, 1998", true);
Clockwork.config:Add("intro_text_big", "BLACK MESA RESEARCH FACILITY", true);

function Schema:CuffPlayer(player, isCuffed, reset)
	player:SetSharedVar("IsCuffed", isCuffed);

	if (isCuffed) then
		Clockwork.player:DropWeapons(player);
		Clockwork.kernel:PrintLog(LOGTYPE_GENERIC, player:Name().." has been cuffed.");

		player:Flashlight(false);
		player:StripWeapons();
	elseif (!reset) then
		if (player:Alive() and !player:IsRagdolled()) then
			Clockwork.player:LightSpawn(player, true, true);
		end;

		Clockwork.kernel:PrintLog(LOGTYPE_GENERIC, player:Name().." has been uncuffed.");
	end;
end;

function Schema:PlayerIsSecurity(player)
	return (player:GetFaction() == FACTION_SECURITY);
end;

function Schema:SayAnnounce(player, text)
	if (Clockwork.kernel:GetSharedVar("CommFailed")) then
		return;
	end;

	Clockwork.chatBox:Add(nil, player, "announce", text);
end;
