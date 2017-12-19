--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local CLASS = Clockwork.class:New("ClassElectricalEngineer");

CLASS.color = Color(228, 115, 28, 255);
CLASS.wages = 10;
CLASS.isOnCharScreen = true;
CLASS.factions = {FACTION_MAINTENANCE};
CLASS.wagesName = "Salary";
CLASS.description = "";
CLASS.defaultPhysDesc = "Wearing casual clothes.";
CLASS.HasObjectAccess = function() return false end;
CLASS.singleGender = GENDER_MALE;
CLASS.models = {
	male = {
		"models/humans/construction.mdl"
	};
};

ROLE_EENGINEER = CLASS:Register();
