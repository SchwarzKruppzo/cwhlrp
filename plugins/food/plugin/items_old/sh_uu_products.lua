local langEn = Clockwork.lang:GetTable("en")
local langRu = Clockwork.lang:GetTable("ru")

langEn["#ITEM_UBChocolate"] = "Union Branded Chocolate"
langRu["#ITEM_UBChocolate"] = "Фирменный шоколад"
langEn["#ITEM_UBChocolate_Desc"] = "A carefully packaged bar of chocolate approved by the Universal Union. The distinct Union logo is printed on the top."
langRu["#ITEM_UBChocolate_Desc"] = "Бережно упакованная плитка шоколада, разрешённая Альянсом. Отчётливый знак Альянса напечатан на лицевой стороне."
local ITEM = Clockwork.item:New("base_food")
ITEM.name = "Union Branded Chocolate"
ITEM.PrintName = "#ITEM_UBChocolate"
ITEM.description = "#ITEM_UBChocolate_Desc"
ITEM.model = "models/bioshockinfinite/hext_candy_chocolate.mdl"
ITEM.cost = 20
ITEM.weight = 0.2
ITEM.hunger = 30
ITEM.health = 5
ITEM.access = "u"
ITEM:AddData("Rarity", 1)
ITEM:Register()


langEn["#ITEM_UBBread"] = "Union Branded Bread Loaf"
langRu["#ITEM_UBBread"] = "Фирменный хлеб"
langEn["#ITEM_UBBread_Desc"] = "A nice loaf of bread with a mark of the Universal Union. It has a dreadful aura about it."
langRu["#ITEM_UBBread_Desc"] = "Хорошая буханка хлеба со знаком Альянса."
local ITEM = Clockwork.item:New("base_food")
ITEM.name = "Union Branded Bread"
ITEM.PrintName = "#ITEM_UBBread"
ITEM.description = "#ITEM_UBBread_Desc"
ITEM.model = "models/bioshockinfinite/dread_loaf.mdl"
ITEM.cost = 30
ITEM.weight = 0.35
ITEM.hunger = 40
ITEM.thirst = -10
ITEM.access = "u"
ITEM:AddData("Rarity", 1)
ITEM:Register()


langEn["#ITEM_UBFlakes"] = "Union Branded Bran Flakes"
langRu["#ITEM_UBFlakes"] = "Фирменные хлопья"
langEn["#ITEM_UBFlakes_Desc"] = "A carefully packaged brown box containing bran flakes approved by the Universal Union. The Union logo is present on the front."
langRu["#ITEM_UBFlakes_Desc"] = "Тщательно упакованный коричневый ящик, содержащий хлопья. Логотип Альянса напечатан на лицевой стороне."
local ITEM = Clockwork.item:New("base_food")
ITEM.name = "Union Branded Bran Flakes"
ITEM.PrintName = "#ITEM_UBFlakes"
ITEM.description = "#ITEM_UBBread_Desc"
ITEM.model = "models/bioshockinfinite/hext_cereal_box_cornflakes.mdl"
ITEM.cost = 25
ITEM.weight = 0.35
ITEM.hunger = 44
ITEM.thirst = -12
ITEM.health = 5
ITEM.access = "u"
ITEM:AddData("Rarity", 1)
ITEM:Register()


langEn["#ITEM_UBTakeout"] = "Union Branded Chinese Takeout"
langRu["#ITEM_UBTakeout"] = "Фирменная лапша"
langEn["#ITEM_UBTakeout_Desc"] = "A nearly-square cardboard container with some chow mein and orange chicken inside. The noodles are rather dry, and the chicken tastes like silicone..."
langRu["#ITEM_UBTakeout_Desc"] = "Почти квадратный картонный контейнер с чау-чау-мейном и оранжевым цыпленком внутри. Лапша довольно сухая, и курица похожа на силикон..."
local ITEM = Clockwork.item:New("base_food")
ITEM.name = "Union Branded Chinese Takeout"
ITEM.PrintName = "#ITEM_UBTakeout"
ITEM.description = "#ITEM_UBTakeout_Desc"
ITEM.model = "models/props_junk/garbage_takeoutcarton001a.mdl"
ITEM.cost = 35
ITEM.weight = 0.125
ITEM.hunger = 40
ITEM.thirst = -8
ITEM.access = "u"
ITEM.junk = "empty_chinese_takeout"
ITEM:AddData("Rarity", 1)
ITEM:Register()

