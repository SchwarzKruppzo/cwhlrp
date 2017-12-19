--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local ITEM = Clockwork.item:New();

ITEM.name = "ItemHandheldRadio";
ITEM.uniqueID = "handheld_radio";
ITEM.cost = 200;
ITEM.model = "models/deadbodies/dead_male_civilian_radio.mdl";
ITEM.weight = 1;
ITEM.access = "v";
ITEM.category = "Communication";
ITEM.business = true;
ITEM.description = "ItemHandheldRadioDesc";
ITEM.customFunctions = {"SetFrequency"};

function ITEM:OnDrop(player, position) end;

if (SERVER) then
	function ITEM:OnCustomFunction(player, name)
		if (name == "SetFrequency") then
			Clockwork.datastream:Start(player, "Frequency", player:GetCharacterData("Frequency", ""));
		end;
	end;
end;

ITEM:Register();
