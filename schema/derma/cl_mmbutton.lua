--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local PANEL = {}

function PANEL:Init() end;

function PANEL:FadeOut(speed, Callback)
	self.animation = Derma_Anim("Fade Panel", self, function(panel, animation, delta, data)
		panel:SetAlpha(255 - (delta * 255));

		if (animation.Finished) then
			panel:SetVisible(false);
				if (Callback) then
					Callback();
				end;
			self.animation = nil;
		end;
	end);

	if (self.animation) then
		self.animation:Start(speed);
	end;
end;

function PANEL:FadeIn(speed, Callback)
	self.animation = Derma_Anim("Fade Panel", self, function(panel, animation, delta, data)
		panel:SetAlpha(delta * 255);

		if (animation.Finished) then
			if (Callback) then
				Callback();
			end;

			self.animation = nil;
		end;
	end);

	if (self.animation) then
		self.animation:Start(speed);
	end;

	self:SetVisible(true);
end;

function PANEL:Think()
	local white = Clockwork.option:GetColor("white");

	if (self.animation) then
		self.animation:Run();
	end;

	if (self:GetDisabled()) then
		local colorDisabled = Color(
			math.max(white.r - 64, 0),
			math.max(white.g - 64, 0),
			math.max(white.b - 64, 0),
			255
		);

		self:SetTextColor(colorDisabled);
	elseif (self:IsHovered()) then
		local colorInfo = Clockwork.option:GetColor("information");
		local mul = math.sin(RealTime() * 8) * 32;

		self:SetTextColor(Color(colorInfo.r + mul, colorInfo.g + mul, colorInfo.b + mul, 255));

		if (!self.played) then
			Clockwork.option:PlaySound("rollover");
			self.played = true;
		end;
	else
		if (self.played) then
			self.played = nil;
		end;

		self:SetTextColor(white);
	end;
end;

function PANEL:SetCallback(Callback)
	self.DoClick = function(button)
		Clockwork.option:PlaySound("click");
		Callback(button);
	end;
end;

function PANEL:Paint(w, h) end;

vgui.Register("hl1rpMainMenuButton", PANEL, "DButton");


local PANEL = {}

function PANEL:Init() end;

function PANEL:FadeOut(speed, Callback)
	self.animation = Derma_Anim("Fade Panel", self, function(panel, animation, delta, data)
		panel:SetAlpha(255 - (delta * 255));

		if (animation.Finished) then
			panel:SetVisible(false);
				if (Callback) then
					Callback();
				end;
			self.animation = nil;
		end;
	end);

	if (self.animation) then
		self.animation:Start(speed);
	end;
end;

function PANEL:FadeIn(speed, Callback)
	self.animation = Derma_Anim("Fade Panel", self, function(panel, animation, delta, data)
		panel:SetAlpha(delta * 255);

		if (animation.Finished) then
			if (Callback) then
				Callback();
			end;

			self.animation = nil;
		end;
	end);

	if (self.animation) then
		self.animation:Start(speed);
	end;

	self:SetVisible(true);
end;

function PANEL:Think()
	if (self.animation) then
		self.animation:Run();
	end;
end;

function PANEL:Paint(w, h) end;

vgui.Register("hl1rpLabel", PANEL, "DLabel");
