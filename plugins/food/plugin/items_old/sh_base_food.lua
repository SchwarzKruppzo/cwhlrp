local ITEM = Clockwork.item:New(nil, true)
ITEM.name = "Base Food"
ITEM.model = "models/props_junk/popcan01a.mdl"
ITEM.weight = 1
ITEM.useText = "#FoodUse"
ITEM.business = true
ITEM.category = "#CATEGORY_Food"
ITEM.hunger = 0
ITEM.thirst = 0
ITEM.health = 0
ITEM.damage = 0
ITEM.drunkTime = 0
ITEM.junk = nil
ITEM.cost = 10
ITEM.notify = true

function ITEM:GetCost()
	return math.max(math.Round(((self("hunger") + self("thirst")) * 8 / 90 + 10 / 9) * 3), 2)
end

ITEM:AddQueryProxy("cost", ITEM.GetCost)

function ITEM:OnUse(player, itemEntity)
	local mod = (1.22 * self:GetData("Rarity"))
	if mod <= 0 then mod = 1 end

	if self("thirst", 0) > 0 then
		player:SetCharacterData("thirst", math.Clamp(player:GetCharacterData("thirst", 0) + (self("thirst") * mod), 0, 100))
	end
	if self("hunger", 0) > 0 then
		player:SetCharacterData("hunger", math.Clamp(player:GetCharacterData("hunger", 0) + (self("hunger") * mod), 0, 100))
	end
	if self("health", 0) > 0 then
		player:SetHealth(math.Clamp(player:Health() + self("health"), 0, player:GetMaxHealth()))
	end
	if self("damage", 0) > 0 then
		player:TakeDamage(damage, player, player)
	end

	if self("drunkTime", 0) > 0 then
		Clockwork.player:SetDrunk(player, self("drunkTime"))
	end

	if self.OnConsume then
		self:OnConsume(player)
	end

	if self("junk") and type(self("junk")) == "string" then
		local itemTable = Clockwork.item:CreateInstance(self("junk"))
		if itemTable then
			itemTable:SetData("Rarity", self:GetData("Rarity"))
			if itemTable.OnJunkCreated then
				itemTable:OnJunkCreated(self)
			end
			player:GiveItem(itemTable, true)
		else
			ErrorNoHalt("[Error] Consumable "..self("name").." attempted to give unexisting junk item "..self("junk")..".\n")
		end
	end

	if self("notify") then
		Clockwork.chatBox:Add(player, nil, "it", "#FoodNotify:"..((self("notifyText") or self("PrintName")) or self("name"))..";", {name = player:Name()})
	end
end




if SERVER then
	function ITEM:OnSetup()
		if type(self("junk")) == "string" then
			local itemTable = Clockwork.item:FindByID(self("junk"))
			if !itemTable then
				ErrorNoHalt("[Error] Consumable "..self("name").." attempted to give unexisting junk item "..self("junk")..".\n")
			end
		end
	end
end

function ITEM:OnDrop(player, position) end

ITEM:Register()
