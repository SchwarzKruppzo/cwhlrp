--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

PLUGIN:SetGlobalAlias("cwCharCustomize");

Clockwork.player:AddCharacterData("Skin", NWTYPE_STRING, "0", true);
Clockwork.player:AddCharacterData("BGroups", NWTYPE_STRING, "", true);

function cwCharCustomize:Format(ent, str)
    local formatTable = string.Explode("_", str);
    if (formatTable) then
        for k, v in pairs(formatTable) do
            local value = tonumber(v)
            if !value then continue end

            ent:SetBodygroup(tonumber(k) - 1, value);
        end;
    end;
end;

if SERVER then
    function cwCharCustomize:PostPlayerSpawn(player, lightSpawn, changeClass, firstSpawn)
        local skin = player:GetCharacterData("Skin", 0);
        local bodygroups = player:GetCharacterData("BGroups", "");

        if bodygroups != "" then
            self:Format(player, bodygroups);
        end;

        if skin then
            player:SetSkin(skin);
        end;
    end;

    function cwCharCustomize:PlayerUnragdolled(player, state, ragdollTable)
        local skin = player:GetCharacterData("Skin", 0);
        local bodygroups = player:GetCharacterData("BGroups", "");

        if bodygroups != "" then
            self:Format(player, bodygroups);
        end;

        if skin then
            player:SetSkin(skin);
        end;
    end;

    function cwCharCustomize:PlayerAdjustCharacterScreenInfo(player, character, info)
        local skin = character.data["Skin"] or "0";
        local bodygroups = character.data["BGroups"] or "";

        info.skin = skin;
        info.bgroups = bodygroups;
    end;


    local cwCfg = Clockwork.config;
    local cwAttribute = Clockwork.attribute;
    local cwTrait = Clockwork.trait;
    local cwFaction = Clockwork.faction;
    local cwClass = Clockwork.class;
    local cwKernel = Clockwork.kernel;
    local cwDatastream = Clockwork.datastream;
    local cwOption = Clockwork.option;
    local cwCommand = Clockwork.command;
    local cwDatabase = Clockwork.database;
    local cwPlugin = Clockwork.plugin;
    function Clockwork.player:CreateCharacterFromData(player, data)
       if (player.cwIsCreatingChar) then
           return;
       end;

       local minimumPhysDesc = cwCfg:Get("minimum_physdesc"):Get();
       local attributesTable = cwAttribute:GetAll();
       local factionTable = cwFaction:FindByID(data.faction);
       local traitsTable = cwTrait:GetAll();
       local hasAttributes = nil;
       local hasTraits = nil;
       local info = {};

       if (table.Count(attributesTable) > 0) then
           for k, v in pairs(attributesTable) do
               if (v.isOnCharScreen) then
                   hasAttributes = true;
                   break;
               end;
           end;
       end;

       if (table.Count(traitsTable) > 0) then
           for k, v in pairs(traitsTable) do
               hasTraits = true;
               break;
           end;
       end;

       if (!factionTable) then
           return self:SetCreateFault(player, {"FaultDidNotChooseFaction"});
       end;

       info.attributes = {};
       info.faction = factionTable.name;
       info.gender = data.gender;
       info.model = data.model;
       info.data = {};

       info.data["Skin"] = data.skin;
       info.data["BGroups"] = data.bgroups;

       if (data.plugin) then
           for k, v in pairs(data.plugin) do
               info.data[k] = v;
           end;
       end;

       local classes = false;

       for k, v in pairs(cwClass:GetAll()) do
           if (v.isOnCharScreen and (v.factions
           and table.HasValue(v.factions, factionTable.name))) then
               classes = true;
           end;
       end;

       if (classes) then
           local classTable = cwClass:FindByID(data.class);
           local validClass = false;

           if (classTable.factions and table.HasValue(classTable.factions, info.faction)) then
               validClass = true;
           end;

           if (!classTable or !validClass) then
               return self:SetCreateFault(player, {"FaultNeedClass"});
           else
               info.data["Class"] = classTable.name;
           end;
       end;

       if (hasTraits and type(data.traits) == "table") then
           local maximumPoints = cwCfg:Get("max_trait_points"):Get();
           local pointsSpent = 0;

           info.data["Traits"] = {};

           for k, v in pairs(data.traits) do
               local traitTable = cwTrait:FindByID(v);

               if (traitTable) then
                   table.insert(info.data["Traits"], traitTable.uniqueID);
                   pointsSpent = pointsSpent + traitTable.points;
               end;
           end;

           if (pointsSpent > maximumPoints) then
               return self:SetCreateFault(player, {"FaultMorePointsThanCanSpend", cwOption:Translate("name_trait", true)});
           end;
       elseif (hasTraits) then
           return self:SetCreateFault(player, {"FaultDidNotChooseTraits", cwOption:Translate("name_traits", true)});
       end;

       if (hasAttributes and type(data.attributes) == "table") then
           local maximumPoints = cwCfg:Get("default_attribute_points"):Get();
           local pointsSpent = 0;

           if (factionTable.attributePointsScale) then
               maximumPoints = math.Round(maximumPoints * factionTable.attributePointsScale);
           end;

           if (factionTable.maximumAttributePoints) then
               maximumPoints = factionTable.maximumAttributePoints;
           end;

           for k, v in pairs(data.attributes) do
               local attributeTable = cwAttribute:FindByID(k);

               if (attributeTable and attributeTable.isOnCharScreen) then
                   local uniqueID = attributeTable.uniqueID;
                   local amount = math.Clamp(v, 0, attributeTable.maximum);

                   info.attributes[uniqueID] = {
                       amount = amount,
                       progress = 0
                   };

                   pointsSpent = pointsSpent + amount;
               end;
           end;

           if (pointsSpent > maximumPoints) then
               return self:SetCreateFault(player, {"FaultMorePointsThanCanSpend", cwOption:GetKey("name_attribute", true)});
           end;
       elseif (hasAttributes) then
           return self:SetCreateFault(player, {"FaultDidNotChooseAttributes", cwOption:GetKey("name_attributes", true)});
       end;

       if (!factionTable.GetName) then
           if (!factionTable.useFullName) then
               if (data.forename and data.surname) then
                   data.forename = string.gsub(data.forename, "^.", string.upper);
                   data.surname = string.gsub(data.surname, "^.", string.upper);

                   if (string.find(data.forename, "[%p%s%d]") or string.find(data.surname, "[%p%s%d]")) then
                       return self:SetCreateFault(player, {"FaultNameNoSpecialChars"});
                   end;

                   if (!string.find(data.forename, "[aeiou]") or !string.find(data.surname, "[aeiou]")) then
                       return self:SetCreateFault(player, {"FaultNameHaveVowel"});
                   end;

                   if (string.utf8len(data.forename) < 2 or string.utf8len(data.surname) < 2) then
                       return self:SetCreateFault(player, {"FaultNameMinLength"});
                   end;

                   if (string.utf8len(data.forename) > 16 or string.utf8len(data.surname) > 16) then
                       return self:SetCreateFault(player, {"FaultNameTooLong"});
                   end;
               else
                   return self:SetCreateFault(player, {"FaultNameInvalid"});
               end;
           elseif (!data.fullName or data.fullName == "") then
               return self:SetCreateFault(player, {"FaultNameInvalid"});
           end;
       end;

       if (cwCommand:FindByID("CharPhysDesc") != nil) then
           if (type(data.physDesc) != "string") then
               return self:SetCreateFault(player, {"FaultPhysDescNeeded"});
           elseif (string.utf8len(data.physDesc) < minimumPhysDesc) then
               return self:SetCreateFault(player, {"PhysDescMinimumLength", minimumPhysDesc});
           end;

           info.data["PhysDesc"] = cwKernel:ModifyPhysDesc(data.physDesc);
       end;

       if (!factionTable.GetModel and !info.model) then
           return self:SetCreateFault(player, {"FaultNeedModel"});
       end;


       local hasRoles = false;
       local modelValid = false;

       for k, v in pairs(cwClass:GetAll()) do
           if (v.isOnCharScreen and (v.factions and table.HasValue(v.factions, info.faction))) then
               hasRoles = true;
           end;
       end;

       if (hasRoles) then
           if (cwClass:IsGenderValid(info.data.Class, gender)) then
               return self:SetCreateFault(player, {"FaultNeedGender"});
           end;

           if (cwClass:IsModelValid(info.data.Class, info.gender, info.model)) then
               modelValid = true;
           end
       else
           if (!cwFaction:IsGenderValid(info.faction, info.gender)) then
               return self:SetCreateFault(player, {"FaultNeedGender"});
           end;
           if (cwFaction:IsModelValid(factionTable.name, info.gender, info.model) or (factionTable.GetModel and !info.model)) then
               modelValid = true;
           end;
       end;

       if (factionTable.whitelist and !self:IsWhitelisted(player, info.faction)) then
           return self:SetCreateFault(player, {"FaultNotOnWhitelist", info.faction});
       elseif (modelValid) then
           local charactersTable = cwCfg:Get("mysql_characters_table"):Get();
           local schemaFolder = cwKernel:GetSchemaFolder();
           local characterID = nil;
           local characters = player:GetCharacters();

           if (cwFaction:HasReachedMaximum(player, factionTable.name)) then
               return self:SetCreateFault(player, {"FaultTooManyInFaction"});
           end;

           for i = 1, self:GetMaximumCharacters(player) do
               if (!characters[i]) then
                   characterID = i;
                   break;
               end;
           end;

           if (characterID) then
               if (factionTable.GetName) then
                   info.name = factionTable:GetName(player, info, data);
               elseif (!factionTable.useFullName) then
                   info.name = data.forename.." "..data.surname;
               else
                   info.name = data.fullName;
               end;

               if (factionTable.GetModel) then
                   info.model = factionTable:GetModel(player, info, data);
               else
                   info.model = data.model;
               end;

               if (factionTable.OnCreation) then
                   local fault = factionTable:OnCreation(player, info);

                   if (fault == false or type(fault) == "string") then
                       return self:SetCreateFault(player, fault or {"FaultGenericError"});
                   end;
               end;

               for k, v in pairs(characters) do
                   if (v.name == info.name) then
                       return self:SetCreateFault(player, {"YouAlreadyHaveCharName", info.name});
                   end;
               end;

               local fault = cwPlugin:Call("PlayerAdjustCharacterCreationInfo", player, info, data);

               if (fault == false or type(fault) == "string") then
                   return self:SetCreateFault(player, fault or {"FaultGenericError"});
               end;

               local queryObj = cwDatabase:Select(charactersTable);
                   queryObj:AddWhere("_Schema = ?", schemaFolder);
                   queryObj:AddWhere("_Name = ?", info.name);
                   queryObj:SetCallback(function(result)
                       if (!IsValid(player)) then
                           return;
                       end;

                       if (cwDatabase:IsResult(result)) then
                           self:SetCreateFault(player, {"FaultCharNameExists", info.name});
                           player.cwIsCreatingChar = nil;
                       else
                           self:LoadCharacter(player, characterID,
                               {
                                   attributes = info.attributes,
                                   faction = info.faction,
                                   gender = info.gender,
                                   model = info.model,
                                   name = info.name,
                                   data = info.data
                               },
                               function()
                                   cwKernel:PrintLog(LOGTYPE_MINOR, {"LogPlayerCreateChar", player:SteamName(), info.faction, info.name});

                                   cwDatastream:Start(player, "CharacterFinish", {wasSuccess = true});

                                   player.cwIsCreatingChar = nil;

                                   local characters = player:GetCharacters();

                                   if (table.Count(characters) == 1) then
                                       self:UseCharacter(player, characterID);
                                   end;
                               end
                           );
                       end;
                   end);
               queryObj:Pull();
           else
               return self:SetCreateFault(player, {"FaultTooManyCharacters"});
           end;
       else
           return self:SetCreateFault(player, {"FaultNeedModel"});
       end;
    end;
