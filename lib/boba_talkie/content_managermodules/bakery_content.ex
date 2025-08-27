defmodule BobaTalkie.ContentManagerModules.BakeryContent do
  @moduledoc """
  Bakery topic content in multiple languages.
  Contains tutorial vocabulary, game objects, and challenge cards for learning bakery items.
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
      title: "Bakery",
      description: "Learn bakery items and ordering at a bakery",
      emoji: "🥐",
      vocabulary: [
        %{id: "bakery_bread", word: "Bread", emoji: "🍞", pronunciation: "BRED", meaning: "Baked food item", example: "Fresh bread smells amazing"},
        %{id: "bakery_croissant", word: "Croissant", emoji: "🥐", pronunciation: "kwah-SAHN", meaning: "French pastry", example: "A buttery French croissant"},
        %{id: "bakery_cake", word: "Cake", emoji: "🎂", pronunciation: "KAYK", meaning: "Sweet dessert", example: "Birthday cake with candles"},
        %{id: "bakery_cookie", word: "Cookie", emoji: "🍪", pronunciation: "KUK-ee", meaning: "Sweet baked treat", example: "Chocolate chip cookie"}
      ],
      game_objects: [
        %{id: "bakery_bread", emoji: "🍞", word: "Bread", pronunciation: "BRED"},
        %{id: "bakery_croissant", emoji: "🥐", word: "Croissant", pronunciation: "kwah-SAHN"},
        %{id: "bakery_cake", emoji: "🎂", word: "Cake", pronunciation: "KAYK"},
        %{id: "bakery_cookie", emoji: "🍪", word: "Cookie", pronunciation: "KUK-ee"}
      ],
      cards: [
        %{id: "bakery_bread", template: "I want fresh _", answer: "bread", description: "Ordering at bakery"},
        %{id: "bakery_croissant", template: "A buttery _", answer: "croissant", description: "Describing pastry"},
        %{id: "bakery_cake", template: "Birthday _ with candles", answer: "cake", description: "Celebration food"}
      ]
    }
  end

  # Spanish content
  defp get_spanish_content do
    %{
      title: "Panadería",
      description: "Aprende productos de panadería y cómo pedir en una panadería",
      emoji: "🥐",
      vocabulary: [
        %{id: "bakery_bread", word: "Pan", emoji: "🍞", pronunciation: "pahn", meaning: "Alimento horneado", example: "Pan fresco huele increíble"},
        %{id: "bakery_croissant", word: "Croissant", emoji: "🥐", pronunciation: "krwa-SAHN", meaning: "Pastel francés", example: "Un croissant francés con mantequilla"},
        %{id: "bakery_cake", word: "Pastel", emoji: "🎂", pronunciation: "pas-TEHL", meaning: "Postre dulce", example: "Pastel de cumpleaños con velas"},
        %{id: "bakery_cookie", word: "Galleta", emoji: "🍪", pronunciation: "ga-YEH-ta", meaning: "Dulce horneado", example: "Galleta con chips de chocolate"}
      ],
      game_objects: [
        %{id: "bakery_bread", emoji: "🍞", word: "Pan", pronunciation: "pahn"},
        %{id: "bakery_croissant", emoji: "🥐", word: "Croissant", pronunciation: "krwa-SAHN"},
        %{id: "bakery_cake", emoji: "🎂", word: "Pastel", pronunciation: "pas-TEHL"},
        %{id: "bakery_cookie", emoji: "🍪", word: "Galleta", pronunciation: "ga-YEH-ta"}
      ],
      cards: [
        %{id: "bakery_bread", template: "Quiero _ fresco", answer: "pan", description: "Pidiendo en panadería"},
        %{id: "bakery_croissant", template: "Un _ con mantequilla", answer: "croissant", description: "Describiendo pastel"},
        %{id: "bakery_cake", template: "_ de cumpleaños con velas", answer: "Pastel", description: "Comida de celebración"}
      ]
    }
  end

  # Chinese content
  defp get_chinese_content do
    %{
      title: "面包店",
      description: "学习面包店物品和在面包店点餐",
      emoji: "🥐",
      vocabulary: [
        %{id: "bakery_bread", word: "面包", emoji: "🍞", pronunciation: "miàn bāo", romanization: "miàn bāo", meaning: "烘焙食品", example: "新鲜面包闻起来很香", example_romanization: "xīn xiān miàn bāo wén qǐ lái hěn xiāng"},
        %{id: "bakery_croissant", word: "羊角面包", emoji: "🥐", pronunciation: "yáng jiǎo miàn bāo", romanization: "yáng jiǎo miàn bāo", meaning: "法式糕点", example: "黄油法式羊角面包", example_romanization: "huáng yóu fǎ shì yáng jiǎo miàn bāo"},
        %{id: "bakery_cake", word: "蛋糕", emoji: "🎂", pronunciation: "dàn gāo", romanization: "dàn gāo", meaning: "甜点", example: "带蜡烛的生日蛋糕", example_romanization: "dài là zhú de shēng rì dàn gāo"},
        %{id: "bakery_cookie", word: "饼干", emoji: "🍪", pronunciation: "bǐng gān", romanization: "bǐng gān", meaning: "甜味烘焙食品", example: "巧克力片饼干", example_romanization: "qiǎo kè lì piàn bǐng gān"}
      ],
      game_objects: [
        %{id: "bakery_bread", emoji: "🍞", word: "面包", pronunciation: "miàn bāo", romanization: "miàn bāo"},
        %{id: "bakery_croissant", emoji: "🥐", word: "羊角面包", pronunciation: "yáng jiǎo miàn bāo", romanization: "yáng jiǎo miàn bāo"},
        %{id: "bakery_cake", emoji: "🎂", word: "蛋糕", pronunciation: "dàn gāo", romanization: "dàn gāo"},
        %{id: "bakery_cookie", emoji: "🍪", word: "饼干", pronunciation: "bǐng gān", romanization: "bǐng gān"}
      ],
      cards: [
        %{id: "bakery_bread", template: "我要新鲜_", answer: "面包", romanization: "miàn bāo", description: "在面包店点餐"},
        %{id: "bakery_croissant", template: "黄油_", answer: "羊角面包", romanization: "yáng jiǎo miàn bāo", description: "描述糕点"},
        %{id: "bakery_cake", template: "带蜡烛的生日_", answer: "蛋糕", romanization: "dàn gāo", description: "庆祝食品"}
      ]
    }
  end

  # French content
  defp get_french_content do
    %{
      title: "Boulangerie",
      description: "Apprendre les articles de boulangerie et comment commander",
      emoji: "🥐",
      vocabulary: [
        %{id: "bakery_bread", word: "Pain", emoji: "🍞", pronunciation: "pan", meaning: "Aliment cuit au four", example: "Le pain frais sent délicieux"},
        %{id: "bakery_croissant", word: "Croissant", emoji: "🥐", pronunciation: "krwa-sahn", meaning: "Pâtisserie française", example: "Un croissant au beurre français"},
        %{id: "bakery_cake", word: "Gâteau", emoji: "🎂", pronunciation: "gah-toh", meaning: "Dessert sucré", example: "Gâteau d'anniversaire avec bougies"},
        %{id: "bakery_cookie", word: "Biscuit", emoji: "🍪", pronunciation: "bee-skwee", meaning: "Friandise cuite", example: "Biscuit aux pépites de chocolat"}
      ],
      game_objects: [
        %{id: "bakery_bread", emoji: "🍞", word: "Pain", pronunciation: "pan"},
        %{id: "bakery_croissant", emoji: "🥐", word: "Croissant", pronunciation: "krwa-sahn"},
        %{id: "bakery_cake", emoji: "🎂", word: "Gâteau", pronunciation: "gah-toh"},
        %{id: "bakery_cookie", emoji: "🍪", word: "Biscuit", pronunciation: "bee-skwee"}
      ],
      cards: [
        %{id: "bakery_bread", template: "Je veux du _ frais", answer: "pain", description: "Commander à la boulangerie"},
        %{id: "bakery_croissant", template: "Un _ au beurre", answer: "croissant", description: "Décrire une pâtisserie"},
        %{id: "bakery_cake", template: "_ d'anniversaire avec bougies", answer: "Gâteau", description: "Nourriture de fête"}
      ]
    }
  end

  # Russian content
  defp get_russian_content do
    %{
      title: "Пекарня",
      description: "Изучение хлебобулочных изделий и заказа в пекарне",
      emoji: "🥐",
      vocabulary: [
        %{id: "bakery_bread", word: "Хлеб", emoji: "🍞", pronunciation: "hleb", romanization: "hleb", meaning: "Выпечка", example: "Свежий хлеб пахнет потрясающе", example_romanization: "svezhiy hleb pahnet potryasayushche"},
        %{id: "bakery_croissant", word: "Круассан", emoji: "🥐", pronunciation: "krwa-SAHN", romanization: "kruassan", meaning: "Французская выпечка", example: "Масляный французский круассан", example_romanization: "maslyany frantsuzskiy kruassan"},
        %{id: "bakery_cake", word: "Торт", emoji: "🎂", pronunciation: "tort", romanization: "tort", meaning: "Сладкий десерт", example: "Торт на день рождения со свечами", example_romanization: "tort na den rozhdeniya so svechami"},
        %{id: "bakery_cookie", word: "Печенье", emoji: "🍪", pronunciation: "peh-CHEN-ye", romanization: "pechen'ye", meaning: "Сладкая выпечка", example: "Печенье с шоколадной крошкой", example_romanization: "pechen'ye s shokoladnoy kroshkoy"}
      ],
      game_objects: [
        %{id: "bakery_bread", emoji: "🍞", word: "Хлеб", pronunciation: "hleb", romanization: "hleb"},
        %{id: "bakery_croissant", emoji: "🥐", word: "Круассан", pronunciation: "krwa-SAHN", romanization: "kruassan"},
        %{id: "bakery_cake", emoji: "🎂", word: "Торт", pronunciation: "tort", romanization: "tort"},
        %{id: "bakery_cookie", emoji: "🍪", word: "Печенье", pronunciation: "peh-CHEN-ye", romanization: "pechen'ye"}
      ],
      cards: [
        %{id: "bakery_bread", template: "Я хочу свежий _", answer: "хлеб", description: "Заказ в пекарне"},
        %{id: "bakery_croissant", template: "Масляный _", answer: "круассан", description: "Описание выпечки"},
        %{id: "bakery_cake", template: "_ на день рождения со свечами", answer: "Торт", description: "Праздничная еда"}
      ]
    }
  end

  # Japanese content
  defp get_japanese_content do
    %{
      title: "パン屋",
      description: "パン屋の商品と注文方法を学ぶ",
      emoji: "🥐",
      vocabulary: [
        %{id: "bakery_bread", word: "パン", emoji: "🍞", pronunciation: "pahn", romanization: "pan", meaning: "焼いた食べ物", example: "新鮮なパンはいい匂いがします", example_romanization: "shinsen na pan wa ii nioi ga shimasu"},
        %{id: "bakery_croissant", word: "クロワッサン", emoji: "🥐", pronunciation: "koo-roh-wah-sahn", romanization: "kurovassan", meaning: "フランスのお菓子", example: "バターのきいたフランスのクロワッサン", example_romanization: "bataa no kiita furansu no kurovassan"},
        %{id: "bakery_cake", word: "ケーキ", emoji: "🎂", pronunciation: "keh-kee", romanization: "keeki", meaning: "甘いデザート", example: "ろうそく付きの誕生日ケーキ", example_romanization: "rousoku tsuki no tanjoubi keeki"},
        %{id: "bakery_cookie", word: "クッキー", emoji: "🍪", pronunciation: "kuk-kee", romanization: "kukkii", meaning: "甘い焼き菓子", example: "チョコレートチップクッキー", example_romanization: "chokoreeto chippu kukkii"}
      ],
      game_objects: [
        %{id: "bakery_bread", emoji: "🍞", word: "パン", pronunciation: "pahn", romanization: "pan"},
        %{id: "bakery_croissant", emoji: "🥐", word: "クロワッサン", pronunciation: "koo-roh-wah-sahn", romanization: "kurovassan"},
        %{id: "bakery_cake", emoji: "🎂", word: "ケーキ", pronunciation: "keh-kee", romanization: "keeki"},
        %{id: "bakery_cookie", emoji: "🍪", word: "クッキー", pronunciation: "kuk-kee", romanization: "kukkii"}
      ],
      cards: [
        %{id: "bakery_bread", template: "新鮮な_がほしいです", answer: "パン", description: "パン屋での注文"},
        %{id: "bakery_croissant", template: "バターのきいた_", answer: "クロワッサン", description: "お菓子の説明"},
        %{id: "bakery_cake", template: "ろうそく付きの誕生日_", answer: "ケーキ", description: "お祝いの食べ物"}
      ]
    }
  end

  # Arabic content
  defp get_arabic_content do
    %{
      title: "المخبز",
      description: "تعلم منتجات المخبز وكيفية الطلب في المخبز",
      emoji: "🥐",
      vocabulary: [
        %{id: "bakery_bread", word: "خبز", emoji: "🍞", pronunciation: "hubz", romanization: "hubz", meaning: "طعام مخبوز", example: "الخبز الطازج رائحته رائعة", example_romanization: "al-hubz at-taazij raaihatuhu raa'ia"},
        %{id: "bakery_croissant", word: "كرواسان", emoji: "🥐", pronunciation: "kru-wa-saan", romanization: "kruvasaan", meaning: "معجنات فرنسية", example: "كرواسان فرنسي بالزبدة", example_romanization: "kruvasaan faransiy bil-zubda"},
        %{id: "bakery_cake", word: "كعكة", emoji: "🎂", pronunciation: "ka'ka", romanization: "ka'ka", meaning: "حلوى حلوة", example: "كعكة عيد ميلاد بالشموع", example_romanization: "ka'kat eid milaad bil-shumuu'"},
        %{id: "bakery_cookie", word: "بسكويت", emoji: "🍪", pronunciation: "bis-koo-eet", romanization: "biskuveet", meaning: "حلوى مخبوزة", example: "بسكويت برقائق الشوكولاتة", example_romanization: "biskuveet bi-raqaa'iq ash-shukulaata"}
      ],
      game_objects: [
        %{id: "bakery_bread", emoji: "🍞", word: "خبز", pronunciation: "hubz", romanization: "hubz"},
        %{id: "bakery_croissant", emoji: "🥐", word: "كرواسان", pronunciation: "kru-wa-saan", romanization: "kruvasaan"},
        %{id: "bakery_cake", emoji: "🎂", word: "كعكة", pronunciation: "ka'ka", romanization: "ka'ka"},
        %{id: "bakery_cookie", emoji: "🍪", word: "بسكويت", pronunciation: "bis-koo-eet", romanization: "biskuveet"}
      ],
      cards: [
        %{id: "bakery_bread", template: "أريد _ طازج", answer: "خبز", description: "الطلب في المخبز"},
        %{id: "bakery_croissant", template: "_ بالزبدة", answer: "كرواسان", description: "وصف المعجنات"},
        %{id: "bakery_cake", template: "_ عيد ميلاد بالشموع", answer: "كعكة", description: "طعام الاحتفال"}
      ]
    }
  end

  # Portuguese content
  defp get_portuguese_content do
    %{
      title: "Padaria",
      description: "Aprenda itens de padaria e como pedir numa padaria",
      emoji: "🥐",
      vocabulary: [
        %{id: "bakery_bread", word: "Pão", emoji: "🍞", pronunciation: "pow", meaning: "Alimento assado", example: "Pão fresco cheira maravilhoso"},
        %{id: "bakery_croissant", word: "Croissant", emoji: "🥐", pronunciation: "krwa-sahn", meaning: "Pastel francês", example: "Um croissant francês com manteiga"},
        %{id: "bakery_cake", word: "Bolo", emoji: "🎂", pronunciation: "BOH-loh", meaning: "Sobremesa doce", example: "Bolo de aniversário com velas"},
        %{id: "bakery_cookie", word: "Biscoito", emoji: "🍪", pronunciation: "bee-SKOY-toh", meaning: "Doce assado", example: "Biscoito com pedaços de chocolate"}
      ],
      game_objects: [
        %{id: "bakery_bread", emoji: "🍞", word: "Pão", pronunciation: "pow"},
        %{id: "bakery_croissant", emoji: "🥐", word: "Croissant", pronunciation: "krwa-sahn"},
        %{id: "bakery_cake", emoji: "🎂", word: "Bolo", pronunciation: "BOH-loh"},
        %{id: "bakery_cookie", emoji: "🍪", word: "Biscoito", pronunciation: "bee-SKOY-toh"}
      ],
      cards: [
        %{id: "bakery_bread", template: "Eu quero _ fresco", answer: "pão", description: "Pedir na padaria"},
        %{id: "bakery_croissant", template: "Um _ com manteiga", answer: "croissant", description: "Descrever pastel"},
        %{id: "bakery_cake", template: "_ de aniversário com velas", answer: "Bolo", description: "Comida de celebração"}
      ]
    }
  end

  # Italian content
  defp get_italian_content do
    %{
      title: "Panetteria",
      description: "Impara i prodotti da forno e come ordinare in panetteria",
      emoji: "🥐",
      vocabulary: [
        %{id: "bakery_bread", word: "Pane", emoji: "🍞", pronunciation: "PAH-neh", meaning: "Cibo cotto al forno", example: "Il pane fresco profuma meravigliosamente"},
        %{id: "bakery_croissant", word: "Cornetto", emoji: "🥐", pronunciation: "kor-NET-toh", meaning: "Dolce francese", example: "Un cornetto francese al burro"},
        %{id: "bakery_cake", word: "Torta", emoji: "🎂", pronunciation: "TOR-tah", meaning: "Dolce dessert", example: "Torta di compleanno con candeline"},
        %{id: "bakery_cookie", word: "Biscotto", emoji: "🍪", pronunciation: "bee-SKOT-toh", meaning: "Dolce cotto", example: "Biscotto con gocce di cioccolato"}
      ],
      game_objects: [
        %{id: "bakery_bread", emoji: "🍞", word: "Pane", pronunciation: "PAH-neh"},
        %{id: "bakery_croissant", emoji: "🥐", word: "Cornetto", pronunciation: "kor-NET-toh"},
        %{id: "bakery_cake", emoji: "🎂", word: "Torta", pronunciation: "TOR-tah"},
        %{id: "bakery_cookie", emoji: "🍪", word: "Biscotto", pronunciation: "bee-SKOT-toh"}
      ],
      cards: [
        %{id: "bakery_bread", template: "Voglio _ fresco", answer: "pane", description: "Ordinare in panetteria"},
        %{id: "bakery_croissant", template: "Un _ al burro", answer: "cornetto", description: "Descrivere dolci"},
        %{id: "bakery_cake", template: "_ di compleanno con candeline", answer: "Torta", description: "Cibo per festeggiare"}
      ]
    }
  end
end