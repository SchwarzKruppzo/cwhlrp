local langEn = Clockwork.lang:GetTable("en");
local langRu = Clockwork.lang:GetTable("ru");
langEn["#CATEGORY_Junk"] = "Junk";
langRu["#CATEGORY_Junk"] = "Мусор";
langEn["#ITEM_EmptyCan"] = "Empty Can";
langRu["#ITEM_EmptyCan"] = "Пустая банка";
langEn["#ITEM_EmptyCan_Desc"] = "An empty can, its label is long gone to say what its contents once held.";
langRu["#ITEM_EmptyCan_Desc"] = "Пустая алюминиевая банка.";


local ITEM = Clockwork.item:New()
ITEM.name = "Empty Can";
ITEM.PrintName = "#ITEM_EmptyCan"
ITEM.model = "models/props_junk/popcan01a.mdl"
ITEM.weight = 0.2
ITEM.business = false
ITEM.category = "#CATEGORY_Junk"
ITEM.description = "#ITEM_EmptyCan_Desc"
ITEM:AddData("S", 0, true)
function ITEM:GetNewSkin()
	return self:GetData("S")
end
ITEM:AddQueryProxy("skin", ITEM.GetNewSkin)
function ITEM:OnDrop(player, position) end
function ITEM:OnJunkCreated(food)
	self:SetData("S", food.skin)
end
ITEM:Register()


langEn["#ITEM_EmptyTinCan"] = "Empty Plastic Can";
langRu["#ITEM_EmptyTinCan"] = "Пустая пластиковая банка";
langEn["#ITEM_EmptyTinCan_Desc"] = "An empty plastic can. It is impossible to determine what was stored in it before.";
langRu["#ITEM_EmptyTinCan_Desc"] = "Пустая пластиковая банка. Выглядит очень изношенной и невозможно определить что в ней хранили раньше.";
local ITEM = Clockwork.item:New()
ITEM.name = "Empty Plastic Can";
ITEM.PrintName = "#ITEM_EmptyTinCan"
ITEM.model = "models/props_lab/jar01b.mdl";
ITEM.weight = 0.15
ITEM.business = false
ITEM.category = "#CATEGORY_Junk"
ITEM.description = "#ITEM_EmptyTinCan_Desc"
function ITEM:OnDrop(player, position) end
ITEM:Register()

langEn["#ITEM_EmptyPBottle"] = "Empty Plastic Can";
langRu["#ITEM_EmptyPBottle"] = "Пустая пластиковая бутылка";
langEn["#ITEM_EmptyPBottle_Desc"] = "An empty plastic bottle, it's fairly big.";
langRu["#ITEM_EmptyPBottle_Desc"] = "Пустая пластиковая бутылка большого размера.";
local ITEM = Clockwork.item:New();
ITEM.PrintName = "#ITEM_EmptyPBottle"
ITEM.name = "Empty Plastic Bottle"
ITEM.model = "models/props_junk/garbage_plasticbottle003a.mdl"
ITEM.weight = 0.15
ITEM.business = false
ITEM.category = "#CATEGORY_Junk"
ITEM.description = "#ITEM_EmptyPBottle_Desc"
function ITEM:OnDrop(player, position) end
ITEM:Register()

langEn["#ITEM_EmptyGBottle"] = "Empty Glass Bottle";
langRu["#ITEM_EmptyGBottle"] = "Пустая стеклянная бутылка";
langEn["#ITEM_EmptyGBottle_Desc"] = "An empty glass bottle.";
langRu["#ITEM_EmptyGBottle_Desc"] = "Пустая стеклянная бутылка, похоже, что из под какого-то алкоголя.";
local ITEM = Clockwork.item:New();
ITEM.PrintName = "#ITEM_EmptyGBottle"
ITEM.name = "Empty Glass Bottle";
ITEM.model = "models/props_junk/garbage_glassbottle003a.mdl";
ITEM.weight = 0.3
ITEM.business = false
ITEM.category = "#CATEGORY_Junk"
ITEM.description = "#ITEM_EmptyGBottle_Desc";
ITEM:AddData("M", "models/props_junk/garbage_glassbottle003a.mdl", true)
function ITEM:GetNewModel()
	return self:GetData("M")
end
ITEM:AddQueryProxy("model", ITEM.GetNewModel)
function ITEM:OnJunkCreated(food)
	self:SetData("M", food.model)
end
function ITEM:OnDrop(player, position) end
ITEM:Register()

langEn["#ITEM_EmptyTcan"] = "Empty Tin Can";
langRu["#ITEM_EmptyTcan"] = "Пустая консервная банка";
langEn["#ITEM_EmptyTcan_Desc"] = "An empty old can, the label is worn off.";
langRu["#ITEM_EmptyTcan_Desc"] = "Старая пустая консервная банка, все надписи стёрты.";
local ITEM = Clockwork.item:New();
ITEM.PrintName = "#ITEM_EmptyTcan"
ITEM.name = "Empty Tin Can";
ITEM.model = "models/props_junk/garbage_metalcan001a.mdl";
ITEM.weight = 0.2
ITEM.business = false
ITEM.category = "#CATEGORY_Junk"
ITEM.description = "#ITEM_EmptyTcan_Desc";
function ITEM:OnDrop(player, position) end
ITEM:Register()

langEn["#ITEM_EmptyMCarton"] = "Empty Carton";
langRu["#ITEM_EmptyMCarton"] = "Пустая картонная упаковка";
langEn["#ITEM_EmptyMCarton_Desc"] = "An empty carton."
langRu["#ITEM_EmptyMCarton_Desc"] = "Пустая картонная упаковка из под молока.";
local ITEM = Clockwork.item:New()
ITEM.PrintName = "#ITEM_EmptyMCarton"
ITEM.name = "Empty Carton"
ITEM.model = "models/props_junk/garbage_milkcarton002a.mdl"
ITEM.weight = 0.125
ITEM.business = false;
ITEM.category = "#CATEGORY_Junk"
ITEM.description = "#ITEM_EmptyMCarton_Desc"
function ITEM:OnDrop(player, position) end
ITEM:Register()

langEn["#ITEM_EmptyJug"] = "Empty Jug";
langRu["#ITEM_EmptyJug"] = "Пустой пластиковый кувшин";
langEn["#ITEM_EmptyJug_Desc"] = "An empty jug."
langRu["#ITEM_EmptyJug_Desc"] = "Пустой пластиковый кувшин из под молока.";
local ITEM = Clockwork.item:New()
ITEM.PrintName = "#ITEM_EmptyJug"
ITEM.name = "Empty Jug"
ITEM.model = "models/props_junk/garbage_milkcarton001a.mdl";
ITEM.weight = 0.2
ITEM.business = false;
ITEM.category = "#CATEGORY_Junk"
ITEM.description = "#ITEM_EmptyJug_Desc"
function ITEM:OnDrop(player, position) end
ITEM:Register()