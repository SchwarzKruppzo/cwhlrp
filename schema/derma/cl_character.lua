--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local Clockwork = Clockwork;
local pairs = pairs;
local RunConsoleCommand = RunConsoleCommand;
local SysTime = SysTime;
local ScrH = ScrH;
local ScrW = ScrW;
local table = table;
local string = string;
local vgui = vgui;
local math = math;

local PANEL = {};

-- Called when the panel is initialized.
function PANEL:Init()
	if (!Clockwork.theme:Call("PreCharacterMenuInit", self)) then
		local smallTextFont = Clockwork.option:GetFont("menu_text_small");
		local menuTextAuthorsFont = Clockwork.option:GetFont("menu_text_author");
		local menuTextControlsFont = Clockwork.option:GetFont("menu_text_controls");
		local menuTextOptionTitleFont = Clockwork.option:GetFont("menu_text_optiontitle");
		local menuTextFont = Clockwork.option:GetFont("menu_text");
		local colorAuthors = Clockwork.option:GetColor("menu_authors");
		local colorInfo = Clockwork.option:GetColor("information");
		local colorTarget = Clockwork.option:GetColor("target_id");


		local scrH = ScrH();
		local scrW = ScrW();
		local buttonY = scrH / 2 + scrH * 0.1
		local panelbuttonY = scrH - scrH * 0.060

		self:SetPos(0, 0);
		self:SetSize(scrW, scrH);
		self:SetDrawOnTop(false);
		self:SetFocusTopLevel(true);
		self:SetPaintBackground(false);
		self:SetMouseInputEnabled(true);

		self.authorLabel = vgui.Create("cwLabelButton", self);
		self.authorLabel:SetDisabled(true);
		self.authorLabel:SetFont(menuTextAuthorsFont);
		self.authorLabel:OverrideTextColor(colorAuthors)
		self.authorLabel:SetText("HL1 RP is a roleplaying schema for Clockwork set in Half-Life 1 timeline. Developed and maintained by Schwarz Kruppzo.");
		self.authorLabel:SizeToContents();
		self.authorLabel:SetPos(scrH * 0.02, scrH - scrH * 0.02 - self.authorLabel:GetTall())

		self.subLabel = vgui.Create("cwLabelButton", self);
		self.subLabel:SetDisabled(true);
		self.subLabel:SetFont(menuTextAuthorsFont);
		self.subLabel:OverrideTextColor(colorAuthors)
		self.subLabel:SetText("Clockwork was created by Conna Wiles (also known as kurozael).");
		self.subLabel:SizeToContents();
		self.subLabel:SetPos(scrH * 0.02, scrH - scrH * 0.02 - self.authorLabel:GetTall() - self.subLabel:GetTall())

		self.loadButton = vgui.Create("hl1rpMainMenuButton", self);
		self.loadButton:SetFont(menuTextFont);
		self.loadButton:SetText(L("CharacterMenuLoad"));
		self.loadButton:FadeIn(0.5);
		self.loadButton:SetCallback(function(panel)
			panel:GetParent().optionTitle:SetText(L("CharacterMenuLoad"));
			panel:GetParent().optionTitle:SizeToContents()

			self:OpenPanel("cwCharacterList", nil, function(panel)
				Clockwork.character:RefreshPanelList();
			end);
		end);
		self.loadButton:SizeToContents();
		self.loadButton:SetMouseInputEnabled(true);
		self.loadButton:SetPos((scrW / 2) - (self.loadButton:GetWide() / 2), buttonY);

		self.createButton = vgui.Create("hl1rpMainMenuButton", self);
		self.createButton:SetFont(menuTextFont);
		self.createButton:SetText(L("CharacterMenuNew"));
		self.createButton:FadeIn(0.5);
		self.createButton:SetCallback(function(panel)
			panel:GetParent().optionTitle:SetText(L("CharacterMenuNew"));
			panel:GetParent().optionTitle:SizeToContents()

			if (table.Count(Clockwork.character:GetAll()) >= Clockwork.player:GetMaximumCharacters()) then
				return Clockwork.character:SetFault({"FaultTooManyCharacters"});
			end;

			Clockwork.character:ResetCreationInfo();
			Clockwork.character:OpenNextCreationPanel();
		end);
		self.createButton:SizeToContents();
		self.createButton:SetMouseInputEnabled(true);
		self.createButton:SetPos((scrW / 2) - (self.createButton:GetWide() / 2), buttonY + self.loadButton:GetTall() + 2);

		self.disconnectButton = vgui.Create("hl1rpMainMenuButton", self);
		self.disconnectButton:SetFont(menuTextFont);
		self.disconnectButton:SetText(L("CharacterMenuLeave"));
		self.disconnectButton:FadeIn(0.5);
		self.disconnectButton:SetCallback(function(panel)
			if (Clockwork.Client:HasInitialized() and !Clockwork.character:IsMenuReset()) then
				Clockwork.character:SetPanelMainMenu();
				Clockwork.character:SetPanelOpen(false);
			else
				RunConsoleCommand("disconnect");
			end;
		end);
		self.disconnectButton:SizeToContents();
		self.disconnectButton:SetPos((scrW / 2) - (self.disconnectButton:GetWide() / 2), buttonY + self.loadButton:GetTall() + self.createButton:GetTall() + 4);
		self.disconnectButton:SetMouseInputEnabled(true);

		self.cancelButton = vgui.Create("hl1rpMainMenuButton", self);
		self.cancelButton:SetFont(menuTextControlsFont);
		self.cancelButton:SetText("« "..L("CharacterMenuCancel"));
		self.cancelButton:SetCallback(function(panel)
			self:ReturnToMainMenu();
		end);
		self.cancelButton:SizeToContents();
		self.cancelButton:SetMouseInputEnabled(true);
		self.cancelButton:SetPos(scrH * 0.1, panelbuttonY - self.cancelButton:GetTall());

		self.previousButton = vgui.Create("hl1rpMainMenuButton", self);
		self.previousButton:SetFont(menuTextControlsFont);
		self.previousButton:SetText("‹ "..L("CharacterMenuPrevious"));
		self.previousButton:SetCallback(function(panel)
			if (!Clockwork.character:IsCreationProcessActive()) then
				local activePanel = Clockwork.character:GetActivePanel();

				if (activePanel and activePanel.OnPrevious) then
					activePanel:OnPrevious();
				end;
			else
				Clockwork.character:OpenPreviousCreationPanel()
			end;
		end);
		self.previousButton:SizeToContents();
		self.previousButton:SetMouseInputEnabled(true);
		self.previousButton:SetPos(scrH * 0.1, panelbuttonY - self.cancelButton:GetTall() - self.previousButton:GetTall() - 4);

		self.nextButton = vgui.Create("hl1rpMainMenuButton", self);
		self.nextButton:SetFont(menuTextControlsFont);
		self.nextButton:SetText("› "..L("CharacterMenuNext"));
		self.nextButton:SetCallback(function(panel)
			if (!Clockwork.character:IsCreationProcessActive()) then
				local activePanel = Clockwork.character:GetActivePanel();

				if (activePanel and activePanel.OnNext) then
					activePanel:OnNext();
				end;
			else
				Clockwork.character:OpenNextCreationPanel()
			end;
		end);
		self.nextButton:SizeToContents();
		self.nextButton:SetMouseInputEnabled(true);
		self.nextButton:SetPos(scrH * 0.1, panelbuttonY - self.cancelButton:GetTall() - self.previousButton:GetTall() - self.nextButton:GetTall() - 2);

		self.optionTitle = vgui.Create("hl1rpLabel", self);
		self.optionTitle:SetDisabled(true);
		self.optionTitle:SetTextColor(colorTarget)
		self.optionTitle:SetFont(menuTextOptionTitleFont)
		self.optionTitle:SetText("Title")
		self.optionTitle:SizeToContents()
		self.optionTitle:SetPos(scrH * 0.1, scrH * 0.060)

		local modelSize = math.min(ScrW() * 0.4, ScrH() * 0.9);

		self.characterModel = vgui.Create("cwCharacterModel", self);
		self.characterModel:SetSize(modelSize, modelSize);
		self.characterModel:SetAlpha(0);
		self.characterModel:SetModel("models/error.mdl");
		self.createTime = SysTime();

		Clockwork.theme:Call("PostCharacterMenuInit", self)
	end;
