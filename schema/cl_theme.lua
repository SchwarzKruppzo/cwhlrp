--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local THEME = Clockwork.theme:Begin(true);
local FONT = "Segoe UI Semilight";

-- Called when fonts should be created.
function THEME:CreateFonts()
	surface.CreateFont("hl1rp_MenuButton", {
		size = Clockwork.kernel:FontScreenScale(17),
		weight = 500,
		antialias = true,
		font = FONT,
		extended = true,
	});

	surface.CreateFont("hl1rp_MenuButton2", {
		size = Clockwork.kernel:FontScreenScale(13),
		weight = 500,
		antialias = true,
		font = FONT,
		extended = true,
	});

	surface.CreateFont("hl1rp_MenuAuthor", {
		size = Clockwork.kernel:FontScreenScale(9),
		weight = 100,
		antialias = true,
		font = FONT,
		extended = true,
	});

	surface.CreateFont("hl1rp_MenuOptionTitle", {
		size = Clockwork.kernel:FontScreenScale(20),
		weight = 100,
		antialias = true,
		font = FONT,
		extended = true,
	});

	surface.CreateFont("hl1rp_Large3D2D", {
		size = Clockwork.kernel:FontScreenScale(2048),
		weight = 600,
		antialias = true,
		font = "Roboto Light",
		extended = true
	});

	surface.CreateFont("hl1rp_IntroTextSmall", {
		size = Clockwork.kernel:FontScreenScale(13),
		weight = 600,
		antialias = true,
		font = FONT,
		extended = true
	});

	surface.CreateFont("hl1rp_IntroTextTiny", {
		size = Clockwork.kernel:FontScreenScale(11),
		weight = 600,
		antialias = true,
		font = FONT,
		extended = true
	});

	surface.CreateFont("hl1rp_CinematicText", {
		size = Clockwork.kernel:FontScreenScale(24),
		weight = 600,
		antialias = true,
		font = FONT,
		extended = true
	});

	surface.CreateFont("hl1rp_IntroTextBig", {
		size = Clockwork.kernel:FontScreenScale(18),
		weight = 600,
		antialias = true,
		font = FONT,
		extended = true
	});

	surface.CreateFont("hl1rp_TargetIDText", {
		size = Clockwork.kernel:FontScreenScale(10),
		weight = 600,
		antialias = true,
		font = FONT,
		extended = true
	});

	surface.CreateFont("hl1rp_MenuTextHuge", {
		size = Clockwork.kernel:FontScreenScale(32),
		weight = 600,
		antialias = true,
		font = FONT,
		extended = true
	});

	surface.CreateFont("hl1rp_MenuTextBig", {
		size = Clockwork.kernel:FontScreenScale(22),
		weight = 600,
		antialias = true,
		font = FONT,
		extended = true
	});

	surface.CreateFont("hl1rp_PlayerInfoText", {
		size = Clockwork.kernel:FontScreenScale(10),
		weight = 600,
		antialias = true,
		font = FONT,
		extended = true
	});

	surface.CreateFont("hl1rp_MainText", {
		size = Clockwork.kernel:FontScreenScale(10),
		weight = 600,
		antialias = true,
		font = FONT,
		extended = true
	});

	surface.CreateFont("hl1rp_BarText", {
		size = Clockwork.kernel:FontScreenScale(9),
		weight = 600,
		antialias = true,
		font = FONT,
		extended = true
	});

	surface.CreateFont("hl1rp_BarTextAuto", {
		size = Clockwork.kernel:FontScreenScale(7),
		weight = 600,
		antialias = true,
		font = "Arial",
		extended = true
	});

	surface.CreateFont("hl1rp_SmallBarText", {
		size = Clockwork.kernel:FontScreenScale(10),
		weight = 600,
		antialias = true,
		font = FONT,
		extended = true
	});
end;

