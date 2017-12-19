--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local PLUGIN = PLUGIN;

function PLUGIN:GetBars(bars)
	local hunger = Clockwork.Client:GetSharedVar("hunger");
	local thirst = Clockwork.Client:GetSharedVar("thirst");

	if !self.hunger then
		self.hunger = hunger
	else
		self.hunger = math.Approach(self.hunger, hunger, 1)
	end

	if !self.thirst then
		self.thirst = thirst
	else
		self.thirst = math.Approach(self.thirst, thirst, 1)
	end

	bars:Add("HUNGER", Color(64, 96, 150, 255), "", self.hunger, 100, true);
	bars:Add("THIRST", Color(163, 158, 109, 255), "", self.thirst, 100, true);
end;