end;

-- A function to fade in the model panel.
function PANEL:FadeInModelPanel(model)
	if (ScrH() < 768) then
		return true;
	end;

	local panel = Clockwork.character:GetActivePanel();
	local x, y = ScrW() - self.characterModel:GetWide() - 8, 16;

	if (panel) then
		x = panel.x + panel:GetWide() - 16;
		y = (panel.y + (panel:GetTall() / 2)) - (self.characterModel:GetTall() / 2);
	end;

	self.characterModel:SetPos(x, y);

	if (self.characterModel:FadeIn(0.5)) then
		self:SetModelPanelModel(model);
		return true;
	else
		return false;
	end;
end;

-- A function to fade out the model panel.
function PANEL:FadeOutModelPanel()
	self.characterModel:FadeOut(0.5);
end;

-- A function to set the model panel's model.
function PANEL:SetModelPanelModel(model)
	if (self.characterModel.currentModel != model) then
		self.characterModel.currentModel = model;
		self.characterModel:SetModel(model);
	end;

	local modelPanel = self.characterModel;
	local weaponModel = Clockwork.plugin:Call("GetModelSelectWeaponModel", model);
	local sequence = Clockwork.plugin:Call("GetModelSelectSequence", modelPanel.Entity, model);

	if (weaponModel) then
		self.characterModel:SetWeaponModel(weaponModel);
	else
		self.characterModel:SetWeaponModel(false);
	end;

	if (sequence) then
		modelPanel.Entity:ResetSequence(sequence);
	end;
