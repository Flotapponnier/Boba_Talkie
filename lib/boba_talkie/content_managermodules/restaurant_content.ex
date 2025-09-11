defmodule BobaTalkie.ContentManagerModules.RestaurantContent do
  @moduledoc """
  Restaurant topic content in multiple languages.
  Contains tutorial vocabulary, game objects, and challenge cards for learning restaurant ordering and dining vocabulary.
  """

  def get_content(language_code) do
    case language_code do
      "en" -> get_english_content()
      "es" -> get_spanish_content()
      "zh" -> get_chinese_content()
      "fr" -> get_french_content()
      "ru" -> get_russian_content()
      "ja" -> get_japanese_content()
      "it" -> get_italian_content()
      "ar" -> get_arabic_content()
      "pt" -> get_portuguese_content()
      _ -> get_english_content() # Fallback to English
    end
  end

  # English content (base implementation)
  defp get_english_content do
    %{
      title: "Restaurant",
      description: "Learn restaurant vocabulary and ordering food",
      emoji: "🍕",
      vocabulary: [
        %{id: "restaurant_menu", word: "Menu", emoji: "📋", pronunciation: "MEN-yoo", meaning: "List of food", example: "Can I see the menu please?"},
        %{id: "restaurant_pizza", word: "Pizza", emoji: "🍕", pronunciation: "PEET-sa", meaning: "Italian dish", example: "I'd like a cheese pizza"},
        %{id: "restaurant_burger", word: "Burger", emoji: "🍔", pronunciation: "BUR-gur", meaning: "Sandwich with meat", example: "The burger looks delicious"},
        %{id: "restaurant_fries", word: "Fries", emoji: "🍟", pronunciation: "frahyz", meaning: "Fried potatoes", example: "Can I have fries with that?"},
        %{id: "restaurant_pasta", word: "Pasta", emoji: "🍝", pronunciation: "PAS-ta", meaning: "Italian noodles", example: "The pasta is cooked perfectly"},
        %{id: "restaurant_salad", word: "Salad", emoji: "🥗", pronunciation: "SAL-ud", meaning: "Mixed vegetables", example: "I'll have a Caesar salad"},
        %{id: "restaurant_soup", word: "Soup", emoji: "🍲", pronunciation: "soop", meaning: "Liquid food", example: "The soup of the day is tomato"},
        %{id: "restaurant_coffee", word: "Coffee", emoji: "☕", pronunciation: "KAW-fee", meaning: "Hot beverage", example: "I need a coffee to wake up"},
        %{id: "restaurant_water", word: "Water", emoji: "💧", pronunciation: "WAW-tur", meaning: "Clear drink", example: "Could I have some water please?"},
        %{id: "restaurant_bill", word: "Bill", emoji: "🧾", pronunciation: "bil", meaning: "Payment receipt", example: "Can we get the bill please?"}
      ],
      game_objects: [
        %{id: "restaurant_menu", emoji: "📋", word: "Menu", pronunciation: "MEN-yoo"},
        %{id: "restaurant_pizza", emoji: "🍕", word: "Pizza", pronunciation: "PEET-sa"},
        %{id: "restaurant_burger", emoji: "🍔", word: "Burger", pronunciation: "BUR-gur"},
        %{id: "restaurant_fries", emoji: "🍟", word: "Fries", pronunciation: "frahyz"},
        %{id: "restaurant_pasta", emoji: "🍝", word: "Pasta", pronunciation: "PAS-ta"},
        %{id: "restaurant_salad", emoji: "🥗", word: "Salad", pronunciation: "SAL-ud"},
        %{id: "restaurant_soup", emoji: "🍲", word: "Soup", pronunciation: "soop"},
        %{id: "restaurant_coffee", emoji: "☕", word: "Coffee", pronunciation: "KAW-fee"},
        %{id: "restaurant_water", emoji: "💧", word: "Water", pronunciation: "WAW-tur"},
        %{id: "restaurant_bill", emoji: "🧾", word: "Bill", pronunciation: "bil"}
      ],
      cards: [
        %{id: "restaurant_menu", template: "Can I see the _", answer: "menu", description: "Requesting restaurant items"},
        %{id: "restaurant_pizza", template: "I'd like to order a _", answer: "pizza", description: "Ordering food"},
        %{id: "restaurant_burger", template: "The _ is delicious", answer: "burger", description: "Describing food"},
        %{id: "restaurant_fries", template: "Can I have _ with that", answer: "fries", description: "Adding sides to order"},
        %{id: "restaurant_pasta", template: "The _ is ready", answer: "pasta", description: "Food status"},
        %{id: "restaurant_salad", template: "Can we get the _", answer: "salad", description: "Requesting food items"},
        %{id: "restaurant_soup", template: "What _ do you have today", answer: "soup", description: "Asking about daily specials"},
        %{id: "restaurant_coffee", template: "I need a _ please", answer: "coffee", description: "Ordering beverages"},
        %{id: "restaurant_water", template: "Could I have some _", answer: "water", description: "Requesting drinks"},
        %{id: "restaurant_bill", template: "Can we get the _", answer: "bill", description: "Paying for meal"}
      ]
    }
  end

  # Spanish content
  defp get_spanish_content do
    %{
      title: "Restaurante",
      description: "Aprende vocabulario de restaurante y cómo pedir comida",
      emoji: "🍕",
      vocabulary: [
        %{id: "restaurant_menu", word: "Menú", emoji: "📋", pronunciation: "me-NOO", meaning: "Lista de comida", example: "¿Puedo ver el menú por favor?"},
        %{id: "restaurant_pizza", word: "Pizza", emoji: "🍕", pronunciation: "PEET-sa", meaning: "Plato italiano", example: "Me gustaría una pizza de queso"},
        %{id: "restaurant_burger", word: "Hamburguesa", emoji: "🍔", pronunciation: "am-bur-GEH-sa", meaning: "Sándwich con carne", example: "La hamburguesa se ve deliciosa"},
        %{id: "restaurant_fries", word: "Papas fritas", emoji: "🍟", pronunciation: "PAH-pas FREE-tas", meaning: "Papas fritas", example: "¿Puedo tener papas fritas con eso?"},
        %{id: "restaurant_pasta", word: "Pasta", emoji: "🍝", pronunciation: "PAS-ta", meaning: "Fideos italianos", example: "La pasta está perfectamente cocida"},
        %{id: "restaurant_salad", word: "Ensalada", emoji: "🥗", pronunciation: "en-sa-LAH-da", meaning: "Verduras mezcladas", example: "Voy a tomar una ensalada César"},
        %{id: "restaurant_soup", word: "Sopa", emoji: "🍲", pronunciation: "SOH-pa", meaning: "Comida líquida", example: "La sopa del día es de tomate"},
        %{id: "restaurant_coffee", word: "Café", emoji: "☕", pronunciation: "ka-FEH", meaning: "Bebida caliente", example: "Necesito un café para despertarme"},
        %{id: "restaurant_water", word: "Agua", emoji: "💧", pronunciation: "AH-gua", meaning: "Bebida transparente", example: "¿Podría darme un poco de agua por favor?"},
        %{id: "restaurant_bill", word: "Cuenta", emoji: "🧾", pronunciation: "KWEN-ta", meaning: "Recibo de pago", example: "¿Nos puede traer la cuenta por favor?"}
      ],
      game_objects: [
        %{id: "restaurant_menu", emoji: "📋", word: "Menú", pronunciation: "me-NOO"},
        %{id: "restaurant_pizza", emoji: "🍕", word: "Pizza", pronunciation: "PEET-sa"},
        %{id: "restaurant_burger", emoji: "🍔", word: "Hamburguesa", pronunciation: "am-bur-GEH-sa"},
        %{id: "restaurant_fries", emoji: "🍟", word: "Papas fritas", pronunciation: "PAH-pas FREE-tas"},
        %{id: "restaurant_pasta", emoji: "🍝", word: "Pasta", pronunciation: "PAS-ta"},
        %{id: "restaurant_salad", emoji: "🥗", word: "Ensalada", pronunciation: "en-sa-LAH-da"},
        %{id: "restaurant_soup", emoji: "🍲", word: "Sopa", pronunciation: "SOH-pa"},
        %{id: "restaurant_coffee", emoji: "☕", word: "Café", pronunciation: "ka-FEH"},
        %{id: "restaurant_water", emoji: "💧", word: "Agua", pronunciation: "AH-gua"},
        %{id: "restaurant_bill", emoji: "🧾", word: "Cuenta", pronunciation: "KWEN-ta"}
      ],
      cards: [
        %{id: "restaurant_menu", template: "¿Puedo ver el _", answer: "menú", description: "Pedir artículos del restaurante"},
        %{id: "restaurant_pizza", template: "Me gustaría pedir una _", answer: "pizza", description: "Ordenar comida"},
        %{id: "restaurant_burger", template: "La _ está deliciosa", answer: "hamburguesa", description: "Describir comida"},
        %{id: "restaurant_fries", template: "¿Puedo tener _ con eso", answer: "papas fritas", description: "Agregar acompañamientos"},
        %{id: "restaurant_pasta", template: "La _ está lista", answer: "pasta", description: "Estado de la comida"},
        %{id: "restaurant_salad", template: "Voy a tomar una _ César", answer: "ensalada", description: "Pedidos específicos"},
        %{id: "restaurant_soup", template: "¿Qué _ tienen hoy", answer: "sopa", description: "Preguntar por especiales"},
        %{id: "restaurant_coffee", template: "Necesito un _ por favor", answer: "café", description: "Pedir bebidas"},
        %{id: "restaurant_water", template: "¿Podría darme _", answer: "agua", description: "Solicitar bebidas"},
        %{id: "restaurant_bill", template: "¿Nos puede traer la _", answer: "cuenta", description: "Pagar la comida"}
      ]
    }
  end

  # Chinese content
  defp get_chinese_content do
    %{
      title: "餐厅",
      description: "学习餐厅词汇和点餐用语",
      emoji: "🍕",
      vocabulary: [
        %{id: "restaurant_menu", word: "菜单", emoji: "📋", pronunciation: "cài dān", romanization: "cài dān", meaning: "食物清单", example: "可以给我看一下菜单吗？", example_romanization: "kě yǐ gěi wǒ kàn yī xià cài dān ma?"},
        %{id: "restaurant_pizza", word: "比萨饼", emoji: "🍕", pronunciation: "bǐ sà bǐng", romanization: "bǐ sà bǐng", meaning: "意大利菜", example: "我想要一个芝士比萨饼", example_romanization: "wǒ xiǎng yào yī gè zhī shì bǐ sà bǐng"},
        %{id: "restaurant_burger", word: "汉堡包", emoji: "🍔", pronunciation: "hàn bǎo bāo", romanization: "hàn bǎo bāo", meaning: "肉类三明治", example: "汉堡包看起来很美味", example_romanization: "hàn bǎo bāo kàn qǐ lái hěn měi wèi"},
        %{id: "restaurant_fries", word: "薯条", emoji: "🍟", pronunciation: "shǔ tiáo", romanization: "shǔ tiáo", meaning: "炸土豆", example: "我可以要薯条吗？", example_romanization: "wǒ kě yǐ yào shǔ tiáo ma?"},
        %{id: "restaurant_pasta", word: "意大利面", emoji: "🍝", pronunciation: "yì dà lì miàn", romanization: "yì dà lì miàn", meaning: "意大利面条", example: "意大利面煮得很完美", example_romanization: "yì dà lì miàn zhǔ dé hěn wán měi"},
        %{id: "restaurant_salad", word: "沙拉", emoji: "🥗", pronunciation: "shā lā", romanization: "shā lā", meaning: "混合蔬菜", example: "我要一份凯撒沙拉", example_romanization: "wǒ yào yī fèn kǎi sā shā lā"},
        %{id: "restaurant_soup", word: "汤", emoji: "🍲", pronunciation: "tāng", romanization: "tāng", meaning: "液体食物", example: "今天的汤是番茄汤", example_romanization: "jīn tiān de tāng shì fān qié tāng"},
        %{id: "restaurant_coffee", word: "咖啡", emoji: "☕", pronunciation: "kā fēi", romanization: "kā fēi", meaning: "热饮", example: "我需要一杯咖啡来提神", example_romanization: "wǒ xū yào yī bēi kā fēi lái tí shén"},
        %{id: "restaurant_water", word: "水", emoji: "💧", pronunciation: "shuǐ", romanization: "shuǐ", meaning: "透明饮料", example: "可以给我一些水吗？", example_romanization: "kě yǐ gěi wǒ yī xiē shuǐ ma?"},
        %{id: "restaurant_bill", word: "账单", emoji: "🧾", pronunciation: "zhàng dān", romanization: "zhàng dān", meaning: "付款收据", example: "我们可以要账单吗？", example_romanization: "wǒ men kě yǐ yào zhàng dān ma?"}
      ],
      game_objects: [
        %{id: "restaurant_menu", emoji: "📋", word: "菜单", pronunciation: "cài dān", romanization: "cài dān"},
        %{id: "restaurant_pizza", emoji: "🍕", word: "比萨饼", pronunciation: "bǐ sà bǐng", romanization: "bǐ sà bǐng"},
        %{id: "restaurant_burger", emoji: "🍔", word: "汉堡包", pronunciation: "hàn bǎo bāo", romanization: "hàn bǎo bāo"},
        %{id: "restaurant_fries", emoji: "🍟", word: "薯条", pronunciation: "shǔ tiáo", romanization: "shǔ tiáo"},
        %{id: "restaurant_pasta", emoji: "🍝", word: "意大利面", pronunciation: "yì dà lì miàn", romanization: "yì dà lì miàn"},
        %{id: "restaurant_salad", emoji: "🥗", word: "沙拉", pronunciation: "shā lā", romanization: "shā lā"},
        %{id: "restaurant_soup", emoji: "🍲", word: "汤", pronunciation: "tāng", romanization: "tāng"},
        %{id: "restaurant_coffee", emoji: "☕", word: "咖啡", pronunciation: "kā fēi", romanization: "kā fēi"},
        %{id: "restaurant_water", emoji: "💧", word: "水", pronunciation: "shuǐ", romanization: "shuǐ"},
        %{id: "restaurant_bill", emoji: "🧾", word: "账单", pronunciation: "zhàng dān", romanization: "zhàng dān"}
      ],
      cards: [
        %{id: "restaurant_menu", template: "可以给我看_吗", answer: "菜单", romanization: "cài dān", description: "请求餐厅物品"},
        %{id: "restaurant_pizza", template: "我想点一个_", answer: "比萨饼", romanization: "bǐ sà bǐng", description: "点餐"},
        %{id: "restaurant_burger", template: "_很美味", answer: "汉堡包", romanization: "hàn bǎo bāo", description: "描述食物"},
        %{id: "restaurant_fries", template: "我可以要_吗", answer: "薯条", romanization: "shǔ tiáo", description: "添加配菜"},
        %{id: "restaurant_pasta", template: "_做好了", answer: "意大利面", romanization: "yì dà lì miàn", description: "食物状态"},
        %{id: "restaurant_salad", template: "我要一份凯撒_", answer: "沙拉", romanization: "shā lā", description: "具体订单"},
        %{id: "restaurant_soup", template: "今天有什么_", answer: "汤", romanization: "tāng", description: "询问特色菜"},
        %{id: "restaurant_coffee", template: "我需要一杯_", answer: "咖啡", romanization: "kā fēi", description: "点饮料"},
        %{id: "restaurant_water", template: "可以给我一些_吗", answer: "水", romanization: "shuǐ", description: "要求饮料"},
        %{id: "restaurant_bill", template: "我们可以要_吗", answer: "账单", romanization: "zhàng dān", description: "付账"}
      ]
    }
  end

  # French content
  defp get_french_content do
    %{
      title: "Restaurant",
      description: "Apprendre le vocabulaire du restaurant et comment commander",
      emoji: "🍕",
      vocabulary: [
        %{id: "restaurant_menu", word: "Menu", emoji: "📋", pronunciation: "muh-noo", meaning: "Liste de nourriture", example: "Puis-je voir le menu s'il vous plaît ?"},
        %{id: "restaurant_pizza", word: "Pizza", emoji: "🍕", pronunciation: "peet-sa", meaning: "Plat italien", example: "Je voudrais une pizza au fromage"},
        %{id: "restaurant_burger", word: "Hamburger", emoji: "🍔", pronunciation: "am-bur-ger", meaning: "Sandwich avec viande", example: "L'hamburger a l'air délicieux"},
        %{id: "restaurant_fries", word: "Frites", emoji: "🍟", pronunciation: "freet", meaning: "Pommes de terre frites", example: "Puis-je avoir des frites avec ça ?"},
        %{id: "restaurant_pasta", word: "Pâtes", emoji: "🍝", pronunciation: "paht", meaning: "Nouilles italiennes", example: "Les pâtes sont parfaitement cuites"},
        %{id: "restaurant_salad", word: "Salade", emoji: "🥗", pronunciation: "sa-lahd", meaning: "Légumes mélangés", example: "Je prendrai une salade César"},
        %{id: "restaurant_soup", word: "Soupe", emoji: "🍲", pronunciation: "soop", meaning: "Nourriture liquide", example: "La soupe du jour est à la tomate"},
        %{id: "restaurant_coffee", word: "Café", emoji: "☕", pronunciation: "ka-feh", meaning: "Boisson chaude", example: "J'ai besoin d'un café pour me réveiller"},
        %{id: "restaurant_water", word: "Eau", emoji: "💧", pronunciation: "oh", meaning: "Boisson transparente", example: "Pourrais-je avoir de l'eau s'il vous plaît ?"},
        %{id: "restaurant_bill", word: "Addition", emoji: "🧾", pronunciation: "ah-dee-syohn", meaning: "Reçu de paiement", example: "Pouvons-nous avoir l'addition s'il vous plaît ?"}
      ],
      game_objects: [
        %{id: "restaurant_menu", emoji: "📋", word: "Menu", pronunciation: "muh-noo"},
        %{id: "restaurant_pizza", emoji: "🍕", word: "Pizza", pronunciation: "peet-sa"},
        %{id: "restaurant_burger", emoji: "🍔", word: "Hamburger", pronunciation: "am-bur-ger"},
        %{id: "restaurant_fries", emoji: "🍟", word: "Frites", pronunciation: "freet"},
        %{id: "restaurant_pasta", emoji: "🍝", word: "Pâtes", pronunciation: "paht"},
        %{id: "restaurant_salad", emoji: "🥗", word: "Salade", pronunciation: "sa-lahd"},
        %{id: "restaurant_soup", emoji: "🍲", word: "Soupe", pronunciation: "soop"},
        %{id: "restaurant_coffee", emoji: "☕", word: "Café", pronunciation: "ka-feh"},
        %{id: "restaurant_water", emoji: "💧", word: "Eau", pronunciation: "oh"},
        %{id: "restaurant_bill", emoji: "🧾", word: "Addition", pronunciation: "ah-dee-syohn"}
      ],
      cards: [
        %{id: "restaurant_menu", template: "Puis-je voir le _", answer: "menu", description: "Demander des articles du restaurant"},
        %{id: "restaurant_pizza", template: "Je voudrais commander une _", answer: "pizza", description: "Commander de la nourriture"},
        %{id: "restaurant_burger", template: "L'_ a l'air délicieux", answer: "hamburger", description: "Décrire la nourriture"},
        %{id: "restaurant_fries", template: "Puis-je avoir des _ avec ça", answer: "frites", description: "Ajouter des accompagnements"},
        %{id: "restaurant_pasta", template: "Les _ sont prêtes", answer: "pâtes", description: "État de la nourriture"},
        %{id: "restaurant_salad", template: "Je prendrai une _ César", answer: "salade", description: "Commandes spécifiques"},
        %{id: "restaurant_soup", template: "Quelle _ avez-vous aujourd'hui", answer: "soupe", description: "Demander les spécialités du jour"},
        %{id: "restaurant_coffee", template: "J'ai besoin d'un _ s'il vous plaît", answer: "café", description: "Commander des boissons"},
        %{id: "restaurant_water", template: "Pourrais-je avoir de l'_", answer: "eau", description: "Demander des boissons"},
        %{id: "restaurant_bill", template: "Pouvons-nous avoir l'_", answer: "addition", description: "Payer le repas"}
      ]
    }
  end

  # Russian content
  defp get_russian_content do
    %{
      title: "Ресторан",
      description: "Изучение ресторанной лексики и заказа еды",
      emoji: "🍕",
      vocabulary: [
        %{id: "restaurant_menu", word: "Меню", emoji: "📋", pronunciation: "meh-NYU", romanization: "menyu", meaning: "Список блюд", example: "Можно посмотреть меню?", example_romanization: "mozhno posmotret' menyu?"},
        %{id: "restaurant_pizza", word: "Пицца", emoji: "🍕", pronunciation: "PEET-sa", romanization: "pittsa", meaning: "Итальянское блюдо", example: "Я хочу пиццу с сыром", example_romanization: "ya hochu pittsu s syrom"},
        %{id: "restaurant_burger", word: "Бургер", emoji: "🍔", pronunciation: "BUR-ger", romanization: "burger", meaning: "Бутерброд с мясом", example: "Бургер выглядит вкусно", example_romanization: "burger vyglyadit vkusno"},
        %{id: "restaurant_fries", word: "Картошка фри", emoji: "🍟", pronunciation: "kar-TOSH-ka fri", romanization: "kartoshka fri", meaning: "Жареная картошка", example: "Можно картошку фри к этому?", example_romanization: "mozhno kartoshku fri k etomu?"},
        %{id: "restaurant_pasta", word: "Паста", emoji: "🍝", pronunciation: "PAS-ta", romanization: "pasta", meaning: "Итальянская лапша", example: "Паста приготовлена идеально", example_romanization: "pasta prigotovlena ideal'no"},
        %{id: "restaurant_salad", word: "Салат", emoji: "🥗", pronunciation: "sa-LAHT", romanization: "salat", meaning: "Смешанные овощи", example: "Я буду салат Цезарь", example_romanization: "ya budu salat Tsezar'"},
        %{id: "restaurant_soup", word: "Суп", emoji: "🍲", pronunciation: "soop", romanization: "sup", meaning: "Жидкая еда", example: "Суп дня - томатный", example_romanization: "sup dnya - tomatnyy"},
        %{id: "restaurant_coffee", word: "Кофе", emoji: "☕", pronunciation: "KO-fe", romanization: "kofe", meaning: "Горячий напиток", example: "Мне нужен кофе, чтобы проснуться", example_romanization: "mne nuzhen kofe, chtoby prosnut'sya"},
        %{id: "restaurant_water", word: "Вода", emoji: "💧", pronunciation: "vo-DAH", romanization: "voda", meaning: "Прозрачный напиток", example: "Можно немного воды?", example_romanization: "mozhno nemnogo vody?"},
        %{id: "restaurant_bill", word: "Счёт", emoji: "🧾", pronunciation: "schyot", romanization: "schyot", meaning: "Чек к оплате", example: "Можно счёт, пожалуйста?", example_romanization: "mozhno schyot, pozhaluysta?"}
      ],
      game_objects: [
        %{id: "restaurant_menu", emoji: "📋", word: "Меню", pronunciation: "meh-NYU", romanization: "menyu"},
        %{id: "restaurant_pizza", emoji: "🍕", word: "Пицца", pronunciation: "PEET-sa", romanization: "pittsa"},
        %{id: "restaurant_burger", emoji: "🍔", word: "Бургер", pronunciation: "BUR-ger", romanization: "burger"},
        %{id: "restaurant_fries", emoji: "🍟", word: "Картошка фри", pronunciation: "kar-TOSH-ka fri", romanization: "kartoshka fri"},
        %{id: "restaurant_pasta", emoji: "🍝", word: "Паста", pronunciation: "PAS-ta", romanization: "pasta"},
        %{id: "restaurant_salad", emoji: "🥗", word: "Салат", pronunciation: "sa-LAHT", romanization: "salat"},
        %{id: "restaurant_soup", emoji: "🍲", word: "Суп", pronunciation: "soop", romanization: "sup"},
        %{id: "restaurant_coffee", emoji: "☕", word: "Кофе", pronunciation: "KO-fe", romanization: "kofe"},
        %{id: "restaurant_water", emoji: "💧", word: "Вода", pronunciation: "vo-DAH", romanization: "voda"},
        %{id: "restaurant_bill", emoji: "🧾", word: "Счёт", pronunciation: "schyot", romanization: "schyot"}
      ],
      cards: [
        %{id: "restaurant_menu", template: "Можно посмотреть _", answer: "меню", description: "Просьба о ресторанных предметах"},
        %{id: "restaurant_pizza", template: "Я хочу заказать _", answer: "пиццу", description: "Заказ еды"},
        %{id: "restaurant_burger", template: "_ выглядит вкусно", answer: "бургер", description: "Описание еды"},
        %{id: "restaurant_fries", template: "Можно _ к этому", answer: "картошку фри", description: "Добавление гарниров"},
        %{id: "restaurant_pasta", template: "_ готова", answer: "паста", description: "Состояние еды"},
        %{id: "restaurant_salad", template: "Я буду _ Цезарь", answer: "салат", description: "Конкретные заказы"},
        %{id: "restaurant_soup", template: "Какой _ у вас сегодня", answer: "суп", description: "Вопрос о блюдах дня"},
        %{id: "restaurant_coffee", template: "Мне нужен _ пожалуйста", answer: "кофе", description: "Заказ напитков"},
        %{id: "restaurant_water", template: "Можно немного _", answer: "воды", description: "Просьба о напитках"},
        %{id: "restaurant_bill", template: "Можно _ пожалуйста", answer: "счёт", description: "Оплата еды"}
      ]
    }
  end

  # Japanese content
  defp get_japanese_content do
    %{
      title: "レストラン",
      description: "レストランの語彙と食べ物の注文を学ぶ",
      emoji: "🍕",
      vocabulary: [
        %{id: "restaurant_menu", word: "メニュー", emoji: "📋", pronunciation: "meh-nyoo", romanization: "menyuu", meaning: "食べ物のリスト", example: "メニューを見せてください", example_romanization: "menyuu wo misete kudasai"},
        %{id: "restaurant_pizza", word: "ピザ", emoji: "🍕", pronunciation: "pee-za", romanization: "piza", meaning: "イタリア料理", example: "チーズピザをください", example_romanization: "chiizu piza wo kudasai"},
        %{id: "restaurant_burger", word: "ハンバーガー", emoji: "🍔", pronunciation: "han-bah-gah", romanization: "hanbaagaa", meaning: "肉のサンドイッチ", example: "ハンバーガーが美味しそう", example_romanization: "hanbaagaa ga oishisou"},
        %{id: "restaurant_fries", word: "フライドポテト", emoji: "🍟", pronunciation: "fu-rah-ee-do po-te-to", romanization: "furaido poteto", meaning: "揚げたジャガイモ", example: "フライドポテトも一緒にお願いします", example_romanization: "furaido poteto mo issho ni onegaishimasu"},
        %{id: "restaurant_pasta", word: "パスタ", emoji: "🍝", pronunciation: "pas-ta", romanization: "pasuta", meaning: "イタリアの麺", example: "パスタが完璧に調理されています", example_romanization: "pasuta ga kanpeki ni chourishite imasu"},
        %{id: "restaurant_salad", word: "サラダ", emoji: "🥗", pronunciation: "sa-ra-da", romanization: "sarada", meaning: "混ぜた野菜", example: "シーザーサラダをお願いします", example_romanization: "shiizaa sarada wo onegaishimasu"},
        %{id: "restaurant_soup", word: "スープ", emoji: "🍲", pronunciation: "soo-pu", romanization: "suupu", meaning: "液体の食べ物", example: "今日のスープはトマトです", example_romanization: "kyou no suupu wa tomato desu"},
        %{id: "restaurant_coffee", word: "コーヒー", emoji: "☕", pronunciation: "koo-hee", romanization: "koohii", meaning: "熱い飲み物", example: "目を覚ますためにコーヒーが必要です", example_romanization: "me wo samasu tame ni koohii ga hitsuyou desu"},
        %{id: "restaurant_water", word: "水", emoji: "💧", pronunciation: "mee-zu", romanization: "mizu", meaning: "透明な飲み物", example: "お水をいただけますか？", example_romanization: "omizu wo itadakemasu ka?"},
        %{id: "restaurant_bill", word: "お会計", emoji: "🧾", pronunciation: "o-kai-kei", romanization: "okaikei", meaning: "支払いのレシート", example: "お会計をお願いします", example_romanization: "okaikei wo onegaishimasu"}
      ],
      game_objects: [
        %{id: "restaurant_menu", emoji: "📋", word: "メニュー", pronunciation: "meh-nyoo", romanization: "menyuu"},
        %{id: "restaurant_pizza", emoji: "🍕", word: "ピザ", pronunciation: "pee-za", romanization: "piza"},
        %{id: "restaurant_burger", emoji: "🍔", word: "ハンバーガー", pronunciation: "han-bah-gah", romanization: "hanbaagaa"},
        %{id: "restaurant_fries", emoji: "🍟", word: "フライドポテト", pronunciation: "fu-rah-ee-do po-te-to", romanization: "furaido poteto"},
        %{id: "restaurant_pasta", emoji: "🍝", word: "パスタ", pronunciation: "pas-ta", romanization: "pasuta"},
        %{id: "restaurant_salad", emoji: "🥗", word: "サラダ", pronunciation: "sa-ra-da", romanization: "sarada"},
        %{id: "restaurant_soup", emoji: "🍲", word: "スープ", pronunciation: "soo-pu", romanization: "suupu"},
        %{id: "restaurant_coffee", emoji: "☕", word: "コーヒー", pronunciation: "koo-hee", romanization: "koohii"},
        %{id: "restaurant_water", emoji: "💧", word: "水", pronunciation: "mee-zu", romanization: "mizu"},
        %{id: "restaurant_bill", emoji: "🧾", word: "お会計", pronunciation: "o-kai-kei", romanization: "okaikei"}
      ],
      cards: [
        %{id: "restaurant_menu", template: "_を見せてください", answer: "メニュー", description: "レストランのアイテムをリクエスト"},
        %{id: "restaurant_pizza", template: "_を注文したいです", answer: "ピザ", description: "食べ物を注文"},
        %{id: "restaurant_burger", template: "_が美味しそう", answer: "ハンバーガー", description: "食べ物を説明"},
        %{id: "restaurant_fries", template: "_も一緒にお願いします", answer: "フライドポテト", description: "サイドを追加"},
        %{id: "restaurant_pasta", template: "_ができました", answer: "パスタ", description: "食べ物の状態"},
        %{id: "restaurant_salad", template: "シーザー_をお願いします", answer: "サラダ", description: "具体的な注文"},
        %{id: "restaurant_soup", template: "今日はどんな_がありますか", answer: "スープ", description: "日替わりメニューについて聞く"},
        %{id: "restaurant_coffee", template: "_をお願いします", answer: "コーヒー", description: "飲み物を注文"},
        %{id: "restaurant_water", template: "_をいただけますか", answer: "お水", description: "飲み物をリクエスト"},
        %{id: "restaurant_bill", template: "_をお願いします", answer: "お会計", description: "食事の支払い"}
      ]
    }
  end

  # Arabic content
  defp get_arabic_content do
    %{
      title: "المطعم",
      description: "تعلم مفردات المطعم وطلب الطعام",
      emoji: "🍕",
      vocabulary: [
        %{id: "restaurant_menu", word: "قائمة الطعام", emoji: "📋", pronunciation: "qaa'imat at-ta'aam", romanization: "qaa'imat at-ta'aam", meaning: "قائمة بالطعام", example: "هل يمكنني رؤية قائمة الطعام؟", example_romanization: "hal yumkinuniy ru'yat qaa'imat at-ta'aam?"},
        %{id: "restaurant_pizza", word: "بيتزا", emoji: "🍕", pronunciation: "beet-za", romanization: "beetza", meaning: "طبق إيطالي", example: "أريد بيتزا بالجبن", example_romanization: "ureed beetza bil-jubn"},
        %{id: "restaurant_burger", word: "برجر", emoji: "🍔", pronunciation: "bur-jar", romanization: "burjar", meaning: "ساندويش باللحم", example: "البرجر يبدو لذيذاً", example_romanization: "al-burjar yabdu ladheedhan"},
        %{id: "restaurant_fries", word: "بطاطا مقلية", emoji: "🍟", pronunciation: "ba-ta-ta muq-lee-ya", romanization: "bataata muqliya", meaning: "بطاطا مقلية", example: "هل يمكنني الحصول على بطاطا مقلية؟", example_romanization: "hal yumkinuniy al-husool 'ala bataata muqliya?"},
        %{id: "restaurant_pasta", word: "معكرونة", emoji: "🍝", pronunciation: "ma'-ka-ru-na", romanization: "ma'karuna", meaning: "نودلز إيطالية", example: "المعكرونة مطبوخة بشكل مثالي", example_romanization: "al-ma'karuna matbuukha bi-shakl mithaliy"},
        %{id: "restaurant_salad", word: "سلطة", emoji: "🥗", pronunciation: "sa-la-ta", romanization: "salata", meaning: "خضار مخلوطة", example: "سآخذ سلطة قيصر", example_romanization: "sa-aakhudh salata qaysar"},
        %{id: "restaurant_soup", word: "شوربة", emoji: "🍲", pronunciation: "shor-ba", romanization: "shorba", meaning: "طعام سائل", example: "شوربة اليوم هي طماطم", example_romanization: "shorba al-yawm hiya tamaatim"},
        %{id: "restaurant_coffee", word: "قهوة", emoji: "☕", pronunciation: "qah-wa", romanization: "qahwa", meaning: "مشروب ساخن", example: "أحتاج قهوة للاستيقاظ", example_romanization: "ahtaaj qahwa lil-istiyqaadh"},
        %{id: "restaurant_water", word: "ماء", emoji: "💧", pronunciation: "maa'", romanization: "maa", meaning: "مشروب شفاف", example: "هل يمكنني الحصول على بعض الماء؟", example_romanization: "hal yumkinuniy al-husool 'ala ba'd al-maa'?"},
        %{id: "restaurant_bill", word: "الفاتورة", emoji: "🧾", pronunciation: "al-faa-tu-ra", romanization: "al-faatura", meaning: "إيصال الدفع", example: "هل يمكننا الحصول على الفاتورة؟", example_romanization: "hal yumkinuna al-husool 'ala al-faatura?"}
      ],
      game_objects: [
        %{id: "restaurant_menu", emoji: "📋", word: "قائمة الطعام", pronunciation: "qaa'imat at-ta'aam", romanization: "qaa'imat at-ta'aam"},
        %{id: "restaurant_pizza", emoji: "🍕", word: "بيتزا", pronunciation: "beet-za", romanization: "beetza"},
        %{id: "restaurant_burger", emoji: "🍔", word: "برجر", pronunciation: "bur-jar", romanization: "burjar"},
        %{id: "restaurant_fries", emoji: "🍟", word: "بطاطا مقلية", pronunciation: "ba-ta-ta muq-lee-ya", romanization: "bataata muqliya"},
        %{id: "restaurant_pasta", emoji: "🍝", word: "معكرونة", pronunciation: "ma'-ka-ru-na", romanization: "ma'karuna"},
        %{id: "restaurant_salad", emoji: "🥗", word: "سلطة", pronunciation: "sa-la-ta", romanization: "salata"},
        %{id: "restaurant_soup", emoji: "🍲", word: "شوربة", pronunciation: "shor-ba", romanization: "shorba"},
        %{id: "restaurant_coffee", emoji: "☕", word: "قهوة", pronunciation: "qah-wa", romanization: "qahwa"},
        %{id: "restaurant_water", emoji: "💧", word: "ماء", pronunciation: "maa'", romanization: "maa"},
        %{id: "restaurant_bill", emoji: "🧾", word: "الفاتورة", pronunciation: "al-faa-tu-ra", romanization: "al-faatura"}
      ],
      cards: [
        %{id: "restaurant_menu", template: "هل يمكنني رؤية _", answer: "قائمة الطعام", description: "طلب عناصر المطعم"},
        %{id: "restaurant_pizza", template: "أريد أن أطلب _", answer: "بيتزا", description: "طلب الطعام"},
        %{id: "restaurant_burger", template: "_ يبدو لذيذاً", answer: "البرجر", description: "وصف الطعام"},
        %{id: "restaurant_fries", template: "هل يمكنني الحصول على _", answer: "بطاطا مقلية", description: "إضافة الأطباق الجانبية"},
        %{id: "restaurant_pasta", template: "_ جاهزة", answer: "المعكرونة", description: "حالة الطعام"},
        %{id: "restaurant_salad", template: "سآخذ _ قيصر", answer: "سلطة", description: "طلبات محددة"},
        %{id: "restaurant_soup", template: "ما _ اليوم", answer: "شوربة", description: "السؤال عن أطباق اليوم"},
        %{id: "restaurant_coffee", template: "أحتاج _ من فضلك", answer: "قهوة", description: "طلب المشروبات"},
        %{id: "restaurant_water", template: "هل يمكنني الحصول على بعض _", answer: "الماء", description: "طلب المشروبات"},
        %{id: "restaurant_bill", template: "هل يمكننا الحصول على _", answer: "الفاتورة", description: "دفع ثمن الطعام"}
      ]
    }
  end

  # Portuguese content
  defp get_portuguese_content do
    %{
      title: "Restaurante",
      description: "Aprenda vocabulário de restaurante e como pedir comida",
      emoji: "🍕",
      vocabulary: [
        %{id: "restaurant_menu", word: "Menu", emoji: "📋", pronunciation: "meh-NOO", meaning: "Lista de comida", example: "Posso ver o menu por favor?"},
        %{id: "restaurant_pizza", word: "Pizza", emoji: "🍕", pronunciation: "PEET-sa", meaning: "Prato italiano", example: "Gostaria de uma pizza de queijo"},
        %{id: "restaurant_burger", word: "Hambúrguer", emoji: "🍔", pronunciation: "am-BUR-ger", meaning: "Sanduíche com carne", example: "O hambúrguer parece delicioso"},
        %{id: "restaurant_fries", word: "Batatas fritas", emoji: "🍟", pronunciation: "ba-TAH-tas FREE-tas", meaning: "Batatas fritas", example: "Posso ter batatas fritas com isso?"},
        %{id: "restaurant_pasta", word: "Massa", emoji: "🍝", pronunciation: "MAS-sa", meaning: "Macarrão italiano", example: "A massa está perfeitamente cozida"},
        %{id: "restaurant_salad", word: "Salada", emoji: "🥗", pronunciation: "sa-LAH-da", meaning: "Vegetais misturados", example: "Vou querer uma salada Caesar"},
        %{id: "restaurant_soup", word: "Sopa", emoji: "🍲", pronunciation: "SOH-pa", meaning: "Comida líquida", example: "A sopa do dia é de tomate"},
        %{id: "restaurant_coffee", word: "Café", emoji: "☕", pronunciation: "ka-FEH", meaning: "Bebida quente", example: "Preciso de um café para acordar"},
        %{id: "restaurant_water", word: "Água", emoji: "💧", pronunciation: "AH-gua", meaning: "Bebida transparente", example: "Poderia me dar um pouco de água por favor?"},
        %{id: "restaurant_bill", word: "Conta", emoji: "🧾", pronunciation: "KON-ta", meaning: "Recibo de pagamento", example: "Podemos ter a conta por favor?"}
      ],
      game_objects: [
        %{id: "restaurant_menu", emoji: "📋", word: "Menu", pronunciation: "meh-NOO"},
        %{id: "restaurant_pizza", emoji: "🍕", word: "Pizza", pronunciation: "PEET-sa"},
        %{id: "restaurant_burger", emoji: "🍔", word: "Hambúrguer", pronunciation: "am-BUR-ger"},
        %{id: "restaurant_fries", emoji: "🍟", word: "Batatas fritas", pronunciation: "ba-TAH-tas FREE-tas"},
        %{id: "restaurant_pasta", emoji: "🍝", word: "Massa", pronunciation: "MAS-sa"},
        %{id: "restaurant_salad", emoji: "🥗", word: "Salada", pronunciation: "sa-LAH-da"},
        %{id: "restaurant_soup", emoji: "🍲", word: "Sopa", pronunciation: "SOH-pa"},
        %{id: "restaurant_coffee", emoji: "☕", word: "Café", pronunciation: "ka-FEH"},
        %{id: "restaurant_water", emoji: "💧", word: "Água", pronunciation: "AH-gua"},
        %{id: "restaurant_bill", emoji: "🧾", word: "Conta", pronunciation: "KON-ta"}
      ],
      cards: [
        %{id: "restaurant_menu", template: "Posso ver o _", answer: "menu", description: "Pedir itens do restaurante"},
        %{id: "restaurant_pizza", template: "Gostaria de pedir uma _", answer: "pizza", description: "Pedir comida"},
        %{id: "restaurant_burger", template: "O _ parece delicioso", answer: "hambúrguer", description: "Descrever comida"},
        %{id: "restaurant_fries", template: "Posso ter _ com isso", answer: "batatas fritas", description: "Adicionar acompanhamentos"},
        %{id: "restaurant_pasta", template: "A _ está pronta", answer: "massa", description: "Estado da comida"},
        %{id: "restaurant_salad", template: "Vou querer uma _ Caesar", answer: "salada", description: "Pedidos específicos"},
        %{id: "restaurant_soup", template: "Que _ vocês têm hoje", answer: "sopa", description: "Perguntar sobre especiais do dia"},
        %{id: "restaurant_coffee", template: "Preciso de um _ por favor", answer: "café", description: "Pedir bebidas"},
        %{id: "restaurant_water", template: "Poderia me dar _", answer: "água", description: "Pedir bebidas"},
        %{id: "restaurant_bill", template: "Podemos ter a _", answer: "conta", description: "Pagar pela refeição"}
      ]
    }
  end

  # Italian content
  defp get_italian_content do
    %{
      title: "Ristorante",
      description: "Impara il vocabolario del ristorante e come ordinare il cibo",
      emoji: "🍕",
      vocabulary: [
        %{id: "restaurant_menu", word: "Menu", emoji: "📋", pronunciation: "meh-NOO", meaning: "Lista del cibo", example: "Posso vedere il menu per favore?"},
        %{id: "restaurant_pizza", word: "Pizza", emoji: "🍕", pronunciation: "PEET-tsa", meaning: "Piatto italiano", example: "Vorrei una pizza al formaggio"},
        %{id: "restaurant_burger", word: "Hamburger", emoji: "🍔", pronunciation: "am-BUR-ger", meaning: "Panino con carne", example: "L'hamburger sembra delizioso"},
        %{id: "restaurant_fries", word: "Patatine fritte", emoji: "🍟", pronunciation: "pa-ta-TEE-neh FREET-teh", meaning: "Patate fritte", example: "Posso avere patatine fritte con quello?"},
        %{id: "restaurant_pasta", word: "Pasta", emoji: "🍝", pronunciation: "PAS-ta", meaning: "Pasta italiana", example: "La pasta è cucinata perfettamente"},
        %{id: "restaurant_salad", word: "Insalata", emoji: "🥗", pronunciation: "in-sa-LAH-ta", meaning: "Verdure miste", example: "Prenderò un'insalata Caesar"},
        %{id: "restaurant_soup", word: "Zuppa", emoji: "🍲", pronunciation: "TSOOP-pa", meaning: "Cibo liquido", example: "La zuppa del giorno è di pomodoro"},
        %{id: "restaurant_coffee", word: "Caffè", emoji: "☕", pronunciation: "kaf-FEH", meaning: "Bevanda calda", example: "Ho bisogno di un caffè per svegliarmi"},
        %{id: "restaurant_water", word: "Acqua", emoji: "💧", pronunciation: "AHK-kwa", meaning: "Bevanda trasparente", example: "Potrei avere un po' d'acqua per favore?"},
        %{id: "restaurant_bill", word: "Conto", emoji: "🧾", pronunciation: "KON-to", meaning: "Ricevuta di pagamento", example: "Possiamo avere il conto per favore?"}
      ],
      game_objects: [
        %{id: "restaurant_menu", emoji: "📋", word: "Menu", pronunciation: "meh-NOO"},
        %{id: "restaurant_pizza", emoji: "🍕", word: "Pizza", pronunciation: "PEET-tsa"},
        %{id: "restaurant_burger", emoji: "🍔", word: "Hamburger", pronunciation: "am-BUR-ger"},
        %{id: "restaurant_fries", emoji: "🍟", word: "Patatine fritte", pronunciation: "pa-ta-TEE-neh FREET-teh"},
        %{id: "restaurant_pasta", emoji: "🍝", word: "Pasta", pronunciation: "PAS-ta"},
        %{id: "restaurant_salad", emoji: "🥗", word: "Insalata", pronunciation: "in-sa-LAH-ta"},
        %{id: "restaurant_soup", emoji: "🍲", word: "Zuppa", pronunciation: "TSOOP-pa"},
        %{id: "restaurant_coffee", emoji: "☕", word: "Caffè", pronunciation: "kaf-FEH"},
        %{id: "restaurant_water", emoji: "💧", word: "Acqua", pronunciation: "AHK-kwa"},
        %{id: "restaurant_bill", emoji: "🧾", word: "Conto", pronunciation: "KON-to"}
      ],
      cards: [
        %{id: "restaurant_menu", template: "Posso vedere il _", answer: "menu", description: "Richiedere articoli del ristorante"},
        %{id: "restaurant_pizza", template: "Vorrei ordinare una _", answer: "pizza", description: "Ordinare cibo"},
        %{id: "restaurant_burger", template: "L'_ sembra delizioso", answer: "hamburger", description: "Descrivere il cibo"},
        %{id: "restaurant_fries", template: "Posso avere _ con quello", answer: "patatine fritte", description: "Aggiungere contorni"},
        %{id: "restaurant_pasta", template: "La _ è pronta", answer: "pasta", description: "Stato del cibo"},
        %{id: "restaurant_salad", template: "Prenderò un'_ Caesar", answer: "insalata", description: "Ordini specifici"},
        %{id: "restaurant_soup", template: "Che _ avete oggi", answer: "zuppa", description: "Chiedere i piatti del giorno"},
        %{id: "restaurant_coffee", template: "Ho bisogno di un _ per favore", answer: "caffè", description: "Ordinare bevande"},
        %{id: "restaurant_water", template: "Potrei avere un po' d'_", answer: "acqua", description: "Richiedere bevande"},
        %{id: "restaurant_bill", template: "Possiamo avere il _", answer: "conto", description: "Pagare per il pasto"}
      ]
    }
  end
end