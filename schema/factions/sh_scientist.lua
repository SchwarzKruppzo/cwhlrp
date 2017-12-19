--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local FACTION = Clockwork.faction:New("Scientific Research");

FACTION.scoreboardClass = "FactionScienceTeam";
FACTION.useFullName = false;
FACTION.material = "hl1rp/factions/scientist";
FACTION.models = {
	female = {
		"models/humans/scientist_female.mdl",
		"models/bmscientistcits/female_01.mdl",
		"models/bmscientistcits/female_02.mdl",
		"models/bmscientistcits/female_03.mdl",
		"models/bmscientistcits/female_04.mdl",
		"models/bmscientistcits/female_06.mdl",
		"models/bmscientistcits/female_07.mdl",
	},
	male = {
		"models/humans/scientist.mdl",
		"models/bmscientistcits/male_01.mdl",
		"models/bmscientistcits/male_02.mdl",
		"models/bmscientistcits/male_03.mdl",
		"models/bmscientistcits/male_04.mdl",
		"models/bmscientistcits/male_05.mdl",
		"models/bmscientistcits/male_06.mdl",
		"models/bmscientistcits/male_07.mdl",
		"models/bmscientistcits/male_08.mdl",
		"models/bmscientistcits/male_09.mdl",
		"models/bmscientistcits/male_10.mdl",
	};
};
FACTION.ranks = {
	["RankS5"] = {
		default = true,
		position = 5
	},
	["RankS4"] = {
		position = 4
	},
	["RankS3"] = {
		position = 3
	},
	["RankS2"] = {
		position = 2
	},
	["RankS1"] = {
		position = 1,
		canPromote = true,
		canDemote = true
	},
	["RankS0"] = {
		position = 0,
		canPromote = true,
		canDemote = true
	};
};

FACTION_SCIENTIST = FACTION:Register();
