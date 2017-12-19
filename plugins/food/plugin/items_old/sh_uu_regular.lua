local langEn = Clockwork.lang:GetTable("en")
local langRu = Clockwork.lang:GetTable("ru")

langEn["#ITEM_UBDonuts"] = "Donuts in box"
langRu["#ITEM_UBDounts"] = "Пончики в коробке"
langEn["#ITEM_UBDonuts_Desc"] = "Striped box with a bunch of scented donuts inside. Stimulates the credibility of the manufacturer."
langRu["#ITEM_UBDonuts_Desc"] = "Полосатая коробка с кучей душистых пончиков внутри. Внушает доверие к производителю."
local ITEM = Clockwork.item:New("base_food")
ITEM.name = "Donuts"
ITEM.PrintName = "#ITEM_UBDonuts"
ITEM.description = "#ITEM_UBDonuts_Desc"
ITEM.model = "models/props_canteen/donutbox.mdl"
ITEM.cost = 40
ITEM.weight = 0.8
ITEM.hunger = 30
ITEM.thirst = -10
ITEM.access = "u"
ITEM:AddData("Rarity", 1)
ITEM:Register()



langEn["#ITEM_UBPizza"] = "Pizza"
langRu["#ITEM_UBPizza"] = "Пицца"
langEn["#ITEM_UBPizza_Desc"] = "Still warm pizza in a white cardboard box. She smells of old times and dough. Black strips on the bottom of the pizza indicate that it was not cooked in the oven."
langRu["#ITEM_UBPizza_Desc"] = "Ещё тёплая пицца в белой картонной коробке. От нее веет запах былых времен и теста. Чёрные полоски на дне пиццы указывают на то, что она была приготовлена не в печи."
local ITEM = Clockwork.item:New("base_food")
ITEM.name = "Pizza"
ITEM.PrintName = "#ITEM_UBPizza"
ITEM.description = "#ITEM_UBPizza_Desc"
ITEM.model = "models/props_canteen/pizza_box.mdl"
ITEM.cost = 50
ITEM.weight = 1
ITEM.hunger = 50
ITEM.thirst = -15
ITEM.access = "u"
ITEM:AddData("Rarity", 2)
ITEM:Register()



langEn["#ITEM_UBTaco"] = "Taco with pork"
langRu["#ITEM_UBTaco"] = "Тако со свининой"
langEn["#ITEM_UBTaco_Desc"] = "Cool taco, inside of which there is a small piece of pork meat, as well as a huge number of all kinds of chemical spices that are very poorly tolerated by the body."
langRu["#ITEM_UBTaco_Desc"] = "Прохладное тако, внутри которого находится небольшой кусок свинного мяса, а так же огромное количество всевозможных химических специй, которые очень плохо переносит организм."
local ITEM = Clockwork.item:New("base_food")
ITEM.name = "Taco"
ITEM.PrintName = "#ITEM_UBTaco"
ITEM.description = "#ITEM_UBTaco_Desc"
ITEM.model = "models/props_canteen/taco.mdl"
ITEM.cost = 25
ITEM.weight = 0.3
ITEM.hunger = 15
ITEM.thirst = -3
ITEM.access = "u"
ITEM:AddData("Rarity", 1)
ITEM:Register()



langEn["#ITEM_UBCupoftea"] = "Cup of tea"
langRu["#ITEM_UBCupoftea"] = "Кружка чая"
langEn["#ITEM_UBCupoftea_Desc"] = "Grayish tea, poured into a plastic mug. This mug is so badly made that you can notice the floating pieces of plastic on the surface of the tea."
langRu["#ITEM_UBCupoftea_Desc"] = "Сероватый чай, налитый в пластиковую кружку. Эта кружка на столько плохо сделана, что вы можете заметить плавающие куски пластмассы на поверхности чая."
local ITEM = Clockwork.item:New("base_drink")
ITEM.name = "Cup of tea"
ITEM.PrintName = "#ITEM_UBCupoftea"
ITEM.description = "#ITEM_UBCupoftea_Desc"
ITEM.model = "models/props_canteen/vacuumflask01b_cup.mdl"
ITEM.cost = 5
ITEM.weight = 0.3
ITEM.hunger = 0
ITEM.thirst = 5
ITEM.access = "u"
ITEM:Register()



