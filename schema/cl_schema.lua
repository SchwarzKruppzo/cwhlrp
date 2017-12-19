--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

Clockwork.character:RemoveCreationPanel("CreateCharacterStage3");

Clockwork.config:AddToSystem("Big intro text", "intro_text_big", "The big text displayed for the introduction.");
Clockwork.config:AddToSystem("Small intro text", "intro_text_small", "The small text displayed for the introduction.");

-- Fix for framework function
function Clockwork.chatBox:Paint()
	local chatBoxSyntaxFont = Clockwork.option:GetFont("chat_box_syntax");
	local chatBoxTextFont = Clockwork.option:GetFont("chat_box_text");
	local isOpen = Clockwork.chatBox:IsOpen();

	Clockwork.kernel:OverrideMainFont(chatBoxTextFont);

	if (!self.spaceWidths[chatBoxTextFont]) then
		self.spaceWidths[chatBoxTextFont] = Clockwork.kernel:GetTextSize(chatBoxTextFont, " ");
	end;

	local isTypingCommand = Clockwork.chatBox:IsTypingCommand();
	local chatBoxSpacing = Clockwork.chatBox:GetSpacing();
	local maximumLines = math.Clamp(CW_CONVAR_MAXCHATLINES:GetInt(), 1, 10);
	local origX, origY = Clockwork.chatBox:GetPosition(4);
	local onHoverData = nil;
	local spaceWidth = self.spaceWidths[chatBoxTextFont];
	local fontHeight = chatBoxSpacing - 4;
	local isTypingVC, voiceCommands = Clockwork.chatBox:IsTypingVC();
	local messages = self.messages;
	local x, y = origX, origY;
	local box = {width = 0, height = 0};

	if (!isOpen) then
		if (#self.historyMsgs > 100) then
			local amount = #self.historyMsgs - 100;

			for i = 1, amount do
				table.remove(self.historyMsgs, 1);
			end;
		end;
	else
		messages = {};

		for i = 0, (maximumLines - 1) do
			messages[#messages + 1] = self.historyMsgs[self.historyPos - i];
		end;
	end;

	for k, v in pairs(messages) do
		local fontName = Clockwork.fonts:GetMultiplied(chatBoxTextFont, v.multiplier or 1);
		Clockwork.kernel:OverrideMainFont(fontName);

		if (!self.spaceWidths[fontName]) then
			self.spaceWidths[fontName] = Clockwork.kernel:GetTextSize(fontName, " ");
		end;

		chatBoxSpacing = Clockwork.chatBox:GetSpacing(fontName);
		spaceWidth = self.spaceWidths[fontName];

		if (messages[k - 1]) then
			y = y - messages[k - 1].spacing;
		end;

		if (!isOpen and k == 1) then
			y = y - ((chatBoxSpacing + v.spacing) * (v.lines - 1)) + 14;
		else
			y = y - ((chatBoxSpacing + v.spacing) * v.lines);

			if (k == 1) then
				y = y + 2;
			end;
		end;

		local messageX = x;
		local messageY = y;
		local alpha = v.alpha;

		if (isTypingCommand or isTypingVC) then
			alpha = 25;
		elseif (isOpen) then
			alpha = 255;
		end;

		if (v.icon) then
			local messageIcon = Clockwork.kernel:GetMaterial(v.icon);

			surface.SetMaterial(messageIcon);
			surface.SetDrawColor(255, 255, 255, alpha);
			surface.DrawTexturedRect(messageX, messageY + (fontHeight / 2) - 8, 16, 16);

			messageX = messageX + 16 + spaceWidth;
		end;

		local mouseX = gui.MouseX();
		local mouseY = gui.MouseY();

		for k2, v2 in pairs(v.text) do
			local textColor = Color(v2.color.r, v2.color.g, v2.color.b, alpha);
			local newLine = false;

			if (mouseX > messageX and mouseY > messageY
			and mouseX < messageX + v2.width
			and mouseY < messageY + v2.height) then
				if (v2.OnHover) then
					onHoverData = v2;
				end;
			end;

			Clockwork.kernel:DrawSimpleText(v2.text, messageX, messageY, textColor);
			messageX = messageX + v2.width;

			if (origY - y > box.height) then
				box.height = origY - y;
			end;

			if (messageX - 8 > box.width) then
				box.width = messageX - 8;
			end;

			if (v2.newLine) then
				messageY = messageY + chatBoxSpacing + v.spacing;
				messageX = origX;
			end;
		end;
	end;

	Clockwork.kernel:OverrideMainFont(false);

	if (isTypingCommand) then
		local colorInformation = Clockwork.option:GetColor("information");
		local currentText = Clockwork.chatBox:GetCurrentText();
		local colorWhite = Clockwork.option:GetColor("white");
		local splitTable = string.Explode(" ", string.utf8sub(currentText, 2));
		local commands = {};
		local oX, oY = origX, origY;
		local command = splitTable[1];
		local prefix = Clockwork.config:Get("command_prefix"):Get();

		if (command and command != "") then
			for k, v in pairs(Clockwork.command:GetAlias()) do
				local commandLen = string.utf8len(command);

				if (commandLen == 0) then
					commandLen = 1;
				end;

				if (string.utf8sub(k, 1, commandLen) == string.lower(command)
				and (!splitTable[2] or string.lower(command) == k)) then
					local cmdTable = Clockwork.command:FindByAlias(v);

 					if (cmdTable and Clockwork.command:HasAccess(Clockwork.Client, cmdTable)) then
 						local shouldAdd = true;

 						for k, v in pairs(commands) do
 							if (v == cmdTable) then
 								shouldAdd = false;
 							end;
 						end;

 						if (shouldAdd) then
 							commands[#commands + 1] = cmdTable;
 						end;
 					end;
				end;

				if (#commands == 8) then
					break;
				end;
			end;

			Clockwork.kernel:OverrideMainFont(chatBoxSyntaxFont);

			if (#commands > 0) then
				local isSingleCommand = (#commands == 1);

				for k, v in pairs(commands) do
					local totalText = prefix..v.name;

					if (isSingleCommand) then
						totalText = totalText.." "..L(v.text);
					end;

					local tWidth, tHeight = Clockwork.kernel:GetCachedTextSize(chatBoxSyntaxFont, totalText);

					if (k == 1) then
						oY = oY - tHeight;
					end;

					Clockwork.kernel:DrawSimpleText(prefix..v.name, oX, oY, colorInformation);

					if (isSingleCommand) then
						local pWidth = Clockwork.kernel:GetCachedTextSize(chatBoxSyntaxFont, prefix..v.name);

						if (v.tip and v.tip != "") then
							Clockwork.kernel:DrawSimpleText(L(v.tip), oX, oY - tHeight - 8, colorWhite);
						end;

						Clockwork.kernel:DrawSimpleText(" "..L(v.text), oX + pWidth, oY, colorWhite);
					end;

					if (k < #commands) then oY = oY - tHeight; end;
					if (oY < y) then y = oY; end;

					if (origY - oY > box.height) then
						box.height = origY - oY;
					end;

					if (origX + tWidth - 8 > box.width) then
						box.width = origX + tWidth - 8;
					end;
				end;
			end;

			Clockwork.kernel:OverrideMainFont(false);
		end;
	elseif (isTypingVC) then
		local colorInformation = Clockwork.option:GetColor("information");
		local isSingleCommand = (#voiceCommands == 1);
		local colorWhite = Clockwork.option:GetColor("white");
		local oX, oY = origX, origY;

		for k, v in pairs(voiceCommands) do
			local totalText = v.command;

			if (isSingleCommand) then
				totalText = totalText.." "..v.phrase;
			end;

			local tWidth, tHeight = Clockwork.kernel:GetCachedTextSize(chatBoxSyntaxFont, totalText);

			if (k == 1) then
				oY = oY - tHeight;
			end;

			Clockwork.kernel:DrawSimpleText(v.command, oX, oY, colorInformation);

			if (isSingleCommand) then
				local pWidth = Clockwork.kernel:GetCachedTextSize(chatBoxSyntaxFont, v.command);

				Clockwork.kernel:DrawSimpleText(v.phrase, oX, oY - tHeight - 8, colorWhite);
			end;

			if (k < #voiceCommands) then oY = oY - tHeight; end;
			if (oY < y) then y = oY; end;

			if (origY - oY > box.height) then
				box.height = origY - oY;
			end;

			if (origX + tWidth - 8 > box.width) then
				box.width = origX + tWidth - 8;
			end;
		end;

		Clockwork.kernel:OverrideMainFont(false);
	end;

	self.scroll:SetSize(box.width + 8, box.height + 8);
	self.scroll:SetPos(x - 4, y - 4);

	if (onHoverData) then
		onHoverData.OnHover(onHoverData);
	end;
end;

Clockwork.chatBox:RegisterDefaultClass("radio", "ic", function(info)
	local localized = Clockwork.chatBox:LangToTable("ChatPlayerRadios", Color(75, 150, 50, 255), info.name, info.text);

	Clockwork.chatBox:Add(info.filtered, nil, unpack(localized));
end);

Clockwork.chatBox:RegisterDefaultClass("radio_eavesdrop", "ic", function(info)
	if (info.shouldHear) then
		local color = Color(255, 255, 175, 255);

		if (info.focusedOn) then
			color = Color(175, 255, 175, 255);
		end;

		local localized = Clockwork.chatBox:LangToTable("ChatPlayerRadios", color, info.name, info.text);

		Clockwork.chatBox:Add(info.filtered, nil, unpack(localized));
	end;
end);

Clockwork.chatBox:RegisterClass("announce", "ic", function(info)
	local localized = Clockwork.chatBox:LangToTable("ChatPlayerAnnounce", Color(60, 125, 225, 255), info.text);

	Clockwork.chatBox:Add(info.filtered, nil, unpack(localized));
end);

Clockwork.datastream:Hook("Frequency", function(data)
	Derma_StringRequest(L("RequestFrequencyTitle"), L("RequestFrequencyHelp"), data, function(text)
		Clockwork.kernel:RunCommand("SetFreq", text);

		if (!Clockwork.menu:GetOpen()) then
			gui.EnableScreenClicker(false);
		end;
	end);

	if (!Clockwork.menu:GetOpen()) then
		gui.EnableScreenClicker(true);
	end;
end);