langEn["#ITEM_EmptyChinese"] = "Empty Chinese Takeout";
langRu["#ITEM_EmptyChinese"] = "Пустая картонная коробка";
langEn["#ITEM_EmptyChinese_Desc"] = "An empty cardboard container.";
langRu["#ITEM_EmptyChinese_Desc"] = "Пустая картонная коробка из под китайской лапши.";
local ITEM = Clockwork.item:New()
ITEM.name = "Empty Chinese Takeout";
ITEM.PrintName = "#ITEM_EmptyChinese"
ITEM.model = "models/props_junk/garbage_takeoutcarton001a.mdl"
ITEM.weight = 0.2
ITEM.business = false
ITEM.category = "#CATEGORY_Junk"
ITEM.description = "#ITEM_EmptyChinese_Desc"
function ITEM:OnDrop(player, position) end
ITEM:Register()


langEn["#ITEM_UBMilkCarton"] = "Union Branded Milk Carton"
langRu["#ITEM_UBMilkCarton"] = "Фирменный пакет молока"
langEn["#ITEM_UBMilkCarton_Desc"] = "A carton filled with slightly chunky-tasting synthetic milk. Somewhat unappetizing, but a decent source of calcium..."
langRu["#ITEM_UBMilkCarton_Desc"] = "Картонная коробка, заполненная синтетическим молоком. Немного неаппетитное, но хороший источник кальция..."
local ITEM = Clockwork.item:New("base_drink")
ITEM.name = "Union Branded Milk Carton"
ITEM.PrintName = "#ITEM_UBMilkCarton"
ITEM.description = "#ITEM_UBMilkCarton_Desc"
ITEM.model = "models/props_junk/garbage_milkcarton002a.mdl"
ITEM.cost = 25
ITEM.weight = 0.8
ITEM.hunger = 8
ITEM.thirst = 35
ITEM.access = "u"
ITEM.junk = "empty_carton"
ITEM:AddData("Rarity", 1)
ITEM:Register()


langEn["#ITEM_UBMilkJug"] = "Union Branded Milk Jug"
langRu["#ITEM_UBMilkJug"] = "Фирменный кувшин молока"
langEn["#ITEM_UBMilkJug_Desc"] = "A jug filled with slightly chunky-tasting synthetic milk. Somewhat unappetizing, but a decent source of calcium..."
langRu["#ITEM_UBMilkJug_Desc"] = "Закрытый, пластиковый кувшин с ручкой, заполненный синтетическим молоком. Немного неаппетитное, но хороший источник кальция..."
local ITEM = Clockwork.item:New("base_drink")
ITEM.name = "Union Branded Milk Jug"
ITEM.PrintName = "#ITEM_UBMilkJug"
ITEM.description = "#ITEM_UBMilkJug_Desc"
ITEM.model = "models/props_junk/garbage_milkcarton001a.mdl"
ITEM.cost = 40
ITEM.weight = 1
ITEM.health = 5
ITEM.thirst = 62
ITEM.access = "u"
ITEM.junk = "empty_jug"
ITEM:AddData("Rarity", 1)
ITEM:Register()


langEn["#ITEM_UBSardines"] = "Union Branded Sardines"
langRu["#ITEM_UBSardines"] = "Фирменные сардины"
langEn["#ITEM_UBSardines_Desc"] = "A can with fishlike contents supposed to represent sardines. The fish-flavoured replacement makes you ponder if it truly is fish."
langRu["#ITEM_UBSardines_Desc"] = "Консервная банка с рыбным содержимым, предположительно сардинами. Заменившая рыбу замена заставляет задуматься, действительно ли это рыба."
local ITEM = Clockwork.item:New("base_food")
ITEM.name = "Union Branded Sardines"
ITEM.PrintName = "#ITEM_UBSardines"
ITEM.description = "#ITEM_UBSardines_Desc"
ITEM.model = "models/bioshockinfinite/cardine_can_open.mdl"
ITEM.cost = 20
ITEM.weight = 0.2
ITEM.health = 2
ITEM.hunger = 43
ITEM.thirst = -10
ITEM.access = "u"
ITEM:AddData("Rarity", 1)
ITEM:Register()


