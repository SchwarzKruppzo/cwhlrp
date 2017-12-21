--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

AddCSLuaFile("cl_init.lua");
AddCSLuaFile("shared.lua");
include("shared.lua");

function ENT:Initialize()
	self:SetModel("models/props_canteen/soda_machine.mdl");
	self:PhysicsInit(SOLID_VPHYSICS);
	self:SetSolid(SOLID_VPHYSICS);
	self:SetUseType(SIMPLE_USE);
	self:SetDTBool(0, true);

	local physObj = self:GetPhysicsObject();
	if (IsValid(physObj)) then
		physObj:EnableMotion(true);
		physObj:Wake();
	end;

	self:SetSkin(math.random(0, 1));

	if (!self.Buttons) then
		self:GenerateButtons();
	end;
end;

function ENT:GetButtons()
	local types = self.ButtonTypes;
	local stocks = {};

	for k, v in pairs(self.Buttons) do
		stocks[k] = v.stock;
	end;

	return stocks, Vector(types[1], types[2], types[3]);
end;

function ENT:SetButtons(types, stocks)
	if (!types or !stocks) then
		return;
	end;

	self.Buttons = {};
	self.ButtonTypes = {types[1], types[2], types[3]};

	self:SetNWVector("Types", types);

	local num = 0;
	for i = 1, 6 do
		if (i%2) == 1 then num = num + 1 end;

		self.Buttons[i] = {
			classtype = self.ButtonTypes[num],
			stock = stocks[i]
		};

		self:SetNWBool("HasStock["..i.."]", (stocks[i] <= 0 and false or true));
	end;
end;

function ENT:GetSodaClass(num)
	if (num == 1) then
		return "sodacan_7";
	elseif (num == 2) then
		return "sodacan_6";
	elseif (num == 3) then
		return "sodacan_5";
	end;
end;

function ENT:GenerateButtons()
	self.Buttons = {}
	self.ButtonTypes = {}

	for i = 1, 3 do
		local rand = math.random(1, 3);
		self.ButtonTypes[i] = rand;
	end;

	self:SetNWVector("Types", Vector(self.ButtonTypes[1], self.ButtonTypes[2], self.ButtonTypes[3]));

	local num = 0;
	for i = 1, 6 do
		if (i%2) == 1 then num = num + 1 end;

		self.Buttons[i] = {
			classtype = self.ButtonTypes[num],
			stock = 5
		};

		self:SetNWBool("HasStock["..i.."]", true);
	end;
end;

function ENT:Use(activator)
	if (self:GetDTBool(0) == false) then
		return;
	end;
	
	activator:EmitSound("buttons/lightswitch2.wav", 55, 125);

	if (self.nextUse or 0) < CurTime() then
		self.nextUse = CurTime() + 2;
	else
		return;
	end;

	local button = self:GetNearestButton(activator);

	if (self.Buttons[button]) then
		local selectedButton = self.Buttons[button];

		if (selectedButton.stock <= 0) then
			return;
		end

		local item = self:GetSodaClass(selectedButton.classtype)
		local cost = Clockwork.item:GetAll()[item] and Clockwork.item:GetAll()[item].cost or 5

		if !Clockwork.player:CanAfford(activator, cost) then
			self:EmitSound("buttons/button2.wav")
			return Clockwork.player:Notify(activator, L(activator, "#VENDING_Afford: "..cost..";"))
		end

		local position = self:GetPos()
		local angle = self:GetAngles();
		local f, r, u = self:GetForward(), self:GetRight(), self:GetUp()
		angle:RotateAroundAxis(r, 90);
		local itemPosition = position + u * 48 - r * 10 + f * 5
		local entity = Clockwork.entity:CreateItem(activator, Clockwork.item:CreateInstance(item), itemPosition, angle)

		if IsValid(entity) then
			self.Buttons[button].stock = self.Buttons[button].stock - 1
			if (self.Buttons[button].stock <= 0) then
				self:SetNWBool("HasStock["..button.."]", false);
				self.Buttons[button].stock = 0;
			end
			self:EmitSound("buttons/button4.wav", Angle(0, 0, 90));
			Clockwork.player:GiveCash(activator, -cost, "soda machine");
		end;
	end;
end;
