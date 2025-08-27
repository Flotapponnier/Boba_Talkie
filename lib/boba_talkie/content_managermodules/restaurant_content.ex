defmodule BobaTalkie.ContentManagerModules.RestaurantContent do
  @moduledoc """
  Restaurant topic content in multiple languages.
  Contains tutorial vocabulary, game objects, and challenge cards for learning restaurant items and ordering.
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
      description: "Learn restaurant vocabulary and how to order food",
      emoji: "🍕",
      vocabulary: [
        %{id: "restaurant_menu", word: "Menu", emoji: "📋", pronunciation: "MEN-yoo", meaning: "List of food options", example: "Can I see the menu please?"},
        %{id: "restaurant_pizza", word: "Pizza", emoji: "🍕", pronunciation: "PEET-za", meaning: "Italian dish", example: "I'll have a slice of pizza"},
        %{id: "restaurant_burger", word: "Burger", emoji: "🍔", pronunciation: "BUR-gur", meaning: "Sandwich with meat", example: "Cheeseburger with fries"},
        %{id: "restaurant_coffee", word: "Coffee", emoji: "☕", pronunciation: "KAW-fee", meaning: "Hot drink", example: "Hot black coffee"}
      ],
      game_objects: [
        %{id: "restaurant_menu", emoji: "📋", word: "Menu", pronunciation: "MEN-yoo"},
        %{id: "restaurant_pizza", emoji: "🍕", word: "Pizza", pronunciation: "PEET-za"},
        %{id: "restaurant_burger", emoji: "🍔", word: "Burger", pronunciation: "BUR-gur"},
        %{id: "restaurant_coffee", emoji: "☕", word: "Coffee", pronunciation: "KAW-fee"}
      ],
      cards: [
        %{id: "restaurant_menu", template: "Can I see the _?", answer: "menu", description: "Asking for menu"},
        %{id: "restaurant_pizza", template: "I'll have a slice of _", answer: "pizza", description: "Ordering food"},
        %{id: "restaurant_coffee", template: "Hot black _", answer: "coffee", description: "Ordering drinks"}
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
        %{id: "restaurant_menu", word: "Menú", emoji: "📋", pronunciation: "meh-NOO", meaning: "Lista de opciones de comida", example: "¿Puedo ver el menú por favor?"},
        %{id: "restaurant_pizza", word: "Pizza", emoji: "🍕", pronunciation: "PEET-sa", meaning: "Plato italiano", example: "Voy a tomar una porción de pizza"},
        %{id: "restaurant_burger", word: "Hamburguesa", emoji: "🍔", pronunciation: "am-boor-GEH-sa", meaning: "Sándwich con carne", example: "Hamburguesa con queso y papas fritas"},
        %{id: "restaurant_coffee", word: "Café", emoji: "☕", pronunciation: "kah-FEH", meaning: "Bebida caliente", example: "Café negro caliente"}
      ],
      game_objects: [
        %{id: "restaurant_menu", emoji: "📋", word: "Menú", pronunciation: "meh-NOO"},
        %{id: "restaurant_pizza", emoji: "🍕", word: "Pizza", pronunciation: "PEET-sa"},
        %{id: "restaurant_burger", emoji: "🍔", word: "Hamburguesa", pronunciation: "am-boor-GEH-sa"},
        %{id: "restaurant_coffee", emoji: "☕", word: "Café", pronunciation: "kah-FEH"}
      ],
      cards: [
        %{id: "restaurant_menu", template: "¿Puedo ver el _?", answer: "menú", description: "Pidiendo el menú"},
        %{id: "restaurant_pizza", template: "Voy a tomar una porción de _", answer: "pizza", description: "Pidiendo comida"},
        %{id: "restaurant_coffee", template: "_ negro caliente", answer: "Café", description: "Pidiendo bebidas"}
      ]
    }
  end

  # Chinese content
  defp get_chinese_content do
    %{
      title: "餐厅",
      description: "学习餐厅词汇和如何点餐",
      emoji: "🍕",
      vocabulary: [
        %{id: "restaurant_menu", word: "菜单", emoji: "📋", pronunciation: "cài dān", romanization: "cài dān", meaning: "食物选项列表", example: "我可以看看菜单吗？", example_romanization: "wǒ kě yǐ kàn kàn cài dān ma?"},
        %{id: "restaurant_pizza", word: "比萨饼", emoji: "🍕", pronunciation: "bǐ sà bǐng", romanization: "bǐ sà bǐng", meaning: "意大利菜", example: "我要一片比萨饼", example_romanization: "wǒ yào yī piàn bǐ sà bǐng"},
        %{id: "restaurant_burger", word: "汉堡", emoji: "🍔", pronunciation: "hàn bǎo", romanization: "hàn bǎo", meaning: "肉类三明治", example: "奶酪汉堡配薯条", example_romanization: "nǎi lào hàn bǎo pèi shǔ tiáo"},
        %{id: "restaurant_coffee", word: "咖啡", emoji: "☕", pronunciation: "kā fēi", romanization: "kā fēi", meaning: "热饮", example: "热黑咖啡", example_romanization: "rè hēi kā fēi"}
      ],
      game_objects: [
        %{id: "restaurant_menu", emoji: "📋", word: "菜单", pronunciation: "cài dān", romanization: "cài dān"},
        %{id: "restaurant_pizza", emoji: "🍕", word: "比萨饼", pronunciation: "bǐ sà bǐng", romanization: "bǐ sà bǐng"},
        %{id: "restaurant_burger", emoji: "🍔", word: "汉堡", pronunciation: "hàn bǎo", romanization: "hàn bǎo"},
        %{id: "restaurant_coffee", emoji: "☕", word: "咖啡", pronunciation: "kā fēi", romanization: "kā fēi"}
      ],
      cards: [
        %{id: "restaurant_menu", template: "我可以看看_吗？", answer: "菜单", romanization: "cài dān", description: "要求看菜单"},
        %{id: "restaurant_pizza", template: "我要一片_", answer: "比萨饼", romanization: "bǐ sà bǐng", description: "点餐"},
        %{id: "restaurant_coffee", template: "热黑_", answer: "咖啡", romanization: "kā fēi", description: "点饮料"}
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
        %{id: "restaurant_menu", word: "Menu", emoji: "📋", pronunciation: "meh-noo", meaning: "Liste des options alimentaires", example: "Puis-je voir le menu s'il vous plaît?"},
        %{id: "restaurant_pizza", word: "Pizza", emoji: "🍕", pronunciation: "peet-sa", meaning: "Plat italien", example: "Je vais prendre une part de pizza"},
        %{id: "restaurant_burger", word: "Hamburger", emoji: "🍔", pronunciation: "am-bur-gur", meaning: "Sandwich avec de la viande", example: "Cheeseburger avec des frites"},
        %{id: "restaurant_coffee", word: "Café", emoji: "☕", pronunciation: "kah-feh", meaning: "Boisson chaude", example: "Café noir chaud"}
      ],
      game_objects: [
        %{id: "restaurant_menu", emoji: "📋", word: "Menu", pronunciation: "meh-noo"},
        %{id: "restaurant_pizza", emoji: "🍕", word: "Pizza", pronunciation: "peet-sa"},
        %{id: "restaurant_burger", emoji: "🍔", word: "Hamburger", pronunciation: "am-bur-gur"},
        %{id: "restaurant_coffee", emoji: "☕", word: "Café", pronunciation: "kah-feh"}
      ],
      cards: [
        %{id: "restaurant_menu", template: "Puis-je voir le _?", answer: "menu", description: "Demander le menu"},
        %{id: "restaurant_pizza", template: "Je vais prendre une part de _", answer: "pizza", description: "Commander de la nourriture"},
        %{id: "restaurant_coffee", template: "_ noir chaud", answer: "Café", description: "Commander des boissons"}
      ]
    }
  end

  # Russian content
  defp get_russian_content do
    %{
      title: "Ресторан",
      description: "Изучение словаря ресторана и как заказывать еду",
      emoji: "🍕",
      vocabulary: [
        %{id: "restaurant_menu", word: "Меню", emoji: "📋", pronunciation: "meh-NYOO", romanization: "menyu", meaning: "Список блюд", example: "Можно посмотреть меню, пожалуйста?", example_romanization: "mozhno posmotret' menyu, pozhaluysta?"},
        %{id: "restaurant_pizza", word: "Пицца", emoji: "🍕", pronunciation: "PEET-tsa", romanization: "pitstsa", meaning: "Итальянское блюдо", example: "Я буду кусочек пиццы", example_romanization: "ya budu kusochek pitstsy"},
        %{id: "restaurant_burger", word: "Бургер", emoji: "🍔", pronunciation: "BUR-ger", romanization: "burger", meaning: "Бутерброд с мясом", example: "Чизбургер с картошкой фри", example_romanization: "chizburger s kartoshkoy fri"},
        %{id: "restaurant_coffee", word: "Кофе", emoji: "☕", pronunciation: "KOH-feh", romanization: "kofe", meaning: "Горячий напиток", example: "Горячий чёрный кофе", example_romanization: "goryachiy chyornyy kofe"}
      ],
      game_objects: [
        %{id: "restaurant_menu", emoji: "📋", word: "Меню", pronunciation: "meh-NYOO", romanization: "menyu"},
        %{id: "restaurant_pizza", emoji: "🍕", word: "Пицца", pronunciation: "PEET-tsa", romanization: "pitstsa"},
        %{id: "restaurant_burger", emoji: "🍔", word: "Бургер", pronunciation: "BUR-ger", romanization: "burger"},
        %{id: "restaurant_coffee", emoji: "☕", word: "Кофе", pronunciation: "KOH-feh", romanization: "kofe"}
      ],
      cards: [
        %{id: "restaurant_menu", template: "Можно посмотреть _?", answer: "меню", description: "Просить меню"},
        %{id: "restaurant_pizza", template: "Я буду кусочек _", answer: "пиццы", description: "Заказывать еду"},
        %{id: "restaurant_coffee", template: "Горячий чёрный _", answer: "кофе", description: "Заказывать напитки"}
      ]
    }
  end

  # Japanese content
  defp get_japanese_content do
    %{
      title: "レストラン",
      description: "レストランの語彙と料理の注文方法を学ぶ",
      emoji: "🍕",
      vocabulary: [
        %{id: "restaurant_menu", word: "メニュー", emoji: "📋", pronunciation: "meh-nyoo", romanization: "menyuu", meaning: "料理の選択肢のリスト", example: "メニューを見せてください", example_romanization: "menyuu wo misete kudasai"},
        %{id: "restaurant_pizza", word: "ピザ", emoji: "🍕", pronunciation: "pee-za", romanization: "piza", meaning: "イタリア料理", example: "ピザを一切れください", example_romanization: "piza wo hitokire kudasai"},
        %{id: "restaurant_burger", word: "ハンバーガー", emoji: "🍔", pronunciation: "han-baa-gaa", romanization: "hanbaagaa", meaning: "肉入りサンドイッチ", example: "フライドポテト付きのチーズバーガー", example_romanization: "furaido poteto tsuki no chiizburgaa"},
        %{id: "restaurant_coffee", word: "コーヒー", emoji: "☕", pronunciation: "koo-hii", romanization: "koohii", meaning: "温かい飲み物", example: "熱いブラックコーヒー", example_romanization: "atsui burakku koohii"}
      ],
      game_objects: [
        %{id: "restaurant_menu", emoji: "📋", word: "メニュー", pronunciation: "meh-nyoo", romanization: "menyuu"},
        %{id: "restaurant_pizza", emoji: "🍕", word: "ピザ", pronunciation: "pee-za", romanization: "piza"},
        %{id: "restaurant_burger", emoji: "🍔", word: "ハンバーガー", pronunciation: "han-baa-gaa", romanization: "hanbaagaa"},
        %{id: "restaurant_coffee", emoji: "☕", word: "コーヒー", pronunciation: "koo-hii", romanization: "koohii"}
      ],
      cards: [
        %{id: "restaurant_menu", template: "_を見せてください", answer: "メニュー", description: "メニューを頼む"},
        %{id: "restaurant_pizza", template: "_を一切れください", answer: "ピザ", description: "料理を注文する"},
        %{id: "restaurant_coffee", template: "熱いブラック_", answer: "コーヒー", description: "飲み物を注文する"}
      ]
    }
  end

  # Arabic content
  defp get_arabic_content do
    %{
      title: "المطعم",
      description: "تعلم مفردات المطعم وكيفية طلب الطعام",
      emoji: "🍕",
      vocabulary: [
        %{id: "restaurant_menu", word: "قائمة الطعام", emoji: "📋", pronunciation: "qaa-imat at-ta-aam", romanization: "qaa'imat at-ta'aam", meaning: "قائمة خيارات الطعام", example: "هل يمكنني رؤية القائمة من فضلك؟", example_romanization: "hal yumkinunii ru'yat al-qaa'ima min fadlik?"},
        %{id: "restaurant_pizza", word: "بيتزا", emoji: "🍕", pronunciation: "beet-sa", romanization: "beetsa", meaning: "طبق إيطالي", example: "سآخذ قطعة بيتزا", example_romanization: "sa-aakhudh qit'at beetsa"},
        %{id: "restaurant_burger", word: "برغر", emoji: "🍔", pronunciation: "bur-gur", romanization: "burgur", meaning: "ساندويتش باللحم", example: "تشيزبرغر مع البطاطس المقلية", example_romanization: "chizburgur ma'a al-bataatis al-muqaliya"},
        %{id: "restaurant_coffee", word: "قهوة", emoji: "☕", pronunciation: "qah-wa", romanization: "qahwa", meaning: "مشروب ساخن", example: "قهوة سوداء ساخنة", example_romanization: "qahwa sawdaa saaghina"}
      ],
      game_objects: [
        %{id: "restaurant_menu", emoji: "📋", word: "قائمة الطعام", pronunciation: "qaa-imat at-ta-aam", romanization: "qaa'imat at-ta'aam"},
        %{id: "restaurant_pizza", emoji: "🍕", word: "بيتزا", pronunciation: "beet-sa", romanization: "beetsa"},
        %{id: "restaurant_burger", emoji: "🍔", word: "برغر", pronunciation: "bur-gur", romanization: "burgur"},
        %{id: "restaurant_coffee", emoji: "☕", word: "قهوة", pronunciation: "qah-wa", romanization: "qahwa"}
      ],
      cards: [
        %{id: "restaurant_menu", template: "هل يمكنني رؤية _؟", answer: "القائمة", description: "طلب القائمة"},
        %{id: "restaurant_pizza", template: "سآخذ قطعة _", answer: "بيتزا", description: "طلب الطعام"},
        %{id: "restaurant_coffee", template: "_ سوداء ساخنة", answer: "قهوة", description: "طلب المشروبات"}
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
        %{id: "restaurant_menu", word: "Menu", emoji: "📋", pronunciation: "meh-NOO", meaning: "Lista de opções de comida", example: "Posso ver o menu por favor?"},
        %{id: "restaurant_pizza", word: "Pizza", emoji: "🍕", pronunciation: "PEET-sa", meaning: "Prato italiano", example: "Vou querer uma fatia de pizza"},
        %{id: "restaurant_burger", word: "Hambúrguer", emoji: "🍔", pronunciation: "ham-BUR-ger", meaning: "Sanduíche com carne", example: "Cheeseburger com batatas fritas"},
        %{id: "restaurant_coffee", word: "Café", emoji: "☕", pronunciation: "ka-FEH", meaning: "Bebida quente", example: "Café preto quente"}
      ],
      game_objects: [
        %{id: "restaurant_menu", emoji: "📋", word: "Menu", pronunciation: "meh-NOO"},
        %{id: "restaurant_pizza", emoji: "🍕", word: "Pizza", pronunciation: "PEET-sa"},
        %{id: "restaurant_burger", emoji: "🍔", word: "Hambúrguer", pronunciation: "ham-BUR-ger"},
        %{id: "restaurant_coffee", emoji: "☕", word: "Café", pronunciation: "ka-FEH"}
      ],
      cards: [
        %{id: "restaurant_menu", template: "Posso ver o _?", answer: "menu", description: "Pedindo o menu"},
        %{id: "restaurant_pizza", template: "Vou querer uma fatia de _", answer: "pizza", description: "Pedindo comida"},
        %{id: "restaurant_coffee", template: "_ preto quente", answer: "Café", description: "Pedindo bebidas"}
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
        %{id: "restaurant_menu", word: "Menu", emoji: "📋", pronunciation: "meh-NOO", meaning: "Lista delle opzioni alimentari", example: "Posso vedere il menu per favore?"},
        %{id: "restaurant_pizza", word: "Pizza", emoji: "🍕", pronunciation: "PEET-tsa", meaning: "Piatto italiano", example: "Prendo una fetta di pizza"},
        %{id: "restaurant_burger", word: "Hamburger", emoji: "🍔", pronunciation: "am-BUR-ger", meaning: "Panino con carne", example: "Cheeseburger con patatine"},
        %{id: "restaurant_coffee", word: "Caffè", emoji: "☕", pronunciation: "kaf-FEH", meaning: "Bevanda calda", example: "Caffè nero caldo"}
      ],
      game_objects: [
        %{id: "restaurant_menu", emoji: "📋", word: "Menu", pronunciation: "meh-NOO"},
        %{id: "restaurant_pizza", emoji: "🍕", word: "Pizza", pronunciation: "PEET-tsa"},
        %{id: "restaurant_burger", emoji: "🍔", word: "Hamburger", pronunciation: "am-BUR-ger"},
        %{id: "restaurant_coffee", emoji: "☕", word: "Caffè", pronunciation: "kaf-FEH"}
      ],
      cards: [
        %{id: "restaurant_menu", template: "Posso vedere il _?", answer: "menu", description: "Chiedere il menu"},
        %{id: "restaurant_pizza", template: "Prendo una fetta di _", answer: "pizza", description: "Ordinare cibo"},
        %{id: "restaurant_coffee", template: "_ nero caldo", answer: "Caffè", description: "Ordinare bevande"}
      ]
    }
  end
end