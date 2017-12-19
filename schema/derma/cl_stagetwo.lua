--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local PANEL = {};

local function InitCustomChar(self, panel, v2)
    local bodyGroups = panel.characterModel.Entity:GetBodyGroups();
    Clockwork.CurrentCustomSkinSelected = 0;
	Clockwork.CurrentCustomBodygroupsSelected = "";

	for k, v in pairs(bodyGroups) do
		panel.characterModel.Entity:SetBodygroup(v.id, 0);
	end
	panel.characterModel.Entity:SetSkin(0);

	self.customizForm:Clear();
	self.skinChoice = self.customizForm:ComboBox("Skin");

	for i = 0, NumModelSkins(v2) - 1 do
		self.skinChoice:AddChoice(i);
	end;

	self.skinChoice.OnSelect = function(multiChoice, index, value, data)
		if IsValid(panel) then
			if IsValid(panel.characterModel) then
				if IsValid(panel.characterModel.Entity) then
					panel.characterModel.Entity:SetSkin(value);
				end;
			end;
		end;

		Clockwork.CurrentCustomSkinSelected = value;
	end;
	self.skinChoice:ChooseOptionID(panel.characterModel.Entity:GetSkin() + 1);

	for k, v in pairs(bodyGroups) do
		local selectedID = panel.characterModel.Entity:GetBodygroup(v.id);
		Clockwork.CurrentCustomBodygroupsSelected = Clockwork.CurrentCustomBodygroupsSelected .. (k != 1 and "_" or "") .. selectedID;

		if v.num <= 1 or v.name == "syringe" or v.name == "holster" or v.name == "helmet" or v.name == "flashlight" or v.name == "idcard" or v.name == "body" or v.name == "chest" then
			continue;
		end;

		local bodygroup = self.customizForm:ComboBox(v.name);
		bodygroup.id = v.id;
		for subid, submodel in pairs(v.submodels) do
			bodygroup:AddChoice(submodel != "" and submodel or "Disabled");
		end;
		bodygroup.OnSelect = function(multiChoice, index, value, data)
			if IsValid(panel) then
				if IsValid(panel.characterModel) then
					if IsValid(panel.characterModel.Entity) then
						panel.characterModel.Entity:SetBodygroup(multiChoice.id, index - 1);
					end;
				end;
			end;
			Clockwork.CurrentCustomBodygroupsSelected = ""
			for xx, cc in pairs(bodyGroups) do
				local selectedID = panel.characterModel.Entity:GetBodygroup(cc.id)
				Clockwork.CurrentCustomBodygroupsSelected = Clockwork.CurrentCustomBodygroupsSelected .. (xx != 1 and "_" or "") .. selectedID;
			end;
		end;
		bodygroup:ChooseOptionID(selectedID + 1);
	end;
end;

