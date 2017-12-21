--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local ITEM = Clockwork.item:New(nil, true);

ITEM.name = "Base Drink";
ITEM.model = "models/props_junk/popcan01a.mdl";
ITEM.weight = 1;
ITEM.useSound = {"npc/barnacle/barnacle_gulp1.wav", "npc/barnacle/barnacle_gulp2.wav"};
ITEM.business = true;
ITEM.category = "CategoryDrink";
ITEM.cost = 10;
ITEM.dUses = 1;
ITEM.dHunger = 0;
ITEM.dThirst = 0;
ITEM.dHealth = 0;
ITEM.dDamage = 0;
ITEM.dDrunkTime = 0;
ITEM.dJunkItem = nil;
ITEM.customFunctions = {"DrinkUse", "DrinkAllUse"};

function ITEM:GetCost()
	return math.max(math.Round(((self("dHunger") + self("dThirst")) * 8 / 90 + 10 / 9) * 3), 2);
end

ITEM:AddQueryProxy("cost", ITEM.GetCost)
ITEM:AddData("Used", 0, true);
ITEM:AddData("Effects", {}, true);


function ITEM:Junk(isWorld, entity)
	if (!IsValid(entity)) then return end;

	local junkClassname = self("dJunkItem");

	if (junkClassname and type(junkClassname) == "string") then
		local itemTable = Clockwork.item:CreateInstance(junkClassname)
		if (itemTable) then
			if (itemTable.OnJunkCreated) then
				itemTable:OnJunkCreated(self);
			end;

			if (isWorld) then
				Clockwork.entity:CreateItem(nil, itemTable, entity:GetPos(), entity:GetAngles());
				entity:Remove();
				return true;
			else
				entity:GiveItem(itemTable, true);
				entity:TakeItem(self);
				return true;
			end;
		else
			ErrorNoHalt("[Error] Consumable "..name.." attempted to give unexisting junk item "..junkClassname..".\n");
		end;
	end;

	if (isWorld) then
		entity:Remove();
	else
		entity:TakeItem(self);
	end;
end;

function ITEM:Consume(player, all)
	local name = self("name");
	local useSound = self("useSound");
	local uses = self("dUses", 0);
	local mul = (!all and 1 or (uses - self:GetData("Used")));
	local hunger = self("dHunger", 0) * mul;
	local thirst = self("dThirst", 0) * mul;
	local health = self("dHealth", 0) * mul;
	local damage = self("dDamage", 0) * mul;
	local drunkTime = self("dDrunkTime", 0) * mul;

	if (thirst > 0) then
		player:SetCharacterData("thirst", math.Clamp(player:GetCharacterData("thirst", 0) + thirst, 0, 100));
	end;

	if (hunger > 0) then
		player:SetCharacterData("hunger", math.Clamp(player:GetCharacterData("hunger", 0) + hunger, 0, 100));
	end;

	if (health > 0) then
		player:SetHealth(math.Clamp(player:Health() + health, 0, player:GetMaxHealth()));
	end;

	if (damage > 0) then
		player:TakeDamage(damage, player, player);
	end;

	if (drunkTime > 0) then
		Clockwork.player:SetDrunk(player, drunkTime);
	end;

	if (self.OnConsume) then
		self:OnConsume(player, all);
	end;

	if (useSound) then
		if (type(useSound) == "table") then
			player:EmitSound(useSound[math.random(1, #useSound)]);
		else
			player:EmitSound(useSound);
		end;
	elseif (useSound != false) then
		player:EmitSound("items/battery_pickup.wav");
	end;

	if (!all) then
		local used = self:GetData("Used");
			self:SetData("Used", used + 1);
		local newUsed = self:GetData("Used");

		if (newUsed == self.dUses) then
			return true;
		end;
	else
		return true;
	end;
end;

function ITEM:GetEntityMenuOptions(entity, options)
	for k, v in pairs(self.customFunctions) do
		options[L(v)] = v;
	end;
end;

function ITEM:EntityHandleMenuOption(player, entity, option, arguments)
	if (arguments == "DrinkUse" or arguments == "DrinkAllUse") then
		player:SetItemEntity(entity);

		if (self:Consume(player, (arguments == "DrinkAllUse"))) then
			self:Junk(true, entity);
		end;

		player:SetItemEntity(nil);
	end;
end;

function ITEM:OnCustomFunction(player, name)
	if (name == "DrinkUse" or name == "DrinkAllUse") then
		if (self:Consume(player, (arguments == "DrinkAllUse"))) then
			self:Junk(false, player);
		end;
	end;
end;
	//Clockwork.chatBox:Add(player, nil, "it", L("DrinkNotify", L(self("dNotifyText") or name)), {name = player:Name()});

if (SERVER) then
	function ITEM:OnSetup()
		if (type(self("dJunkItem")) == "string") then
			local itemTable = Clockwork.item:FindByID(self("dJunkItem"));

			if (!itemTable) then
				ErrorNoHalt("[Error] Consumable "..self("name").." attempted to give unexisting junk item "..self("dJunkItem")..".\n");
			end;
		end;
	end;
else
	function ITEM:GetClientSideName()
		local name = L(self("name"));
		local maxUses = self("dUses") or 1;
		local used = (maxUses - self:GetData("Used"));

		return (name.." ["..used.."/"..maxUses.."]")
	end;

	function ITEM:OnHUDPaintTargetID(entity, x, y, alpha)
		local colorTargetID = Clockwork.option:GetColor("target_id");
		local color = self("color") or colorTargetID;
		local maxUses = self("dUses") or 1;
		local used = (maxUses - self:GetData("Used"));
		local uses = "["..used.."/"..maxUses.."]";

		y = Clockwork.kernel:DrawInfo(uses, x, y, color, alpha);

		return y;
	end;
end;

function ITEM:OnDrop(player, position) end;

ITEM:Register();