-- Called when to initialize the theme.
function THEME:Initialize()
	Clockwork.option:SetFont("bar_text", "hl1rp_BarText");
	Clockwork.option:SetFont("auto_bar_text", "hl1rp_BarTextAuto");
	Clockwork.option:SetFont("main_text", "hl1rp_MainText");
	Clockwork.option:SetFont("hints_text", "hl1rp_IntroTextTiny");
	Clockwork.option:SetFont("large_3d_2d", "hl1rp_Large3D2D");
	Clockwork.option:SetFont("target_id_text", "hl1rp_TargetIDText");
	Clockwork.option:SetFont("cinematic_text", "hl1rp_CinematicText");
	Clockwork.option:SetFont("date_time_text", "hl1rp_IntroTextSmall");
	Clockwork.option:SetFont("intro_text_big", "hl1rp_IntroTextBig");
	Clockwork.option:SetFont("intro_text_small", "hl1rp_IntroTextSmall");
	Clockwork.option:SetFont("intro_text_tiny", "hl1rp_IntroTextTiny");
	Clockwork.option:SetFont("player_info_text", "hl1rp_PlayerInfoText");
	Clockwork.option:SetFont("menu_text", "hl1rp_MenuButton");
	Clockwork.option:SetFont("menu_text_controls", "hl1rp_MenuButton2");
	Clockwork.option:SetFont("menu_text_author", "hl1rp_MenuAuthor");
	Clockwork.option:SetFont("menu_text_optiontitle", "hl1rp_MenuOptionTitle");
	Clockwork.option:SetFont("menu_text_big", "hl1rp_MenuTextBig");
	Clockwork.option:SetFont("menu_text_huge", "hl1rp_MenuTextHuge");
	Clockwork.option:SetFont("menu_text_small", "hl1rp_IntroTextSmall");
	Clockwork.option:SetFont("menu_text_tiny", "hl1rp_IntroTextTiny");

	Clockwork.option:SetColor("menu_authors", Color(255, 255, 255, 4));
	Clockwork.option:SetColor("columnsheet_shadow_normal", Color(0, 0, 0, 0));
	//Clockwork.option:SetColor("columnsheet_text_normal", Color(255, 255, 255, 255));
	Clockwork.option:SetColor("columnsheet_shadow_active", Color(0, 0, 0, 0));
	Clockwork.option:SetColor("columnsheet_text_active", Color(255, 210, 64, 255));
	Clockwork.option:SetColor("attribute_base_color", Color(50, 50, 50, 255));
	Clockwork.option:SetColor("attribute_progress_color", Color(247, 240, 195, 255));
	Clockwork.option:SetColor("attribute_boost_color", Color(50, 255, 50, 255));
	Clockwork.option:SetColor("attribute_hinder_color", Color(255, 50, 50, 255));
	Clockwork.option:SetColor("attribute_main_color", Color(255, 210, 64, 255));
	Clockwork.option:SetColor("basic_form_highlight", Color(0, 0, 0, 255));
	//Clockwork.option:SetColor("basic_form_color_help", Color(255, 255, 255, 255));
	Clockwork.option:SetColor("basic_form_color", Color(30, 30, 30, 255));
	Clockwork.option:SetColor("information", Color(146, 206, 239, 255));
	//Clockwork.option:SetColor("foreground", Color(255, 255, 255, 125));
	Clockwork.option:SetColor("target_id", Color(146, 206, 255, 255));

	SMALL_BAR_BG = Clockwork.render:AddSlice9("Small", "hl1rp/frame_bg", 6);
	INFOTEXT_SLICED = Clockwork.render:AddSlice9("SmallBox", "clockwork/sliced/smallbox", 6);
	SCOREBOARD_ITEM_SLICED = Clockwork.render:AddSlice9("SmallBox", "hl1rp/frame_small_bg", 6);
	SLICED_COLUMNSHEET_BUTTON = Clockwork.render:AddSlice9("Transparent", "hl1rp/frame_bg", 20);
	PANEL_LIST_SLICED = Clockwork.render:AddSlice9("Transparent", "hl1rp/frame_bg", 20);
	DERMA_SLICED_BG = Clockwork.render:AddSlice9("Transparent", "hl1rp/frame_bg", 20);
	SLICED_LARGE_DEFAULT = Clockwork.render:AddSlice9("Small", "hl1rp/frame_small_bg", 28);
	SLICED_PROGRESS_BAR = Clockwork.render:AddSlice9("Small", "hl1rp/frame_small_bg", 28);
	SLICED_PLAYER_INFO = Clockwork.render:AddSlice9("Small", "hl1rp/frame_small_bg", 28);
	SLICED_INFO_MENU_BG = Clockwork.render:AddSlice9("Transparent", "hl1rp/frame_bg", 20);

	Clockwork.option:SetKey("top_bar_width_scale", 0.2);

	Clockwork.bars.height = 18;
	Clockwork.bars.padding = 32;