-- Called when the panel is initialized.
function PANEL:Init()
	local smallTextFont = Clockwork.option:GetFont("menu_text_small");
	local panel = Clockwork.character:GetPanel();

	self.categoryList = vgui.Create("cwPanelList", self);
 	self.categoryList:SetPadding(8);
	self.categoryList:SetSpacing(8);
 	self.categoryList:SizeToContents();

	self.overrideModel = nil;
	self.hasSelectedModel = nil;
	self.hasPhysDesc = (Clockwork.command:FindByID("CharPhysDesc") != nil);
	self.info = Clockwork.character:GetCreationInfo();

	if (!Clockwork.faction.stored[self.info.faction].GetModel) then
		self.hasSelectedModel = true;
	end;

	local genderModels = Clockwork.faction.stored[self.info.faction].models[string.lower(self.info.gender)];

    if (self.info.class) then
        genderModels = Clockwork.class.stored[self.info.class].models[string.lower(self.info.gender)];
    end

	if (!Clockwork.faction.stored[self.info.faction].GetName) then
		self.nameForm = vgui.Create("cwBasicForm", self);
		self.nameForm:SetAutoSize(true);
		self.nameForm:SetPadding(8);
		self.nameForm:SetSpacing(8);
		self.nameForm:SetText(L("Name"));

		if (Clockwork.faction.stored[self.info.faction].useFullName) then
			self.fullNameTextEntry = self.nameForm:TextEntry(L("CharacterMenuFullName"));
			self.fullNameTextEntry:SetAllowNonAsciiCharacters(true);
		else
			self.forenameTextEntry = self.nameForm:TextEntry(L("CharacterMenuForename"));
			self.forenameTextEntry:SetAllowNonAsciiCharacters(true);

			self.surnameTextEntry = self.nameForm:TextEntry(L("CharacterMenuSurname"));
			self.surnameTextEntry:SetAllowNonAsciiCharacters(true);
		end;
	end;

	if (self.hasSelectedModel or self.hasPhysDesc) then
		if (self.hasPhysDesc) then
			self.physDescForm = vgui.Create("cwBasicForm");
			self.physDescForm:SetAutoSize(true);
			self.physDescForm:SetPadding(8);
			self.physDescForm:SetSpacing(8);
			self.physDescForm:SetText(L("CharacterMenuPhysDesc"));
			self.physDescForm:Help(L("CharacterMenuPhysDescHelp"));

			self.physDescTextEntry = self.physDescForm:TextEntry();
			self.physDescTextEntry:SetAllowNonAsciiCharacters(true);
		end;

		if (self.hasSelectedModel) then
			self.appearanceForm = vgui.Create("cwBasicForm");
			self.appearanceForm:SetAutoSize(true);
			self.appearanceForm:SetPadding(8);
			self.appearanceForm:SetSpacing(8);
			self.appearanceForm:SetText(L("CharacterMenuAppearance"));
			self.appearanceForm:Help(L("CharacterMenuModelHelp"));

			self.modelItemsList = vgui.Create("DPanelList", self);
			self.modelItemsList:SetPadding(4);
			self.modelItemsList:SetSpacing(16);
			self.modelItemsList:SetAutoSize(true);
			self.modelItemsList:EnableHorizontal(true);
			self.modelItemsList:EnableVerticalScrollbar(true);

			self.appearanceForm:AddItem(self.modelItemsList);

            self.customizForm = vgui.Create("cwBasicForm");
            self.customizForm:SetAutoSize(true);
    		self.customizForm:SetText("Customization");
    		self.customizForm:SetPadding(8);
            self.customizForm:SetSpacing(8);
		end;
	end;

	if (self.nameForm) then
		self.categoryList:AddItem(self.nameForm);
	end;

	if (self.physDescForm) then
		self.categoryList:AddItem(self.physDescForm);
	end;

	if (self.appearanceForm) then
		self.categoryList:AddItem(self.appearanceForm);
	end;

    if (self.customizForm) then
		self.categoryList:AddItem(self.customizForm);
	end;

	local informationColor = Clockwork.option:GetColor("information");
	local spawnIcon = nil;

	if (self.modelItemsList) then
		for k2, v2 in pairs(genderModels) do
			spawnIcon = Clockwork.kernel:CreateMarkupToolTip(vgui.Create("cwSpawnIcon", self));
			spawnIcon:SetModel(v2);

			-- Called when the spawn icon is clicked.
			function spawnIcon.DoClick(spawnIcon)
				if (self.selectedSpawnIcon) then
					self.selectedSpawnIcon:SetColor(nil);
				end;

				spawnIcon:SetColor(informationColor);

				if (!panel:FadeInModelPanel(v2)) then
					panel:SetModelPanelModel(v2);
				end;

				self.selectedSpawnIcon = spawnIcon;
				self.selectedModel = v2;

                InitCustomChar(self, panel, v2);
			end;

			self.modelItemsList:AddItem(spawnIcon);
		end;
	end;
end;