langEn["#ITEM_UBBakedbeans"] = "Baked beans"
langRu["#ITEM_UBBakedbeans"] = "Запечённые бобы"
langEn["#ITEM_UBBakedbeans_Desc"] = "Very suspicious light beans. I hope that I will not get irradiated if I eat them. Apparently, they were prepared in a nuclear reactor. However, they are very delicious!"
langRu["#ITEM_UBBakedbeans_Desc"] = "Очень подозрительные светлые бобы. Надеюсь, что я не облучусь, если съем их. По сей видимости, их готовили в ядерном реакторе. Тем не менее, они очень вкусные!"
local ITEM = Clockwork.item:New("base_food")
ITEM.name = "Baked beans"
ITEM.PrintName = "#ITEM_UBBakedbeans"
ITEM.description = "#ITEM_UBBakedbeans_Desc"
ITEM.model = "models/bioshockinfinite/baked_beans.mdl"
ITEM.cost = 40
ITEM.weight = 1
ITEM.hunger = 50
ITEM.thirst = -5
ITEM.access = "u"
ITEM:AddData("Rarity", 1)
ITEM:Register()


langEn["#ITEM_UBJuniper"] = "Tincture of a juniper"
langRu["#ITEM_UBJuniper"] = "Настойка можжевельника"
langEn["#ITEM_UBJuniper_Desc"] = "Idle tincture of juniper. When you open the bottle there is a smell of quality alcohol and greens. But, the taste leaves much to be desired. The main thing - that drunk!"
langRu["#ITEM_UBJuniper_Desc"] = "Праздная настойка можжевельника. При открытии бутылки появляется запах качественного спирта и зелени. Но, вкус оставляет желать лучшего. Главное - что пьянит!"
local ITEM = Clockwork.item:New("base_drink")
ITEM.name = "Juniper"
ITEM.PrintName = "#ITEM_UBJuniper"
ITEM.description = "#ITEM_UBJuniper_Desc"
ITEM.model = "models/bioshockinfinite/jin_bottle.mdl"
ITEM.cost = 40
ITEM.weight = 1.5
ITEM.hunger = -10
ITEM.thirst = 60
ITEM.drunkTime = 72
ITEM.access = "u"
ITEM:AddData("Rarity", 2)
ITEM:Register()



langEn["#ITEM_UBBeer"] = "Bottled beer"
langRu["#ITEM_UBBeer"] = "Бутылированное пиво"
langEn["#ITEM_UBBeer_Desc"] = "Fetid beer, rather sharp to the taste, but quite good intoxicating."
langRu["#ITEM_UBBeer_Desc"] = "Зловонное пиво, довольно резкое на вкус, но довольно хорошо пьянящее."
local ITEM = Clockwork.item:New("base_drink")
ITEM.name = "Beer"
ITEM.PrintName = "#ITEM_UBBeer"
ITEM.description = "#ITEM_UBBeer_Desc"
ITEM.model = "models/bioshockinfinite/jin_bottle.mdl"
ITEM.cost = 25
ITEM.weight = 1
ITEM.hunger = -5
ITEM.thirst = 35
ITEM.drunkTime = 128
ITEM.access = "u"
ITEM.junk = "empty_glass_bottle"
ITEM:AddData("Rarity", 1)
ITEM:Register()



langEn["#ITEM_UBCola"] = "Bottled cola"
langRu["#ITEM_UBCola"] = "Бутылированная кола"
langEn["#ITEM_UBCola_Desc"] = "It's pretty funny to see such a pop in a dark place like this city. But, nevertheless, this cola is even better than what was before!"
langRu["#ITEM_UBCola_Desc"] = "Довольно забавно видеть такую шипучку в таком тёмном месте, как этот город. Но, тем не менее, эта кола даже лучше, чем то, что было раньше!"
local ITEM = Clockwork.item:New("base_drink")
ITEM.name = "Cola"
ITEM.PrintName = "#ITEM_UBCola"
ITEM.description = "#ITEM_UBCola_Desc"
ITEM.model = "models/bioshockinfinite/dickle_jar.mdl"
ITEM.cost = 15
ITEM.weight = 0.5
ITEM.hunger = -5
ITEM.thirst = 20
ITEM.access = "u"
ITEM.junk = "empty_glass_bottle"
ITEM:AddData("Rarity", 1)
ITEM:Register()