else
    function cwCharCustomize:LegsThink(maxSeqGroundSpeed)
    	local curTime = CurTime();

    	if (IsValid(self.LegsEntity)) then
            local bgroups = Clockwork.Client:GetCharacterData("BGroups", "");
    		if (self.LegsEntity.bgroups != bgroups) then
    			self.LegsEntity.bgroups = bgroups;

    			if self.LegsEntity.bgroups != "" then
    				cwCharCustomize:Format(self.LegsEntity, self.LegsEntity.bgroups);
    			else
    				for k, v in pairs(self.LegsEntity:GetBodyGroups()) do
                    	self.LegsEntity:SetBodygroup(v.id, 0);
                	end;
    			end;
    		end;
        end;
    end;

    local PANEL = vgui.GetControlTable("cwStorage");
    PANEL.RebuildPanel = function(self, storagePanel, storageType, usedWeight, weight, usedSpace, space, cash, inventory)
        storagePanel:Clear(true);
    		storagePanel.cash = cash;
    		storagePanel.weight = weight;
    		storagePanel.usedWeight = usedWeight;
    		storagePanel.space = space;
    		storagePanel.usedSpace = usedSpace;
    		storagePanel.inventory = inventory;
    		storagePanel.storageType = storageType;
    	Clockwork.plugin:Call("PlayerPreRebuildStorage", storagePanel);

    	local modelIcon = vgui.Create("DModelPanel", storagePanel);
    	modelIcon:SetSize(100, 250);

    	local sequence;

    	if (storageType == "Container") then
    		local ent = Clockwork.storage:GetEntity();

    		if (IsValid(ent)) then
    			modelIcon:SetModel(ent:GetModel())
    			sequence = ent:GetSequence();
    		end;
    	else
    		local player = Clockwork.Client;

    		modelIcon:SetModel(player:GetModel());
            if player:GetCharacterData("Skin", 0) then
                modelIcon.Entity:SetSkin(player:GetCharacterData("Skin", 0))
            end
            if player:GetCharacterData("BGroups", "") then
                cwCharCustomize:Format(modelIcon.Entity, player:GetCharacterData("BGroups", ""))
            end
    		sequence = player:GetSequence();
    	end;

    	local bone = modelIcon:GetEntity():LookupBone("ValveBiped.Bip01_Head1")
    	local position = Vector(0, 0, 10);

    	if (bone) then
    		position = modelIcon:GetEntity():GetBonePosition(bone);
    	end;

    	modelIcon:SetLookAt(position - Vector(0, 0, 15));
    	modelIcon:GetEntity():SetSequence(sequence);

    	function modelIcon:LayoutEntity(entity) return self:RunAnimation(); end;

    	storagePanel:AddItem(modelIcon);

    	local categories = {};
    	local usedWeight = (cash * Clockwork.config:Get("cash_weight"):Get());
    	local usedSpace = (cash * Clockwork.config:Get("cash_space"):Get());
    	local itemsList = {};

    	if (Clockwork.storage:GetNoCashWeight()) then
    		usedWeight = 0;
    	end;

    	if (Clockwork.storage:GetNoCashSpace()) then
    		usedSpace = 0;
    	end;

    	for k, v in pairs(storagePanel.inventory) do
    		for k2, v2 in pairs(v) do
    			if ((storageType == "Container" and Clockwork.storage:CanTakeFrom(v2))
    			or (storageType == "Inventory" and Clockwork.storage:CanGiveTo(v2))) then
    				local itemCategory = v2("category");

    				if (itemCategory) then
    					itemsList[itemCategory] = itemsList[itemCategory] or {};
    					itemsList[itemCategory][#itemsList[itemCategory] + 1] = v2;
    					usedWeight = usedWeight + math.max(v2("storageWeight", v2("weight")), 0);
    					usedSpace = usedSpace + math.max(v2("storageSpace", v2("space")), 0);
    				end;
    			end;
    		end;
    	end;

    	for k, v in pairs(itemsList) do
    		categories[#categories + 1] = {
    			itemsList = v,
    			category = k
    		};
    	end;

    	table.sort(categories, function(a, b)
    		return a.category < b.category;
    	end);

    	if (!storagePanel.usedWeight) then
    		storagePanel.usedWeight = usedWeight;
    	end;

    	if (!storagePanel.usedSpace) then
    		storagePanel.usedSpace = usedSpace;
    	end;

    	Clockwork.plugin:Call(
    		"PlayerStorageRebuilt", storagePanel, categories
    	);

    	local numberWang = nil;
    	local cashForm = nil;
    	local button = nil;

    	if (Clockwork.config:Get("cash_enabled"):Get() and storagePanel.cash > 0) then
    		numberWang = vgui.Create("DNumberWang", storagePanel);
    		cashForm = vgui.Create("DForm", storagePanel);
    		button = vgui.Create("DButton", storagePanel);

    		button:SetText(L("StorageTransfer"));
    		button.Stretch = true;

    		-- Called when the button is clicked.
    		function button.DoClick(button)
    			if (storageType == "Inventory") then
    				Clockwork.kernel:RunCommand("StorageGiveCash", numberWang:GetValue());
    			else
    				Clockwork.kernel:RunCommand("StorageTakeCash", numberWang:GetValue());
    			end;
    		end;

    		numberWang.Stretch = true;
    		numberWang:SetDecimals(0);
    		numberWang:SetMinMax(0, storagePanel.cash);
    		numberWang:SetValue(storagePanel.cash);
    		numberWang:SizeToContents();

    		cashForm:SetPadding(5);
    		cashForm:SetName(L("Cash"));
    		cashForm:AddItem(numberWang);
    		cashForm:AddItem(button);
    	end;

    	local informationForm = vgui.Create("DForm", storagePanel);
    		informationForm:SetPadding(5);
    		informationForm:SetName(L("Weight"));

    		local storageWeight = vgui.Create("cwStorageWeight", storagePanel);
    		storageWeight:SetWeight(weight);
    		storageWeight:SetUsedWeight(usedWeight);

    		informationForm:AddItem(storageWeight);
    	storagePanel:AddItem(informationForm);

    	if (Clockwork.inventory:UseSpaceSystem() and storagePanel.usedSpace > 0) then
    		local informationForm = vgui.Create("DForm", storagePanel);
    			informationForm:SetPadding(5);
    			informationForm:SetName(L("Space"));

    			local storageSpace = vgui.Create("cwStorageSpace", storagePanel);
    			storageSpace:SetSpace(space);
    			storageSpace:SetUsedSpace(usedSpace);

    			informationForm:AddItem(storageSpace);
    		storagePanel:AddItem(informationForm);
    	end;

    	if (cashForm) then
    		storagePanel:AddItem(cashForm);
    	end;

    	if (#categories > 0) then
    		for k, v in pairs(categories) do
    			local collapsibleCategory = Clockwork.kernel:CreateCustomCategoryPanel(v.category, storagePanel);
    				collapsibleCategory:SetCookieName(storageType..v.category);
    			storagePanel:AddItem(collapsibleCategory);

    			local categoryList = vgui.Create("DPanelList", collapsibleCategory);
    				categoryList:EnableHorizontal(true);
    				categoryList:SetAutoSize(true);
    				categoryList:SetPadding(4);
    				categoryList:SetSpacing(4);
    			collapsibleCategory:SetContents(categoryList);

    			table.sort(v.itemsList, function(a, b)
    				return a("itemID") < b("itemID");
    			end);

    			for k2, v2 in pairs(v.itemsList) do
    				CURRENT_ITEM_DATA = {
    					itemTable = v2,
    					storageType = storagePanel.storageType
    				};

    				categoryList:AddItem(
    					vgui.Create("cwStorageItem", categoryList)
    				);
    			end;
    		end;
    	end;
    end;

    local PANEL = vgui.GetControlTable("cwScoreboardItem");
    PANEL.Init = function(self)
        SCOREBOARD_PANEL = true;

    	self:SetSize(self:GetParent():GetWide(), 52);

    	local nameFont = Clockwork.option:GetFont("scoreboard_name");
    	local descFont = Clockwork.option:GetFont("scoreboard_desc");
    	local playerData = self:GetParent().playerData;
    	local info = {
    		doesRecognise = Clockwork.player:DoesRecognise(playerData.player),
    		avatarImage = playerData.avatarImage,
    		steamName = playerData.steamName,
    		faction = playerData.faction,
    		player = playerData.player,
    		class = playerData.class,
    		model = playerData.model,
    		skin = playerData.skin,
    		name = playerData.name
    	};

    	info.text = Clockwork.plugin:Call("GetPlayerScoreboardText", info.player);

    	Clockwork.plugin:Call("ScoreboardAdjustPlayerInfo", info);

    	self.toolTip = info.toolTip;
    	self.player = info.player;

    	self.nameLabel = vgui.Create("DLabel", self);
    	self.nameLabel:SetText(info.name);
    	self.nameLabel:SetFont(nameFont);
    	self.nameLabel:SetTextColor(Clockwork.option:GetColor("scoreboard_name"));
    	self.nameLabel:SizeToContents();

    	local class = Clockwork.class:FindByID(self.player:Team());

    	if (class and class.color) then
    		self.nameLabel:SetColor(class.color);
    	end;

    	self.factionLabel = vgui.Create("DLabel", self);
    	self.factionLabel:SetText(info.faction);
    	self.factionLabel:SetFont(descFont);
    	self.factionLabel:SetTextColor(Clockwork.option:GetColor("scoreboard_desc"));
    	self.factionLabel:SizeToContents();

    	if (type(info.text) == "string") then
    		self.factionLabel:SetText(info.text);
    		self.factionLabel:SizeToContents();
    	end;

    	if (info.doesRecognise) then
    		self.spawnIcon = Clockwork.kernel:CreateMarkupToolTip(vgui.Create("cwSpawnIcon", self));
    		self.spawnIcon:SetModel(info.model, info.skin);
    		self.spawnIcon:SetSize(40, 40);
    	else
    		self.spawnIcon = Clockwork.kernel:CreateMarkupToolTip(vgui.Create("DImageButton", self));
    		self.spawnIcon:SetImage("clockwork/unknown2.png");
    		self.spawnIcon:SetSize(40, 40);
    	end;

    	-- Called when the spawn icon is clicked.
    	function self.spawnIcon.DoClick(spawnIcon)
    		local options = {};

    		Clockwork.plugin:Call("GetPlayerScoreboardOptions", info.player, options);
    		Clockwork.kernel:AddMenuFromData(nil, options);
    	end;

    	self.avatarImage = vgui.Create("AvatarImage", self);
    	self.avatarImage:SetSize(40, 40);

    	self.avatarButton = Clockwork.kernel:CreateMarkupToolTip(vgui.Create("DButton", self.avatarImage));
    	self.avatarButton:Dock(FILL);
    	self.avatarButton:SetText("");
    	self.avatarButton:SetDrawBorder(false);
    	self.avatarButton:SetDrawBackground(false);

    	if (info.avatarImage) then
    		self.avatarButton:SetToolTip(L("PlayerNameAndSteamID", info.steamName, info.player:SteamID()));
    		self.avatarButton.DoClick = function(button)
    			if (IsValid(info.player)) then
    				info.player:ShowProfile();
    			end;
    		end;

    		self.avatarImage:SetPlayer(info.player);
    	end;

    	SCOREBOARD_PANEL = nil;
    end;

    function Clockwork.character:RefreshPanelList()
    	local factionScreens = {};
    	local factionList = {};
    	local panelList = self:GetPanelList();

    	if (panelList) then
    		panelList:Clear();

    		for k, v in pairs(self:GetAll()) do
    			local faction = Clockwork.plugin:Call("GetPlayerCharacterScreenFaction", v);
    			if (!factionScreens[faction]) then factionScreens[faction] = {}; end;

    			factionScreens[faction][#factionScreens[faction] + 1] = v;
    		end;

    		for k, v in pairs(factionScreens) do
    			table.sort(v, function(a, b)
    				return Clockwork.plugin:Call("CharacterScreenSortFactionCharacters", k, a, b);
    			end);

    			factionList[#factionList + 1] = {name = k, characters = v};
    		end;

    		table.sort(factionList, function(a, b)
    			return a.name < b.name;
    		end);

    		for k, v in pairs(factionList) do
    			for k2, v2 in pairs(v.characters) do
    				panelList.customData = {
    					name = v2.name,
    					model = v2.model,
    					banned = v2.banned,
    					faction = v.name,
    					details = v2.details,
                        skin = v2.skin,
					    bgroups = v2.bgroups,
    					charTable = v2,
    					characterID = v2.characterID
    				};

    				v2.panel = vgui.Create("cwCharacterPanel", panelList);

    				if (IsValid(v2.panel)) then
    					panelList:AddPanel(v2.panel);
    				end;
    			end;
    		end;
    	end;
    end;
end;
