local langEn = Clockwork.lang:GetTable("en")
local langRu = Clockwork.lang:GetTable("ru")

langEn["#ITEM_Coffee"] = "Coffee mug"
langRu["#ITEM_Coffee"] = "Кружка кофе"
langEn["#ITEM_Coffee_Desc"] = "A mug filled with unfiltered coffee. Something strange is floating on the surface of the coffee itself. The taste is very bitter mush."
langRu["#ITEM_Coffee_Desc"] = "Кружка, наполненная нефильтрованым кофе. На поверхности самого кофе плавает что-то странное. На вкус очень горькое месиво."
local ITEM = Clockwork.item:New("base_drink")
ITEM.name = "Coffee mug"
ITEM.PrintName = "#ITEM_Coffee"
ITEM.description = "#ITEM_Coffee_Desc"
ITEM.model = "models/props_junk/garbage_coffeemug001a.mdl"
ITEM.cost = 15
ITEM.weight = 0.2
ITEM.hunger = 0
ITEM.thirst = 15
ITEM:Register()



langEn["#ITEM_UBSpoiledbeer"] = "Bottle of spoiled beer"
langRu["#ITEM_UBSpoiledbeer"] = "Бутылка испорченного пива"
langEn["#ITEM_UBSpoiledbeer_Desc"] = "A bottle filled with light beer. It is already very old, without gas, but it tastes pretty good. Even a little intoxicates."
langRu["#ITEM_UBSpoilerbeer_Desc"] = "Бутылка, в которую налито светлое пиво. Оно уже очень старое, без газа, но на вкус довольно сносно. Даже немного пьянит."
local ITEM = Clockwork.item:New("base_drink")
ITEM.name = "Spoiled beer"
ITEM.PrintName = "#ITEM_UBSpoiledbeer"
ITEM.description = "#ITEM_UBSpoiledbeer_Desc"
ITEM.model = "models/props_junk/garbage_glassbottle001a.mdl"
ITEM.cost = 30
ITEM.weight = 1
ITEM.hunger = 0
ITEM.thirst = 40
ITEM.junk =  "empty_glass_bottle"
ITEM:Register()



langEn["#ITEM_UBSpoiledwhiskey"] = "Bottle of spoiled whiskey"
langRu["#ITEM_UBSpoiledwhiskey"] = "Бутылка испорченного виски"
langEn["#ITEM_UBSpoiledwhiskey_Desc"] = "A bottle wrapped in a thick layer of paper to hide the contents. Filled with bitter whiskey, which is almost impossible to drink, except that only for the effect of 'deja vu'"
langRu["#ITEM_UBSpoilerwhiskey_Desc"] = "Бутылка, обернутая в толстый слой бумаги для скрытия содержимого. Наполнено горьким виски, который практически невозможно пить, разве что только ради эффекта 'дежа вю'"
local ITEM = Clockwork.item:New("base_drink")
ITEM.name = "Spoiled whiskey"
ITEM.PrintName = "#ITEM_UBSpoiledwhiskey"
ITEM.description = "#ITEM_UBSpoiledwhiskey_Desc"
ITEM.model = "models/props_junk/garbage_glassbottle002a.mdl"
ITEM.cost = 40
ITEM.weight = 1
ITEM.hunger = 0
ITEM.thirst = 50
ITEM.junk =  "empty_glass_bottle"
ITEM:Register()




langEn["#ITEM_UBPurifiedwater"] = "Bottle of purified water"
langRu["#ITEM_UBPurifiedwater"] = "Бутылка очищенной воды"
langEn["#ITEM_UBPurifiedwater_Desc"] = "A bottle filled with water from still clean sources. It is quite tasty and 'useful', but no one has cleaned up the water completely, therefore, it is likely that it can be contaminated."
langRu["#ITEM_UBPurifiedwater_Desc"] = "Бутылка, наполненная водой из ещё чистых источников. Она довольно вкусная и 'полезная', но полной отчисткой воды никто не занимался, по этому, скорее всего, она может быть заражена."
local ITEM = Clockwork.item:New("base_drink")
ITEM.name = "Purified water"
ITEM.PrintName = "#ITEM_UBPurifiedwater"
ITEM.description = "#ITEM_UBPurifiedwater_Desc"
ITEM.model = "models/props_junk/GlassBottle01a.mdl"
ITEM.cost = 30
ITEM.weight = 1
ITEM.hunger = 0
ITEM.thirst = 40
ITEM.junk =  "empty_glass_bottle"
ITEM:Register()



langEn["#ITEM_UBPrewarcanfood"] = "Pre-war canned food"
langRu["#ITEM_UBPrewarcanfood"] = "Довоенные консервы"
langEn["#ITEM_UBPrewarcanfood_Desc"] = "Pre-war canned food, the label has long been ripped off, but judging by the consistency, there is meat inside. Holes on the sides of canned food alarm that this canned food can be spoiled."
langRu["#ITEM_UBPrewarcanfood_Desc"] = "Довоенные консервы, этикетка давным давно сорвана, но, судя по консистенции, внутри есть мясо. Дырки по бокам консервов настораживают, что этот консерв может быть испорчен."
local ITEM = Clockwork.item:New("base_food")
ITEM.name = "Pre-war canned food"
ITEM.PrintName = "#ITEM_UBPrewarcanfood"
ITEM.description = "#ITEM_UBPrewarcanfood_Desc"
ITEM.model = "models/props_junk/garbage_metalcan001a.mdl"
ITEM.cost = 50
ITEM.weight = 1
ITEM.hunger = 50
ITEM.thirst = 5
ITEM.junk =  "empty_tin_can"
ITEM:Register()



