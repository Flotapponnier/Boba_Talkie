defmodule BobaTalkie.ContentManagerModules.ColorsContent do
  @moduledoc """
  Colors topic content in multiple languages.
  Contains tutorial vocabulary, game objects, and challenge cards for learning colors.
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
      title: "Colors",
      description: "Learn color names and descriptions",
      emoji: "🌈",
      vocabulary: [
        %{id: "color_red", word: "Red", emoji: "🔴", pronunciation: "red", meaning: "Primary color", example: "The apple is red"},
        %{id: "color_blue", word: "Blue", emoji: "🔵", pronunciation: "bloo", meaning: "Primary color", example: "The sky is blue"},
        %{id: "color_green", word: "Green", emoji: "🟢", pronunciation: "green", meaning: "Secondary color", example: "The grass is green"},
        %{id: "color_yellow", word: "Yellow", emoji: "🟡", pronunciation: "YEL-oh", meaning: "Primary color", example: "The sun is yellow"},
        %{id: "color_orange", word: "Orange", emoji: "🟠", pronunciation: "OR-inj", meaning: "Secondary color", example: "The orange fruit is orange"},
        %{id: "color_purple", word: "Purple", emoji: "🟣", pronunciation: "PUR-puhl", meaning: "Secondary color", example: "The grape is purple"},
        %{id: "color_pink", word: "Pink", emoji: "🩷", pronunciation: "pink", meaning: "Light red", example: "The flower is pink"},
        %{id: "color_brown", word: "Brown", emoji: "🤎", pronunciation: "brown", meaning: "Earth color", example: "The tree is brown"},
        %{id: "color_black", word: "Black", emoji: "⚫", pronunciation: "blak", meaning: "Absence of color", example: "The night is black"},
        %{id: "color_white", word: "White", emoji: "⚪", pronunciation: "wahyt", meaning: "All colors", example: "The snow is white"},
        %{id: "color_gray", word: "Gray", emoji: "🩶", pronunciation: "gray", meaning: "Mix of black and white", example: "The cloud is gray"}
      ],
      game_objects: [
        %{id: "color_red", emoji: "🔴", word: "Red", pronunciation: "red"},
        %{id: "color_blue", emoji: "🔵", word: "Blue", pronunciation: "bloo"},
        %{id: "color_green", emoji: "🟢", word: "Green", pronunciation: "green"},
        %{id: "color_yellow", emoji: "🟡", word: "Yellow", pronunciation: "YEL-oh"},
        %{id: "color_orange", emoji: "🟠", word: "Orange", pronunciation: "OR-inj"},
        %{id: "color_purple", emoji: "🟣", word: "Purple", pronunciation: "PUR-puhl"},
        %{id: "color_pink", emoji: "🩷", word: "Pink", pronunciation: "pink"},
        %{id: "color_brown", emoji: "🤎", word: "Brown", pronunciation: "brown"},
        %{id: "color_black", emoji: "⚫", word: "Black", pronunciation: "blak"},
        %{id: "color_white", emoji: "⚪", word: "White", pronunciation: "wahyt"},
        %{id: "color_gray", emoji: "🩶", word: "Gray", pronunciation: "gray"}
      ],
      cards: [
        %{id: "color_red", template: "The apple is _", answer: "Red", description: "Describing object colors"},
        %{id: "color_blue", template: "The sky is _", answer: "Blue", description: "Natural color association"},
        %{id: "color_green", template: "The grass is _", answer: "Green", description: "Nature color"},
        %{id: "color_yellow", template: "The sun is _", answer: "Yellow", description: "Celestial color"},
        %{id: "color_orange", template: "The _ fruit is orange", answer: "Orange", description: "Fruit and color match"},
        %{id: "color_purple", template: "The grape is _", answer: "Purple", description: "Fruit color"},
        %{id: "color_pink", template: "The flower is _", answer: "Pink", description: "Flower color"},
        %{id: "color_brown", template: "The tree is _", answer: "Brown", description: "Tree color"},
        %{id: "color_black", template: "The night is _", answer: "Black", description: "Time color"},
        %{id: "color_white", template: "The snow is _", answer: "White", description: "Weather color"}
      ]
    }
  end

  # Spanish content
  defp get_spanish_content do
    %{
      title: "Colores",
      description: "Aprende nombres de colores y descripciones",
      emoji: "🌈",
      vocabulary: [
        %{id: "color_red", word: "Rojo", emoji: "🔴", pronunciation: "ROH-ho", meaning: "Color primario", example: "La manzana es roja"},
        %{id: "color_blue", word: "Azul", emoji: "🔵", pronunciation: "ah-SOOL", meaning: "Color primario", example: "El cielo es azul"},
        %{id: "color_green", word: "Verde", emoji: "🟢", pronunciation: "VEHR-deh", meaning: "Color secundario", example: "La hierba es verde"},
        %{id: "color_yellow", word: "Amarillo", emoji: "🟡", pronunciation: "ah-mah-REE-yoh", meaning: "Color primario", example: "El sol es amarillo"},
        %{id: "color_orange", word: "Naranja", emoji: "🟠", pronunciation: "nah-RAHN-ha", meaning: "Color secundario", example: "La naranja es naranja"},
        %{id: "color_purple", word: "Morado", emoji: "🟣", pronunciation: "moh-RAH-doh", meaning: "Color secundario", example: "La uva es morada"},
        %{id: "color_pink", word: "Rosa", emoji: "🩷", pronunciation: "ROH-sah", meaning: "Rojo claro", example: "La flor es rosa"},
        %{id: "color_brown", word: "Marrón", emoji: "🤎", pronunciation: "mah-RROHN", meaning: "Color tierra", example: "El árbol es marrón"},
        %{id: "color_black", word: "Negro", emoji: "⚫", pronunciation: "NEH-groh", meaning: "Ausencia de color", example: "La noche es negra"},
        %{id: "color_white", word: "Blanco", emoji: "⚪", pronunciation: "BLAHN-koh", meaning: "Todos los colores", example: "La nieve es blanca"},
        %{id: "color_gray", word: "Gris", emoji: "🩶", pronunciation: "grees", meaning: "Mezcla de negro y blanco", example: "La nube es gris"}
      ],
      game_objects: [
        %{id: "color_red", emoji: "🔴", word: "Rojo", pronunciation: "ROH-ho"},
        %{id: "color_blue", emoji: "🔵", word: "Azul", pronunciation: "ah-SOOL"},
        %{id: "color_green", emoji: "🟢", word: "Verde", pronunciation: "VEHR-deh"},
        %{id: "color_yellow", emoji: "🟡", word: "Amarillo", pronunciation: "ah-mah-REE-yoh"},
        %{id: "color_orange", emoji: "🟠", word: "Naranja", pronunciation: "nah-RAHN-ha"},
        %{id: "color_purple", emoji: "🟣", word: "Morado", pronunciation: "moh-RAH-doh"},
        %{id: "color_pink", emoji: "🩷", word: "Rosa", pronunciation: "ROH-sah"},
        %{id: "color_brown", emoji: "🤎", word: "Marrón", pronunciation: "mah-RROHN"},
        %{id: "color_black", emoji: "⚫", word: "Negro", pronunciation: "NEH-groh"},
        %{id: "color_white", emoji: "⚪", word: "Blanco", pronunciation: "BLAHN-koh"},
        %{id: "color_gray", emoji: "🩶", word: "Gris", pronunciation: "grees"}
      ],
      cards: [
        %{id: "color_red", template: "La manzana es _", answer: "Roja", description: "Describiendo colores de objetos"},
        %{id: "color_blue", template: "El cielo es _", answer: "Azul", description: "Asociación de color natural"},
        %{id: "color_green", template: "La hierba es _", answer: "Verde", description: "Color de la naturaleza"},
        %{id: "color_yellow", template: "El sol es _", answer: "Amarillo", description: "Color celestial"},
        %{id: "color_orange", template: "La _ es naranja", answer: "Naranja", description: "Fruta y color coinciden"},
        %{id: "color_purple", template: "La uva es _", answer: "Morada", description: "Color de fruta"},
        %{id: "color_pink", template: "La flor es _", answer: "Rosa", description: "Color de flor"},
        %{id: "color_brown", template: "El árbol es _", answer: "Marrón", description: "Color de árbol"},
        %{id: "color_black", template: "La noche es _", answer: "Negra", description: "Color del tiempo"},
        %{id: "color_white", template: "La nieve es _", answer: "Blanca", description: "Color del clima"}
      ]
    }
  end

  # Chinese content
  defp get_chinese_content do
    %{
      title: "颜色",
      description: "学习颜色名称和描述",
      emoji: "🌈",
      vocabulary: [
        %{id: "color_red", word: "红色", emoji: "🔴", pronunciation: "hóng sè", romanization: "hóng sè", meaning: "基本颜色", example: "苹果是红色的", example_romanization: "píng guǒ shì hóng sè de"},
        %{id: "color_blue", word: "蓝色", emoji: "🔵", pronunciation: "lán sè", romanization: "lán sè", meaning: "基本颜色", example: "天空是蓝色的", example_romanization: "tiān kōng shì lán sè de"},
        %{id: "color_green", word: "绿色", emoji: "🟢", pronunciation: "lǜ sè", romanization: "lǜ sè", meaning: "次要颜色", example: "草是绿色的", example_romanization: "cǎo shì lǜ sè de"},
        %{id: "color_yellow", word: "黄色", emoji: "🟡", pronunciation: "huáng sè", romanization: "huáng sè", meaning: "基本颜色", example: "太阳是黄色的", example_romanization: "tài yáng shì huáng sè de"},
        %{id: "color_orange", word: "橙色", emoji: "🟠", pronunciation: "chéng sè", romanization: "chéng sè", meaning: "次要颜色", example: "橙子是橙色的", example_romanization: "chéng zi shì chéng sè de"},
        %{id: "color_purple", word: "紫色", emoji: "🟣", pronunciation: "zǐ sè", romanization: "zǐ sè", meaning: "次要颜色", example: "葡萄是紫色的", example_romanization: "pú táo shì zǐ sè de"},
        %{id: "color_pink", word: "粩色", emoji: "🩷", pronunciation: "fěn sè", romanization: "fěn sè", meaning: "浅红色", example: "花是粩色的", example_romanization: "huā shì fěn sè de"},
        %{id: "color_brown", word: "棕色", emoji: "🤎", pronunciation: "zōng sè", romanization: "zōng sè", meaning: "土色", example: "树是棕色的", example_romanization: "shù shì zōng sè de"},
        %{id: "color_black", word: "黑色", emoji: "⚫", pronunciation: "hēi sè", romanization: "hēi sè", meaning: "无色", example: "夜晚是黑色的", example_romanization: "yè wǎn shì hēi sè de"},
        %{id: "color_white", word: "白色", emoji: "⚪", pronunciation: "bái sè", romanization: "bái sè", meaning: "所有颜色", example: "雪是白色的", example_romanization: "xuě shì bái sè de"},
        %{id: "color_gray", word: "灰色", emoji: "🩶", pronunciation: "huī sè", romanization: "huī sè", meaning: "黑白混合", example: "云是灰色的", example_romanization: "yún shì huī sè de"}
      ],
      game_objects: [
        %{id: "color_red", emoji: "🔴", word: "红色", pronunciation: "hóng sè", romanization: "hóng sè"},
        %{id: "color_blue", emoji: "🔵", word: "蓝色", pronunciation: "lán sè", romanization: "lán sè"},
        %{id: "color_green", emoji: "🟢", word: "绿色", pronunciation: "lǜ sè", romanization: "lǜ sè"},
        %{id: "color_yellow", emoji: "🟡", word: "黄色", pronunciation: "huáng sè", romanization: "huáng sè"},
        %{id: "color_orange", emoji: "🟠", word: "橙色", pronunciation: "chéng sè", romanization: "chéng sè"},
        %{id: "color_purple", emoji: "🟣", word: "紫色", pronunciation: "zǐ sè", romanization: "zǐ sè"},
        %{id: "color_pink", emoji: "🩷", word: "粩色", pronunciation: "fěn sè", romanization: "fěn sè"},
        %{id: "color_brown", emoji: "🤎", word: "棕色", pronunciation: "zōng sè", romanization: "zōng sè"},
        %{id: "color_black", emoji: "⚫", word: "黑色", pronunciation: "hēi sè", romanization: "hēi sè"},
        %{id: "color_white", emoji: "⚪", word: "白色", pronunciation: "bái sè", romanization: "bái sè"},
        %{id: "color_gray", emoji: "🩶", word: "灰色", pronunciation: "huī sè", romanization: "huī sè"}
      ],
      cards: [
        %{id: "color_red", template: "苹果是_的", answer: "红色", romanization: "hóng sè", description: "描述物体颜色"},
        %{id: "color_blue", template: "天空是_的", answer: "蓝色", romanization: "lán sè", description: "自然色彩联想"},
        %{id: "color_green", template: "草是_的", answer: "绿色", romanization: "lǜ sè", description: "自然颜色"},
        %{id: "color_yellow", template: "太阳是_的", answer: "黄色", romanization: "huáng sè", description: "天体颜色"},
        %{id: "color_orange", template: "_是橙色的", answer: "橙子", romanization: "chéng zi", description: "水果和颜色匹配"},
        %{id: "color_purple", template: "葡萄是_的", answer: "紫色", romanization: "zǐ sè", description: "水果颜色"},
        %{id: "color_pink", template: "花是_的", answer: "粩色", romanization: "fěn sè", description: "花的颜色"},
        %{id: "color_brown", template: "树是_的", answer: "棕色", romanization: "zōng sè", description: "树的颜色"},
        %{id: "color_black", template: "夜晚是_的", answer: "黑色", romanization: "hēi sè", description: "时间颜色"},
        %{id: "color_white", template: "雪是_的", answer: "白色", romanization: "bái sè", description: "天气颜色"}
      ]
    }
  end

  # French content
  defp get_french_content do
    %{
      title: "Couleurs",
      description: "Apprendre les noms des couleurs et les descriptions",
      emoji: "🌈",
      vocabulary: [
        %{id: "color_red", word: "Rouge", emoji: "🔴", pronunciation: "roozh", meaning: "Couleur primaire", example: "La pomme est rouge"},
        %{id: "color_blue", word: "Bleu", emoji: "🔵", pronunciation: "bluh", meaning: "Couleur primaire", example: "Le ciel est bleu"},
        %{id: "color_green", word: "Vert", emoji: "🟢", pronunciation: "vehr", meaning: "Couleur secondaire", example: "L'herbe est verte"},
        %{id: "color_yellow", word: "Jaune", emoji: "🟡", pronunciation: "zhohn", meaning: "Couleur primaire", example: "Le soleil est jaune"},
        %{id: "color_orange", word: "Orange", emoji: "🟠", pronunciation: "oh-rahnzh", meaning: "Couleur secondaire", example: "L'orange est orange"},
        %{id: "color_purple", word: "Violet", emoji: "🟣", pronunciation: "vee-oh-leh", meaning: "Couleur secondaire", example: "Le raisin est violet"},
        %{id: "color_pink", word: "Rose", emoji: "🩷", pronunciation: "rohz", meaning: "Rouge clair", example: "La fleur est rose"},
        %{id: "color_brown", word: "Brun", emoji: "🤎", pronunciation: "bruhn", meaning: "Couleur terre", example: "L'arbre est brun"},
        %{id: "color_black", word: "Noir", emoji: "⚫", pronunciation: "nwahr", meaning: "Absence de couleur", example: "La nuit est noire"},
        %{id: "color_white", word: "Blanc", emoji: "⚪", pronunciation: "blahn", meaning: "Toutes les couleurs", example: "La neige est blanche"},
        %{id: "color_gray", word: "Gris", emoji: "🩶", pronunciation: "gree", meaning: "Mélange de noir et blanc", example: "Le nuage est gris"}
      ],
      game_objects: [
        %{id: "color_red", emoji: "🔴", word: "Rouge", pronunciation: "roozh"},
        %{id: "color_blue", emoji: "🔵", word: "Bleu", pronunciation: "bluh"},
        %{id: "color_green", emoji: "🟢", word: "Vert", pronunciation: "vehr"},
        %{id: "color_yellow", emoji: "🟡", word: "Jaune", pronunciation: "zhohn"},
        %{id: "color_orange", emoji: "🟠", word: "Orange", pronunciation: "oh-rahnzh"},
        %{id: "color_purple", emoji: "🟣", word: "Violet", pronunciation: "vee-oh-leh"},
        %{id: "color_pink", emoji: "🩷", word: "Rose", pronunciation: "rohz"},
        %{id: "color_brown", emoji: "🤎", word: "Brun", pronunciation: "bruhn"},
        %{id: "color_black", emoji: "⚫", word: "Noir", pronunciation: "nwahr"},
        %{id: "color_white", emoji: "⚪", word: "Blanc", pronunciation: "blahn"},
        %{id: "color_gray", emoji: "🩶", word: "Gris", pronunciation: "gree"}
      ],
      cards: [
        %{id: "color_red", template: "La pomme devient _", answer: "Rouge", description: "Décrire les couleurs d'objets"},
        %{id: "color_blue", template: "Le ciel paraît _", answer: "Bleu", description: "Association couleur naturelle"},
        %{id: "color_green", template: "L'herbe pousse _", answer: "Verte", description: "Couleur de la nature"},
        %{id: "color_yellow", template: "Le soleil brille _", answer: "Jaune", description: "Couleur céleste"},
        %{id: "color_orange", template: "L'_ mûrit orange", answer: "Orange", description: "Fruit et couleur correspondent"},
        %{id: "color_purple", template: "Le raisin devient _", answer: "Violet", description: "Couleur de fruit"},
        %{id: "color_pink", template: "La fleur fleurit _", answer: "Rose", description: "Couleur de fleur"},
        %{id: "color_brown", template: "L'arbre vieillit _", answer: "Brun", description: "Couleur d'arbre"},
        %{id: "color_black", template: "La nuit tombe _", answer: "Noire", description: "Couleur du temps"},
        %{id: "color_white", template: "La neige tombe _", answer: "Blanche", description: "Couleur du temps"}
      ]
    }
  end

  # Russian content
  defp get_russian_content do
    %{
      title: "Цвета",
      description: "Изучение названий цветов и их описаний",
      emoji: "🌈",
      vocabulary: [
        %{id: "color_red", word: "Красный", emoji: "🔴", pronunciation: "KRAHS-nyy", romanization: "krasnyy", meaning: "Основной цвет", example: "Яблоко красное", example_romanization: "yabloko krasnoye"},
        %{id: "color_blue", word: "Синий", emoji: "🔵", pronunciation: "SEE-nee", romanization: "siniy", meaning: "Основной цвет", example: "Небо синее", example_romanization: "nebo sineye"},
        %{id: "color_green", word: "Зеленый", emoji: "🟢", pronunciation: "zee-LYO-nyy", romanization: "zelenyy", meaning: "Вторичный цвет", example: "Трава зеленая", example_romanization: "trava zelenaya"},
        %{id: "color_yellow", word: "Жёлтый", emoji: "🟡", pronunciation: "ZHYOL-tyy", romanization: "zheltyy", meaning: "Основной цвет", example: "Солнце жёлтое", example_romanization: "solntse zheltoye"},
        %{id: "color_orange", word: "Оранжевый", emoji: "🟠", pronunciation: "ah-RAHN-zheh-vyy", romanization: "oranzhevyy", meaning: "Вторичный цвет", example: "Апельсин оранжевый", example_romanization: "apel'sin oranzhevyy"},
        %{id: "color_purple", word: "Фиолетовый", emoji: "🟣", pronunciation: "fee-oh-LEH-toh-vyy", romanization: "fioletovyy", meaning: "Вторичный цвет", example: "Виноград фиолетовый", example_romanization: "vinograd fioletovyy"},
        %{id: "color_pink", word: "Розовый", emoji: "🩷", pronunciation: "ROH-zoh-vyy", romanization: "rozovyy", meaning: "Светло-красный", example: "Цветок розовый", example_romanization: "tsvetok rozovyy"},
        %{id: "color_brown", word: "Коричневый", emoji: "🤎", pronunciation: "koh-REECH-neh-vyy", romanization: "korichnevyy", meaning: "Земляной цвет", example: "Дерево коричневое", example_romanization: "derevo korichnevoe"},
        %{id: "color_black", word: "Чёрный", emoji: "⚫", pronunciation: "CHOR-nyy", romanization: "chernyy", meaning: "Отсутствие цвета", example: "Ночь чёрная", example_romanization: "noch' chernaya"},
        %{id: "color_white", word: "Белый", emoji: "⚪", pronunciation: "BYE-lyy", romanization: "belyy", meaning: "Все цвета", example: "Снег белый", example_romanization: "sneg belyy"},
        %{id: "color_gray", word: "Серый", emoji: "🩶", pronunciation: "SEH-ryy", romanization: "seryy", meaning: "Смесь чёрного и белого", example: "Облако серое", example_romanization: "oblako seroye"}
      ],
      game_objects: [
        %{id: "color_red", emoji: "🔴", word: "Красный", pronunciation: "KRAHS-nyy", romanization: "krasnyy"},
        %{id: "color_blue", emoji: "🔵", word: "Синий", pronunciation: "SEE-nee", romanization: "siniy"},
        %{id: "color_green", emoji: "🟢", word: "Зеленый", pronunciation: "zee-LYO-nyy", romanization: "zelenyy"},
        %{id: "color_yellow", emoji: "🟡", word: "Жёлтый", pronunciation: "ZHYOL-tyy", romanization: "zheltyy"},
        %{id: "color_orange", emoji: "🟠", word: "Оранжевый", pronunciation: "ah-RAHN-zheh-vyy", romanization: "oranzhevyy"},
        %{id: "color_purple", emoji: "🟣", word: "Фиолетовый", pronunciation: "fee-oh-LEH-toh-vyy", romanization: "fioletovyy"},
        %{id: "color_pink", emoji: "🩷", word: "Розовый", pronunciation: "ROH-zoh-vyy", romanization: "rozovyy"},
        %{id: "color_brown", emoji: "🤎", word: "Коричневый", pronunciation: "koh-REECH-neh-vyy", romanization: "korichnevyy"},
        %{id: "color_black", emoji: "⚫", word: "Чёрный", pronunciation: "CHOR-nyy", romanization: "chernyy"},
        %{id: "color_white", emoji: "⚪", word: "Белый", pronunciation: "BYE-lyy", romanization: "belyy"},
        %{id: "color_gray", emoji: "🩶", word: "Серый", pronunciation: "SEH-ryy", romanization: "seryy"}
      ],
      cards: [
        %{id: "color_red", template: "Яблоко _", answer: "Красное", description: "Описание цветов объектов"},
        %{id: "color_blue", template: "Небо _", answer: "Синее", description: "Ассоциация природного цвета"},
        %{id: "color_green", template: "Трава _", answer: "Зеленая", description: "Цвет природы"},
        %{id: "color_yellow", template: "Солнце _", answer: "Жёлтое", description: "Небесный цвет"},
        %{id: "color_orange", template: "_ оранжевый", answer: "Апельсин", description: "Фрукт и цвет совпадают"},
        %{id: "color_purple", template: "Виноград _", answer: "Фиолетовый", description: "Цвет фрукта"},
        %{id: "color_pink", template: "Цветок _", answer: "Розовый", description: "Цвет цветка"},
        %{id: "color_brown", template: "Дерево _", answer: "Коричневое", description: "Цвет дерева"},
        %{id: "color_black", template: "Ночь _", answer: "Чёрная", description: "Цвет времени"},
        %{id: "color_white", template: "Снег _", answer: "Белый", description: "Цвет погоды"}
      ]
    }
  end

  # Japanese content
  defp get_japanese_content do
    %{
      title: "色",
      description: "色の名前と説明を学ぶ",
      emoji: "🌈",
      vocabulary: [
        %{id: "color_red", word: "赤", emoji: "🔴", pronunciation: "ah-kah", romanization: "aka", meaning: "基本色", example: "りんごは赤いです", example_romanization: "ringo wa akai desu"},
        %{id: "color_blue", word: "青", emoji: "🔵", pronunciation: "ah-oh", romanization: "ao", meaning: "基本色", example: "空は青いです", example_romanization: "sora wa aoi desu"},
        %{id: "color_green", word: "緑", emoji: "🟢", pronunciation: "mee-doh-ree", romanization: "midori", meaning: "二次色", example: "草は緑です", example_romanization: "kusa wa midori desu"},
        %{id: "color_yellow", word: "黄色", emoji: "🟡", pronunciation: "kee-ee-roh", romanization: "kiiro", meaning: "基本色", example: "太陽は黄色いです", example_romanization: "taiyou wa kiiroi desu"},
        %{id: "color_orange", word: "オレンジ", emoji: "🟠", pronunciation: "oh-ren-jee", romanization: "orenji", meaning: "二次色", example: "オレンジはオレンジ色です", example_romanization: "orenji wa orenji-iro desu"},
        %{id: "color_purple", word: "紫", emoji: "🟣", pronunciation: "moo-rah-sah-kee", romanization: "murasaki", meaning: "二次色", example: "ぶどうは紫です", example_romanization: "budou wa murasaki desu"},
        %{id: "color_pink", word: "ピンク", emoji: "🩷", pronunciation: "peen-koo", romanization: "pinku", meaning: "薄い赤", example: "花はピンクです", example_romanization: "hana wa pinku desu"},
        %{id: "color_brown", word: "茶色", emoji: "🤎", pronunciation: "chah-ee-roh", romanization: "chairo", meaning: "土の色", example: "木は茶色です", example_romanization: "ki wa chairo desu"},
        %{id: "color_black", word: "黒", emoji: "⚫", pronunciation: "koo-roh", romanization: "kuro", meaning: "色の不在", example: "夜は黒いです", example_romanization: "yoru wa kuroi desu"},
        %{id: "color_white", word: "白", emoji: "⚪", pronunciation: "shee-roh", romanization: "shiro", meaning: "全ての色", example: "雪は白いです", example_romanization: "yuki wa shiroi desu"},
        %{id: "color_gray", word: "灰色", emoji: "🩶", pronunciation: "hah-ee-ee-roh", romanization: "haiiro", meaning: "黒と白の混合", example: "雲は灰色です", example_romanization: "kumo wa haiiro desu"}
      ],
      game_objects: [
        %{id: "color_red", emoji: "🔴", word: "赤", pronunciation: "ah-kah", romanization: "aka"},
        %{id: "color_blue", emoji: "🔵", word: "青", pronunciation: "ah-oh", romanization: "ao"},
        %{id: "color_green", emoji: "🟢", word: "緑", pronunciation: "mee-doh-ree", romanization: "midori"},
        %{id: "color_yellow", emoji: "🟡", word: "黄色", pronunciation: "kee-ee-roh", romanization: "kiiro"},
        %{id: "color_orange", emoji: "🟠", word: "オレンジ", pronunciation: "oh-ren-jee", romanization: "orenji"},
        %{id: "color_purple", emoji: "🟣", word: "紫", pronunciation: "moo-rah-sah-kee", romanization: "murasaki"},
        %{id: "color_pink", emoji: "🩷", word: "ピンク", pronunciation: "peen-koo", romanization: "pinku"},
        %{id: "color_brown", emoji: "🤎", word: "茶色", pronunciation: "chah-ee-roh", romanization: "chairo"},
        %{id: "color_black", emoji: "⚫", word: "黒", pronunciation: "koo-roh", romanization: "kuro"},
        %{id: "color_white", emoji: "⚪", word: "白", pronunciation: "shee-roh", romanization: "shiro"},
        %{id: "color_gray", emoji: "🩶", word: "灰色", pronunciation: "hah-ee-ee-roh", romanization: "haiiro"}
      ],
      cards: [
        %{id: "color_red", template: "りんごは_です", answer: "赤い", description: "物の色を説明する"},
        %{id: "color_blue", template: "空は_です", answer: "青い", description: "自然の色の関連付け"},
        %{id: "color_green", template: "草は_です", answer: "緑", description: "自然の色"},
        %{id: "color_yellow", template: "太陽は_です", answer: "黄色い", description: "天体の色"},
        %{id: "color_orange", template: "_はオレンジ色です", answer: "オレンジ", description: "果物と色の一致"},
        %{id: "color_purple", template: "ぶどうは_です", answer: "紫", description: "果物の色"},
        %{id: "color_pink", template: "花は_です", answer: "ピンク", description: "花の色"},
        %{id: "color_brown", template: "木は_です", answer: "茶色", description: "木の色"},
        %{id: "color_black", template: "夜は_です", answer: "黒い", description: "時闓の色"},
        %{id: "color_white", template: "雪は_です", answer: "白い", description: "天気の色"}
      ]
    }
  end

  # Arabic content
  defp get_arabic_content do
    %{
      title: "الألوان",
      description: "تعلم أسماء الألوان والأوصاف",
      emoji: "🌈",
      vocabulary: [
        %{id: "color_red", word: "أحمر", emoji: "🔴", pronunciation: "ah-mar", romanization: "ahmar", meaning: "لون أساسي", example: "التفاحة حمراء", example_romanization: "at-tuffaha hamraa'"},
        %{id: "color_blue", word: "أزرق", emoji: "🔵", pronunciation: "az-raq", romanization: "azraq", meaning: "لون أساسي", example: "السماء زرقاء", example_romanization: "as-samaa' zarqaa'"},
        %{id: "color_green", word: "أخضر", emoji: "🟢", pronunciation: "akh-dar", romanization: "akhdar", meaning: "لون ثانوي", example: "العشب أخضر", example_romanization: "al-'ushb akhdar"},
        %{id: "color_yellow", word: "أصفر", emoji: "🟡", pronunciation: "as-far", romanization: "asfar", meaning: "لون أساسي", example: "الشمس صفراء", example_romanization: "ash-shams safraa'"},
        %{id: "color_orange", word: "برتقالي", emoji: "🟠", pronunciation: "bur-tu-qaa-lee", romanization: "burtuqaali", meaning: "لون ثانوي", example: "البرتقالة برتقالية", example_romanization: "al-burtuqala burtuqaaliya"},
        %{id: "color_purple", word: "بنفسجي", emoji: "🟣", pronunciation: "ba-naf-sa-jee", romanization: "banafsaji", meaning: "لون ثانوي", example: "العنب بنفسجي", example_romanization: "al-'inab banafsaji"},
        %{id: "color_pink", word: "وردي", emoji: "🩷", pronunciation: "war-dee", romanization: "wardii", meaning: "أحمر فاتح", example: "الزهرة وردية", example_romanization: "az-zahra wardiya"},
        %{id: "color_brown", word: "بني", emoji: "🤎", pronunciation: "bun-nee", romanization: "bunnii", meaning: "لون الأرض", example: "الشجرة بنية", example_romanization: "ash-shajara buniya"},
        %{id: "color_black", word: "أسود", emoji: "⚫", pronunciation: "as-wad", romanization: "aswad", meaning: "غياب اللون", example: "الليل أسود", example_romanization: "al-layl aswad"},
        %{id: "color_white", word: "أبيض", emoji: "⚪", pronunciation: "ab-yad", romanization: "abyad", meaning: "كل الألوان", example: "الثلج أبيض", example_romanization: "ath-thalj abyad"},
        %{id: "color_gray", word: "رمادي", emoji: "🩶", pronunciation: "ra-maa-dee", romanization: "ramaadii", meaning: "خليط من الأسود والأبيض", example: "السحابة رمادية", example_romanization: "as-sahaba ramaadiya"}
      ],
      game_objects: [
        %{id: "color_red", emoji: "🔴", word: "أحمر", pronunciation: "ah-mar", romanization: "ahmar"},
        %{id: "color_blue", emoji: "🔵", word: "أزرق", pronunciation: "az-raq", romanization: "azraq"},
        %{id: "color_green", emoji: "🟢", word: "أخضر", pronunciation: "akh-dar", romanization: "akhdar"},
        %{id: "color_yellow", emoji: "🟡", word: "أصفر", pronunciation: "as-far", romanization: "asfar"},
        %{id: "color_orange", emoji: "🟠", word: "برتقالي", pronunciation: "bur-tu-qaa-lee", romanization: "burtuqaali"},
        %{id: "color_purple", emoji: "🟣", word: "بنفسجي", pronunciation: "ba-naf-sa-jee", romanization: "banafsaji"},
        %{id: "color_pink", emoji: "🩷", word: "وردي", pronunciation: "war-dee", romanization: "wardii"},
        %{id: "color_brown", emoji: "🤎", word: "بني", pronunciation: "bun-nee", romanization: "bunnii"},
        %{id: "color_black", emoji: "⚫", word: "أسود", pronunciation: "as-wad", romanization: "aswad"},
        %{id: "color_white", emoji: "⚪", word: "أبيض", pronunciation: "ab-yad", romanization: "abyad"},
        %{id: "color_gray", emoji: "🩶", word: "رمادي", pronunciation: "ra-maa-dee", romanization: "ramaadii"}
      ],
      cards: [
        %{id: "color_red", template: "التفاحة _", answer: "حمراء", description: "وصف ألوان الأشياء"},
        %{id: "color_blue", template: "السماء _", answer: "زرقاء", description: "ارتباط اللون الطبيعي"},
        %{id: "color_green", template: "العشب _", answer: "أخضر", description: "لون الطبيعة"},
        %{id: "color_yellow", template: "الشمس _", answer: "صفراء", description: "لون سماوي"},
        %{id: "color_orange", template: "_ برتقالية", answer: "البرتقالة", description: "الفاكهة واللون يتطابقان"},
        %{id: "color_purple", template: "العنب _", answer: "بنفسجي", description: "لون الفاكهة"},
        %{id: "color_pink", template: "الزهرة _", answer: "وردية", description: "لون الزهرة"},
        %{id: "color_brown", template: "الشجرة _", answer: "بنية", description: "لون الشجرة"},
        %{id: "color_black", template: "الليل _", answer: "أسود", description: "لون الوقت"},
        %{id: "color_white", template: "الثلج _", answer: "أبيض", description: "لون الطقس"}
      ]
    }
  end

  # Portuguese content
  defp get_portuguese_content do
    %{
      title: "Cores",
      description: "Aprenda nomes de cores e descrições",
      emoji: "🌈",
      vocabulary: [
        %{id: "color_red", word: "Vermelho", emoji: "🔴", pronunciation: "ver-ME-lho", meaning: "Cor primária", example: "A maçã é vermelha"},
        %{id: "color_blue", word: "Azul", emoji: "🔵", pronunciation: "ah-ZOOL", meaning: "Cor primária", example: "O céu é azul"},
        %{id: "color_green", word: "Verde", emoji: "🟢", pronunciation: "VEHR-de", meaning: "Cor secundária", example: "A grama é verde"},
        %{id: "color_yellow", word: "Amarelo", emoji: "🟡", pronunciation: "ah-ma-REH-lo", meaning: "Cor primária", example: "O sol é amarelo"},
        %{id: "color_orange", word: "Laranja", emoji: "🟠", pronunciation: "la-RAHN-ja", meaning: "Cor secundária", example: "A laranja é laranja"},
        %{id: "color_purple", word: "Roxo", emoji: "🟣", pronunciation: "ROH-sho", meaning: "Cor secundária", example: "A uva é roxa"},
        %{id: "color_pink", word: "Rosa", emoji: "🩷", pronunciation: "ROH-za", meaning: "Vermelho claro", example: "A flor é rosa"},
        %{id: "color_brown", word: "Marrom", emoji: "🤎", pronunciation: "mah-HOHM", meaning: "Cor terra", example: "A árvore é marrom"},
        %{id: "color_black", word: "Preto", emoji: "⚫", pronunciation: "PREH-to", meaning: "Ausência de cor", example: "A noite é preta"},
        %{id: "color_white", word: "Branco", emoji: "⚪", pronunciation: "BRAHN-ko", meaning: "Todas as cores", example: "A neve é branca"},
        %{id: "color_gray", word: "Cinza", emoji: "🩶", pronunciation: "SEEN-za", meaning: "Mistura de preto e branco", example: "A nuvem é cinza"}
      ],
      game_objects: [
        %{id: "color_red", emoji: "🔴", word: "Vermelho", pronunciation: "ver-ME-lho"},
        %{id: "color_blue", emoji: "🔵", word: "Azul", pronunciation: "ah-ZOOL"},
        %{id: "color_green", emoji: "🟢", word: "Verde", pronunciation: "VEHR-de"},
        %{id: "color_yellow", emoji: "🟡", word: "Amarelo", pronunciation: "ah-ma-REH-lo"},
        %{id: "color_orange", emoji: "🟠", word: "Laranja", pronunciation: "la-RAHN-ja"},
        %{id: "color_purple", emoji: "🟣", word: "Roxo", pronunciation: "ROH-sho"},
        %{id: "color_pink", emoji: "🩷", word: "Rosa", pronunciation: "ROH-za"},
        %{id: "color_brown", emoji: "🤎", word: "Marrom", pronunciation: "mah-HOHM"},
        %{id: "color_black", emoji: "⚫", word: "Preto", pronunciation: "PREH-to"},
        %{id: "color_white", emoji: "⚪", word: "Branco", pronunciation: "BRAHN-ko"},
        %{id: "color_gray", emoji: "🩶", word: "Cinza", pronunciation: "SEEN-za"}
      ],
      cards: [
        %{id: "color_red", template: "A maçã é _", answer: "Vermelha", description: "Descrevendo cores de objetos"},
        %{id: "color_blue", template: "O céu é _", answer: "Azul", description: "Associação de cor natural"},
        %{id: "color_green", template: "A grama é _", answer: "Verde", description: "Cor da natureza"},
        %{id: "color_yellow", template: "O sol é _", answer: "Amarelo", description: "Cor celestial"},
        %{id: "color_orange", template: "A _ é laranja", answer: "Laranja", description: "Fruta e cor coincidem"},
        %{id: "color_purple", template: "A uva é _", answer: "Roxa", description: "Cor da fruta"},
        %{id: "color_pink", template: "A flor é _", answer: "Rosa", description: "Cor da flor"},
        %{id: "color_brown", template: "A árvore é _", answer: "Marrom", description: "Cor da árvore"},
        %{id: "color_black", template: "A noite é _", answer: "Preta", description: "Cor do tempo"},
        %{id: "color_white", template: "A neve é _", answer: "Branca", description: "Cor do tempo"}
      ]
    }
  end

  # Italian content
  defp get_italian_content do
    %{
      title: "Colori",
      description: "Impara i nomi dei colori e le descrizioni",
      emoji: "🌈",
      vocabulary: [
        %{id: "color_red", word: "Rosso", emoji: "🔴", pronunciation: "ROHS-so", meaning: "Colore primario", example: "La mela è rossa"},
        %{id: "color_blue", word: "Blu", emoji: "🔵", pronunciation: "bloo", meaning: "Colore primario", example: "Il cielo è blu"},
        %{id: "color_green", word: "Verde", emoji: "🟢", pronunciation: "VEHR-de", meaning: "Colore secondario", example: "L'erba è verde"},
        %{id: "color_yellow", word: "Giallo", emoji: "🟡", pronunciation: "JAHL-lo", meaning: "Colore primario", example: "Il sole è giallo"},
        %{id: "color_orange", word: "Arancione", emoji: "🟠", pronunciation: "ah-ran-CHOH-ne", meaning: "Colore secondario", example: "L'arancia è arancione"},
        %{id: "color_purple", word: "Viola", emoji: "🟣", pronunciation: "vee-OH-la", meaning: "Colore secondario", example: "L'uva è viola"},
        %{id: "color_pink", word: "Rosa", emoji: "🩷", pronunciation: "ROH-za", meaning: "Rosso chiaro", example: "Il fiore è rosa"},
        %{id: "color_brown", word: "Marrone", emoji: "🤎", pronunciation: "mar-ROH-ne", meaning: "Colore terra", example: "L'albero è marrone"},
        %{id: "color_black", word: "Nero", emoji: "⚫", pronunciation: "NEH-ro", meaning: "Assenza di colore", example: "La notte è nera"},
        %{id: "color_white", word: "Bianco", emoji: "⚪", pronunciation: "bee-AHN-ko", meaning: "Tutti i colori", example: "La neve è bianca"},
        %{id: "color_gray", word: "Grigio", emoji: "🩶", pronunciation: "GREE-jo", meaning: "Mix di nero e bianco", example: "La nuvola è grigia"}
      ],
      game_objects: [
        %{id: "color_red", emoji: "🔴", word: "Rosso", pronunciation: "ROHS-so"},
        %{id: "color_blue", emoji: "🔵", word: "Blu", pronunciation: "bloo"},
        %{id: "color_green", emoji: "🟢", word: "Verde", pronunciation: "VEHR-de"},
        %{id: "color_yellow", emoji: "🟡", word: "Giallo", pronunciation: "JAHL-lo"},
        %{id: "color_orange", emoji: "🟠", word: "Arancione", pronunciation: "ah-ran-CHOH-ne"},
        %{id: "color_purple", emoji: "🟣", word: "Viola", pronunciation: "vee-OH-la"},
        %{id: "color_pink", emoji: "🩷", word: "Rosa", pronunciation: "ROH-za"},
        %{id: "color_brown", emoji: "🤎", word: "Marrone", pronunciation: "mar-ROH-ne"},
        %{id: "color_black", emoji: "⚫", word: "Nero", pronunciation: "NEH-ro"},
        %{id: "color_white", emoji: "⚪", word: "Bianco", pronunciation: "bee-AHN-ko"},
        %{id: "color_gray", emoji: "🩶", word: "Grigio", pronunciation: "GREE-jo"}
      ],
      cards: [
        %{id: "color_red", template: "La mela è _", answer: "Rossa", description: "Descrivere i colori degli oggetti"},
        %{id: "color_blue", template: "Il cielo è _", answer: "Blu", description: "Associazione colore naturale"},
        %{id: "color_green", template: "L'erba è _", answer: "Verde", description: "Colore della natura"},
        %{id: "color_yellow", template: "Il sole è _", answer: "Giallo", description: "Colore celestiale"},
        %{id: "color_orange", template: "L'_ è arancione", answer: "Arancia", description: "Frutto e colore corrispondono"},
        %{id: "color_purple", template: "L'uva è _", answer: "Viola", description: "Colore del frutto"},
        %{id: "color_pink", template: "Il fiore è _", answer: "Rosa", description: "Colore del fiore"},
        %{id: "color_brown", template: "L'albero è _", answer: "Marrone", description: "Colore dell'albero"},
        %{id: "color_black", template: "La notte è _", answer: "Nera", description: "Colore del tempo"},
        %{id: "color_white", template: "La neve è _", answer: "Bianca", description: "Colore del tempo"}
      ]
    }
  end
end