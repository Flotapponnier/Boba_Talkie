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
      description: "Learn basic colors and how to describe them",
      emoji: "🌈",
      vocabulary: [
        %{id: "color_red", word: "Red", emoji: "🔴", pronunciation: "RED", meaning: "The color red", example: "The rose is red"},
        %{id: "color_blue", word: "Blue", emoji: "🔵", pronunciation: "BLOO", meaning: "The color blue", example: "The sky is blue"},
        %{id: "color_green", word: "Green", emoji: "🟢", pronunciation: "GREEN", meaning: "The color green", example: "Grass is green"},
        %{id: "color_yellow", word: "Yellow", emoji: "🟡", pronunciation: "YEL-oh", meaning: "The color yellow", example: "The sun is yellow"}
      ],
      game_objects: [
        %{id: "color_red", emoji: "🔴", word: "Red", pronunciation: "RED"},
        %{id: "color_blue", emoji: "🔵", word: "Blue", pronunciation: "BLOO"},
        %{id: "color_green", emoji: "🟢", word: "Green", pronunciation: "GREEN"},
        %{id: "color_yellow", emoji: "🟡", word: "Yellow", pronunciation: "YEL-oh"}
      ],
      cards: [
        %{id: "color_red", template: "The rose is _", answer: "red", description: "Describe color of flowers"},
        %{id: "color_blue", template: "The sky is _", answer: "blue", description: "Describe color of sky"},
        %{id: "color_green", template: "Grass is _", answer: "green", description: "Describe color of plants"}
      ]
    }
  end

  # Spanish content
  defp get_spanish_content do
    %{
      title: "Colores",
      description: "Aprende colores básicos y cómo describirlos",
      emoji: "🌈",
      vocabulary: [
        %{id: "color_red", word: "Rojo", emoji: "🔴", pronunciation: "ROH-hoh", meaning: "El color rojo", example: "La rosa es roja"},
        %{id: "color_blue", word: "Azul", emoji: "🔵", pronunciation: "ah-SOOL", meaning: "El color azul", example: "El cielo es azul"},
        %{id: "color_green", word: "Verde", emoji: "🟢", pronunciation: "BEHR-deh", meaning: "El color verde", example: "La hierba es verde"},
        %{id: "color_yellow", word: "Amarillo", emoji: "🟡", pronunciation: "ah-mah-REE-yoh", meaning: "El color amarillo", example: "El sol es amarillo"}
      ],
      game_objects: [
        %{id: "color_red", emoji: "🔴", word: "Rojo", pronunciation: "ROH-hoh"},
        %{id: "color_blue", emoji: "🔵", word: "Azul", pronunciation: "ah-SOOL"},
        %{id: "color_green", emoji: "🟢", word: "Verde", pronunciation: "BEHR-deh"},
        %{id: "color_yellow", emoji: "🟡", word: "Amarillo", pronunciation: "ah-mah-REE-yoh"}
      ],
      cards: [
        %{id: "color_red", template: "La rosa es _", answer: "roja", description: "Describir el color de las flores"},
        %{id: "color_blue", template: "El cielo es _", answer: "azul", description: "Describir el color del cielo"},
        %{id: "color_green", template: "La hierba es _", answer: "verde", description: "Describir el color de las plantas"}
      ]
    }
  end

  # Chinese content
  defp get_chinese_content do
    %{
      title: "颜色",
      description: "学习基本颜色及其描述方法",
      emoji: "🌈",
      vocabulary: [
        %{id: "color_red", word: "红色", emoji: "🔴", pronunciation: "hóng sè", romanization: "hóng sè", meaning: "红颜色", example: "玫瑰是红色的", example_romanization: "méi guì shì hóng sè de"},
        %{id: "color_blue", word: "蓝色", emoji: "🔵", pronunciation: "lán sè", romanization: "lán sè", meaning: "蓝颜色", example: "天空是蓝色的", example_romanization: "tiān kōng shì lán sè de"},
        %{id: "color_green", word: "绿色", emoji: "🟢", pronunciation: "lǜ sè", romanization: "lǜ sè", meaning: "绿颜色", example: "草是绿色的", example_romanization: "cǎo shì lǜ sè de"},
        %{id: "color_yellow", word: "黄色", emoji: "🟡", pronunciation: "huáng sè", romanization: "huáng sè", meaning: "黄颜色", example: "太阳是黄色的", example_romanization: "tài yáng shì huáng sè de"}
      ],
      game_objects: [
        %{id: "color_red", emoji: "🔴", word: "红色", pronunciation: "hóng sè", romanization: "hóng sè"},
        %{id: "color_blue", emoji: "🔵", word: "蓝色", pronunciation: "lán sè", romanization: "lán sè"},
        %{id: "color_green", emoji: "🟢", word: "绿色", pronunciation: "lǜ sè", romanization: "lǜ sè"},
        %{id: "color_yellow", emoji: "🟡", word: "黄色", pronunciation: "huáng sè", romanization: "huáng sè"}
      ],
      cards: [
        %{id: "color_red", template: "玫瑰是_的", answer: "红色", romanization: "hóng sè", description: "描述花的颜色"},
        %{id: "color_blue", template: "天空是_的", answer: "蓝色", romanization: "lán sè", description: "描述天空的颜色"},
        %{id: "color_green", template: "草是_的", answer: "绿色", romanization: "lǜ sè", description: "描述植物的颜色"}
      ]
    }
  end

  # French content
  defp get_french_content do
    %{
      title: "Couleurs",
      description: "Apprendre les couleurs de base et comment les décrire",
      emoji: "🌈",
      vocabulary: [
        %{id: "color_red", word: "Rouge", emoji: "🔴", pronunciation: "roozh", meaning: "La couleur rouge", example: "La rose est rouge"},
        %{id: "color_blue", word: "Bleu", emoji: "🔵", pronunciation: "bluh", meaning: "La couleur bleue", example: "Le ciel est bleu"},
        %{id: "color_green", word: "Vert", emoji: "🟢", pronunciation: "vehr", meaning: "La couleur verte", example: "L'herbe est verte"},
        %{id: "color_yellow", word: "Jaune", emoji: "🟡", pronunciation: "zhohn", meaning: "La couleur jaune", example: "Le soleil est jaune"}
      ],
      game_objects: [
        %{id: "color_red", emoji: "🔴", word: "Rouge", pronunciation: "roozh"},
        %{id: "color_blue", emoji: "🔵", word: "Bleu", pronunciation: "bluh"},
        %{id: "color_green", emoji: "🟢", word: "Vert", pronunciation: "vehr"},
        %{id: "color_yellow", emoji: "🟡", word: "Jaune", pronunciation: "zhohn"}
      ],
      cards: [
        %{id: "color_red", template: "La rose est _", answer: "rouge", description: "Décrire la couleur des fleurs"},
        %{id: "color_blue", template: "Le ciel est _", answer: "bleu", description: "Décrire la couleur du ciel"},
        %{id: "color_green", template: "L'herbe est _", answer: "verte", description: "Décrire la couleur des plantes"}
      ]
    }
  end

  # Russian content
  defp get_russian_content do
    %{
      title: "Цвета",
      description: "Изучение основных цветов и их описания",
      emoji: "🌈",
      vocabulary: [
        %{id: "color_red", word: "Красный", emoji: "🔴", pronunciation: "KRAHS-ny", romanization: "krasny", meaning: "Красный цвет", example: "Роза красная", example_romanization: "roza krasnaya"},
        %{id: "color_blue", word: "Синий", emoji: "🔵", pronunciation: "SEE-nee", romanization: "siniy", meaning: "Синий цвет", example: "Небо синее", example_romanization: "nebo sineye"},
        %{id: "color_green", word: "Зелёный", emoji: "🟢", pronunciation: "zee-LYOH-ny", romanization: "zelyony", meaning: "Зелёный цвет", example: "Трава зелёная", example_romanization: "trava zelyonaya"},
        %{id: "color_yellow", word: "Жёлтый", emoji: "🟡", pronunciation: "ZHOHL-ty", romanization: "zholty", meaning: "Жёлтый цвет", example: "Солнце жёлтое", example_romanization: "solntse zholtoye"}
      ],
      game_objects: [
        %{id: "color_red", emoji: "🔴", word: "Красный", pronunciation: "KRAHS-ny", romanization: "krasny"},
        %{id: "color_blue", emoji: "🔵", word: "Синий", pronunciation: "SEE-nee", romanization: "siniy"},
        %{id: "color_green", emoji: "🟢", word: "Зелёный", pronunciation: "zee-LYOH-ny", romanization: "zelyony"},
        %{id: "color_yellow", emoji: "🟡", word: "Жёлтый", pronunciation: "ZHOHL-ty", romanization: "zholty"}
      ],
      cards: [
        %{id: "color_red", template: "Роза _", answer: "красная", description: "Описать цвет цветов"},
        %{id: "color_blue", template: "Небо _", answer: "синее", description: "Описать цвет неба"},
        %{id: "color_green", template: "Трава _", answer: "зелёная", description: "Описать цвет растений"}
      ]
    }
  end

  # Japanese content
  defp get_japanese_content do
    %{
      title: "色",
      description: "基本的な色とその表現方法を学ぶ",
      emoji: "🌈",
      vocabulary: [
        %{id: "color_red", word: "赤", emoji: "🔴", pronunciation: "ah-kah", romanization: "aka", meaning: "赤い色", example: "バラは赤いです", example_romanization: "bara wa akai desu"},
        %{id: "color_blue", word: "青", emoji: "🔵", pronunciation: "ah-oh", romanization: "ao", meaning: "青い色", example: "空は青いです", example_romanization: "sora wa aoi desu"},
        %{id: "color_green", word: "緑", emoji: "🟢", pronunciation: "mee-doh-ree", romanization: "midori", meaning: "緑の色", example: "草は緑です", example_romanization: "kusa wa midori desu"},
        %{id: "color_yellow", word: "黄色", emoji: "🟡", pronunciation: "kee-ee-roh", romanization: "kiiro", meaning: "黄色い色", example: "太陽は黄色です", example_romanization: "taiyou wa kiiro desu"}
      ],
      game_objects: [
        %{id: "color_red", emoji: "🔴", word: "赤", pronunciation: "ah-kah", romanization: "aka"},
        %{id: "color_blue", emoji: "🔵", word: "青", pronunciation: "ah-oh", romanization: "ao"},
        %{id: "color_green", emoji: "🟢", word: "緑", pronunciation: "mee-doh-ree", romanization: "midori"},
        %{id: "color_yellow", emoji: "🟡", word: "黄色", pronunciation: "kee-ee-roh", romanization: "kiiro"}
      ],
      cards: [
        %{id: "color_red", template: "バラは_いです", answer: "赤", description: "花の色を説明する"},
        %{id: "color_blue", template: "空は_いです", answer: "青", description: "空の色を説明する"},
        %{id: "color_green", template: "草は_です", answer: "緑", description: "植物の色を説明する"}
      ]
    }
  end

  # Arabic content
  defp get_arabic_content do
    %{
      title: "الألوان",
      description: "تعلم الألوان الأساسية وكيفية وصفها",
      emoji: "🌈",
      vocabulary: [
        %{id: "color_red", word: "أحمر", emoji: "🔴", pronunciation: "ah-mar", romanization: "ahmar", meaning: "اللون الأحمر", example: "الوردة حمراء", example_romanization: "al-wardah hamra"},
        %{id: "color_blue", word: "أزرق", emoji: "🔵", pronunciation: "az-raq", romanization: "azraq", meaning: "اللون الأزرق", example: "السماء زرقاء", example_romanization: "as-sama zarqa"},
        %{id: "color_green", word: "أخضر", emoji: "🟢", pronunciation: "akh-dar", romanization: "akhdar", meaning: "اللون الأخضر", example: "العشب أخضر", example_romanization: "al-ushb akhdar"},
        %{id: "color_yellow", word: "أصفر", emoji: "🟡", pronunciation: "as-far", romanization: "asfar", meaning: "اللون الأصفر", example: "الشمس صفراء", example_romanization: "ash-shams safra"}
      ],
      game_objects: [
        %{id: "color_red", emoji: "🔴", word: "أحمر", pronunciation: "ah-mar", romanization: "ahmar"},
        %{id: "color_blue", emoji: "🔵", word: "أزرق", pronunciation: "az-raq", romanization: "azraq"},
        %{id: "color_green", emoji: "🟢", word: "أخضر", pronunciation: "akh-dar", romanization: "akhdar"},
        %{id: "color_yellow", emoji: "🟡", word: "أصفر", pronunciation: "as-far", romanization: "asfar"}
      ],
      cards: [
        %{id: "color_red", template: "الوردة _", answer: "حمراء", description: "وصف لون الزهور"},
        %{id: "color_blue", template: "السماء _", answer: "زرقاء", description: "وصف لون السماء"},
        %{id: "color_green", template: "العشب _", answer: "أخضر", description: "وصف لون النباتات"}
      ]
    }
  end

  # Portuguese content
  defp get_portuguese_content do
    %{
      title: "Cores",
      description: "Aprenda cores básicas e como descrevê-las",
      emoji: "🌈",
      vocabulary: [
        %{id: "color_red", word: "Vermelho", emoji: "🔴", pronunciation: "ver-MEH-lho", meaning: "A cor vermelha", example: "A rosa é vermelha"},
        %{id: "color_blue", word: "Azul", emoji: "🔵", pronunciation: "ah-ZOOL", meaning: "A cor azul", example: "O céu é azul"},
        %{id: "color_green", word: "Verde", emoji: "🟢", pronunciation: "VEHR-deh", meaning: "A cor verde", example: "A grama é verde"},
        %{id: "color_yellow", word: "Amarelo", emoji: "🟡", pronunciation: "ah-mah-REH-loh", meaning: "A cor amarela", example: "O sol é amarelo"}
      ],
      game_objects: [
        %{id: "color_red", emoji: "🔴", word: "Vermelho", pronunciation: "ver-MEH-lho"},
        %{id: "color_blue", emoji: "🔵", word: "Azul", pronunciation: "ah-ZOOL"},
        %{id: "color_green", emoji: "🟢", word: "Verde", pronunciation: "VEHR-deh"},
        %{id: "color_yellow", emoji: "🟡", word: "Amarelo", pronunciation: "ah-mah-REH-loh"}
      ],
      cards: [
        %{id: "color_red", template: "A rosa é _", answer: "vermelha", description: "Descrever a cor das flores"},
        %{id: "color_blue", template: "O céu é _", answer: "azul", description: "Descrever a cor do céu"},
        %{id: "color_green", template: "A grama é _", answer: "verde", description: "Descrever a cor das plantas"}
      ]
    }
  end

  # Italian content
  defp get_italian_content do
    %{
      title: "Colori",
      description: "Impara i colori di base e come descriverli",
      emoji: "🌈",
      vocabulary: [
        %{id: "color_red", word: "Rosso", emoji: "🔴", pronunciation: "ROHS-soh", meaning: "Il colore rosso", example: "La rosa è rossa"},
        %{id: "color_blue", word: "Blu", emoji: "🔵", pronunciation: "bloo", meaning: "Il colore blu", example: "Il cielo è blu"},
        %{id: "color_green", word: "Verde", emoji: "🟢", pronunciation: "VEHR-deh", meaning: "Il colore verde", example: "L'erba è verde"},
        %{id: "color_yellow", word: "Giallo", emoji: "🟡", pronunciation: "JAHL-loh", meaning: "Il colore giallo", example: "Il sole è giallo"}
      ],
      game_objects: [
        %{id: "color_red", emoji: "🔴", word: "Rosso", pronunciation: "ROHS-soh"},
        %{id: "color_blue", emoji: "🔵", word: "Blu", pronunciation: "bloo"},
        %{id: "color_green", emoji: "🟢", word: "Verde", pronunciation: "VEHR-deh"},
        %{id: "color_yellow", emoji: "🟡", word: "Giallo", pronunciation: "JAHL-loh"}
      ],
      cards: [
        %{id: "color_red", template: "La rosa è _", answer: "rossa", description: "Descrivere il colore dei fiori"},
        %{id: "color_blue", template: "Il cielo è _", answer: "blu", description: "Descrivere il colore del cielo"},
        %{id: "color_green", template: "L'erba è _", answer: "verde", description: "Descrivere il colore delle piante"}
      ]
    }
  end
end