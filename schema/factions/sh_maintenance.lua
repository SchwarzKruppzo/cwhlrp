--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local FACTION = Clockwork.faction:New("Maintenance & Engineering");

FACTION.scoreboardClass = "FactionMaintenancePersonnel";
FACTION.useFullName = false;
FACTION.material = "hl1rp/factions/service";
FACTION.ranks = {
    ["RankM1"] = {
        default = true,
        position = 1,
        show = false
    },
    ["RankM0"] = {
        position = 0,
        class = "Maintenance Supervisor",
        canPromote = true,
        canDemote = true
    };
};

FACTION_MAINTENANCE = FACTION:Register();
