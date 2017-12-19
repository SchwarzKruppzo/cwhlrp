--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local FACTION = Clockwork.faction:New("Medical Assist & Response");

FACTION.scoreboardClass = "FactionMedicalPersonnel";
FACTION.useFullName = false;
FACTION.material = "hl1rp/factions/medic";
FACTION.models = {
	female = {
		"models/humans/group01/scrubfe1a.mdl",
		"models/humans/group01/scrubfe1b.mdl",
		"models/humans/group01/scrubfe1c.mdl",
		"models/humans/group01/scrubfe1d.mdl",
		"models/humans/group01/scrubfe1e.mdl",
	},
	male = {
		"models/humans/group01/scrub1a.mdl",
		"models/humans/group01/scrub1b.mdl",
		"models/humans/group01/scrub1c.mdl",
		"models/humans/group01/scrub1d.mdl",
		"models/humans/group01/scrub1e.mdl",
		"models/humans/group01/scrub1f.mdl",
		"models/humans/group01/scrub1g.mdl",
		"models/humans/group01/scrub1h.mdl",
		"models/humans/group01/scrub1i.mdl"
	};
};
FACTION.ranks = {
	["RankMS3"] = {
		default = true,
		position = 3
	},
	["RankMS2"] = {
		position = 2
	},
	["RankMS1"] = {
		position = 1
	},
	["RankMS0"] = {
		position = 0,
		canPromote = true,
		canDemote = true
	};
};

FACTION_MEDIC = FACTION:Register();