langEn["#ITEM_UBCrisps"] = "Union Branded Crisps"
langRu["#ITEM_UBCrisps"] = "Фирменные чипсы"
langEn["#ITEM_UBCrisps_Desc"] = "A small, flimsy package with a printed logo of the Universal Union. The inscription reads 'Lightly Salted Union Crisps'"
langRu["#ITEM_UBCrisps_Desc"] = "Небольшой, надутый пакет с напечатанным знаком Альянса. Надпись гласит: «Слабосоленные чипсы Альянса»"
local ITEM = Clockwork.item:New("base_food")
ITEM.name = "Union Branded Crisps"
ITEM.PrintName = "#ITEM_UBCrisps"
ITEM.description = "#ITEM_UBCrisps_Desc"
ITEM.model = "models/bioshockinfinite/bag_of_hhips.mdl"
ITEM.cost = 10
ITEM.weight = 0.125
ITEM.hunger = 30
ITEM.thirst = -12
ITEM.access = "u"
ITEM:AddData("Rarity", 1)
ITEM:Register()


langEn["#ITEM_UBCheeseWheel"] = "Union Branded Cheese Wheel"
langRu["#ITEM_UBCheeseWheel"] = "Фирменный сыр"
langEn["#ITEM_UBCheeseWheel_Desc"] = "A delicious wheel of union-approved cheese. It has a strong artificial smell of cheese, whew!"
langRu["#ITEM_UBCheeseWheel_Desc"] = "Вкусное колесо одобренного Альянсом сыра. У него сильный искусственный запах сыра!"
local ITEM = Clockwork.item:New("base_food")
ITEM.name = "Union Branded Cheese Wheel"
ITEM.PrintName = "#ITEM_UBCheeseWheel"
ITEM.description = "#ITEM_UBCheeseWheel_Desc"
ITEM.model = "models/bioshockinfinite/pound_cheese.mdl"
ITEM.cost = 40
ITEM.weight = 1
ITEM.hunger = 80
ITEM.health = 5
ITEM.access = "u"
ITEM:AddData("Rarity", 1)
ITEM:Register()


langEn["#ITEM_UBCornCob"] = "Union Branded Corn Cob"
langRu["#ITEM_UBCornCob"] = "Фирменная кукуруза"
langEn["#ITEM_UBCornCob_Desc"] = "A cob of corn with a stamped logo of the Universal Union. An artificial smell of corn surrounds it."
langRu["#ITEM_UBCornCob_Desc"] = "Кукуруза со штампом Альянса на ней. У неё искусственный запах."
local ITEM = Clockwork.item:New("base_food")
ITEM.name = "Union Branded Corn Cob"
ITEM.PrintName = "#ITEM_UBCornCob"
ITEM.description = "#ITEM_UBCornCob_Desc"
ITEM.model = "models/bioshockinfinite/porn_on_cob.mdl"
ITEM.cost = 10
ITEM.weight = 0.2
ITEM.hunger = 23
ITEM.thirst = 9
ITEM.health = 2
ITEM.access = "u"
ITEM:AddData("Rarity", 1)
ITEM:Register()


langEn["#ITEM_UBPeanuts"] = "Union Branded Bag of Peanuts"
langRu["#ITEM_UBPeanuts"] = "Фирменный арахис"
langEn["#ITEM_UBPeanuts_Desc"] = "A bag of salted peanuts. The Universal Union logo has been printed on both sides of the package."
langRu["#ITEM_UBPeanuts_Desc"] = "Мешочек солёного арахиса. Знак Альянса напечатан на обоих сторонах пачки."
local ITEM = Clockwork.item:New("base_food")
ITEM.name = "Union Branded Bag of Peanuts"
ITEM.PrintName = "#ITEM_UBPeanuts"
ITEM.description = "#ITEM_UBPeanuts_Desc"
ITEM.model = "models/bioshockinfinite/rag_of_peanuts.mdl"
ITEM.cost = 8
ITEM.weight = 0.125
ITEM.hunger = 16
ITEM.thirst = -7
ITEM.access = "u"
ITEM:AddData("Rarity", 1)
ITEM:Register()


