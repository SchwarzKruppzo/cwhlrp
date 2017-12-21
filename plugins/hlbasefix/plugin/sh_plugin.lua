--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local PLUGIN = PLUGIN;

function PLUGIN:PostDrawViewModel(ViewModel, Player, Weapon)
	if (!IsValid(Weapon)) then return false end;

	if (Weapon.PostDrawViewModel == nil) then return false end;
	return Weapon:PostDrawViewModel(ViewModel, Weapon, Player);
end;
