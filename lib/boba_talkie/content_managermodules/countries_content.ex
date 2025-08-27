defmodule BobaTalkie.ContentManagerModules.CountriesContent do
  @moduledoc """
  Countries topic content in multiple languages.
  Contains tutorial vocabulary, game objects, and challenge cards for learning country names and nationalities.
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
      title: "Countries",
      description: "Learn country names and nationalities",
      emoji: "🇹🇼",
      vocabulary: [
        %{id: "country_usa", word: "USA", emoji: "🇺🇸", pronunciation: "yoo-es-AY", meaning: "United States", example: "USA is very diverse"},
        %{id: "country_france", word: "France", emoji: "🇫🇷", pronunciation: "FRANS", meaning: "European country", example: "France is famous for cuisine"},
        %{id: "country_japan", word: "Japan", emoji: "🇯🇵", pronunciation: "juh-PAN", meaning: "Asian country", example: "Japan has beautiful cherry blossoms"},
        %{id: "country_italy", word: "Italy", emoji: "🇮🇹", pronunciation: "IT-uh-lee", meaning: "European country", example: "Italy makes great pasta"}
      ],
      game_objects: [
        %{id: "country_usa", emoji: "🇺🇸", word: "USA", pronunciation: "yoo-es-AY"},
        %{id: "country_france", emoji: "🇫🇷", word: "France", pronunciation: "FRANS"},
        %{id: "country_japan", emoji: "🇯🇵", word: "Japan", pronunciation: "juh-PAN"},
        %{id: "country_italy", emoji: "🇮🇹", word: "Italy", pronunciation: "IT-uh-lee"}
      ],
      cards: [
        %{id: "country_usa", template: "I am from _", answer: "USA", description: "Stating nationality"},
        %{id: "country_france", template: "_ is famous for cuisine", answer: "France", description: "Describing countries"},
        %{id: "country_japan", template: "_ has cherry blossoms", answer: "Japan", description: "Cultural knowledge"}
      ]
    }
  end

  # Spanish content
  defp get_spanish_content do
    %{
      title: "Países",
      description: "Aprende nombres de países y nacionalidades",
      emoji: "🇹🇼",
      vocabulary: [
        %{id: "country_usa", word: "Estados Unidos", emoji: "🇺🇸", pronunciation: "es-TAH-dos oo-NEE-dos", meaning: "País norteamericano", example: "Estados Unidos es muy diverso"},
        %{id: "country_france", word: "Francia", emoji: "🇫🇷", pronunciation: "FRAHN-see-ah", meaning: "País europeo", example: "Francia es famosa por su cocina"},
        %{id: "country_japan", word: "Japón", emoji: "🇯🇵", pronunciation: "ha-POHN", meaning: "País asiático", example: "Japón tiene hermosas flores de cerezo"},
        %{id: "country_italy", word: "Italia", emoji: "🇮🇹", pronunciation: "ee-TAH-lee-ah", meaning: "País europeo", example: "Italia hace gran pasta"}
      ],
      game_objects: [
        %{id: "country_usa", emoji: "🇺🇸", word: "Estados Unidos", pronunciation: "es-TAH-dos oo-NEE-dos"},
        %{id: "country_france", emoji: "🇫🇷", word: "Francia", pronunciation: "FRAHN-see-ah"},
        %{id: "country_japan", emoji: "🇯🇵", word: "Japón", pronunciation: "ha-POHN"},
        %{id: "country_italy", emoji: "🇮🇹", word: "Italia", pronunciation: "ee-TAH-lee-ah"}
      ],
      cards: [
        %{id: "country_usa", template: "Soy de _", answer: "Estados Unidos", description: "Declarando nacionalidad"},
        %{id: "country_france", template: "_ es famosa por su cocina", answer: "Francia", description: "Describiendo países"},
        %{id: "country_japan", template: "_ tiene flores de cerezo", answer: "Japón", description: "Conocimiento cultural"}
      ]
    }
  end

  # Chinese content
  defp get_chinese_content do
    %{
      title: "国家",
      description: "学习国家名称和国籍",
      emoji: "🇹🇼",
      vocabulary: [
        %{id: "country_usa", word: "美国", emoji: "🇺🇸", pronunciation: "měi guó", romanization: "měi guó", meaning: "北美国家", example: "美国非常多样化", example_romanization: "měi guó fēi cháng duō yàng huà"},
        %{id: "country_france", word: "法国", emoji: "🇫🇷", pronunciation: "fǎ guó", romanization: "fǎ guó", meaning: "欧洲国家", example: "法国以美食闻名", example_romanization: "fǎ guó yǐ měi shí wén míng"},
        %{id: "country_japan", word: "日本", emoji: "🇯🇵", pronunciation: "rì běn", romanization: "rì běn", meaning: "亚洲国家", example: "日本有美丽的樱花", example_romanization: "rì běn yǒu měi lì de yīng huā"},
        %{id: "country_italy", word: "意大利", emoji: "🇮🇹", pronunciation: "yì dà lì", romanization: "yì dà lì", meaning: "欧洲国家", example: "意大利制作美味的意大利面", example_romanization: "yì dà lì zhì zuò měi wèi de yì dà lì miàn"}
      ],
      game_objects: [
        %{id: "country_usa", emoji: "🇺🇸", word: "美国", pronunciation: "měi guó", romanization: "měi guó"},
        %{id: "country_france", emoji: "🇫🇷", word: "法国", pronunciation: "fǎ guó", romanization: "fǎ guó"},
        %{id: "country_japan", emoji: "🇯🇵", word: "日本", pronunciation: "rì běn", romanization: "rì běn"},
        %{id: "country_italy", emoji: "🇮🇹", word: "意大利", pronunciation: "yì dà lì", romanization: "yì dà lì"}
      ],
      cards: [
        %{id: "country_usa", template: "我来自_", answer: "美国", romanization: "měi guó", description: "声明国籍"},
        %{id: "country_france", template: "_以美食闻名", answer: "法国", romanization: "fǎ guó", description: "描述国家"},
        %{id: "country_japan", template: "_有樱花", answer: "日本", romanization: "rì běn", description: "文化知识"}
      ]
    }
  end

  # French content
  defp get_french_content do
    %{
      title: "Pays",
      description: "Apprendre les noms des pays et les nationalités",
      emoji: "🇹🇼",
      vocabulary: [
        %{id: "country_usa", word: "États-Unis", emoji: "🇺🇸", pronunciation: "eh-tah-zoo-nee", meaning: "Pays d'Amérique du Nord", example: "Les États-Unis sont très diversifiés"},
        %{id: "country_france", word: "France", emoji: "🇫🇷", pronunciation: "frahnss", meaning: "Pays européen", example: "La France est célèbre pour sa cuisine"},
        %{id: "country_japan", word: "Japon", emoji: "🇯🇵", pronunciation: "zhah-pon", meaning: "Pays asiatique", example: "Le Japon a de belles fleurs de cerisier"},
        %{id: "country_italy", word: "Italie", emoji: "🇮🇹", pronunciation: "ee-tah-lee", meaning: "Pays européen", example: "L'Italie fait d'excellentes pâtes"}
      ],
      game_objects: [
        %{id: "country_usa", emoji: "🇺🇸", word: "États-Unis", pronunciation: "eh-tah-zoo-nee"},
        %{id: "country_france", emoji: "🇫🇷", word: "France", pronunciation: "frahnss"},
        %{id: "country_japan", emoji: "🇯🇵", word: "Japon", pronunciation: "zhah-pon"},
        %{id: "country_italy", emoji: "🇮🇹", word: "Italie", pronunciation: "ee-tah-lee"}
      ],
      cards: [
        %{id: "country_usa", template: "Je viens des _", answer: "États-Unis", description: "Déclarer sa nationalité"},
        %{id: "country_france", template: "La _ est célèbre pour sa cuisine", answer: "France", description: "Décrire des pays"},
        %{id: "country_japan", template: "Le _ a des fleurs de cerisier", answer: "Japon", description: "Connaissance culturelle"}
      ]
    }
  end

  # Russian content
  defp get_russian_content do
    %{
      title: "Страны",
      description: "Изучение названий стран и национальностей",
      emoji: "🇹🇼",
      vocabulary: [
        %{id: "country_usa", word: "США", emoji: "🇺🇸", pronunciation: "seh-sheh-ah", romanization: "SShA", meaning: "Североамериканская страна", example: "США очень разнообразная", example_romanization: "SShA ochen' raznoobraznaya"},
        %{id: "country_france", word: "Франция", emoji: "🇫🇷", pronunciation: "FRAHN-tsee-ya", romanization: "Frantsiya", meaning: "Европейская страна", example: "Франция славится кухней", example_romanization: "Frantsiya slavitsya kukhney"},
        %{id: "country_japan", word: "Япония", emoji: "🇯🇵", pronunciation: "ya-POH-nee-ya", romanization: "Yaponiya", meaning: "Азиатская страна", example: "В Японии красивая сакура", example_romanization: "v Yaponii krasivaya sakura"},
        %{id: "country_italy", word: "Италия", emoji: "🇮🇹", pronunciation: "ee-TAH-lee-ya", romanization: "Italiya", meaning: "Европейская страна", example: "Италия делает отличную пасту", example_romanization: "Italiya delayet otlichnuyu pastu"}
      ],
      game_objects: [
        %{id: "country_usa", emoji: "🇺🇸", word: "США", pronunciation: "seh-sheh-ah", romanization: "SShA"},
        %{id: "country_france", emoji: "🇫🇷", word: "Франция", pronunciation: "FRAHN-tsee-ya", romanization: "Frantsiya"},
        %{id: "country_japan", emoji: "🇯🇵", word: "Япония", pronunciation: "ya-POH-nee-ya", romanization: "Yaponiya"},
        %{id: "country_italy", emoji: "🇮🇹", word: "Италия", pronunciation: "ee-TAH-lee-ya", romanization: "Italiya"}
      ],
      cards: [
        %{id: "country_usa", template: "Я из _", answer: "США", description: "Заявление о национальности"},
        %{id: "country_france", template: "_ славится кухней", answer: "Франция", description: "Описание стран"},
        %{id: "country_japan", template: "В _ красивая сакура", answer: "Японии", description: "Культурные знания"}
      ]
    }
  end

  # Japanese content
  defp get_japanese_content do
    %{
      title: "国",
      description: "国名と国籍を学ぶ",
      emoji: "🇹🇼",
      vocabulary: [
        %{id: "country_usa", word: "アメリカ", emoji: "🇺🇸", pronunciation: "ah-meh-ree-kah", romanization: "Amerika", meaning: "北アメリカの国", example: "アメリカはとても多様です", example_romanization: "Amerika wa totemo tayou desu"},
        %{id: "country_france", word: "フランス", emoji: "🇫🇷", pronunciation: "foo-rah-n-su", romanization: "Furansu", meaning: "ヨーロッパの国", example: "フランスは料理で有名です", example_romanization: "Furansu wa ryouri de yuumei desu"},
        %{id: "country_japan", word: "日本", emoji: "🇯🇵", pronunciation: "nee-hon", romanization: "Nihon", meaning: "アジアの国", example: "日本には美しい桜があります", example_romanization: "Nihon ni wa utsukushii sakura ga arimasu"},
        %{id: "country_italy", word: "イタリア", emoji: "🇮🇹", pronunciation: "ee-tah-ree-ah", romanization: "Itaria", meaning: "ヨーロッパの国", example: "イタリアは美味しいパスタを作ります", example_romanization: "Itaria wa oishii pasuta wo tsukurimasu"}
      ],
      game_objects: [
        %{id: "country_usa", emoji: "🇺🇸", word: "アメリカ", pronunciation: "ah-meh-ree-kah", romanization: "Amerika"},
        %{id: "country_france", emoji: "🇫🇷", word: "フランス", pronunciation: "foo-rah-n-su", romanization: "Furansu"},
        %{id: "country_japan", emoji: "🇯🇵", word: "日本", pronunciation: "nee-hon", romanization: "Nihon"},
        %{id: "country_italy", emoji: "🇮🇹", word: "イタリア", pronunciation: "ee-tah-ree-ah", romanization: "Itaria"}
      ],
      cards: [
        %{id: "country_usa", template: "私は_出身です", answer: "アメリカ", description: "国籍を述べる"},
        %{id: "country_france", template: "_は料理で有名です", answer: "フランス", description: "国を説明する"},
        %{id: "country_japan", template: "_には桜があります", answer: "日本", description: "文化的知識"}
      ]
    }
  end

  # Arabic content
  defp get_arabic_content do
    %{
      title: "البلدان",
      description: "تعلم أسماء البلدان والجنسيات",
      emoji: "🇹🇼",
      vocabulary: [
        %{id: "country_usa", word: "أمريكا", emoji: "🇺🇸", pronunciation: "amrii-ka", romanization: "amriika", meaning: "البلد الأمريكي الشمالي", example: "أمريكا متنوعة جداً", example_romanization: "amriika mutanawwi'a jiddan"},
        %{id: "country_france", word: "فرنسا", emoji: "🇫🇷", pronunciation: "fa-ran-sa", romanization: "faransa", meaning: "البلد الأوروبي", example: "فرنسا مشهورة بالمأكولات", example_romanization: "faransa mashhura bil-ma'kulaat"},
        %{id: "country_japan", word: "اليابان", emoji: "🇯🇵", pronunciation: "al-yaa-baan", romanization: "al-yaabaan", meaning: "البلد الآسيوي", example: "اليابان لديها أزهار الكرز الجميلة", example_romanization: "al-yaabaan ladayha azhaar al-karaz al-jamiila"},
        %{id: "country_italy", word: "إيطاليا", emoji: "🇮🇹", pronunciation: "ii-taa-lee-ya", romanization: "iitaaliya", meaning: "البلد الأوروبي", example: "إيطاليا تصنع معكرونة رائعة", example_romanization: "iitaaliya tasna' ma'karuna raa'i'a"}
      ],
      game_objects: [
        %{id: "country_usa", emoji: "🇺🇸", word: "أمريكا", pronunciation: "amrii-ka", romanization: "amriika"},
        %{id: "country_france", emoji: "🇫🇷", word: "فرنسا", pronunciation: "fa-ran-sa", romanization: "faransa"},
        %{id: "country_japan", emoji: "🇯🇵", word: "اليابان", pronunciation: "al-yaa-baan", romanization: "al-yaabaan"},
        %{id: "country_italy", emoji: "🇮🇹", word: "إيطاليا", pronunciation: "ii-taa-lee-ya", romanization: "iitaaliya"}
      ],
      cards: [
        %{id: "country_usa", template: "أنا من _", answer: "أمريكا", description: "ذكر الجنسية"},
        %{id: "country_france", template: "_ مشهورة بالمأكولات", answer: "فرنسا", description: "وصف البلدان"},
        %{id: "country_japan", template: "_ لديها أزهار الكرز", answer: "اليابان", description: "المعرفة الثقافية"}
      ]
    }
  end

  # Portuguese content
  defp get_portuguese_content do
    %{
      title: "Países",
      description: "Aprenda nomes de países e nacionalidades",
      emoji: "🇹🇼",
      vocabulary: [
        %{id: "country_usa", word: "Estados Unidos", emoji: "🇺🇸", pronunciation: "es-TAH-dos oo-NEE-dos", meaning: "País norte-americano", example: "Estados Unidos é muito diverso"},
        %{id: "country_france", word: "França", emoji: "🇫🇷", pronunciation: "FRAHN-sa", meaning: "País europeu", example: "França é famosa pela culinária"},
        %{id: "country_japan", word: "Japão", emoji: "🇯🇵", pronunciation: "ja-PAOH", meaning: "País asiático", example: "Japão tem belas flores de cerejeira"},
        %{id: "country_italy", word: "Itália", emoji: "🇮🇹", pronunciation: "ee-TAH-lee-a", meaning: "País europeu", example: "Itália faz massas excelentes"}
      ],
      game_objects: [
        %{id: "country_usa", emoji: "🇺🇸", word: "Estados Unidos", pronunciation: "es-TAH-dos oo-NEE-dos"},
        %{id: "country_france", emoji: "🇫🇷", word: "França", pronunciation: "FRAHN-sa"},
        %{id: "country_japan", emoji: "🇯🇵", word: "Japão", pronunciation: "ja-PAOH"},
        %{id: "country_italy", emoji: "🇮🇹", word: "Itália", pronunciation: "ee-TAH-lee-a"}
      ],
      cards: [
        %{id: "country_usa", template: "Eu sou dos _", answer: "Estados Unidos", description: "Declarar nacionalidade"},
        %{id: "country_france", template: "_ é famosa pela culinária", answer: "França", description: "Descrever países"},
        %{id: "country_japan", template: "_ tem flores de cerejeira", answer: "Japão", description: "Conhecimento cultural"}
      ]
    }
  end

  # Italian content
  defp get_italian_content do
    %{
      title: "Paesi",
      description: "Impara i nomi dei paesi e le nazionalità",
      emoji: "🇹🇼",
      vocabulary: [
        %{id: "country_usa", word: "Stati Uniti", emoji: "🇺🇸", pronunciation: "STAH-tee oo-NEE-tee", meaning: "Paese nordamericano", example: "Gli Stati Uniti sono molto diversi"},
        %{id: "country_france", word: "Francia", emoji: "🇫🇷", pronunciation: "FRAHN-chah", meaning: "Paese europeo", example: "La Francia è famosa per la cucina"},
        %{id: "country_japan", word: "Giappone", emoji: "🇯🇵", pronunciation: "jah-POH-neh", meaning: "Paese asiatico", example: "Il Giappone ha bellissimi fiori di ciliegio"},
        %{id: "country_italy", word: "Italia", emoji: "🇮🇹", pronunciation: "ee-TAH-lee-ah", meaning: "Paese europeo", example: "L'Italia fa ottima pasta"}
      ],
      game_objects: [
        %{id: "country_usa", emoji: "🇺🇸", word: "Stati Uniti", pronunciation: "STAH-tee oo-NEE-tee"},
        %{id: "country_france", emoji: "🇫🇷", word: "Francia", pronunciation: "FRAHN-chah"},
        %{id: "country_japan", emoji: "🇯🇵", word: "Giappone", pronunciation: "jah-POH-neh"},
        %{id: "country_italy", emoji: "🇮🇹", word: "Italia", pronunciation: "ee-TAH-lee-ah"}
      ],
      cards: [
        %{id: "country_usa", template: "Io vengo dagli _", answer: "Stati Uniti", description: "Dichiarare nazionalità"},
        %{id: "country_france", template: "La _ è famosa per la cucina", answer: "Francia", description: "Descrivere paesi"},
        %{id: "country_japan", template: "Il _ ha fiori di ciliegio", answer: "Giappone", description: "Conoscenza culturale"}
      ]
    }
  end
end