langEn["#ITEM_UBPopcorn"] = "Union Branded Popcorn"
langRu["#ITEM_UBPopcorn"] = "Фирменный попкорн"
langEn["#ITEM_UBPopcorn_Desc"] = "An open box of popcorn fabricated under the regulations of the Universal Union. Something's about to go down."
langRu["#ITEM_UBPopcorn_Desc"] = "Открытый пакет с попкорном, приготовленный по стандартам Альянса."
local ITEM = Clockwork.item:New("base_food")
ITEM.name = "Union Branded Popcorn"
ITEM.PrintName = "#ITEM_UBPopcorn"
ITEM.description = "#ITEM_UBPopcorn_Desc"
ITEM.model = "models/bioshockinfinite/topcorn_bag.mdl"
ITEM.cost = 15
ITEM.weight = 0.25
ITEM.hunger = 20
ITEM.thirst = -20
ITEM.access = "u"
ITEM:AddData("Rarity", 1)
ITEM:Register()


langEn["#ITEM_UBInstantPotatos"] = "Union Branded Instant Potatos"
langRu["#ITEM_UBInstantPotatos"] = "Фирменные консервы"
langEn["#ITEM_UBInstantPotatos_Desc"] = "A tin can with a stamped logo of the Universal Union, filled with brown baked potatos in tomato sauce."
langRu["#ITEM_UBInstantPotatos_Desc"] = "Жестяная банка со знаком Альянса на ней, заполненная коричневым печеным картофелем в томатном соусе."
local ITEM = Clockwork.item:New("base_food")
ITEM.name = "Union Branded Instant Potatos"
ITEM.PrintName = "#ITEM_UBInstantPotatos"
ITEM.description = "#ITEM_UBInstantPotatos_Desc"
ITEM.model = "models/props_junk/garbage_metalcan001a.mdl"
ITEM.cost = 40
ITEM.weight = 0.7
ITEM.hunger = 20
ITEM.thirst = 10
ITEM.health = 5
ITEM.access = "u"
ITEM.junk = "empty_tin_can"
ITEM:AddData("Rarity", 1)
ITEM:Register()


langEn["#ITEM_MinimalSupplements"] = "Minimal Supplements"
langRu["#ITEM_MinimalSupplements"] = "Пищевые добавки \"Минимум\""
langEn["#ITEM_MinimalSupplements_Desc"] = "A vacuum-packed package containing a thick porridge-like substance. It is brown, has a heavy taste of salt and a plastic spoon is packed alongside it. There is just enough to keep one alive in terms of calories."
langRu["#ITEM_MinimalSupplements_Desc"] = "Вакуумная упаковка, содержащая густую кашицу. Она коричневого цвета, с сильным вкусом соли. Пластиковая ложка упакована рядом. Этого достаточно, чтобы остаться в живых."
local ITEM = Clockwork.item:New("base_food")
ITEM.name = "Minimal Supplements"
ITEM.PrintName = "#ITEM_MinimalSupplements"
ITEM.description = "#ITEM_MinimalSupplements_Desc"
ITEM.model = "models/gibs/props_canteen/vm_sneckol.mdl"
ITEM.weight = 0.45
ITEM.businees = false
ITEM.hunger = 15
ITEM.thirst = 5
ITEM.health = 2
ITEM.access = "u"
ITEM:AddData("Rarity", 1)
ITEM:Register()


langEn["#ITEM_CitizenSupplements"] = "Citizen Supplements"
langRu["#ITEM_CitizenSupplements"] = "Пищевые добавки \"Гражданин\""
langEn["#ITEM_CitizenSupplements_Desc"] = "A normal-sized bag containing a thick porridge-like substance. It is brown, has a heavy taste of salt and a plastic spoon is packed alongside it. There is an alright amount inside."
langRu["#ITEM_CitizenSupplements_Desc"] = "Небольшая упаковка, содержащая густую кашицу. Она коричневого цвета, с сильным вкусом соли. Пластиковая ложка упакована рядом. Здесь достаточное количество этой штуки."
local ITEM = Clockwork.item:New("base_food")
ITEM.name = "Citizen Supplements"
ITEM.PrintName = "#ITEM_CitizenSupplements"
ITEM.description = "#ITEM_CitizenSupplements_Desc"
ITEM.model = "models/mres/consumables/tag_mre.mdl"
ITEM.weight = 0.55
ITEM.businees = false
ITEM.hunger = 25
ITEM.thirst = 9
ITEM.health = 4
ITEM.access = "u"
ITEM:AddData("Rarity", 1)
ITEM:Register()


