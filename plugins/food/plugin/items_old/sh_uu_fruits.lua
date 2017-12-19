local langEn = Clockwork.lang:GetTable("en")
local langRu = Clockwork.lang:GetTable("ru")

langEn["#ITEM_UBApple"] = "Union Branded Apple"
langRu["#ITEM_UBApple"] = "Фирменное яблоко"
langEn["#ITEM_UBApple_Desc"] = "A red apple with a printed logo of the Universal Union on the side. It retains a fresh, fruity aroma."
langRu["#ITEM_UBApple_Desc"] = "Красное яблоко с напечатанным знаком Альянса на нём. Сохраняет вкусный свежий аромат."
local ITEM = Clockwork.item:New("base_food")
ITEM.name = "Union Branded Apple"
ITEM.PrintName = "#ITEM_UBApple"
ITEM.description = "#ITEM_UBApple_Desc"
ITEM.model = "models/bioshockinfinite/hext_apple.mdl"
ITEM.cost = 25
ITEM.weight = 0.25
ITEM.hunger = 25
ITEM.thirst = 10
ITEM.access = "u"
ITEM:AddData("Rarity", 1)
ITEM:Register()



langEn["#ITEM_UBBanana"] = "Union Branded Banana"
langRu["#ITEM_UBBanana"] = "Фирменный банан"
langEn["#ITEM_UBBanana_Desc"] = "A deliciously-looking banana with a distinct print of the Universal Union logo. It is not as soft as a banana should be."
langRu["#ITEM_UBBanana_Desc"] = "Аппетитно выглядящий банан с напечатанным знаком Альянса на нём. Не такой мягкий, как должен бы быть."
local ITEM = Clockwork.item:New("base_food")
ITEM.name = "Union Branded Banana"
ITEM.PrintName = "#ITEM_UBBanana"
ITEM.description = "#ITEM_UBBanana_Desc"
ITEM.model = "models/bioshockinfinite/hext_banana.mdl"
ITEM.cost = 20
ITEM.weight = 0.175
ITEM.hunger = 28
ITEM.thirst = 22
ITEM.access = "u"
ITEM:AddData("Rarity", 1)
ITEM:Register()


langEn["#ITEM_UBMelon"] = "Union Branded Melon"
langRu["#ITEM_UBMelon"] = "Фирменный арбуз"
langEn["#ITEM_UBMelon_Desc"] = "A large, green synthetic fruit consisting of a silicone shell concealing red arrowroot gel. Biting into the gel would taste somewhat reminiscent of watermelon candy, but saccharin sweet, almost uncomfortably so."
langRu["#ITEM_UBMelon_Desc"] = "Большой, зеленый синтетический фрукт, состоящий из силиконовой оболочки, скрывающей красный гель. Гель на вкус напоминает конфеты из арбуза."
local ITEM = Clockwork.item:New("base_food")
ITEM.name = "Union Branded Melon"
ITEM.PrintName = "#ITEM_UBMelon"
ITEM.description = "#ITEM_UBMelon_Desc"
ITEM.model = "models/props_junk/watermelon01.mdl"
ITEM.cost = 60
ITEM.weight = 2
ITEM.hunger = 50
ITEM.thirst = 25
ITEM.access = "u"
ITEM:AddData("Rarity", 1)
ITEM:Register()


langEn["#ITEM_UBOrange"] = "Union Branded Orange"
langRu["#ITEM_UBOrange"] = "Фирменный апельсин"
langEn["#ITEM_UBOrange_Desc"] = "A delicious-looking orange with a sticker bearing the Union insignia stuck to it. It doesn't smell as fresh as its original counterpart, however."
langRu["#ITEM_UBOrange_Desc"] = "Аппетитно выглядящий апельсин с напечатанным знаком Альянса на нём. Тем не менее, он не пахнет столь же свежо, как его оригинальный аналог."
local ITEM = Clockwork.item:New("base_food")
ITEM.name = "Union Branded Orange"
ITEM.PrintName = "#ITEM_UBOrange"
ITEM.description = "#ITEM_UBOrange_Desc"
ITEM.model = "models/bioshockinfinite/hext_orange.mdl"
ITEM.cost = 15
ITEM.weight = 0.2
ITEM.hunger = 18
ITEM.thirst = 14
ITEM.health = 1
ITEM.access = "u"
ITEM:AddData("Rarity", 1)
ITEM:Register()


langEn["#ITEM_UBPear"] = "Union Branded Pear"
langRu["#ITEM_UBPear"] = "Фирменная груша"
langEn["#ITEM_UBPear_Desc"] = "An deliciously-looking pear with a printed Union logo. It doesn't smell as fresh as its original counterpart, however."
langRu["#ITEM_UBPear_Desc"] = "Аппетитно выглядящая груша с напечатанным знаком Альянса на ней. Тем не менее, она не пахнет столь же свежо, как её оригинальный аналог."
local ITEM = Clockwork.item:New("base_food")
ITEM.name = "Union Branded Pear"
ITEM.PrintName = "#ITEM_UBPear"
ITEM.description = "#ITEM_UBPear_Desc"
ITEM.model = "models/bioshockinfinite/hext_pear.mdl"
ITEM.cost = 18
ITEM.weight = 0.15
ITEM.hunger = 22
ITEM.thirst = 13
ITEM.health = 1
ITEM.access = "u"
ITEM:AddData("Rarity", 1)
ITEM:Register()


langEn["#ITEM_UBPineapple"] = "Union Branded Pineapple"
langRu["#ITEM_UBPineapple"] = "Фирменный ананас"
langEn["#ITEM_UBPineapple_Desc"] = "An deliciously-looking pineapple with a printed Union logo. It doesn't smell as fresh as its original counterpart, however."
langRu["#ITEM_UBPineapple_Desc"] = "Аппетитно выглядящий ананас с напечатанным знаком Альянса на нём. Тем не менее, он не пахнет столь же свежо, как его оригинальный аналог."
local ITEM = Clockwork.item:New("base_food")
ITEM.name = "Union Branded Pineapple"
ITEM.PrintName = "#ITEM_UBPineapple"
ITEM.description = "#ITEM_UBPineapple_Desc"
ITEM.model = "models/bioshockinfinite/hext_pineapple.mdl"
ITEM.cost = 30
ITEM.weight = 0.45
ITEM.hunger = 35
ITEM.thirst = 18
ITEM.health = 2
ITEM.access = "u"
ITEM:AddData("Rarity", 1)
ITEM:Register()


langEn["#ITEM_UBPotato"] = "Union Branded Potato"
langRu["#ITEM_UBPotato"] = "Фирменная картошка"
langEn["#ITEM_UBPotato_Desc"] = "A raw, uncooked potato with a distinct logo of the Universal Union. Looks like they didn't get the colouring correct."
langRu["#ITEM_UBPotato_Desc"] = "Сырая картошка с напечатанным знаком Альянса на ней. Кажется, им не удалось получить правильный цвет."
local ITEM = Clockwork.item:New("base_food")
ITEM.name = "Union Branded Potato"
ITEM.PrintName = "#ITEM_UBPotato"
ITEM.description = "#ITEM_UBPotato_Desc"
ITEM.model = "models/bioshockinfinite/hext_potato.mdl"
ITEM.cost = 15
ITEM.weight = 0.2
ITEM.hunger = 20
ITEM.thirst = -5
ITEM.access = "u"
ITEM:AddData("Rarity", 1)
ITEM:Register()