-- Called when the next button is pressed.
function PANEL:OnNext()
	if (self.overrideModel) then
		self.info.model = self.overrideModel;
	else
		self.info.model = self.selectedModel;
	end;

    self.info.skin = tonumber(Clockwork.CurrentCustomSkinSelected);
	self.info.bgroups = tostring(Clockwork.CurrentCustomBodygroupsSelected);

	if (!Clockwork.faction.stored[self.info.faction].GetName) then
		if (IsValid(self.fullNameTextEntry)) then
			local limitCharName = Clockwork.config:Get("max_char_name"):Get();
			self.info.fullName = self.fullNameTextEntry:GetValue();

			if (self.info.fullName == "") then
				Clockwork.character:SetFault({"FaultNameInvalid"});
				return false;
			elseif (string.utf8len(self.info.fullName) > limitCharName) then
				Clockwork.character:SetFault({"FaultNameInvalid"});
				return false;
			end;
		else
			self.info.forename = self.forenameTextEntry:GetValue();
			self.info.surname = self.surnameTextEntry:GetValue();

			if (self.info.forename == "" or self.info.surname == "") then
				Clockwork.character:SetFault({"FaultNameInvalid"});
				return false;
			end;

			if (string.find(self.info.forename, "[%p%s%d]") or string.find(self.info.surname, "[%p%s%d]")) then
				Clockwork.character:SetFault({"FaultNameNoSpecialChars"});
				return false;
			end;

			if (!string.find(self.info.forename, "[aeiou]") or !string.find(self.info.surname, "[aeiou]")) then
				Clockwork.character:SetFault({"FaultNameHaveVowel"});
				return false;
			end;

			if (string.utf8len(self.info.forename) < 2 or string.utf8len(self.info.surname) < 2) then
				Clockwork.character:SetFault({"FaultNameMinLength"});
				return false;
			end;

			if (string.utf8len(self.info.forename) > 16 or string.utf8len(self.info.surname) > 16) then
				Clockwork.character:SetFault({"FaultNameTooLong"});
				return false;
			end;
		end;
	end;

	if (self.hasSelectedModel and !self.info.model) then
		Clockwork.character:SetFault({"FaultNeedModel"});
		return false;
	end;

	if (self.hasPhysDesc) then
		local minimumPhysDesc = Clockwork.config:Get("minimum_physdesc"):Get();
			self.info.physDesc = self.physDescTextEntry:GetValue();
		if (string.utf8len(self.info.physDesc) < minimumPhysDesc) then
			Clockwork.character:SetFault({"PhysDescMinimumLength", minimumPhysDesc});
			return false;
		end;
	end;
end;

-- Called when the panel is painted.
function PANEL:Paint(w, h) end;

-- A function to make the panel fade out.
function PANEL:FadeOut(speed, Callback)
	Clockwork.option:PlaySound("rollover");

	self:SetVisible(false);
	self:SetAlpha(0);

	if (Callback) then
		Callback();
	end;
end;

-- A function to make the panel fade in.
function PANEL:FadeIn(speed, Callback)
	if (self:GetAlpha() == 0 and CW_CONVAR_FADEPANEL:GetInt() == 1 and (!self.animation or !self.animation:Active())) then
		self.animation = Derma_Anim("Fade Panel", self, function(panel, animation, delta, data)
			panel:SetVisible(true);
			panel:SetAlpha(delta * 255);

			if (animation.Finished) then
				self.animation = nil;
			end;

			if (animation.Finished and Callback) then
				Callback();
			end;
		end);

		if (self.animation) then
			self.animation:Start(speed);
		end;

		Clockwork.option:PlaySound("click_release");
	else
		self:SetVisible(true);
		self:SetAlpha(255);

		if (Callback) then
			Callback();
		end;
	end;
end;

-- Called each frame.
function PANEL:Think()
	self:InvalidateLayout(true);

	if (self.animation) then
		self.animation:Run();
	end;
end;

-- Called when the layout should be performed.
function PANEL:PerformLayout(w, h)
	self.categoryList:StretchToParent(0, 0, 0, 0);

	self:SetSize(512, math.min(self.categoryList.pnlCanvas:GetTall() + 8, ScrH() * 0.5));
end;

vgui.Register("cwCharacterStageTwo", PANEL, "EditablePanel");
