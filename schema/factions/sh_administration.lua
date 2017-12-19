--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local FACTION = Clockwork.faction:New("Administrative Personnel");

FACTION.scoreboardClass = "FactionAdministrationPersonnel";
FACTION.useFullName = false;
FACTION.whitelist = true;
FACTION.material = "hl1rp/factions/administration";
FACTION.models = {
	female = {
		"models/humans/suitfem/female_02.mdl",
		"models/player/female_02_suit.mdl"
	},
	male = {
		"models/breen.mdl",
		"models/taggart/gallahan.mdl"
	};
};

FACTION_ADMIN = FACTION:Register();
