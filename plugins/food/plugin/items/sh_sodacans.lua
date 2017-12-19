--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local ITEM = Clockwork.item:New();

ITEM.name = "ItemEmptyCan";
ITEM.uniqueID = "empty_sodacan";
ITEM.model = "models/props_junk/popcan01a.mdl"
ITEM.weight = 0.2;
ITEM.business = false;
ITEM.category = "CategoryJunk";
ITEM.description = "ItemEmptyCanDesc";
ITEM:AddData("M", 0, true);
ITEM:AddData("S", 0, true);
ITEM.GetNewModel = function(self) return self:GetData("M") end;
ITEM.GetNewSkin = function(self) return self:GetData("S") end;
ITEM:AddQueryProxy("model", ITEM.GetNewModel);
ITEM:AddQueryProxy("skin", ITEM.GetNewSkin);
function ITEM:OnDrop(player, position) end;
function ITEM:OnJunkCreated(food) self:SetData("M", food.model); self:SetData("S", food.skin) end;

ITEM:Register();


local ITEM = Clockwork.item:New("base_drink");

ITEM.name = "ItemSodaCan1";
ITEM.uniqueID = "sodacan_1";
ITEM.description = "ItemSodaCan1Desc";
ITEM.model = "models/foodnhouseholditems/sodacan01.mdl";
ITEM.cost = 4;
ITEM.weight = 0.33
ITEM.dUses = 4;
ITEM.dHunger = 3;
ITEM.dThirst = 10;
ITEM.dHealth = 1;
ITEM.dJunkItem = "empty_sodacan";

ITEM:Register();


local ITEM = Clockwork.item:New("base_drink");

ITEM.name = "ItemSodaCan2";
ITEM.uniqueID = "sodacan_2";
ITEM.description = "ItemSodaCan2Desc";
ITEM.model = "models/foodnhouseholditems/sodacan04.mdl";
ITEM.cost = 4;
ITEM.weight = 0.33
ITEM.dUses = 4;
ITEM.dHunger = 3;
ITEM.dThirst = 10;
ITEM.dHealth = 1;
ITEM.dJunkItem = "empty_sodacan";

ITEM:Register();


local ITEM = Clockwork.item:New("base_drink");

ITEM.name = "ItemSodaCan3";
ITEM.uniqueID = "sodacan_3";
ITEM.description = "ItemSodaCan3Desc";
ITEM.model = "models/foodnhouseholditems/sodacan05.mdl";
ITEM.cost = 4;
ITEM.weight = 0.33
ITEM.dUses = 4;
ITEM.dHunger = 3;
ITEM.dThirst = 10;
ITEM.dHealth = 1;
ITEM.dJunkItem = "empty_sodacan";

ITEM:Register();


local ITEM = Clockwork.item:New("base_drink");

ITEM.name = "ItemSodaCan4";
ITEM.uniqueID = "sodacan_4";
ITEM.description = "ItemSodaCan4Desc";
ITEM.model = "models/foodnhouseholditems/sodacan06.mdl";
ITEM.cost = 4;
ITEM.weight = 0.33
ITEM.dUses = 4;
ITEM.dHunger = 3;
ITEM.dThirst = 10;
ITEM.dHealth = 1;
ITEM.dJunkItem = "empty_sodacan";

ITEM:Register();


local ITEM = Clockwork.item:New("base_drink");

ITEM.name = "ItemSodaCan5";
ITEM.uniqueID = "sodacan_5";
ITEM.description = "ItemSodaCan5Desc";
ITEM.model = "models/props_hl1rp/sodacan.mdl";
ITEM.cost = 4;
ITEM.weight = 0.33
ITEM.dUses = 4;
ITEM.dHunger = 3;
ITEM.dThirst = 10;
ITEM.dHealth = 1;
ITEM.dJunkItem = "empty_sodacan";

ITEM:Register();


local ITEM = Clockwork.item:New("base_drink");

ITEM.name = "ItemSodaCan6";
ITEM.uniqueID = "sodacan_6";
ITEM.description = "ItemSodaCan6Desc";
ITEM.model = "models/props_hl1rp/sodacan.mdl";
ITEM.skin = 1;
ITEM.cost = 4;
ITEM.weight = 0.33
ITEM.dUses = 4;
ITEM.dHunger = 3;
ITEM.dThirst = 10;
ITEM.dHealth = 1;
ITEM.dJunkItem = "empty_sodacan";

ITEM:Register();


local ITEM = Clockwork.item:New("base_drink");

ITEM.name = "ItemSodaCan7";
ITEM.uniqueID = "sodacan_7";
ITEM.description = "ItemSodaCan7Desc";
ITEM.model = "models/props_hl1rp/sodacan.mdl";
ITEM.skin = 2;
ITEM.cost = 4;
ITEM.weight = 0.33
ITEM.dUses = 4;
ITEM.dHunger = 3;
ITEM.dThirst = 10;
ITEM.dHealth = 1;
ITEM.dJunkItem = "empty_sodacan";

ITEM:Register();
