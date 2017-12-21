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

function Schema:LoadSodaMachines()
	local sodamachines = Clockwork.kernel:RestoreSchemaData("plugins/sodamachines/"..game.GetMap());

	for k, v in pairs(sodamachines) do
		local entity = ents.Create("ent_sodamachine");
		entity:SetPos(v.position);
		entity:Spawn();
		entity:SetSkin(v.skin);
		entity:SetDTBool(0, v.enabled);

		if (IsValid(entity)) then
			entity:SetAngles(v.angles);
			entity:SetButtons(v.types);
		end;

		local phys = entity:GetPhysicsObject();

		if (IsValid(phys)) then
			phys:Wake();
			phys:EnableMotion(false);
		end;
	end;
end;

function Schema:SaveSodaMachines()
	local sodamachines = {};

	for k, v in pairs(ents.FindByClass("ent_sodamachine")) do
		local types, stocks = v:GetButtons();
		sodamachines[#sodamachines + 1] = {
			angles = v:GetAngles(),
			position = v:GetPos(),
			skin = v:GetSkin(),
			enabled = v:GetDTBool(0),
			types = types
		};
	end;

	Clockwork.kernel:SaveSchemaData("plugins/sodamachines/"..game.GetMap(), sodamachines);
end;