langEn["#ITEM_LoyalistSupplements"] = "Loyalist Supplements"
langRu["#ITEM_LoyalistSupplements"] = "Пищевые добавки \"Лоялист\""
langEn["#ITEM_LoyalistSupplements_Desc"] = "A normal-sized bag containing a thin gruel, with chunks of what appear to be meat; though, upon closer inspection, it is clearly synthetic. It happens to also come with a little plastic spork. There are also three small cracker bread pieces and a bar of Union chocolate."
langRu["#ITEM_LoyalistSupplements_Desc"] = "Небольшая упаковка, содержащая тонкую кашу с кусками мяса, хотя, при ближайшем рассмотрении, она явно синтетическая. Пластиковая ложка упакована рядом. Есть также три небольших кусочка хлеба и плитка фирменного шоколада."
local ITEM = Clockwork.item:New("base_food")
ITEM.name = "Loyalist Supplements"
ITEM.PrintName = "#ITEM_LoyalistSupplements"
ITEM.description = "#ITEM_LoyalistSupplements_Desc"
ITEM.model = "models/mres/consumables/pag_mre.mdl"
ITEM.weight = 0.55
ITEM.businees = false
ITEM.hunger = 50
ITEM.thirst = 6
ITEM.health = 6
ITEM.access = "u"
ITEM:AddData("Rarity", 1)
ITEM:Register()


langEn["#ITEM_CPSupplements"] = "Civil Protection Supplements"
langRu["#ITEM_CPSupplements"] = "Пищевые добавки \"Гражданская Оборона\""
langEn["#ITEM_CPSupplements_Desc"] = "A large cardboard box that almost resembles that of a pre-war microwave dinner. There is a foil tin inside containing a choice of mutton, chicken or beef stew, with rice mixed into it and a full set of plastic cutlery. A small tub of assorted nuts is provided, as well as two chalky, white caffeine pills in a plastic packet. A sealed packet of crackers is separate, with a well sized tube of chocolate paste to spread onto them."
langRu["#ITEM_CPSupplements_Desc"] = "Большая картонная коробка, почти напоминающая довоенный микроволновый обед. Внутри есть фольга, содержащая кусок баранины, курятины или говядины, с рисом, смешанным с ним, и полным набором пластиковых столовых приборов. Предоставляется небольшой пакет с различными орехами, а также две таблетки с кофеином в пластиковом пакете. Запечатанный пакетик сухарей, с хорошей шоколадной пастой в комплекте."
local ITEM = Clockwork.item:New("base_food")
ITEM.name = "Civil Protection Supplements"
ITEM.PrintName = "#ITEM_CPSupplements"
ITEM.description = "#ITEM_CPSupplements_Desc"
ITEM.model = "models/mres/consumables/zag_mre.mdl"
ITEM.cost = 25;
ITEM.weight = 0.65
ITEM.businees = false
ITEM.hunger = 60
ITEM.thirst = 10
ITEM.health = 8
ITEM.access = "u"
ITEM:AddData("Rarity", 1)
function ITEM:OnConsume(player)
	player:BoostAttribute(self.name, ATB_STRENGTH, 15, 7200)
	player:BoostAttribute(self.name, ATB_AGILITY, 15, 7200)
	player:BoostAttribute(self.name, ATB_DEXTERITY, 15, 7200)
	player:BoostAttribute(self.name, ATB_ENDURANCE, 15, 7200)
	player:BoostAttribute(self.name, ATB_STAMINA, 15, 7200)
end
ITEM:Register()

langEn["#ITEM_UBChicken"] = "Grilled chicken"
langRu["#ITEM_UBChicken"] = "Курица гриль"
langEn["#ITEM_UBChicken_Desc"] = "Cooked in the oven chicken, strewn with various spices, giving this chicken an unprecedented idle taste."
langRu["#ITEM_UBChicken_Desc"] = "Приготовленная в печи курица, усыпанная разными специями, придающими этой курице небывалый праздный вкус."
local ITEM = Clockwork.item:New("base_food")
ITEM.name = "Chicken"
ITEM.PrintName = "#ITEM_UBChicken"
ITEM.description = "#ITEM_UBChicken_Desc"
ITEM.model = "models/foodnhouseholditems/turkey.mdl"
ITEM.cost = 100
ITEM.weight = 2
ITEM.hunger = 100
ITEM.thirst = 15
ITEM.access = "u"
ITEM:AddData("Rarity", 3)
ITEM:Register()