langEn["#ITEM_UBSaltedring"] = "Salted ringlets"
langRu["#ITEM_UBSaltedring"] = "Солёные колечки"
langEn["#ITEM_UBSaltedring_Desc"] = "Dry salted ringlets, they taste like they eat dry porridge. The reverse label indicates that solid particles can form in the rings. You can break your teeth."
langRu["#ITEM_UBSaltedring_Desc"] = "Сухие солёные колечки, вкус у них как будто бы ешь сухую кашу. Обратная этикетка указывает на то, что в колечках возможно образование твёрдых частичек. Можно сломать зубы."
local ITEM = Clockwork.item:New("base_food")
ITEM.name = "Salted Ringlets"
ITEM.PrintName = "#ITEM_UBSaltedring"
ITEM.description = "#ITEM_UBSaltedring_Desc"
ITEM.model = "models/foodnhouseholditems/applejacks.mdl"
ITEM.cost = 30
ITEM.weight = 0.8
ITEM.hunger = 30
ITEM.thirst = -10
ITEM.access = "u"
ITEM:AddData("Rarity", 1)
ITEM:Register()



langEn["#ITEM_UBBaconsubstitute"] = "Bacon substitute"
langRu["#ITEM_UBBaconsubstitute"] = "Заменитель бекона"
langEn["#ITEM_UBBaconsubstitute_Desc"] = "Has a yellowish tinge, which is why it causes mistrust. To taste - a stick of salt, but the taste of some meat is present."
langRu["#ITEM_UBBaconsubstitute_Desc"] = "Имеет желтоватый оттенок, из-за чего вызывает недоверие. На вкус - палочка соли, но вкус какого-то мяса присутствует."
local ITEM = Clockwork.item:New("base_food")
ITEM.name = "Bacon substitute"
ITEM.PrintName = "#ITEM_UBBaconsubstitute"
ITEM.description = "#ITEM_UBBaconsubstitute_Desc"
ITEM.model = "models/foodnhouseholditems/bacon.mdl"
ITEM.cost = 15
ITEM.weight = 0.2
ITEM.hunger = 30
ITEM.thirst = -17
ITEM.access = "u"
ITEM:AddData("Rarity", 1)
ITEM:Register()



langEn["#ITEM_UBCarrot"] = "Carrot"
langRu["#ITEM_UBCarrot"] = "Морковь"
langEn["#ITEM_UBCarrot_Desc"] = "Carrots are red, looks rather wrinkled. Navrjadli from it it is possible to receive any vitamins, nevertheless it is chewed enough easily, than its present analogue."
langRu["#ITEM_UBCarrot_Desc"] = "Морковь красного цвета, выглядит довольно сморщеной. Наврядли из нее можно получить какие-либо витамины, тем не менее жуётся довольно легко, чем её настоящий аналог."
local ITEM = Clockwork.item:New("base_food")
ITEM.name = "Carrot"
ITEM.PrintName = "#ITEM_UBCarrot"
ITEM.description = "#ITEM_UBCarrot_Desc"
ITEM.model = "models/foodnhouseholditems/carrot.mdl"
ITEM.cost = 10
ITEM.weight = 0.3
ITEM.hunger = 8
ITEM.thirst = -2
ITEM:Register()



langEn["#ITEM_UBWinewhite"] = "White wine"
langRu["#ITEM_UBWinewhite"] = "Бутылка белого вина"
langEn["#ITEM_UBWinewhite_Desc"] = "A bottle of white wine in a neat wrapper with a majestic Alliance sign on the labels. Very good smells of roses and peaches. The taste is quite idle. The Alliance takes care of its subjects!"
langRu["#ITEM_UBWinewhite_Desc"] = "Бутылка белого вина в аккуратной обёртке с величественным знаком Альянса на этикетках. Очень хорошо пахнет розами и персиками. На вкус - довольно праздно. Альянс заботится о своих подданых!"
local ITEM = Clockwork.item:New("base_drink")
ITEM.name = "White wine"
ITEM.PrintName = "#ITEM_UBWinewhite"
ITEM.description = "#ITEM_UBWinewhite_Desc"
ITEM.model = "models/foodnhouseholditems/champagne.mdl"
ITEM.cost = 100
ITEM.weight = 1
ITEM.hunger = 10
ITEM.thirst = 70
ITEM.drunkTime = 256
ITEM.access = "u"
ITEM.junk = "empty_glass_bottle"
ITEM:AddData("Rarity", 3)
ITEM:Register()



