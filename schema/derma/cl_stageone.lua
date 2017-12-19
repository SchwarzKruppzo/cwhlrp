--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local PANEL = {};

-- Called when the panel is initialized.
function PANEL:Init()
	local smallTextFont = Clockwork.option:GetFont("menu_text_small");
	local factions = {};

	for k, v in pairs(Clockwork.faction.stored) do
		if (!v.whitelist or Clockwork.character:IsWhitelisted(v.name)) then
			if (!Clockwork.faction:HasReachedMaximum(k)) then
				factions[#factions + 1] = v.name;
			end;
		end;
	end;

	table.sort(factions, function(a, b)
		return a < b;
	end);

	self.forcedFaction = nil;
	self.info = Clockwork.character:GetCreationInfo();

	self.categoryList = vgui.Create("cwPanelList", self);
 	self.categoryList:SetPadding(8);
	self.categoryList:SetSpacing(8);
 	self.categoryList:SizeToContents();

	self.settingsForm = vgui.Create("cwBasicForm");
	self.settingsForm:SetAutoSize(true);
	self.settingsForm:SetText(L("CreateCharacterStage1"));
	self.settingsForm:SetPadding(8);
	self.settingsForm:SetSpacing(8);

	if (#factions > 1) then
		self.settingsForm:Help(L("CharacterMenuFactionHelp"));
		self.factionMultiChoice = self.settingsForm:ComboBox(L("CharacterMenuFaction"));

		-- Called when an option is selected.
		self.factionMultiChoice.OnSelect = function(multiChoice, index, value, data)
            local id;
            local hasRoles = false;

            if (IsValid(self.rolesMultiChoice)) then
                self.rolesMultiChoice:Clear();
                self.rolesMultiChoice.OnSelect = function(multiChoice, index, value, data)
                end;
            end;

            self.info.class = nil;
            self.roles = {};

            for k, v in pairs(Clockwork.faction.stored) do
				if (v.name == value) then
                    id = k;
                end;
            end;

            if (id) then
                for k, v in pairs(Clockwork.class:GetAll()) do
            		if (v.isOnCharScreen and (v.factions and table.HasValue(v.factions, id))) then
                        hasRoles = true;
                        if (hasRoles) then
                            if (!IsValid(self.rolesMultiChoice)) then
        						self.rolesMultiChoice = self.settingsForm:ComboBox(L("Roles"));
        						self.settingsForm:Rebuild();
                                self.rolesMultiChoice.OnSelect = function(multiChoice2, index2, value2, data2)
                                    if (self.roles[value2]) then
                                        local id = self.roles[value2];
                                        local role = Clockwork.class:FindByID(id);

                                        if (role) then
                                            self.info.class = role.name;

                                            if (IsValid(self.genderMultiChoice)) then
                        						self.genderMultiChoice:Clear();
                        					else
                        						self.genderMultiChoice = self.settingsForm:ComboBox(L("Gender"));
                        						self.settingsForm:Rebuild();
                        					end;

                        					if (role.singleGender) then
                        						self.genderMultiChoice:AddChoice(L(role.singleGender));
                        					else
                        						self.genderMultiChoice:AddChoice(L(GENDER_FEMALE));
                        						self.genderMultiChoice:AddChoice(L(GENDER_MALE));
                        					end;

                        					Clockwork.CurrentFactionSelected = {self, value};
                                        end;
                                    end;
                                end;
        					end;
                        end;

                        local name = L(v.name);

                        self.rolesMultiChoice:AddChoice(name);
            			self.roles[name] = v.index;
            		end;
            	end;

                if (!hasRoles) then
                    local factionTable = Clockwork.faction.stored[id];

					if (IsValid(self.genderMultiChoice)) then
						self.genderMultiChoice:Clear();
					else
						self.genderMultiChoice = self.settingsForm:ComboBox(L("Gender"));
						self.settingsForm:Rebuild();
					end;

					if (factionTable.singleGender) then
						self.genderMultiChoice:AddChoice(L(factionTable.singleGender));
					else
						self.genderMultiChoice:AddChoice(L(GENDER_FEMALE));
						self.genderMultiChoice:AddChoice(L(GENDER_MALE));
					end;

					Clockwork.CurrentFactionSelected = {self, value};
                end
            end
		end;
	elseif (#factions == 1) then
		for k, v in pairs(Clockwork.faction.stored) do
			if (v.name == factions[1]) then
				self.genderMultiChoice = self.settingsForm:ComboBox(L("Gender"));

				if (v.singleGender) then
					self.genderMultiChoice:AddChoice(L(v.singleGender));
				else
					self.genderMultiChoice:AddChoice(L(GENDER_FEMALE));
					self.genderMultiChoice:AddChoice(L(GENDER_MALE));
				end;

				Clockwork.CurrentFactionSelected = {self, v.name};
				self.forcedFaction = v.name;

				break;
			end;
		end;
	end;

	if (self.factionMultiChoice) then
		for k, v in pairs(factions) do
			self.factionMultiChoice:AddChoice(v);
		end;
	end;

	self.customChoices = {};

	Clockwork.plugin:Call("GetPersuasionChoices", self.customChoices);

	if (self.customChoices) then
		self.customPanels = {};

		for k2, v2 in pairs(self.customChoices) do
			if (!v2.type or string.lower(v2.type) == "combobox") then
				table.insert(self.customPanels, {v2, self.settingsForm:ComboBox(v2.name)});

				for k3, v3 in ipairs(v2.choices) do
					self.customPanels[#self.customPanels][2]:AddChoice(v3)
				end;
			elseif (string.lower(v2.type) == "textentry") then
				table.insert(self.customPanels, {v2, self.settingsForm:TextEntry(v2.name)});
			end;
		end;
	end;

	self.categoryList:AddItem(self.settingsForm);
end;

-- Called when the next button is pressed.
function PANEL:OnNext()
	self.info.plugin = {};

	if (self.customPanels) then
		for k, v in pairs(self.customPanels) do
			local value = v[2]:GetValue();

			if (value == "") then
				Clockwork.character:SetFault({"FaultDidNotFillPanel", v[1].name});
				return false;
			elseif (v[1].isNumber) then
				local max = v[1].max;
				local min = v[1].min;

				if (!tonumber(value)) then
					Clockwork.character:SetFault({"FaultDidNotFillPanelWithNumber", v[1].name});
					return false;
				end;

				if (max and max < tonumber(value)) then
					Clockwork.character:SetFault({"FaultTextEntryHigherThan", tostring(max), v[1].name});
					return false;
				end;

				if (min and min > tonumber(value)) then
					Clockwork.character:SetFault({"FaultTextEntryLowerThan", tostring(min), v[1].name});
					return false;
				end;
			end;

			self.info.plugin[v[1].name] = value;
		end;
	end;

	if (IsValid(self.genderMultiChoice)) then
		local faction = self.forcedFaction;
		local gender = self.genderMultiChoice:GetValue();

		if (gender == L(GENDER_MALE)) then
			gender = GENDER_MALE;
		else
			gender = GENDER_FEMALE;
		end;

		if (!faction and self.factionMultiChoice) then
			faction = self.factionMultiChoice:GetValue();
		end;

        local classTable = Clockwork.class:GetAll();

		for k, v in pairs(Clockwork.faction.stored) do
			if (v.name == faction) then
                local hasRoles = false;

                if (table.Count(classTable) > 0) then
        			for k, v in pairs(classTable) do
        				if (v.isOnCharScreen and (v.factions and table.HasValue(v.factions, faction))) then
                            hasRoles = true;
        				end;
        			end;
        		end;

                if (hasRoles) then
                    local validClass = false;

                    if (self.info.class) then
                        local class = Clockwork.class:FindByID(self.info.class);

                        if (class.factions and table.HasValue(class.factions, faction)) then
                            validClass = true;
                        end;
                    end;

                    if (!validClass) then
                        Clockwork.character:SetFault(L("FaultNeedClass"));
                        return false;
                    else
                        if (Clockwork.class:IsGenderValid(self.info.class, gender)) then
                            self.info.faction = faction;
                            self.info.gender = gender;

                            return true;
                        end;
                    end;
                else
    				if (Clockwork.faction:IsGenderValid(faction, gender)) then
    					self.info.faction = faction;
                        self.info.class = nil;
    					self.info.gender = gender;

    					return true;
    				end;
                end;
			end;
		end;
	end;

	Clockwork.character:SetFault({"FaultDidNotChooseFaction"});
	return false;
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
	Clockwork.option:PlaySound("click_release");

	self:SetVisible(true);
	self:SetAlpha(255);

	if (Callback) then
		Callback();
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
	self:SetSize(512, math.min(self.categoryList.pnlCanvas:GetTall() + 8, ScrH() * 0.6));
end;

vgui.Register("cwCharacterStageOne", PANEL, "EditablePanel");