langEn["#ITEM_Milkcarton"] = "Milk catron"
langRu["#ITEM_Milkcarton"] = "Пакет молока"
langEn["#ITEM_Milkcarton_Desc"] = "White carton with milk. Inside it is really milk - it is true, it is not cleaned and it is very much in vain. The cow, most likely, is sick. Nevertheless, this is the only milk that has at least some useful properties."
langRu["#ITEM_Milkcarton_Desc"] = "Белый пакет с молоком. Внутри действительно молоко - правда, оно не очищено и от него очень сильно несет выменем. Корова, скорее всего, больная. Тем не менее, это единственное молоко, которое обладает хоть какими-то полезными свойствами."
local ITEM = Clockwork.item:New("base_drink")
ITEM.name = "Milk carton"
ITEM.PrintName = "#ITEM_Milkcarton"
ITEM.description = "#ITEM_Milkcarton_Desc"
ITEM.model = "models/props_junk/garbage_milkcarton001a.mdl"
ITEM.cost = 50
ITEM.weight = 1.5
ITEM.hunger = 15
ITEM.thirst = 35
ITEM.junk =  "empty_carton"
ITEM:Register()



langEn["#ITEM_UBOil"] = "Old bottle of olive oil"
langRu["#ITEM_UBOil"] = "Старая бутылка оливкового масла"
langEn["#ITEM_UBOil_Desc"] = "Old, tasteless, smelly olive oil, which was widely used by housewives before the war. It's almost impossible to drink, but if you try, and from this shit you can get something really useful."
langRu["#ITEM_UBOil_Desc"] = "Старое, бесвкусное, вонючее оливковое масло, которое широко использовали домохозяйки до войны. Его практически не возможно пить, но, если постараться, и из этого дерьма можно получить что-то действительно полезное."
local ITEM = Clockwork.item:New("base_drink")
ITEM.name = "Olive Oil"
ITEM.PrintName = "#ITEM_UBOil"
ITEM.description = "#ITEM_UBOil_Desc"
ITEM.model = "models/props_junk/garbage_plasticbottle002a.mdl"
ITEM.cost = 30
ITEM.weight = 1
ITEM.hunger = -30
ITEM.thirst = 50
ITEM:Register()



langEn["#ITEM_UBOldsoda"] = "Bottle with old soda"
langRu["#ITEM_UBOldsoda"] = "Бутылка со старой газировкой"
langEn["#ITEM_UBOldsoda_Desc"] = "Brown bottle with old soda inside. It has long been exhausted, but the sweet taste covers this unpleasant flaw."
langRu["#ITEM_UBOldsoda_Desc"] = "Коричневая бутылка со старой газировкой внутри. Она уже давным давно выдохлась, но сладковатый вкус покрывает этот неприятный недостаток."
local ITEM = Clockwork.item:New("base_drink")
ITEM.name = "Old soda"
ITEM.PrintName = "#ITEM_UBOldsoda"
ITEM.description = "#ITEM_UBOldsoda_Desc"
ITEM.model = "models/props_junk/garbage_plasticbottle003a.mdl"
ITEM.cost = 50
ITEM.weight = 0.6
ITEM.hunger = 0
ITEM.thirst = 60
ITEM.junk =  "empty_plastic_bottle"
ITEM:Register()



langEn["#ITEM_UBOldfastfood"] = "Old fast food"
langRu["#ITEM_UBOldfastfood"] = "Старая еда быстрого приготовления"
langEn["#ITEM_UBOldfastfood_Desc"] = "Package without labels, inside there is dry noodles and sachets with condiments. The noodles themselves were slightly moldy because of the dampness, but is this a problem?"
langRu["#ITEM_UBOldfastfood_Desc"] = "Пакет без этикеток, внутри находится сухая лапша и пакетики с приправами. Сама лапша немного покрылась плесенью из-за сыроватости, но разве это проблема?"
local ITEM = Clockwork.item:New("base_food")
ITEM.name = "Old fast food"
ITEM.PrintName = "#ITEM_UBOldfastfood"
ITEM.description = "#ITEM_UBOldfastfood_Desc"
ITEM.model = "models/props_junk/garbage_takeoutcarton001a.mdl"
ITEM.cost = 30
ITEM.weight = 0.3
ITEM.hunger = 40
ITEM.thirst = -10
ITEM.junk =  "empty_chinese_takeout"
ITEM:Register()




langEn["#ITEM_UBHawthorn"] = "Bottle of hawthorn"
langRu["#ITEM_UBHawthorn"] = "Бутылка боярышника"
langEn["#ITEM_UBHawthorn_Desc"] = "A bottle of the long-forgotten fun of the Russian people."
langRu["#ITEM_UBHawthorn_Desc"] = "Бутылка давно забытого веселья русского народа."
local ITEM = Clockwork.item:New("base_drink")
ITEM.name = "Hawthorn"
ITEM.PrintName = "#ITEM_UBHawthorn"
ITEM.description = "#ITEM_UBHawthorn_Desc"
ITEM.model = "models/props_junk/glassjug01.mdl"
ITEM.cost = 40
ITEM.weight = 0.8
ITEM.hunger = -10
ITEM.thirst = 50
ITEM.junk =  "empty_glass_bottle"
ITEM:Register()