langEn["#ITEM_UBWinered"] = "Red wine"
langRu["#ITEM_UBWinered"] = "Бутылка красного вина"
langEn["#ITEM_UBWinered_Desc"] = "A bottle of very old wine, which was produced before the war. The opening of this bottle creates a real holiday, and the taste of this wine is like the tears of angels."
langRu["#ITEM_UBWinered_Desc"] = "Бутылка ну очень старого вина, которое производилось ещё до войны. Открытие этой бутылки создаёт настоящий праздник, а на вкус это вино - как слёзы ангелов."
local ITEM = Clockwork.item:New("base_drink")
ITEM.name = "Red wine"
ITEM.PrintName = "#ITEM_UBWinered"
ITEM.description = "#ITEM_UBWinered_Desc"
ITEM.model = "models/foodnhouseholditems/champagne2.mdl"
ITEM.cost = 1000
ITEM.weight = 1
ITEM.hunger = 50
ITEM.thirst = 100
ITEM.drunkTime = 200
ITEM.junk = "empty_glass_bottle"
ITEM:AddData("Rarity", 4)
ITEM:Register()



langEn["#ITEM_UBSweetringlets"] = "Sweet ringlets"
langRu["#ITEM_UBSweetringlets"] = "Сладкие колечки"
langEn["#ITEM_UBSweetringlets_Desc"] = "A cardboard box containing a bunch of colorful sweet rings. They taste sweet, but they are sour. It is possible, but it is better to drink this matter with milk."
langRu["#ITEM_UBSweetringlets_Desc"] = "Картонная коробка, содержащая в себе кучу разноцветных сладких колечек. На вкус они хоть и сладкие, но до жути кислые. Есть можно, но лучше запивать это дело молоком."
local ITEM = Clockwork.item:New("base_food")
ITEM.name = "Sweet ringlets"
ITEM.PrintName = "#ITEM_UBSweetringlets"
ITEM.description = "#ITEM_UBSweetringlets_Desc"
ITEM.model = "models/foodnhouseholditems/cheerios.mdl"
ITEM.cost = 30
ITEM.weight = 0.8
ITEM.hunger = 30
ITEM.thirst = -6
ITEM.access = "u"
ITEM:AddData("Rarity", 1)
ITEM:Register()



langEn["#ITEM_UBPastrycookies"] = "Pastry cookies"
langRu["#ITEM_UBSweetringlets"] = "Печенье в обёртке"
langEn["#ITEM_UBPastrycookies_Desc"] = "Cookies in a beautiful wrapper with the symbols of the Alliance on the sides. It is quite fragile, you can notice already broken cookies inside. The taste is like sand, but you can get used to it."
langRu["#ITEM_UBPastrycookies_Desc"] = "Печенье в красивой обёртке с символикой Альянса по бокам. Оно довольно хрупкое, можно заметить уже сломанные печеньки внутри. На вкус - как песок, но привыкнуть можно."
local ITEM = Clockwork.item:New("base_food")
ITEM.name = "Pastry cookies"
ITEM.PrintName = "#ITEM_UBPastrycookies"
ITEM.description = "#ITEM_UBPastrycookies_Desc"
ITEM.model = "models/foodnhouseholditems/digestive.mdl"
ITEM.cost = 15
ITEM.weight = 0.4
ITEM.hunger = 10
ITEM.thirst = -2
ITEM.access = "u"
ITEM:AddData("Rarity", 1)
ITEM:Register()



langEn["#ITEM_UBIcecream"] = "Ice cream"
langRu["#ITEM_UBIcecream"] = "Мороженое"
langEn["#ITEM_UBIcecream_Desc"] = "Chocolate ice cream, which for some reason does not want to melt in such a terrible heat as we have. The taste is really chocolate, but something is wrong with it. It's not cold!"
langRu["#ITEM_UBIcecream_Desc"] = "Шоколадная мороженка, которая по каким-то причинам не хочет таять при такой ужасной жаре как у нас. На вкус - действительно шоколад, но что-то с ним не так. Оно не холодное!"
local ITEM = Clockwork.item:New("base_food")
ITEM.name = "Ice cream"
ITEM.PrintName = "#ITEM_UBIcecream"
ITEM.description = "#ITEM_UBIcecream_Desc"
ITEM.model = "models/foodnhouseholditems/icecream.mdl"
ITEM.cost = 50
ITEM.weight = 0.1
ITEM.hunger = 5
ITEM.thirst = 30
ITEM.access = "u"
ITEM:AddData("Rarity", 2)
ITEM:Register()



