--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local FACTION = Clockwork.faction:New("Security Force");

FACTION.scoreboardClass = "FactionSecurityForce";
FACTION.useFullName = false;
FACTION.material = "hl1rp/factions/security";
FACTION.singleGender = GENDER_MALE;
FACTION.models = {
	male = {
		"models/humans/worker.mdl"
	},
	female = {
		"models/humans/worker.mdl"
	},
};
FACTION.ranks = {
	["RankSF5"] = {
		default = true,
		position = 5
	},
	["RankSF4"] = {
		position = 4
	},
	["RankSF3"] = {
		position = 3
	},
	["RankSF2"] = {
		position = 2
	},
	["RankSF1"] = {
		position = 1
	},
	["RankSF0"] = {
		position = 0,
		canPromote = true,
		canDemote = true
	};
};

FACTION_SECURITY = FACTION:Register();
