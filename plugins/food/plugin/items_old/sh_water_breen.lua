local langEn = Clockwork.lang:GetTable("en");
local langRu = Clockwork.lang:GetTable("ru");
langEn["#ITEM_BreenWater"] = "Breen's Water";
langRu["#ITEM_BreenWater"] = "Вода Брина";
langEn["#ITEM_BreenWater_Desc"] = "A blue aluminium union branded can, it swishes when you shake it.";
langRu["#ITEM_BreenWater_Desc"] = "Алюминиевая банка голубого цвета с фирменным знаком Альянса на ней, если её встряхнуть можно услышать шипение газа.";
langEn["#ITEM_SmoothBreenWater"] = "Smooth Breen's Water";
langRu["#ITEM_SmoothBreenWater"] = "Ароматная вода Брина";
langEn["#ITEM_SmoothBreenWater_Desc"] = "A red aluminium union branded can, it swishes when you shake it.";
langRu["#ITEM_SmoothBreenWater_Desc"] = "Алюминиевая банка красного цвета с фирменным знаком Альянса на ней, если её встряхнуть можно услышать шипение газа.";
langEn["#ITEM_SpecialBreenWater"] = "Special Breen's Water";
langRu["#ITEM_SpecialBreenWater"] = "Специальная вода Брина";
langEn["#ITEM_SpecialBreenWater_Desc"] = "A yellow aluminium union branded can, it swishes when you shake it.";
langRu["#ITEM_SpecialBreenWater_Desc"] = "Алюминиевая банка жёлтого цвета с фирменным знаком Альянса на ней, если её встряхнуть можно услышать шипение газа.";

local ITEM = Clockwork.item:New("base_drink")
ITEM.name = "Breen's Water"
ITEM.PrintName = "#ITEM_BreenWater"
ITEM.description = "#ITEM_BreenWater_Desc"
ITEM.model = "models/props_junk/popcan01a.mdl"
ITEM.cost = 4
ITEM.weight = 0.33
ITEM.hunger = 10
ITEM.thirst = 30
ITEM.health = 5
ITEM.access = "u"
ITEM.junk = "empty_can"
function ITEM:OnConsume(player)
	player:SetCharacterData("stamina", 100)
	player:BoostAttribute(self.name, ATB_AGILITY, 1, 120)
	player:BoostAttribute(self.name, ATB_STAMINA, 1, 120)
end
ITEM:Register()


local ITEM = Clockwork.item:New("base_drink")
ITEM.name = "Smooth Breen's Water"
ITEM.PrintName = "#ITEM_SmoothBreenWater"
ITEM.description = "#ITEM_SmoothBreenWater_Desc"
ITEM.model = "models/props_junk/popcan01a.mdl"
ITEM.skin = 1
ITEM.cost = 10
ITEM.weight = 0.33
ITEM.hunger = 15
ITEM.thirst = 35
ITEM.health = 5
ITEM.access = "u"
ITEM.junk = "empty_can"
function ITEM:OnConsume(player)
	player:SetCharacterData("stamina", 100)
	player:BoostAttribute(self.name, ATB_AGILITY, 5, 120)
	player:BoostAttribute(self.name, ATB_STAMINA, 5, 120)
end
ITEM:Register()


local ITEM = Clockwork.item:New("base_drink")
ITEM.name = "Special Breen's Water"
ITEM.PrintName = "#ITEM_SpecialBreenWater"
ITEM.description = "#ITEM_SpecialBreenWater_Desc"
ITEM.model = "models/props_junk/popcan01a.mdl"
ITEM.skin = 2
ITEM.cost = 25
ITEM.weight = 0.33
ITEM.hunger = 15
ITEM.thirst = 40
ITEM.health = 15
ITEM.access = "u"
ITEM.junk = "empty_can"
ITEM.business = false
function ITEM:OnConsume(player)
	player:SetCharacterData("stamina", 100)
	player:BoostAttribute(self.name, ATB_AGILITY, 10, 120)
	player:BoostAttribute(self.name, ATB_STAMINA, 10, 120)
end
ITEM:Register()