end;

-- A function to return to the main menu.
function PANEL:ReturnToMainMenu()
	local panel = Clockwork.character:GetActivePanel();

	if (panel) then
	--	if (CW_CONVAR_FADEPANEL:GetInt() == 1) then
			panel:FadeOut(0.5, function()
				Clockwork.character.activePanel = nil;
					panel:Remove();
				self:FadeInTitle();
			end);
--		else
--			Clockwork.character.activePanel = nil;
	--		panel:Remove();
--		end;
	else
		self:FadeInTitle();
	end;

	self:FadeOutModelPanel();
	self:FadeOutNavigation();
end;

-- A function to fade out the navigation.
function PANEL:FadeOutNavigation()
	if (!Clockwork.theme:Call("PreCharacterFadeOutNavigation", self)) then
		self.previousButton:FadeOut(0.1);
		self.cancelButton:FadeOut(0.1);
		self.nextButton:FadeOut(0.1);
		self.optionTitle:FadeOut(0.1);
	end;
end;

-- A function to fade in the navigation.
function PANEL:FadeInNavigation()
	if (!Clockwork.theme:Call("PreCharacterFadeInNavigation", self)) then
		self.previousButton:FadeIn(0.1);
		self.cancelButton:FadeIn(0.1);
		self.nextButton:FadeIn(0.1);
		self.optionTitle:FadeIn(0.1);
	end;
end;

-- A function to fade out the title.
function PANEL:FadeOutTitle()
	if (!Clockwork.theme:Call("PreCharacterFadeOutTitle", self)) then
		self.subLabel:FadeOut(0.1);
		self.authorLabel:FadeOut(0.1);
		self.loadButton:FadeOut(0.1);
		self.createButton:FadeOut(0.1);
		self.disconnectButton:FadeOut(0.1);
	end;
end;

-- A function to fade in the title.
function PANEL:FadeInTitle()
	if (!Clockwork.theme:Call("PreCharacterFadeInTitle", self)) then
		self.subLabel:FadeIn(0.1);
		self.authorLabel:FadeIn(0.1);
		self.loadButton:FadeIn(0.1);
		self.createButton:FadeIn(0.1);
		self.disconnectButton:FadeIn(0.1);
	end;
end;