langEn["#ITEM_UBHotdog"] = "Hot-Dog"
langRu["#ITEM_UBHotdog"] = "Хот-дог"
langEn["#ITEM_UBHotdog_Desc"] = "Literally sausage in the dough. True, the dough itself is more like sand, and the sausage is more like rubber."
langRu["#ITEM_UBHotdog_Desc"] = "Буквально сосиска в тесте. Правда, само тесто больше похоже на песок, а сосиска больше похожа на резину. С кетчупом пойдёт."
local ITEM = Clockwork.item:New("base_food")
ITEM.name = "Hot-dog"
ITEM.PrintName = "#ITEM_UBHotdog"
ITEM.description = "#ITEM_UBHotdog_Desc"
ITEM.model = "models/foodnhouseholditems/hotdog.mdl"
ITEM.cost = 15
ITEM.weight = 0.2
ITEM.hunger = 10
ITEM.thirst = -2
ITEM.access = "u"
ITEM:AddData("Rarity", 1)
ITEM:Register()



langEn["#ITEM_UBRPepper"] = "Red Pepper"
langRu["#ITEM_UBRPepper"] = "Красный перец"
langEn["#ITEM_UBRPepper_Desc"] = "Pretty big red pepper. Its peel has an unhealthy red color, which means that it is likely to be covered with rather dangerous chemicals. But nobody cares."
langRu["#ITEM_UBRPepper_Desc"] = "Довольно большой красный перец. Его кожица имеет нездоровый красный цвет, а значит, что он, скорее всего, покрыт довольно опасными химикатами. Но никого это не волнует."
local ITEM = Clockwork.item:New("base_food")
ITEM.name = "Red Pepper"
ITEM.PrintName = "#ITEM_UBRPepper"
ITEM.description = "#ITEM_UBRPepper_Desc"
ITEM.model = "models/foodnhouseholditems/pepper1.mdl"
ITEM.cost = 5
ITEM.weight = 0.1
ITEM.hunger = 4
ITEM.thirst = -1
ITEM.access = "u"
ITEM:AddData("Rarity", 1)
ITEM:Register()



langEn["#ITEM_UBPickles"] = "Bottle with pickles"
langRu["#ITEM_UBPickles"] = "Банка с соленьями"
langEn["#ITEM_UBPickles_Desc"] = "A small bottle with a bunch of different pickles inside. The water inside is rather viscous, and the pickles are very difficult to chew. But, nevertheless, they are very tasty!"
langRu["#ITEM_UBPickles_Desc"] = "Небольшая банка с кучей разных солений внутри. Вода внутри довольно вязкая, а соленья очень трудно жуются. Но, тем не менее, они очень вкусные!"
local ITEM = Clockwork.item:New("base_food")
ITEM.name = "Pickles"
ITEM.PrintName = "#ITEM_UBPickles"
ITEM.description = "#ITEM_UBPickles_Desc"
ITEM.model = "models/foodnhouseholditems/picklejar.mdl"
ITEM.cost = 40
ITEM.weight = 1
ITEM.hunger = 40
ITEM.thirst = 10
ITEM.access = "u"
ITEM:AddData("Rarity", 2)
ITEM:Register()


langRu["#ITEM_UBBagel"] = "Рогалик"
langEn["#ITEM_UBBagel"] = "Bagel"
langEn["#ITEM_UBBagel_Desc"] = "Bagel, consisting of a quality test and sprinkled with fragrant spices. Sweet before death!"
langRu["#ITEM_UBBagel_Desc"] = "Рогалик, состоящий из качественного теста и посыпанный душистыми специями. До смерти сладкий!"
local ITEM = Clockwork.item:New("base_food")
ITEM.name = "Bagel"
ITEM.PrintName = "#ITEM_UBBagel"
ITEM.description = "#ITEM_UBBagel_Desc"
ITEM.model = "models/foodnhouseholditems/pretzel.mdl"
ITEM.cost = 30
ITEM.weight = 0.2
ITEM.hunger = 20
ITEM.thirst = -10
ITEM.access = "u"
ITEM:AddData("Rarity", 2)
ITEM:Register()



