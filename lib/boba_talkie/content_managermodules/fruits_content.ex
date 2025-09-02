defmodule BobaTalkie.ContentManagerModules.FruitsContent do
  @moduledoc """
  Fruits & Food topic content in multiple languages.
  Contains tutorial vocabulary, game objects, and challenge cards.
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
      title: "Fruits & Food",
      description: "Learn names of common fruits and food items",
      emoji: "🍎",
      vocabulary: [
        %{id: "fruit_apple", word: "Apple", emoji: "🍎", pronunciation: "ap-uhl", meaning: "A red or green fruit", example: "I eat an apple every day"},
        %{id: "fruit_banana", word: "Banana", emoji: "🍌", pronunciation: "buh-nan-uh", meaning: "A yellow curved fruit", example: "The banana is very sweet"},
        %{id: "fruit_orange", word: "Orange", emoji: "🍊", pronunciation: "or-inj", meaning: "A citrus fruit", example: "This orange is juicy"},
        %{id: "fruit_grape", word: "Grape", emoji: "🍇", pronunciation: "grayp", meaning: "Small round fruit", example: "I like purple grapes"},
        %{id: "fruit_strawberry", word: "Strawberry", emoji: "🍓", pronunciation: "straw-ber-ee", meaning: "A red berry", example: "Strawberries are delicious"},
        %{id: "fruit_cherry", word: "Cherry", emoji: "🍒", pronunciation: "cher-ee", meaning: "A small red fruit", example: "These cherries are sweet"},
        %{id: "fruit_peach", word: "Peach", emoji: "🍑", pronunciation: "peech", meaning: "A fuzzy orange fruit", example: "The peach is ripe"},
        %{id: "fruit_pineapple", word: "Pineapple", emoji: "🍍", pronunciation: "pai-nap-uhl", meaning: "A tropical fruit", example: "Pineapple pizza is controversial"},
        %{id: "fruit_watermelon", word: "Watermelon", emoji: "🍉", pronunciation: "waw-ter-mel-uhn", meaning: "A large green fruit", example: "Watermelon is refreshing in summer"},
        %{id: "fruit_lemon", word: "Lemon", emoji: "🍋", pronunciation: "lem-uhn", meaning: "A sour yellow fruit", example: "Add lemon to your tea"}
      ],
      game_objects: [
        %{id: "fruit_apple", emoji: "🍎", word: "Apple", pronunciation: "ap-uhl"},
        %{id: "fruit_banana", emoji: "🍌", word: "Banana", pronunciation: "buh-nan-uh"},
        %{id: "fruit_orange", emoji: "🍊", word: "Orange", pronunciation: "or-inj"},
        %{id: "fruit_grape", emoji: "🍇", word: "Grape", pronunciation: "grayp"},
        %{id: "fruit_strawberry", emoji: "🍓", word: "Strawberry", pronunciation: "straw-ber-ee"},
        %{id: "fruit_watermelon", emoji: "🍉", word: "Watermelon", pronunciation: "waw-ter-mel-uhn"},
        %{id: "fruit_cheese", emoji: "🧀", word: "Cheese", pronunciation: "cheez"},
        %{id: "fruit_egg", emoji: "🥚", word: "Egg", pronunciation: "eg"}
      ],
      cards: [
        %{id: "fruit_apple", template: "Eat the _", answer: "apple", description: "Enjoying a healthy snack"},
        %{id: "fruit_banana", template: "The _ is yellow", answer: "banana", description: "Describing fruit color"},
        %{id: "fruit_orange", template: "This _ is juicy", answer: "orange", description: "Describing fruit texture"},
        %{id: "fruit_grape", template: "I like purple _", answer: "grapes", description: "Expressing preference"}
      ]
    }
  end

  # Spanish content
  defp get_spanish_content do
    %{
      title: "Frutas y Comida",
      description: "Aprende nombres de frutas y alimentos comunes",
      emoji: "🍎",
      vocabulary: [
        %{id: "fruit_apple", word: "Manzana", emoji: "🍎", pronunciation: "man-sah-nah", meaning: "Una fruta roja o verde", example: "Como una manzana todos los días"},
        %{id: "fruit_banana", word: "Plátano", emoji: "🍌", pronunciation: "plah-tah-noh", meaning: "Una fruta amarilla curvada", example: "El plátano está muy dulce"},
        %{id: "fruit_orange", word: "Naranja", emoji: "🍊", pronunciation: "nah-rahn-hah", meaning: "Una fruta cítrica", example: "Esta naranja está jugosa"},
        %{id: "fruit_grape", word: "Uva", emoji: "🍇", pronunciation: "oo-vah", meaning: "Fruta pequeña y redonda", example: "Me gustan las uvas moradas"},
        %{id: "fruit_strawberry", word: "Fresa", emoji: "🍓", pronunciation: "freh-sah", meaning: "Una baya roja", example: "Las fresas están deliciosas"},
        %{id: "fruit_cherry", word: "Cereza", emoji: "🍒", pronunciation: "seh-reh-sah", meaning: "Una fruta pequeña y roja", example: "Estas cerezas están dulces"},
        %{id: "fruit_peach", word: "Durazno", emoji: "🍑", pronunciation: "doo-rahs-noh", meaning: "Una fruta naranja peluda", example: "El durazno está maduro"},
        %{id: "fruit_pineapple", word: "Piña", emoji: "🍍", pronunciation: "pee-nyah", meaning: "Una fruta tropical", example: "La pizza con piña es controversial"},
        %{id: "fruit_watermelon", word: "Sandía", emoji: "🍉", pronunciation: "san-dee-ah", meaning: "Una fruta grande y verde", example: "La sandía refresca en verano"},
        %{id: "fruit_lemon", word: "Limón", emoji: "🍋", pronunciation: "lee-mohn", meaning: "Una fruta amarilla ácida", example: "Añade limón a tu té"}
      ],
      game_objects: [
        %{id: "fruit_apple", emoji: "🍎", word: "Manzana", pronunciation: "man-sah-nah"},
        %{id: "fruit_banana", emoji: "🍌", word: "Plátano", pronunciation: "plah-tah-noh"},
        %{id: "fruit_orange", emoji: "🍊", word: "Naranja", pronunciation: "nah-rahn-hah"},
        %{id: "fruit_grape", emoji: "🍇", word: "Uva", pronunciation: "oo-vah"},
        %{id: "fruit_strawberry", emoji: "🍓", word: "Fresa", pronunciation: "freh-sah"},
        %{id: "fruit_watermelon", emoji: "🍉", word: "Sandía", pronunciation: "san-dee-ah"}
      ],
      cards: [
        %{id: "fruit_apple", template: "Come la _", answer: "manzana", description: "Disfrutando un snack saludable"},
        %{id: "fruit_banana", template: "El _ es amarillo", answer: "plátano", description: "Describiendo el color de la fruta"},
        %{id: "fruit_orange", template: "Esta _ está jugosa", answer: "naranja", description: "Describiendo la textura de la fruta"},
        %{id: "fruit_grape", template: "Me gustan las _ moradas", answer: "uvas", description: "Expresando preferencia"}
      ]
    }
  end

  # Chinese content with pinyin
  defp get_chinese_content do
    %{
      title: "水果和食物",
      description: "学习常见水果和食物的名称",
      emoji: "🍎",
      vocabulary: [
        %{id: "fruit_apple", word: "苹果", emoji: "🍎", pronunciation: "píng guǒ", romanization: "píng guǒ", meaning: "红色或绿色的水果", example: "我每天吃一个苹果", example_romanization: "wǒ měi tiān chī yī gè píng guǒ"},
        %{id: "fruit_banana", word: "香蕉", emoji: "🍌", pronunciation: "xiāng jiāo", romanization: "xiāng jiāo", meaning: "黄色弯曲的水果", example: "香蕉很甜", example_romanization: "xiāng jiāo hěn tián"},
        %{id: "fruit_orange", word: "橙子", emoji: "🍊", pronunciation: "chéng zi", romanization: "chéng zi", meaning: "柑橘类水果", example: "这个橙子很多汁", example_romanization: "zhè gè chéng zi hěn duō zhī"},
        %{id: "fruit_grape", word: "葡萄", emoji: "🍇", pronunciation: "pú táo", romanization: "pú táo", meaning: "小圆形水果", example: "我喜欢紫葡萄", example_romanization: "wǒ xǐ huān zǐ pú táo"},
        %{id: "fruit_strawberry", word: "草莓", emoji: "🍓", pronunciation: "cǎo méi", romanization: "cǎo méi", meaning: "红色浆果", example: "草莓很美味", example_romanization: "cǎo méi hěn měi wèi"},
        %{id: "fruit_cherry", word: "樱桃", emoji: "🍒", pronunciation: "yīng táo", romanization: "yīng táo", meaning: "小红水果", example: "这些樱桃很甜", example_romanization: "zhè xiē yīng táo hěn tián"},
        %{id: "fruit_peach", word: "桃子", emoji: "🍑", pronunciation: "táo zi", romanization: "táo zi", meaning: "毛茸茸的橙色水果", example: "桃子熟了", example_romanization: "táo zi shú le"},
        %{id: "fruit_pineapple", word: "菠萝", emoji: "🍍", pronunciation: "bō luó", romanization: "bō luó", meaning: "热带水果", example: "菠萝披萨很有争议", example_romanization: "bō luó pī sà hěn yǒu zhēng yì"},
        %{id: "fruit_watermelon", word: "西瓜", emoji: "🍉", pronunciation: "xī guā", romanization: "xī guā", meaning: "大的绿色水果", example: "西瓜在夏天很解渴", example_romanization: "xī guā zài xià tiān hěn jiě kě"},
        %{id: "fruit_lemon", word: "柠檬", emoji: "🍋", pronunciation: "níng méng", romanization: "níng méng", meaning: "酸的黄色水果", example: "在茶里加柠檬", example_romanization: "zài chá lǐ jiā níng méng"}
      ],
      game_objects: [
        %{id: "fruit_apple", emoji: "🍎", word: "苹果", pronunciation: "píng guǒ", romanization: "píng guǒ"},
        %{id: "fruit_banana", emoji: "🍌", word: "香蕉", pronunciation: "xiāng jiāo", romanization: "xiāng jiāo"},
        %{id: "fruit_orange", emoji: "🍊", word: "橙子", pronunciation: "chéng zi", romanization: "chéng zi"},
        %{id: "fruit_grape", emoji: "🍇", word: "葡萄", pronunciation: "pú táo", romanization: "pú táo"},
        %{id: "fruit_strawberry", emoji: "🍓", word: "草莓", pronunciation: "cǎo méi", romanization: "cǎo méi"},
        %{id: "fruit_watermelon", emoji: "🍉", word: "西瓜", pronunciation: "xī guā", romanization: "xī guā"}
      ],
      cards: [
        %{id: "fruit_apple", template: "吃_", answer: "苹果", romanization: "píng guǒ", description: "享用健康零食"},
        %{id: "fruit_banana", template: "_是黄色的", answer: "香蕉", romanization: "xiāng jiāo", description: "描述水果颜色"},
        %{id: "fruit_orange", template: "这个_很多汁", answer: "橙子", romanization: "chéng zi", description: "描述水果质地"},
        %{id: "fruit_grape", template: "我喜欢紫_", answer: "葡萄", romanization: "pú táo", description: "表达偏好"}
      ]
    }
  end

  # French content
  defp get_french_content do
    %{
      title: "Fruits et Nourriture",
      description: "Apprendre les noms des fruits et aliments courants",
      emoji: "🍎",
      vocabulary: [
        %{id: "fruit_apple", word: "Pomme", emoji: "🍎", pronunciation: "pom", meaning: "Un fruit rouge ou vert", example: "Je mange une pomme chaque jour"},
        %{id: "fruit_banana", word: "Banane", emoji: "🍌", pronunciation: "bah-NAHN", meaning: "Un fruit jaune courbé", example: "La banane est jaune"},
        %{id: "fruit_orange", word: "Orange", emoji: "🍊", pronunciation: "oh-RAHNZH", meaning: "Un agrume", example: "Le jus d'orange est sain"},
        %{id: "fruit_grape", word: "Raisin", emoji: "🍇", pronunciation: "ray-ZAN", meaning: "Petit fruit rond", example: "Les raisins violets sont sucrés"},
        %{id: "fruit_strawberry", word: "Fraise", emoji: "🍓", pronunciation: "frehz", meaning: "Une baie rouge", example: "Les fraises sont délicieuses"},
        %{id: "fruit_cherry", word: "Cerise", emoji: "🍒", pronunciation: "seh-REEZ", meaning: "Un petit fruit rouge", example: "Ces cerises sont sucrées"},
        %{id: "fruit_peach", word: "Pêche", emoji: "🍑", pronunciation: "pehsh", meaning: "Un fruit orange duveteux", example: "La pêche est mûre"},
        %{id: "fruit_pineapple", word: "Ananas", emoji: "🍍", pronunciation: "ah-nah-NAH", meaning: "Un fruit tropical", example: "L'ananas est sucré"},
        %{id: "fruit_watermelon", word: "Pastèque", emoji: "🍉", pronunciation: "pahs-TEHK", meaning: "Un gros fruit vert", example: "La pastèque rafraîchit en été"},
        %{id: "fruit_lemon", word: "Citron", emoji: "🍋", pronunciation: "see-TROHN", meaning: "Un fruit jaune acide", example: "Ajoute du citron au thé"},
        %{id: "fruit_avocado", word: "Avocat", emoji: "🥑", pronunciation: "ah-voh-KAH", meaning: "Un fruit vert crémeux", example: "L'avocat est nutritif"},
        %{id: "fruit_coconut", word: "Noix de coco", emoji: "🥥", pronunciation: "nwah duh koh-koh", meaning: "Un fruit tropical dur", example: "La noix de coco est exotique"},
        %{id: "fruit_mango", word: "Mangue", emoji: "🥭", pronunciation: "mahn-guh", meaning: "Un fruit tropical sucré", example: "La mangue est délicieuse"},
        %{id: "fruit_kiwi", word: "Kiwi", emoji: "🥝", pronunciation: "kee-wee", meaning: "Un petit fruit vert", example: "Le kiwi est acide"},
        %{id: "fruit_tomato", word: "Tomate", emoji: "🍅", pronunciation: "toh-MAHT", meaning: "Un légume rouge", example: "La tomate est juteuse"},
        %{id: "fruit_carrot", word: "Carotte", emoji: "🥕", pronunciation: "kah-ROHT", meaning: "Un légume orange", example: "La carotte est croquante"},
        %{id: "fruit_bread", word: "Pain", emoji: "🍞", pronunciation: "pan", meaning: "Aliment de base", example: "Le pain est frais"},
        %{id: "fruit_milk", word: "Lait", emoji: "🥛", pronunciation: "leh", meaning: "Boisson blanche", example: "Le lait est nutritif"},
        %{id: "fruit_cheese", word: "Fromage", emoji: "🧀", pronunciation: "froh-MAHZH", meaning: "Produit laitier", example: "Le fromage est savoureux"},
        %{id: "fruit_egg", word: "Œuf", emoji: "🥚", pronunciation: "uhf", meaning: "Produit de poule", example: "L'œuf est frais"}
      ],
      game_objects: [
        %{id: "fruit_apple", emoji: "🍎", word: "Pomme", pronunciation: "pom"},
        %{id: "fruit_banana", emoji: "🍌", word: "Banane", pronunciation: "bah-NAHN"},
        %{id: "fruit_orange", emoji: "🍊", word: "Orange", pronunciation: "oh-RAHNZH"},
        %{id: "fruit_grape", emoji: "🍇", word: "Raisin", pronunciation: "ray-ZAN"},
        %{id: "fruit_strawberry", emoji: "🍓", word: "Fraise", pronunciation: "frehz"},
        %{id: "fruit_watermelon", emoji: "🍉", word: "Pastèque", pronunciation: "pahs-TEHK"},
        %{id: "fruit_cheese", emoji: "🧀", word: "Fromage", pronunciation: "froh-MAHZH"},
        %{id: "fruit_egg", emoji: "🥚", word: "Œuf", pronunciation: "uhf"}
      ],
      cards: [
        %{id: "fruit_apple", template: "Mange la _", answer: "pomme", description: "Action avec fruit"},
        %{id: "fruit_banana", template: "La _ est jaune", answer: "banane", description: "Décrire la couleur du fruit"},
        %{id: "fruit_orange", template: "Cette _ est juteuse", answer: "orange", description: "Décrire la texture du fruit"},
        %{id: "fruit_grape", template: "J'aime les _ violets", answer: "raisins", description: "Exprimer une préférence"},
        %{id: "fruit_strawberry", template: "La _ est rouge", answer: "fraise", description: "Décrire la couleur du fruit"},
        %{id: "fruit_cherry", template: "Cette _ est sucrée", answer: "cerise", description: "Décrire le goût du fruit"},
        %{id: "fruit_peach", template: "La _ est mûre", answer: "pêche", description: "Décrire l'état du fruit"},
        %{id: "fruit_pineapple", template: "L'_ est tropical", answer: "ananas", description: "Décrire l'origine du fruit"},
        %{id: "fruit_watermelon", template: "La _ est rafraîchissante", answer: "pastèque", description: "Décrire l'effet du fruit"},
        %{id: "fruit_lemon", template: "Le _ est acide", answer: "citron", description: "Décrire le goût du fruit"},
        %{id: "fruit_avocado", template: "L'_ est vert", answer: "avocat", description: "Décrire la couleur du fruit"},
        %{id: "fruit_coconut", template: "La _ est dur", answer: "noix de coco", description: "Décrire la texture du fruit"},
        %{id: "fruit_mango", template: "La _ est exotique", answer: "mangue", description: "Décrire l'origine du fruit"},
        %{id: "fruit_kiwi", template: "Le _ est vert", answer: "kiwi", description: "Décrire la couleur du fruit"},
        %{id: "fruit_tomato", template: "La _ est rouge", answer: "tomate", description: "Décrire la couleur du légume"},
        %{id: "fruit_carrot", template: "La _ est orange", answer: "carotte", description: "Décrire la couleur du légume"},
        %{id: "fruit_bread", template: "Le _ est frais", answer: "pain", description: "Décrire l'état du pain"},
        %{id: "fruit_milk", template: "Le _ est blanc", answer: "lait", description: "Décrire la couleur du lait"},
        %{id: "fruit_cheese", template: "Le _ est délicieux", answer: "fromage", description: "Décrire le goût du fromage"},
        %{id: "fruit_egg", template: "L'_ est blanc", answer: "œuf", description: "Décrire la couleur de l'œuf"}
      ]
    }
  end

  # Japanese content with romanization
  defp get_japanese_content do
    %{
      title: "果物と食べ物",
      description: "一般的な果物と食品の名前を学ぶ",
      emoji: "🍎",
      vocabulary: [
        %{id: "fruit_apple", word: "りんご", emoji: "🍎", pronunciation: "reen-goh", romanization: "ringo", meaning: "赤や緑の果物", example: "毎日りんごを食べます", example_romanization: "mainichi ringo wo tabemasu"},
        %{id: "fruit_banana", word: "バナナ", emoji: "🍌", pronunciation: "bah-nah-nah", romanization: "banana", meaning: "黄色い曲がった果物", example: "バナナは黄色です", example_romanization: "banana wa kiiro desu"},
        %{id: "fruit_orange", word: "オレンジ", emoji: "🍊", pronunciation: "oh-ren-jee", romanization: "orenji", meaning: "柑橘類の果物", example: "オレンジジュースは健康的です", example_romanization: "orenji juusu wa kenkou-teki desu"},
        %{id: "fruit_grape", word: "ぶどう", emoji: "🍇", pronunciation: "boo-doh", romanization: "budou", meaning: "小さな丸い果物", example: "紫のぶどうは甘いです", example_romanization: "murasaki no budou wa amai desu"},
        %{id: "fruit_strawberry", word: "いちご", emoji: "🍓", pronunciation: "ee-chee-goh", romanization: "ichigo", meaning: "赤いベリー", example: "いちごは美味しいです", example_romanization: "ichigo wa oishii desu"},
        %{id: "fruit_cherry", word: "さくらんぼ", emoji: "🍒", pronunciation: "sah-koo-rahn-boh", romanization: "sakuranbo", meaning: "小さな赤い果物", example: "このさくらんぼは甘いです", example_romanization: "kono sakuranbo wa amai desu"},
        %{id: "fruit_peach", word: "桃", emoji: "🍑", pronunciation: "moh-moh", romanization: "momo", meaning: "毛深いオレンジの果物", example: "桃が熟しています", example_romanization: "momo ga jukushite imasu"},
        %{id: "fruit_pineapple", word: "パイナップル", emoji: "🍍", pronunciation: "pai-nah-ppu-ru", romanization: "painappuru", meaning: "熱帯の果物", example: "パイナップルは甘いです", example_romanization: "painappuru wa amai desu"},
        %{id: "fruit_watermelon", word: "すいか", emoji: "🍉", pronunciation: "soo-ee-kah", romanization: "suika", meaning: "大きな緑の果物", example: "夏にすいかは爽やかです", example_romanization: "natsu ni suika wa sawayaka desu"},
        %{id: "fruit_lemon", word: "レモン", emoji: "🍋", pronunciation: "reh-mohn", romanization: "remon", meaning: "酸っぱい黄色い果物", example: "お茶にレモンを加える", example_romanization: "ocha ni remon wo kuwaeru"}
      ],
      game_objects: [
        %{id: "fruit_apple", emoji: "🍎", word: "りんご", pronunciation: "reen-goh", romanization: "ringo"},
        %{id: "fruit_banana", emoji: "🍌", word: "バナナ", pronunciation: "bah-nah-nah", romanization: "banana"},
        %{id: "fruit_orange", emoji: "🍊", word: "オレンジ", pronunciation: "oh-ren-jee", romanization: "orenji"},
        %{id: "fruit_grape", emoji: "🍇", word: "ぶどう", pronunciation: "boo-doh", romanization: "budou"},
        %{id: "fruit_strawberry", emoji: "🍓", word: "いちご", pronunciation: "ee-chee-goh", romanization: "ichigo"},
        %{id: "fruit_watermelon", emoji: "🍉", word: "すいか", pronunciation: "soo-ee-kah", romanization: "suika"}
      ],
      cards: [
        %{id: "fruit_apple", template: "_を食べる", answer: "りんご", romanization: "ringo", description: "果物に関する動作"},
        %{id: "fruit_banana", template: "_は黄色です", answer: "バナナ", romanization: "banana", description: "果物の色を説明"},
        %{id: "fruit_orange", template: "この_はおいしい", answer: "オレンジ", romanization: "orenji", description: "果物の質感を説明"},
        %{id: "fruit_grape", template: "_が好きです", answer: "ぶどう", romanization: "budou", description: "好みを表現"}
      ]
    }
  end

  # Russian content with romanization  
  defp get_russian_content do
    %{
      title: "Фрукты и Еда",
      description: "Изучить названия распространенных фруктов и продуктов",
      emoji: "🍎",
      vocabulary: [
        %{id: "fruit_apple", word: "Яблоко", emoji: "🍎", pronunciation: "YAHB-lah-kah", romanization: "yabloko", meaning: "Красный или зеленый фрукт", example: "Я ем яблоко каждый день", example_romanization: "ya yem yabloko kazhdyy den'"},
        %{id: "fruit_banana", word: "Банан", emoji: "🍌", pronunciation: "bah-NAHN", romanization: "banan", meaning: "Желтый изогнутый фрукт", example: "Банан желтый", example_romanization: "banan zheltyy"},
        %{id: "fruit_orange", word: "Апельсин", emoji: "🍊", pronunciation: "ah-peel-SEEN", romanization: "apel'sin", meaning: "Цитрусовый фрукт", example: "Апельсиновый сок полезен", example_romanization: "apel'sinovyy sok polezen"},
        %{id: "fruit_grape", word: "Виноград", emoji: "🍇", pronunciation: "vee-nah-GRAHT", romanization: "vinograd", meaning: "Маленький круглый фрукт", example: "Фиолетовый виноград сладкий", example_romanization: "fioletovyy vinograd sladkiy"},
        %{id: "fruit_strawberry", word: "Клубника", emoji: "🍓", pronunciation: "kloob-NEE-kah", romanization: "klubnika", meaning: "Красная ягода", example: "Клубника очень вкусная", example_romanization: "klubnika ochen' vkusnaya"},
        %{id: "fruit_cherry", word: "Вишня", emoji: "🍒", pronunciation: "VEESH-nyah", romanization: "vishnya", meaning: "Маленький красный фрукт", example: "Эти вишни сладкие", example_romanization: "eti vishni sladkie"},
        %{id: "fruit_peach", word: "Персик", emoji: "🍑", pronunciation: "PER-seek", romanization: "persik", meaning: "Пушистый оранжевый фрукт", example: "Персик спелый", example_romanization: "persik spelyy"},
        %{id: "fruit_pineapple", word: "Ананас", emoji: "🍍", pronunciation: "ah-nah-NAHS", romanization: "ananas", meaning: "Тропический фрукт", example: "Ананас сладкий", example_romanization: "ananas sladkiy"},
        %{id: "fruit_watermelon", word: "Арбуз", emoji: "🍉", pronunciation: "ar-BOOZ", romanization: "arbuz", meaning: "Большой зеленый фрукт", example: "Арбуз освежает летом", example_romanization: "arbuz osvezhayet letom"},
        %{id: "fruit_lemon", word: "Лимон", emoji: "🍋", pronunciation: "lee-MOHN", romanization: "limon", meaning: "Кислый желтый фрукт", example: "Добавь лимон в чай", example_romanization: "dobav' limon v chay"}
      ],
      game_objects: [
        %{id: "fruit_apple", emoji: "🍎", word: "Яблоко", pronunciation: "YAHB-lah-kah", romanization: "yabloko"},
        %{id: "fruit_banana", emoji: "🍌", word: "Банан", pronunciation: "bah-NAHN", romanization: "banan"},
        %{id: "fruit_orange", emoji: "🍊", word: "Апельсин", pronunciation: "ah-peel-SEEN", romanization: "apel'sin"},
        %{id: "fruit_grape", emoji: "🍇", word: "Виноград", pronunciation: "vee-nah-GRAHT", romanization: "vinograd"},
        %{id: "fruit_strawberry", emoji: "🍓", word: "Клубника", pronunciation: "kloob-NEE-kah", romanization: "klubnika"},
        %{id: "fruit_watermelon", emoji: "🍉", word: "Арбуз", pronunciation: "ar-BOOZ", romanization: "arbuz"}
      ],
      cards: [
        %{id: "fruit_apple", template: "Съешь _", answer: "яблоко", romanization: "yabloko", description: "Действие с фруктом"},
        %{id: "fruit_banana", template: "_ желтый", answer: "Банан", romanization: "banan", description: "Описание цвета фрукта"},
        %{id: "fruit_orange", template: "Этот _ сочный", answer: "апельсин", romanization: "apel'sin", description: "Описание текстуры фрукта"},
        %{id: "fruit_grape", template: "Мне нравится _", answer: "виноград", romanization: "vinograd", description: "Выражение предпочтения"}
      ]
    }
  end

  # Arabic content with romanization
  defp get_arabic_content do
    %{
      title: "الفواكه والطعام",
      description: "تعلم أسماء الفواكه والأطعمة الشائعة",
      emoji: "🍎",
      vocabulary: [
        %{id: "fruit_apple", word: "تفاحة", emoji: "🍎", pronunciation: "tuf-fa-ha", romanization: "tuffaha", meaning: "فاكهة حمراء أو خضراء", example: "آكل تفاحة كل يوم", example_romanization: "akul tuffaha kull yawm"},
        %{id: "fruit_banana", word: "موز", emoji: "🍌", pronunciation: "mawz", romanization: "mawz", meaning: "فاكهة صفراء منحنية", example: "الموز أصفر", example_romanization: "al-mawz asfar"},
        %{id: "fruit_orange", word: "برتقال", emoji: "🍊", pronunciation: "bur-tu-qaal", romanization: "burtuqaal", meaning: "فاكهة حمضية", example: "عصير البرتقال صحي", example_romanization: "aseer al-burtuqaal sahhi"},
        %{id: "fruit_grape", word: "عنب", emoji: "🍇", pronunciation: "i-nab", romanization: "inab", meaning: "فاكهة صغيرة مستديرة", example: "العنب الأرجواني حلو", example_romanization: "al-inab al-urjuwaani hulw"},
        %{id: "fruit_strawberry", word: "فراولة", emoji: "🍓", pronunciation: "fa-ra-wi-la", romanization: "farawila", meaning: "توت أحمر", example: "الفراولة لذيذة جداً", example_romanization: "al-farawila ladheedha jiddan"},
        %{id: "fruit_cherry", word: "كرز", emoji: "🍒", pronunciation: "ka-raz", romanization: "karaz", meaning: "فاكهة صغيرة حمراء", example: "هذا الكرز حلو", example_romanization: "hatha al-karaz hulw"},
        %{id: "fruit_peach", word: "خوخ", emoji: "🍑", pronunciation: "khawkh", romanization: "khawkh", meaning: "فاكهة برتقالية ناعمة", example: "الخوخ ناضج", example_romanization: "al-khawkh nadhij"},
        %{id: "fruit_pineapple", word: "أناناس", emoji: "🍍", pronunciation: "a-na-naas", romanization: "ananaas", meaning: "فاكهة استوائية", example: "الأناناس حلو", example_romanization: "al-ananaas hulw"},
        %{id: "fruit_watermelon", word: "بطيخ", emoji: "🍉", pronunciation: "ba-teekh", romanization: "bateekh", meaning: "فاكهة كبيرة خضراء", example: "البطيخ منعش في الصيف", example_romanization: "al-bateekh mun'ish fi al-sayf"},
        %{id: "fruit_lemon", word: "ليمون", emoji: "🍋", pronunciation: "lay-moon", romanization: "laymoon", meaning: "فاكهة صفراء حامضة", example: "أضف الليمون للشاي", example_romanization: "adhif al-laymoon li al-shaay"}
      ],
      game_objects: [
        %{id: "fruit_apple", emoji: "🍎", word: "تفاحة", pronunciation: "tuf-fa-ha", romanization: "tuffaha"},
        %{id: "fruit_banana", emoji: "🍌", word: "موز", pronunciation: "mawz", romanization: "mawz"},
        %{id: "fruit_orange", emoji: "🍊", word: "برتقال", pronunciation: "bur-tu-qaal", romanization: "burtuqaal"},
        %{id: "fruit_grape", emoji: "🍇", word: "عنب", pronunciation: "i-nab", romanization: "inab"},
        %{id: "fruit_strawberry", emoji: "🍓", word: "فراولة", pronunciation: "fa-ra-wi-la", romanization: "farawila"},
        %{id: "fruit_watermelon", emoji: "🍉", word: "بطيخ", pronunciation: "ba-teekh", romanization: "bateekh"}
      ],
      cards: [
        %{id: "fruit_apple", template: "كل _", answer: "تفاحة", romanization: "tuffaha", description: "عمل مع الفاكهة"},
        %{id: "fruit_banana", template: "_ أصفر", answer: "الموز", romanization: "al-mawz", description: "وصف لون الفاكهة"},
        %{id: "fruit_orange", template: "هذا _ عصيري", answer: "البرتقال", romanization: "al-burtuqaal", description: "وصف ملمس الفاكهة"},
        %{id: "fruit_grape", template: "أحب _", answer: "العنب", romanization: "al-inab", description: "تعبير عن التفضيل"}
      ]
    }
  end

  # Italian content
  defp get_italian_content do
    %{
      title: "Frutta e Cibo",
      description: "Impara i nomi di frutta e cibi comuni",
      emoji: "🍎",
      vocabulary: [
        %{id: "fruit_apple", word: "Mela", emoji: "🍎", pronunciation: "MEH-lah", meaning: "Un frutto rosso o verde", example: "Mangio una mela ogni giorno"},
        %{id: "fruit_banana", word: "Banana", emoji: "🍌", pronunciation: "bah-NAH-nah", meaning: "Un frutto giallo curvo", example: "La banana è gialla"},
        %{id: "fruit_orange", word: "Arancia", emoji: "🍊", pronunciation: "ah-RAHN-chah", meaning: "Un agrume", example: "Il succo d'arancia è salutare"},
        %{id: "fruit_grape", word: "Uva", emoji: "🍇", pronunciation: "OO-vah", meaning: "Piccolo frutto rotondo", example: "L'uva viola è dolce"},
        %{id: "fruit_strawberry", word: "Fragola", emoji: "🍓", pronunciation: "FRAH-goh-lah", meaning: "Una bacca rossa", example: "Le fragole sono deliziose"},
        %{id: "fruit_cherry", word: "Ciliegia", emoji: "🍒", pronunciation: "chee-lee-EH-jah", meaning: "Un piccolo frutto rosso", example: "Queste ciliegie sono dolci"},
        %{id: "fruit_peach", word: "Pesca", emoji: "🍑", pronunciation: "PEH-skah", meaning: "Un frutto arancione peloso", example: "La pesca è matura"},
        %{id: "fruit_pineapple", word: "Ananas", emoji: "🍍", pronunciation: "AH-nah-nahs", meaning: "Un frutto tropicale", example: "L'ananas è dolce"},
        %{id: "fruit_watermelon", word: "Cocomero", emoji: "🍉", pronunciation: "koh-koh-MEH-roh", meaning: "Un grosso frutto verde", example: "Il cocomero rinfresca d'estate"},
        %{id: "fruit_lemon", word: "Limone", emoji: "🍋", pronunciation: "lee-MOH-neh", meaning: "Un frutto giallo aspro", example: "Aggiungi il limone al tè"}
      ],
      game_objects: [
        %{id: "fruit_apple", emoji: "🍎", word: "Mela", pronunciation: "MEH-lah"},
        %{id: "fruit_banana", emoji: "🍌", word: "Banana", pronunciation: "bah-NAH-nah"},
        %{id: "fruit_orange", emoji: "🍊", word: "Arancia", pronunciation: "ah-RAHN-chah"},
        %{id: "fruit_grape", emoji: "🍇", word: "Uva", pronunciation: "OO-vah"},
        %{id: "fruit_strawberry", emoji: "🍓", word: "Fragola", pronunciation: "FRAH-goh-lah"},
        %{id: "fruit_watermelon", emoji: "🍉", word: "Cocomero", pronunciation: "koh-koh-MEH-roh"}
      ],
      cards: [
        %{id: "fruit_apple", template: "Mangia la _", answer: "mela", description: "Azione con frutta"},
        %{id: "fruit_banana", template: "La _ è gialla", answer: "banana", description: "Descrive il colore del frutto"},
        %{id: "fruit_orange", template: "Questa _ è succosa", answer: "arancia", description: "Descrive la consistenza del frutto"},
        %{id: "fruit_grape", template: "Mi piace l'_", answer: "uva", description: "Esprime preferenza"}
      ]
    }
  end

  # Portuguese content
  defp get_portuguese_content do
    %{
      title: "Frutas e Comida",
      description: "Aprenda nomes de frutas e alimentos comuns",
      emoji: "🍎",
      vocabulary: [
        %{id: "fruit_apple", word: "Maçã", emoji: "🍎", pronunciation: "mah-SAH", meaning: "Uma fruta vermelha ou verde", example: "Eu como uma maçã todo dia"},
        %{id: "fruit_banana", word: "Banana", emoji: "🍌", pronunciation: "bah-NAH-nah", meaning: "Uma fruta amarela curvada", example: "A banana é amarela"},
        %{id: "fruit_orange", word: "Laranja", emoji: "🍊", pronunciation: "lah-RAHN-jah", meaning: "Uma fruta cítrica", example: "Suco de laranja é saudável"},
        %{id: "fruit_grape", word: "Uva", emoji: "🍇", pronunciation: "OO-vah", meaning: "Fruta pequena e redonda", example: "As uvas roxas são doces"},
        %{id: "fruit_strawberry", word: "Morango", emoji: "🍓", pronunciation: "moh-RAHN-goh", meaning: "Uma fruta vermelha pequena", example: "Os morangos são deliciosos"},
        %{id: "fruit_cherry", word: "Cereja", emoji: "🍒", pronunciation: "seh-REH-jah", meaning: "Uma fruta pequena vermelha", example: "Essas cerejas são doces"},
        %{id: "fruit_peach", word: "Pêssego", emoji: "🍑", pronunciation: "PEH-seh-goh", meaning: "Uma fruta laranja aveludada", example: "O pêssego está maduro"},
        %{id: "fruit_pineapple", word: "Abacaxi", emoji: "🍍", pronunciation: "ah-bah-kah-SHEE", meaning: "Uma fruta tropical", example: "O abacaxi é doce"},
        %{id: "fruit_watermelon", word: "Melancia", emoji: "🍉", pronunciation: "meh-lahn-SEE-ah", meaning: "Uma fruta grande e verde", example: "A melancia refresca no verão"},
        %{id: "fruit_lemon", word: "Limão", emoji: "🍋", pronunciation: "lee-MOWN", meaning: "Uma fruta amarela azeda", example: "Adicione limão ao chá"}
      ],
      game_objects: [
        %{id: "fruit_apple", emoji: "🍎", word: "Maçã", pronunciation: "mah-SAH"},
        %{id: "fruit_banana", emoji: "🍌", word: "Banana", pronunciation: "bah-NAH-nah"},
        %{id: "fruit_orange", emoji: "🍊", word: "Laranja", pronunciation: "lah-RAHN-jah"},
        %{id: "fruit_grape", emoji: "🍇", word: "Uva", pronunciation: "OO-vah"},
        %{id: "fruit_strawberry", emoji: "🍓", word: "Morango", pronunciation: "moh-RAHN-goh"},
        %{id: "fruit_watermelon", emoji: "🍉", word: "Melancia", pronunciation: "meh-lahn-SEE-ah"}
      ],
      cards: [
        %{id: "fruit_apple", template: "Coma a _", answer: "maçã", description: "Ação com fruta"},
        %{id: "fruit_banana", template: "A _ é amarela", answer: "banana", description: "Descreve a cor da fruta"},
        %{id: "fruit_orange", template: "Esta _ é suculenta", answer: "laranja", description: "Descreve a textura da fruta"},
        %{id: "fruit_grape", template: "Eu gosto de _", answer: "uvas", description: "Expressa preferência"}
      ]
    }
  end
end