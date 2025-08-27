defmodule BobaTalkie.ContentManagerModules.AnimalsContent do
  @moduledoc """
  Animals topic content in multiple languages.
  Contains tutorial vocabulary, game objects, and challenge cards for learning animal names.
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
      title: "Animals",
      description: "Learn animal names and their characteristics",
      emoji: "🐶",
      vocabulary: [
        %{id: "animal_dog", word: "Dog", emoji: "🐶", pronunciation: "DAWG", meaning: "Domestic animal", example: "The dog is man's best friend"},
        %{id: "animal_cat", word: "Cat", emoji: "🐱", pronunciation: "KAT", meaning: "Domestic pet", example: "The cat sleeps in the sun"},
        %{id: "animal_rabbit", word: "Rabbit", emoji: "🐰", pronunciation: "RAB-it", meaning: "Small hopping animal", example: "The rabbit hops quickly"},
        %{id: "animal_bear", word: "Bear", emoji: "🐻", pronunciation: "BAIR", meaning: "Large wild animal", example: "The brown bear is strong"}
      ],
      game_objects: [
        %{id: "animal_dog", emoji: "🐶", word: "Dog", pronunciation: "DAWG"},
        %{id: "animal_cat", emoji: "🐱", word: "Cat", pronunciation: "KAT"},
        %{id: "animal_rabbit", emoji: "🐰", word: "Rabbit", pronunciation: "RAB-it"},
        %{id: "animal_bear", emoji: "🐻", word: "Bear", pronunciation: "BAIR"}
      ],
      cards: [
        %{id: "animal_dog", template: "The _ is loyal", answer: "dog", description: "Describe pet characteristics"},
        %{id: "animal_cat", template: "The _ sleeps in the sun", answer: "cat", description: "Describe animal behavior"},
        %{id: "animal_rabbit", template: "The _ hops quickly", answer: "rabbit", description: "Describe animal movement"}
      ]
    }
  end

  # Spanish content
  defp get_spanish_content do
    %{
      title: "Animales",
      description: "Aprende nombres de animales y sus características",
      emoji: "🐶",
      vocabulary: [
        %{id: "animal_dog", word: "Perro", emoji: "🐶", pronunciation: "PEH-rro", meaning: "Animal doméstico", example: "El perro es el mejor amigo del hombre"},
        %{id: "animal_cat", word: "Gato", emoji: "🐱", pronunciation: "GAH-to", meaning: "Mascota doméstica", example: "El gato duerme al sol"},
        %{id: "animal_rabbit", word: "Conejo", emoji: "🐰", pronunciation: "ko-NEH-ho", meaning: "Animal pequeño que salta", example: "El conejo salta rápidamente"},
        %{id: "animal_bear", word: "Oso", emoji: "🐻", pronunciation: "OH-so", meaning: "Animal salvaje grande", example: "El oso pardo es fuerte"}
      ],
      game_objects: [
        %{id: "animal_dog", emoji: "🐶", word: "Perro", pronunciation: "PEH-rro"},
        %{id: "animal_cat", emoji: "🐱", word: "Gato", pronunciation: "GAH-to"},
        %{id: "animal_rabbit", emoji: "🐰", word: "Conejo", pronunciation: "ko-NEH-ho"},
        %{id: "animal_bear", emoji: "🐻", word: "Oso", pronunciation: "OH-so"}
      ],
      cards: [
        %{id: "animal_dog", template: "El _ es leal", answer: "perro", description: "Describir características de mascotas"},
        %{id: "animal_cat", template: "El _ duerme al sol", answer: "gato", description: "Describir comportamiento animal"},
        %{id: "animal_rabbit", template: "El _ salta rápidamente", answer: "conejo", description: "Describir movimiento animal"}
      ]
    }
  end

  # Chinese content
  defp get_chinese_content do
    %{
      title: "动物",
      description: "学习动物名称和它们的特征",
      emoji: "🐶",
      vocabulary: [
        %{id: "animal_dog", word: "狗", emoji: "🐶", pronunciation: "gǒu", romanization: "gǒu", meaning: "家庭动物", example: "狗是人类最好的朋友", example_romanization: "gǒu shì rén lèi zuì hǎo de péng yǒu"},
        %{id: "animal_cat", word: "猫", emoji: "🐱", pronunciation: "māo", romanization: "māo", meaning: "家庭宠物", example: "猫在阳光下睡觉", example_romanization: "māo zài yáng guāng xià shuì jiào"},
        %{id: "animal_rabbit", word: "兔子", emoji: "🐰", pronunciation: "tù zi", romanization: "tù zi", meaning: "小跳跃动物", example: "兔子跳得很快", example_romanization: "tù zi tiào dé hěn kuài"},
        %{id: "animal_bear", word: "熊", emoji: "🐻", pronunciation: "xióng", romanization: "xióng", meaning: "大型野生动物", example: "棕熊很强壮", example_romanization: "zōng xióng hěn qiáng zhuàng"}
      ],
      game_objects: [
        %{id: "animal_dog", emoji: "🐶", word: "狗", pronunciation: "gǒu", romanization: "gǒu"},
        %{id: "animal_cat", emoji: "🐱", word: "猫", pronunciation: "māo", romanization: "māo"},
        %{id: "animal_rabbit", emoji: "🐰", word: "兔子", pronunciation: "tù zi", romanization: "tù zi"},
        %{id: "animal_bear", emoji: "🐻", word: "熊", pronunciation: "xióng", romanization: "xióng"}
      ],
      cards: [
        %{id: "animal_dog", template: "_很忠诚", answer: "狗", romanization: "gǒu", description: "描述宠物特征"},
        %{id: "animal_cat", template: "_在阳光下睡觉", answer: "猫", romanization: "māo", description: "描述动物行为"},
        %{id: "animal_rabbit", template: "_跳得很快", answer: "兔子", romanization: "tù zi", description: "描述动物运动"}
      ]
    }
  end

  # French content
  defp get_french_content do
    %{
      title: "Animaux",
      description: "Apprendre les noms des animaux et leurs caractéristiques",
      emoji: "🐶",
      vocabulary: [
        %{id: "animal_dog", word: "Chien", emoji: "🐶", pronunciation: "shee-an", meaning: "Animal domestique", example: "Le chien est le meilleur ami de l'homme"},
        %{id: "animal_cat", word: "Chat", emoji: "🐱", pronunciation: "shah", meaning: "Animal domestique", example: "Le chat dort au soleil"},
        %{id: "animal_rabbit", word: "Lapin", emoji: "🐰", pronunciation: "lah-pan", meaning: "Petit animal qui saute", example: "Le lapin saute rapidement"},
        %{id: "animal_bear", word: "Ours", emoji: "🐻", pronunciation: "oors", meaning: "Grand animal sauvage", example: "L'ours brun est fort"}
      ],
      game_objects: [
        %{id: "animal_dog", emoji: "🐶", word: "Chien", pronunciation: "shee-an"},
        %{id: "animal_cat", emoji: "🐱", word: "Chat", pronunciation: "shah"},
        %{id: "animal_rabbit", emoji: "🐰", word: "Lapin", pronunciation: "lah-pan"},
        %{id: "animal_bear", emoji: "🐻", word: "Ours", pronunciation: "oors"}
      ],
      cards: [
        %{id: "animal_dog", template: "Le _ est fidèle", answer: "chien", description: "Décrire les caractéristiques des animaux"},
        %{id: "animal_cat", template: "Le _ dort au soleil", answer: "chat", description: "Décrire le comportement animal"},
        %{id: "animal_rabbit", template: "Le _ saute rapidement", answer: "lapin", description: "Décrire les mouvements des animaux"}
      ]
    }
  end

  # Russian content
  defp get_russian_content do
    %{
      title: "Животные",
      description: "Изучение названий животных и их характеристик",
      emoji: "🐶",
      vocabulary: [
        %{id: "animal_dog", word: "Собака", emoji: "🐶", pronunciation: "so-BAH-ka", romanization: "sobaka", meaning: "Домашнее животное", example: "Собака - лучший друг человека", example_romanization: "sobaka - luchshiy drug cheloveka"},
        %{id: "animal_cat", word: "Кот", emoji: "🐱", pronunciation: "koht", romanization: "kot", meaning: "Домашний питомец", example: "Кот спит на солнце", example_romanization: "kot spit na solntse"},
        %{id: "animal_rabbit", word: "Кролик", emoji: "🐰", pronunciation: "KROH-lik", romanization: "krolik", meaning: "Маленькое прыгающее животное", example: "Кролик быстро прыгает", example_romanization: "krolik bystro pryigayet"},
        %{id: "animal_bear", word: "Медведь", emoji: "🐻", pronunciation: "med-VEHD", romanization: "medved'", meaning: "Большое дикое животное", example: "Бурый медведь сильный", example_romanization: "buryy medved' sil'nyy"}
      ],
      game_objects: [
        %{id: "animal_dog", emoji: "🐶", word: "Собака", pronunciation: "so-BAH-ka", romanization: "sobaka"},
        %{id: "animal_cat", emoji: "🐱", word: "Кот", pronunciation: "koht", romanization: "kot"},
        %{id: "animal_rabbit", emoji: "🐰", word: "Кролик", pronunciation: "KROH-lik", romanization: "krolik"},
        %{id: "animal_bear", emoji: "🐻", word: "Медведь", pronunciation: "med-VEHD", romanization: "medved'"}
      ],
      cards: [
        %{id: "animal_dog", template: "_ верная", answer: "собака", description: "Описать характеристики домашних животных"},
        %{id: "animal_cat", template: "_ спит на солнце", answer: "кот", description: "Описать поведение животных"},
        %{id: "animal_rabbit", template: "_ быстро прыгает", answer: "кролик", description: "Описать движения животных"}
      ]
    }
  end

  # Japanese content
  defp get_japanese_content do
    %{
      title: "動物",
      description: "動物の名前とその特徴を学ぶ",
      emoji: "🐶",
      vocabulary: [
        %{id: "animal_dog", word: "犬", emoji: "🐶", pronunciation: "ee-nu", romanization: "inu", meaning: "家庭の動物", example: "犬は人間の最高の友達です", example_romanization: "inu wa ningen no saikou no tomodachi desu"},
        %{id: "animal_cat", word: "猫", emoji: "🐱", pronunciation: "neh-ko", romanization: "neko", meaning: "家庭のペット", example: "猫は日向で寝ています", example_romanization: "neko wa hinata de nete imasu"},
        %{id: "animal_rabbit", word: "うさぎ", emoji: "🐰", pronunciation: "oo-sah-gee", romanization: "usagi", meaning: "小さく跳ねる動物", example: "うさぎは素早く跳びます", example_romanization: "usagi wa subayaku tobimasu"},
        %{id: "animal_bear", word: "熊", emoji: "🐻", pronunciation: "koo-mah", romanization: "kuma", meaning: "大きな野生動物", example: "ヒグマは強いです", example_romanization: "higuma wa tsuyoi desu"}
      ],
      game_objects: [
        %{id: "animal_dog", emoji: "🐶", word: "犬", pronunciation: "ee-nu", romanization: "inu"},
        %{id: "animal_cat", emoji: "🐱", word: "猫", pronunciation: "neh-ko", romanization: "neko"},
        %{id: "animal_rabbit", emoji: "🐰", word: "うさぎ", pronunciation: "oo-sah-gee", romanization: "usagi"},
        %{id: "animal_bear", emoji: "🐻", word: "熊", pronunciation: "koo-mah", romanization: "kuma"}
      ],
      cards: [
        %{id: "animal_dog", template: "_は忠実です", answer: "犬", description: "ペットの特徴を説明"},
        %{id: "animal_cat", template: "_は日向で寝ています", answer: "猫", description: "動物の行動を説明"},
        %{id: "animal_rabbit", template: "_は素早く跳びます", answer: "うさぎ", description: "動物の動きを説明"}
      ]
    }
  end

  # Arabic content
  defp get_arabic_content do
    %{
      title: "الحيوانات",
      description: "تعلم أسماء الحيوانات وخصائصها",
      emoji: "🐶",
      vocabulary: [
        %{id: "animal_dog", word: "كلب", emoji: "🐶", pronunciation: "kalb", romanization: "kalb", meaning: "حيوان أليف", example: "الكلب أفضل صديق للإنسان", example_romanization: "al-kalb afdal sadeeq lil-insaan"},
        %{id: "animal_cat", word: "قط", emoji: "🐱", pronunciation: "qitt", romanization: "qitt", meaning: "حيوان أليف منزلي", example: "القط ينام في الشمس", example_romanization: "al-qitt yanaam fii ash-shams"},
        %{id: "animal_rabbit", word: "أرنب", emoji: "🐰", pronunciation: "ar-nab", romanization: "arnab", meaning: "حيوان صغير يقفز", example: "الأرنب يقفز بسرعة", example_romanization: "al-arnab yaqfiz bi-sur'a"},
        %{id: "animal_bear", word: "دب", emoji: "🐻", pronunciation: "dubb", romanization: "dubb", meaning: "حيوان بري كبير", example: "الدب البني قوي", example_romanization: "ad-dubb al-bunniy qawiy"}
      ],
      game_objects: [
        %{id: "animal_dog", emoji: "🐶", word: "كلب", pronunciation: "kalb", romanization: "kalb"},
        %{id: "animal_cat", emoji: "🐱", word: "قط", pronunciation: "qitt", romanization: "qitt"},
        %{id: "animal_rabbit", emoji: "🐰", word: "أرنب", pronunciation: "ar-nab", romanization: "arnab"},
        %{id: "animal_bear", emoji: "🐻", word: "دب", pronunciation: "dubb", romanization: "dubb"}
      ],
      cards: [
        %{id: "animal_dog", template: "_ مخلص", answer: "الكلب", description: "وصف خصائص الحيوانات الأليفة"},
        %{id: "animal_cat", template: "_ ينام في الشمس", answer: "القط", description: "وصف سلوك الحيوانات"},
        %{id: "animal_rabbit", template: "_ يقفز بسرعة", answer: "الأرنب", description: "وصف حركة الحيوانات"}
      ]
    }
  end

  # Portuguese content
  defp get_portuguese_content do
    %{
      title: "Animais",
      description: "Aprenda nomes de animais e suas características",
      emoji: "🐶",
      vocabulary: [
        %{id: "animal_dog", word: "Cachorro", emoji: "🐶", pronunciation: "ka-SHOR-roh", meaning: "Animal doméstico", example: "O cachorro é o melhor amigo do homem"},
        %{id: "animal_cat", word: "Gato", emoji: "🐱", pronunciation: "GAH-toh", meaning: "Animal de estimação doméstico", example: "O gato dorme no sol"},
        %{id: "animal_rabbit", word: "Coelho", emoji: "🐰", pronunciation: "koh-EH-lyoh", meaning: "Pequeno animal que pula", example: "O coelho pula rapidamente"},
        %{id: "animal_bear", word: "Urso", emoji: "🐻", pronunciation: "OOR-soh", meaning: "Grande animal selvagem", example: "O urso pardo é forte"}
      ],
      game_objects: [
        %{id: "animal_dog", emoji: "🐶", word: "Cachorro", pronunciation: "ka-SHOR-roh"},
        %{id: "animal_cat", emoji: "🐱", word: "Gato", pronunciation: "GAH-toh"},
        %{id: "animal_rabbit", emoji: "🐰", word: "Coelho", pronunciation: "koh-EH-lyoh"},
        %{id: "animal_bear", emoji: "🐻", word: "Urso", pronunciation: "OOR-soh"}
      ],
      cards: [
        %{id: "animal_dog", template: "O _ é leal", answer: "cachorro", description: "Descrever características dos animais de estimação"},
        %{id: "animal_cat", template: "O _ dorme no sol", answer: "gato", description: "Descrever comportamento animal"},
        %{id: "animal_rabbit", template: "O _ pula rapidamente", answer: "coelho", description: "Descrever movimento animal"}
      ]
    }
  end

  # Italian content
  defp get_italian_content do
    %{
      title: "Animali",
      description: "Impara i nomi degli animali e le loro caratteristiche",
      emoji: "🐶",
      vocabulary: [
        %{id: "animal_dog", word: "Cane", emoji: "🐶", pronunciation: "KAH-neh", meaning: "Animale domestico", example: "Il cane è il migliore amico dell'uomo"},
        %{id: "animal_cat", word: "Gatto", emoji: "🐱", pronunciation: "GAT-toh", meaning: "Animale domestico", example: "Il gatto dorme al sole"},
        %{id: "animal_rabbit", word: "Coniglio", emoji: "🐰", pronunciation: "ko-NEE-lyoh", meaning: "Piccolo animale che salta", example: "Il coniglio salta velocemente"},
        %{id: "animal_bear", word: "Orso", emoji: "🐻", pronunciation: "OR-soh", meaning: "Grande animale selvatico", example: "L'orso bruno è forte"}
      ],
      game_objects: [
        %{id: "animal_dog", emoji: "🐶", word: "Cane", pronunciation: "KAH-neh"},
        %{id: "animal_cat", emoji: "🐱", word: "Gatto", pronunciation: "GAT-toh"},
        %{id: "animal_rabbit", emoji: "🐰", word: "Coniglio", pronunciation: "ko-NEE-lyoh"},
        %{id: "animal_bear", emoji: "🐻", word: "Orso", pronunciation: "OR-soh"}
      ],
      cards: [
        %{id: "animal_dog", template: "Il _ è leale", answer: "cane", description: "Descrivere caratteristiche degli animali domestici"},
        %{id: "animal_cat", template: "Il _ dorme al sole", answer: "gatto", description: "Descrivere comportamento animale"},
        %{id: "animal_rabbit", template: "Il _ salta velocemente", answer: "coniglio", description: "Descrivere movimento animale"}
      ]
    }
  end
end