-- A function to open a panel.
function PANEL:OpenPanel(vguiName, childData, Callback)
	if (!Clockwork.theme:Call("PreCharacterMenuOpenPanel", self, vguiName, childData, Callback)) then
		local panel = Clockwork.character:GetActivePanel();

		local y  = (ScrH() * 0.16) + self.optionTitle:GetTall() + 4

		if (panel) then
			panel:FadeOut(0.5, function()
				panel:Remove(); self.childData = childData;

				Clockwork.character.activePanel = vgui.Create(vguiName, self);
				Clockwork.character.activePanel:SetAlpha(0);
				Clockwork.character.activePanel:FadeIn(0.5);
				Clockwork.character.activePanel:MakePopup();

				Clockwork.character.activePanel:SetPos(ScrH() * 0.1, y);

				if (Callback) then
					Callback(Clockwork.character.activePanel);
				end;

				if (childData) then
					Clockwork.character.activePanel.isCreationProcess = true;
					Clockwork.character:FadeInNavigation();
				end;
			end);
		else
			self.childData = childData;
			self:FadeOutTitle();

			Clockwork.character.activePanel = vgui.Create(vguiName, self);
			Clockwork.character.activePanel:SetAlpha(0);
			Clockwork.character.activePanel:FadeIn(0.5);
			Clockwork.character.activePanel:MakePopup();
			Clockwork.character.activePanel:SetPos(ScrH() * 0.1, y);

			if (Callback) then
				Callback(Clockwork.character.activePanel);
			end;

			if (childData) then
				Clockwork.character.activePanel.isCreationProcess = true;
				Clockwork.character:FadeInNavigation();
			end;
		end;

		--[[ Fade out the model panel, we probably don't need it now! --]]
		self:FadeOutModelPanel();

		Clockwork.theme:Call("PostCharacterMenuOpenPanel", self);
	end;
end;

-- Called when the panel is painted.
function PANEL:Paint(w, h)
	if (!Clockwork.theme:Call("PreCharacterMenuPaint", self)) then
		local schemaLogo = Clockwork.option:GetKey("schema_logo");
		local subLabelAlpha = self.subLabel:GetAlpha();
		local scrH = ScrH();
		local scrW = ScrW();

		if (schemaLogo != "" and subLabelAlpha > 0) then
			local w, h = 1024, 256

			if (!self.logoTextureID) then
				self.logoTextureID = Material(schemaLogo..".png");
			end;

			self.logoTextureID:SetFloat("$alpha", subLabelAlpha);

			surface.SetDrawColor(255, 255, 255, subLabelAlpha);
			surface.SetMaterial(self.logoTextureID);
			surface.DrawTexturedRect((scrW / 2) - (w / 2), (((scrH / 2) + (scrH * 0.1)) / 2) - (h / 2) + 16, w, h);
		end;

		local tinyTextFont = Clockwork.option:GetFont("menu_text_tiny");
		local colorTargetID = Clockwork.option:GetColor("target_id");
		local backgroundColor = Clockwork.option:GetColor("background");
		local foregroundColor = Clockwork.option:GetColor("foreground");
		local colorWhite = Clockwork.option:GetColor("white");
		local colorInformation = Clockwork.option:GetColor("information");
		local x, y = x, (scrH * 0.060) + self.optionTitle:GetTall() + 4;

		if (Clockwork.character:IsCreationProcessActive()) then
			local creationPanels = Clockwork.character:GetCreationPanels(true);
			local creationInfo = Clockwork.character:GetCreationInfo();
			local numCreationPanels = #creationPanels;
			local creationProgress = Clockwork.character:GetCreationProgress();
			local progressHeight = 48;

			for i = 1, numCreationPanels do
				local textX = (scrH * 0.1) + ((scrW - ((scrH * 0.1) * 2)) / numCreationPanels) * (i - 0.5);
				local textY = y + (progressHeight / 2);
				local color = Color(colorWhite.r, colorWhite.g, colorWhite.b, 200);
				if i < creationInfo.index then
					color = colorInformation
				elseif i == creationInfo.index then
					local mul = math.sin(RealTime() * 8) * 32;

					color = Color(colorInformation.r + mul, colorInformation.g + mul, colorInformation.b + mul, 255);
				end
				Clockwork.kernel:DrawSimpleText(L(creationPanels[i].friendlyName), textX, textY - 1, color, 1, 1);
			end;
		end;

		Clockwork.theme:Call("PostCharacterMenuPaint", self);
	end;


	return true;
end;

-- Called each frame.
function PANEL:Think()
	if (!Clockwork.theme:Call("PreCharacterMenuThink", self)) then
		local characters = table.Count(Clockwork.character:GetAll());
		local bIsLoading = Clockwork.character:IsPanelLoading();
		local schemaLogo = Clockwork.option:GetKey("schema_logo");
		local activePanel = Clockwork.character:GetActivePanel();
		local fault = Clockwork.character:GetFault();

		if (Clockwork.plugin:Call("ShouldDrawCharacterBackgroundBlur")) then
			Clockwork.kernel:RegisterBackgroundBlur(self, self.createTime);
		else
			Clockwork.kernel:RemoveBackgroundBlur(self);
		end;

		if (self.characterModel) then
			if (!self.characterModel.currentModel
			or self.characterModel.currentModel == "models/error.mdl") then
				self.characterModel:SetAlpha(0);
			end;
		end;

		if (!Clockwork.character:IsCreationProcessActive()) then
			if (activePanel) then
				if (activePanel.GetNextDisabled
				and activePanel:GetNextDisabled()) then
					self.nextButton:SetDisabled(true);
				else
					self.nextButton:SetDisabled(false);
				end;

				if (activePanel.GetPreviousDisabled
				and activePanel:GetPreviousDisabled()) then
					self.previousButton:SetDisabled(true);
				else
					self.previousButton:SetDisabled(false);
				end;
			end;
		else
			local previousPanelInfo = Clockwork.character:GetPreviousCreationPanel();

			if (previousPanelInfo) then
				self.previousButton:SetDisabled(false);
			else
				self.previousButton:SetDisabled(true);
			end;

			self.nextButton:SetDisabled(false);
		end;

		if (characters == 0 or bIsLoading) then
			self.loadButton:SetDisabled(true);
		else
			self.loadButton:SetDisabled(false);
		end;

		if (characters >= Clockwork.player:GetMaximumCharacters()
		or Clockwork.character:IsPanelLoading()) then
			self.createButton:SetDisabled(true);
		else
			self.createButton:SetDisabled(false);
		end;

		local scrH = ScrH();
		local scrW = ScrW();
		local buttonY = scrH / 2 + scrH * 0.1

		if (Clockwork.Client:HasInitialized() and !Clockwork.character:IsMenuReset()) then
			if (self.disconnectButton:GetText() != L("CharacterMenuCancel")) then
				self.disconnectButton:SetText(L("CharacterMenuCancel"));
				self.disconnectButton:SizeToContents();
				self.disconnectButton:SetPos((scrW / 2) - (self.disconnectButton:GetWide() / 2), buttonY + self.loadButton:GetTall() + self.createButton:GetTall() + 4);
			end
		else
			if (self.disconnectButton:GetText() != L("CharacterMenuLeave")) then
				self.disconnectButton:SetText(L("CharacterMenuLeave"));
				self.disconnectButton:SizeToContents();
				self.disconnectButton:SetPos((scrW / 2) - (self.disconnectButton:GetWide() / 2), buttonY + self.loadButton:GetTall() + self.createButton:GetTall() + 4);
			end
		end;

		if (self.animation) then
			self.animation:Run();
		end;

		self:SetSize(ScrW(), ScrH());

		Clockwork.theme:Call("PostCharacterMenuThink", self)
	end;
end;

vgui.Register("cwCharacterMenu", PANEL, "DPanel");


local PANEL = {};

-- Called when the panel is initialized.
function PANEL:Init()
	local smallTextFont = Clockwork.option:GetFont("menu_text_small");
	local tinyTextFont = Clockwork.option:GetFont("menu_text_tiny");
	local buttonsList = {};
	local colorWhite = Clockwork.option:GetColor("white");
	local buttonX = 20;
	local buttonY = 0;
	local labels = {};

	self.customData = self:GetParent().customData;
	self.buttonPanels = {};
	self:SetPaintBackground(false);

	Clockwork.plugin:Call("GetCharacterPanelLabels", labels, self.customData);

	self.nameLabel = vgui.Create("cwLabelButton", self);
	self.nameLabel:SetDisabled(true);
	self.nameLabel:SetFont(smallTextFont);
	self.nameLabel:SetText(string.upper(self.customData.name));
	self.nameLabel:SizeToContents();
	self.nameLabel:SetPos(0, 80);

	self.factionLabel = vgui.Create("cwLabelButton", self);
	self.factionLabel:SetDisabled(true);
	self.factionLabel:SetFont(tinyTextFont);
	self.factionLabel:SetText(string.upper(self.customData.faction));
	self.factionLabel:SizeToContents();
	self.factionLabel:SetPos(0, self.nameLabel.y + self.nameLabel:GetTall() + 4);

	local color = Color(255, 255, 255, 255);
	local factionTable = Clockwork.faction:FindByID(self.customData.faction);

	if (!factionTable or !factionTable.color) then
		for k, v in pairs(Clockwork.class:GetAll()) do
			if (v.factions and table.HasValue(v.factions, self.customData.faction)) then
				color = v.color;
			end;
		end;
	else
		color = factionTable.color;
	end;

	self.factionLabel:OverrideTextColor(color)

	local modelSize = math.min(ScrW() * 0.4, ScrH() * 0.65);

	self.characterModel = vgui.Create("cwCharacterModel", self);
	self.characterModel:SetModel(self.customData.model);
	self.characterModel:SetSize(modelSize, modelSize);
	self.characterModel:SetMouseInputEnabled(true);

	if self.customData.skin then
		self.characterModel.Entity:SetSkin(self.customData.skin)
	end
	if self.customData.bgroups then
		cwCharCustomize:Format(self.characterModel.Entity, self.customData.bgroups)
	end

	buttonY = self.factionLabel.y + self.factionLabel:GetTall() + 4;

	self.characterModel:SetPos(0, buttonY - (self.characterModel:GetTall() * 0.1));

	local modelPanel = self.characterModel;
	local sequence = Clockwork.plugin:Call("GetCharacterPanelSequence", modelPanel.Entity, self.customData.charTable);

	if (sequence) then
		modelPanel.Entity:ResetSequence(sequence);
	end;

	self.useButton = Clockwork.kernel:CreateMarkupToolTip(vgui.Create("DImageButton", self));
	self.useButton:SetToolTip(L("UseThisCharacter"));
	self.useButton:SetImage("icon16/tick.png");
	self.useButton:SetSize(16, 16);
	self.useButton:SetPos(0, buttonY);
	self.useButton:SetMouseInputEnabled(true);

	self.deleteButton = Clockwork.kernel:CreateMarkupToolTip(vgui.Create("DImageButton", self));
	self.deleteButton:SetToolTip(L("DeleteThisCharacter"));
	self.deleteButton:SetImage("icon16/cross.png");
	self.deleteButton:SetSize(16, 16);
	self.deleteButton:SetPos(20, buttonY);
	self.deleteButton:SetMouseInputEnabled(true);

	Clockwork.plugin:Call("GetCustomCharacterButtons", self.customData.charTable, buttonsList);

	for k, v in pairs(buttonsList) do
		local button = Clockwork.kernel:CreateMarkupToolTip(vgui.Create("DImageButton", self));
			buttonX = buttonX + 20;
			button:SetToolTip(v.toolTip);
			button:SetImage(v.image);
			button:SetSize(16, 16);
			button:SetPos(buttonX, buttonY);
			button:SetMouseInputEnabled(true);
		self.buttonPanels[#self.buttonPanels + 1] = button;

		-- Called when the button is clicked.
		function button.DoClick(button)
			local function Callback()
				Clockwork.datastream:Start("InteractCharacter", {
					characterID = self.customData.characterID, action = k
				});
			end;

			if (!v.OnClick or v.OnClick(Callback) != false) then
				Callback();
			end;
		end;
	end;

	-- Called when the button is clicked.
	function self.useButton.DoClick(spawnIcon)
		Clockwork.datastream:Start("InteractCharacter", {
			characterID = self.customData.characterID, action = "use"}
		);
	end;

	-- Called when the button is clicked.
	function self.deleteButton.DoClick(spawnIcon)
		Clockwork.kernel:AddMenuFromData(nil, {
			["Yes"] = function()
				Clockwork.datastream:Start("InteractCharacter", {
					characterID = self.customData.characterID, action = "delete"}
				);
			end,
			["No"] = function() end
		});
	end;

	local modelPanel = self.characterModel;

	-- Called when the character model is clicked.
	function modelPanel.DoClick(modelPanel)
		local activePanel = Clockwork.character:GetActivePanel();

		if (activePanel:GetSelectedModel() == self) then
			local options = {};
			local panel = Clockwork.character:GetPanel();

			options["Use"] = function()
				Clockwork.datastream:Start("InteractCharacter", {
					characterID = self.customData.characterID, action = "use"}
				);
			end;

			options["Delete"] = {};
			options["Delete"]["No"] = function() end;
			options["Delete"]["Yes"] = function()
				Clockwork.datastream:Start("InteractCharacter", {
					characterID = self.customData.characterID, action = "delete"}
				);
			end;

			Clockwork.plugin:Call(
				"GetCustomCharacterOptions", self.customData.charTable, options, menu
			);

			Clockwork.kernel:AddMenuFromData(nil, options, function(menu, key, value)
				menu:AddOption(T(key), function()
					Clockwork.datastream:Start("InteractCharacter", {
						characterID = self.customData.characterID, action = value}
					);
				end);
			end);
		else
			for k, v in pairs(activePanel:GetCharacterPanels()) do
				if (v == self) then
					activePanel:SetSelectedIdx(k);
				end;
			end;
		end;
	end;

	local maxWidth = math.max(buttonX, 200);

	if (self.nameLabel:GetWide() > maxWidth) then
		maxWidth = self.nameLabel:GetWide();
	end;

	if (self.factionLabel:GetWide() > maxWidth) then
		maxWidth = self.factionLabel:GetWide();
	end;

	local labelY = self.characterModel.y + self.characterModel:GetTall() + 4;

	for k, v in pairs(labels) do
		local label = vgui.Create("cwLabelButton", self);

		label:SetDisabled(true);
		label:SetFont(tinyTextFont);
		label:SetText(string.upper(v.text));
		label:OverrideTextColor(v.color)
		label:SizeToContents();
		label:SetPos((maxWidth / 2) - (label:GetWide()/2), labelY);
		labelY = labelY + label:GetTall() + 4;
	end;

	self.characterModel.x = (maxWidth / 2) - (self.characterModel:GetWide() / 2);
	self.nameLabel:SetPos((maxWidth / 2) - (self.nameLabel:GetWide() / 2), self.nameLabel.y);
	self.factionLabel:SetPos((maxWidth / 2) - (self.factionLabel:GetWide() / 2), self.factionLabel.y);
	self:SetSize(maxWidth, ScrH());

	local buttonAddX = ((maxWidth / 2) - (buttonX / 2)) - 10;

	self.useButton:SetPos(self.useButton.x + buttonAddX, self.useButton.y);
	self.deleteButton:SetPos(self.deleteButton.x + buttonAddX, self.deleteButton.y);

	for k, v in pairs(self.buttonPanels) do
		v:SetPos(v.x + buttonAddX, v.y);
	end;
end;

-- A function to set whether the panel is active.
function PANEL:SetActive(isActive)
	if (isActive) then
		self.nameLabel:OverrideTextColor(Clockwork.option:GetColor("information"));
	else
		self.nameLabel:OverrideTextColor(false);
	end;
end;

-- Called each frame.
function PANEL:Think()
	local markupObject = Clockwork.theme:GetMarkupObject();
	local weaponModel = Clockwork.plugin:Call("GetCharacterPanelWeaponModel", self, self.customData.charTable);
	local toolTip = Clockwork.plugin:Call("GetCharacterPanelToolTip", self, self.customData.charTable);

	if (tooltip and toolTip != "") then
		details = markupObject:Title(self.customData.name);
		details = markupObject:Add(toolTip);
	end;

	markupObject:Title(L("CharTooltipDetailsTitle"));
	markupObject:Add(self.customData.details or L("CharNoDetailsToDisplay"));

	if (weaponModel) then
		self.characterModel:SetWeaponModel(weaponModel);
	else
		self.characterModel:SetWeaponModel(false);
	end;

	self.characterModel:SetDetails(markupObject:GetText());
end;

vgui.Register("cwCharacterPanel", PANEL, "DPanel");