langEn["#ITEM_UBSandwich"] = "Sandwich"
langRu["#ITEM_UBSandwich"] = "Сэндвич"
langEn["#ITEM_UBSandwich_Desc"] = "Ready-to-eat sandwich. It consists of stale bread, dubious meat and dull greenery. What else is needed for happiness?"
langRu["#ITEM_UBSandwich_Desc"] = "Готовый к употреблению сэндвич. Он состоит из чёрствого хлеба, сомнительного мяса и затухшей зелени. Что ещё нужно для счастья?"
local ITEM = Clockwork.item:New("base_food")
ITEM.name = "Sandwich"
ITEM.PrintName = "#ITEM_UBSandwich"
ITEM.description = "#ITEM_UBSandwich_Desc"
ITEM.model = "models/foodnhouseholditems/sandwich.mdl"
ITEM.cost = 15
ITEM.weight = 0.3
ITEM.hunger = 30
ITEM.thirst = -15
ITEM.access = "u"
ITEM:AddData("Rarity", 1)
ITEM:Register()



langEn["#ITEM_UBBurger"] = "Burger"
langRu["#ITEM_UBBurger"] = "Бургер"
langEn["#ITEM_UBBurger_Desc"] = "The burger glued from different parts reminds of old times. It is a pity that since then, the rest is only the bitterness of chemicals."
langRu["#ITEM_UBBurger_Desc"] = "Склеяный из разных частей бургер напоминает о былых временах. Жаль, что с тех времен осталость только горечь химикатов."
local ITEM = Clockwork.item:New("base_food")
ITEM.name = "Burger"
ITEM.PrintName = "#ITEM_UBBurger"
ITEM.description = "#ITEM_UBBurger_Desc"
ITEM.model = "models/foodnhouseholditems/mcdburger.mdl"
ITEM.cost = 45
ITEM.weight = 0.5
ITEM.hunger = 30
ITEM.thirst = -5
ITEM.access = "u"
ITEM:AddData("Rarity", 1)
ITEM:Register()



langEn["#ITEM_UBKetp"] = "Ketchup"
langRu["#ITEM_UBKetp"] = "Кетчуп"
langEn["#ITEM_UBKetp_Desc"] = "Red viscous liquid in a transparent jar. The label says it's ketchup, but it tastes like more of a fused rusty metal."
langRu["#ITEM_UBKetp_Desc"] = "Красная вязкая жидкость в прозрачной баночке. Этикетка гласит, что это кетчуп, но на вкус похоже больше на плавленый ржавый металл."
local ITEM = Clockwork.item:New("base_food")
ITEM.name = "Ketchup"
ITEM.PrintName = "#ITEM_UBKetp"
ITEM.description = "#ITEM_UBKetp_Desc"
ITEM.model = "models/foodnhouseholditems/ketchup.mdl"
ITEM.cost = 20
ITEM.weight = 1
ITEM.hunger = 20
ITEM.thirst = -20
ITEM.access = "u"
ITEM:AddData("Rarity", 1)
ITEM:Register()




langEn["#ITEM_UBWalnut"] = "Walnut Pie"
langRu["#ITEM_UBWalnut"] = "Ореховый пирог"
langEn["#ITEM_UBWalnut_Desc"] = "A fresh pie, from which gives off a fragrance from a long time, when we all peed in our pants. It was a year ago."
langRu["#ITEM_UBWalnut_Desc"] = "Свежий пирог, от которого отдает ароматом из далёких времён, когда мы все мочились в штаны. Это было год назад."
local ITEM = Clockwork.item:New("base_food")
ITEM.name = "Walnut Pie"
ITEM.PrintName = "#ITEM_UBWalnut"
ITEM.description = "#ITEM_UBWalnut_Desc"
ITEM.model = "models/foodnhouseholditems/pie.mdl"
ITEM.cost = 100
ITEM.weight = 2
ITEM.hunger = 100
ITEM.thirst = -35
ITEM.access = "u"
ITEM:AddData("Rarity", 2)
ITEM:Register()