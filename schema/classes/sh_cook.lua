--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local CLASS = Clockwork.class:New("ClassCook");

CLASS.color = Color(224, 135, 123, 255);
CLASS.wages = 10;
CLASS.isOnCharScreen = true;
CLASS.factions = {FACTION_MAINTENANCE};
CLASS.wagesName = "Salary";
CLASS.description = "";
CLASS.defaultPhysDesc = "Wearing a clean a chef hat.";
CLASS.HasObjectAccess = function() return false end;
CLASS.models = {
	female = {
		"models/mossman.mdl"
	},
	male = {
		"models/Characters/Hostage_01.mdl",
		"models/Humans/Group02/male_08.mdl"
	};
};

ROLE_COOK = CLASS:Register();