end;

-- Called just before a bar is drawn.
function THEME.module:PreDrawBar(barInfo)
	surface.SetDrawColor(70, 70, 71, 255);
	surface.DrawRect(barInfo.x, barInfo.y, barInfo.width, barInfo.height);

	surface.SetDrawColor(Color(255, 176, 0, 200));
	surface.DrawOutlinedRect(barInfo.x, barInfo.y, barInfo.width, barInfo.height);

	barInfo.drawBackground = false;
	barInfo.drawProgress = false;

	if (barInfo.text) then
		barInfo.text = string.upper(barInfo.text);
	end;

 	-- Thats a bad solution.
	if (barInfo.uniqueID == "HEALTH") then
		barInfo.color = Color(231, 75, 54, 255);
	elseif (barInfo.uniqueID == "ARMOR") then
		barInfo.color = Color(201, 166, 120, 255);
	end;
end;

-- Called just after a bar is drawn.
function THEME.module:PostDrawBar(barInfo)
	local width = barInfo.progressWidth;

	if (width >= barInfo.width - 8) then
		width = barInfo.width;
	end;

	if (width > 8) then
		surface.SetDrawColor(barInfo.color.r, barInfo.color.g, barInfo.color.b, barInfo.color.a);
		surface.DrawRect(barInfo.x + 1, barInfo.y + 1, math.max(width - 2, 0), barInfo.height - 2);
	end;
end;

-- Called when the menu is opened.
function THEME.module:MenuOpened()
	if (Clockwork.Client:HasInitialized()) then
		Clockwork.kernel:RegisterBackgroundBlur("MainMenu", SysTime());
	end;
end;

-- Called when the menu is closed.
function THEME.module:MenuClosed()
	if (Clockwork.Client:HasInitialized()) then
		Clockwork.kernel:RemoveBackgroundBlur("MainMenu");
	end;
end;

-- Called just before the weapon selection info is drawn.
function THEME.module:PreDrawWeaponSelectionInfo(info)
	DERMA_SLICED_BG:Draw(info.x, info.y, info.width, info.height, 4, Color(255, 255, 255, info.alpha));

	info.drawBackground = false;
end;

-- Called just before the local player's information is drawn.
function THEME.module:PreDrawPlayerInfo(boxInfo, information, subInformation)
	DERMA_SLICED_BG:Draw(boxInfo.x, boxInfo.y, boxInfo.width, boxInfo.height, 4, Color(255, 255, 255, 200));

	boxInfo.drawBackground = false;
end;

-- Called after the character menu has initialized.
function THEME.hooks:PostCharacterMenuInit(panel) end;

-- Called every frame that the character menu is open.
function THEME.hooks:PostCharacterMenuThink(panel) end;

-- Called after the character menu is painted.
function THEME.hooks:PostCharacterMenuPaint(panel) end;

-- Called after a character menu panel is opened.
function THEME.hooks:PostCharacterMenuOpenPanel(panel) end;

-- Called after the main menu has initialized.
function THEME.hooks:PostMainMenuInit(panel) end;

-- Called after the main menu is rebuilt.
function THEME.hooks:PostMainMenuRebuild(panel) end;

-- Called after a main menu panel is opened.
function THEME.hooks:PostMainMenuOpenPanel(panel, panelToOpen) end;

-- Called after the main menu is painted.
function THEME.hooks:PostMainMenuPaint(panel) end;

-- Called every frame that the main menu is open.
function THEME.hooks:PostMainMenuThink(panel) end;

Clockwork.theme:Finish(THEME);
