--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

include("shared.lua");

function ENT:Initialize()
	self.ButtonTypes = Vector();
	self.PixVis = {}
	for i = 1, 6 do
		self.PixVis[i] = util.GetPixelVisibleHandle();
	end;
end;

function ENT:Think()
	local types = self:GetNWVector("Types");

	if (self.ButtonTypes != types) then
		self.ButtonTypes = types;
		self:ReloadButtons(types);
	end;
end;

function ENT:OnRemove()
	if (self.Buttons) then
		for k, v in pairs(self.Buttons) do
			if (IsValid(v)) then v:Remove() end;
		end;
	end;
end;

function ENT:ReloadButtons(buttonTypes)
	if (self.Buttons) then
		for k, v in pairs(self.Buttons) do
			if (IsValid(v)) then v:Remove() end;
		end;
	end;

	self.Buttons = {};

	local num = 0;
	for i = 1, 6 do
		if (i%2 == 1) then num = num + 1 end;

		local classtype = buttonTypes[num];
		self.Buttons[i] = ents.CreateClientProp();
		self.Buttons[i]:SetModel("models/props_canteen/soda_machine_button.mdl");
		self.Buttons[i]:SetParent(self);
		self.Buttons[i]:Spawn();
		if (classtype == 2) then
			self.Buttons[i]:SetSkin(1);
		elseif (classtype == 3) then
			self.Buttons[i]:SetSkin(2);
		end;
	end;
end;

local glowMaterial = Material("sprites/glow04_noz");
local color_green = Color(0, 255, 0, 255);
local color_red = Color(255, 0, 0, 255);
local color_orange = Color(255, 125, 0, 255);

function ENT:Draw()
	self:DrawModel();

	if (self.Buttons) then
		local f, r, u = self:GetForward() * -21.4, self:GetRight() * -16.85, self:GetUp() * 53.09;
		local spos = self:GetPos();

		for k, v in pairs(self.Buttons) do
			if (!IsValid(v)) then continue end
			local pos = spos + r + f + u + self:GetUp() * -(2.02 * (k - 1));

			v:SetPos(pos);
			v:SetAngles(self:GetAngles());
			v:DrawModel();
		end;
	end;
end;

local function GetGlowColor(ent, k, closest)
	local color = color_green;

	if (!ent:GetNWBool("HasStock["..k.."]")) then
		color = color_red;
	end;

	if (closest != k) then
		color.a = color == color_red and 200 or 150;
	else
		color.a = 180 + math.sin(RealTime() * 7.5) * 50;
	end;

	if (LocalPlayer():KeyDown(IN_USE) and closest == k) then
		color = table.Copy(color);
		color.r = math.min(color.r + 100, 255);
		color.g = math.min(color.g + 100, 255);
		color.b = math.min(color.b + 100, 255);
	end;

	return color;
end;

function ENT:DrawTranslucent()
	if (self:GetDTBool(0) and self.Buttons) then
		local position = self:GetPos();
		local f, r, u = self:GetForward() * -24.4, self:GetRight() * -17.25, self:GetUp() * 53.09;
		local closest = self:GetNearestButton();

		if (LocalPlayer():GetPos():Distance(position) < 512) then
			local angles = self:GetAngles();
			angles:RotateAroundAxis(angles:Up(), -180);
			angles:RotateAroundAxis(angles:Forward(), 90);

			cam.Start3D2D(position + self:GetForward() * -23.9 + self:GetRight() * -17.09 + u, angles, 0.06)
				for k, v in pairs(self.Buttons) do
					local color = GetGlowColor(self, k, closest);
					color.a = color.a / 12;
					surface.SetDrawColor(color);
					surface.DrawRect(0, -10 + 33.5 * (k - 1), 14, 22);
				end;
			cam.End3D2D();
		end;

		cam.IgnoreZ(true)
		render.SetMaterial(glowMaterial);
		for k, v in pairs(self.Buttons) do
			local color = GetGlowColor(self, k, closest);
			local pos = position + f + r + u + self:GetUp() * -(2 * (k - 1));
			local lightDir = self:GetAngles():Right();
			local viewNormal = position - EyePos();
			local distance = viewNormal:Length();
			viewNormal:Normalize();
			local viewDot = viewNormal:Dot(lightDir);

			if (viewDot >= 0) then
				local visible = util.PixelVisible(pos, 1, self.PixVis[k]);
				if (!visible or visible < 0.55) then continue end;

				local size = math.Clamp(distance * visible * viewDot, 0, 3);
				local alpha = math.Clamp((1000 - distance) * visible * viewDot, 0, color.a);
				color.a = alpha;
				render.DrawSprite(pos, size, size, color);
			end;
		end;

		cam.IgnoreZ(false);
	end;
end;
