defmodule BobaTalkie.ContentManagerModules.FamilyContent do
  @moduledoc """
  Family topic content in multiple languages.
  Contains tutorial vocabulary, game objects, and challenge cards for learning family relationships and descriptions.
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
      title: "Family",
      description: "Learn family relationships and descriptions",
      emoji: "👨‍👩‍👧‍👦",
      vocabulary: [
        %{id: "family_mother", word: "Mother", emoji: "👩", pronunciation: "MUH-thur", meaning: "Female parent", example: "My mother is kind and caring"},
        %{id: "family_father", word: "Father", emoji: "👨", pronunciation: "FAH-thur", meaning: "Male parent", example: "My father works hard every day"},
        %{id: "family_sister", word: "Sister", emoji: "👧", pronunciation: "SIS-tur", meaning: "Female sibling", example: "I have one younger sister"},
        %{id: "family_brother", word: "Brother", emoji: "👦", pronunciation: "BRUH-thur", meaning: "Male sibling", example: "My brother is very funny"},
        %{id: "family_grandmother", word: "Grandmother", emoji: "👵", pronunciation: "GRAND-muh-thur", meaning: "Mother's or father's mother", example: "My grandmother tells great stories"},
        %{id: "family_grandfather", word: "Grandfather", emoji: "👴", pronunciation: "GRAND-fah-thur", meaning: "Mother's or father's father", example: "My grandfather is very wise"},
        %{id: "family_baby", word: "Baby", emoji: "👶", pronunciation: "BAY-bee", meaning: "Very young child", example: "The baby is sleeping peacefully"},
        %{id: "family_family", word: "Family", emoji: "👨‍👩‍👧‍👦", pronunciation: "FAM-uh-lee", meaning: "Group of related people", example: "I love spending time with my family"},
        %{id: "family_aunt", word: "Aunt", emoji: "👸", pronunciation: "ant", meaning: "Parent's sister", example: "My aunt always brings presents"},
        %{id: "family_uncle", word: "Uncle", emoji: "🤴", pronunciation: "UHN-kul", meaning: "Parent's brother", example: "My uncle teaches me guitar"}
      ],
      game_objects: [
        %{id: "family_mother", emoji: "👩", word: "Mother", pronunciation: "MUH-thur"},
        %{id: "family_father", emoji: "👨", word: "Father", pronunciation: "FAH-thur"},
        %{id: "family_sister", emoji: "👧", word: "Sister", pronunciation: "SIS-tur"},
        %{id: "family_brother", emoji: "👦", word: "Brother", pronunciation: "BRUH-thur"},
        %{id: "family_grandmother", emoji: "👵", word: "Grandmother", pronunciation: "GRAND-muh-thur"},
        %{id: "family_grandfather", emoji: "👴", word: "Grandfather", pronunciation: "GRAND-fah-thur"},
        %{id: "family_baby", emoji: "👶", word: "Baby", pronunciation: "BAY-bee"},
        %{id: "family_family", emoji: "👨‍👩‍👧‍👦", word: "Family", pronunciation: "FAM-uh-lee"},
        %{id: "family_aunt", emoji: "👸", word: "Aunt", pronunciation: "ant"},
        %{id: "family_uncle", emoji: "🤴", word: "Uncle", pronunciation: "UHN-kul"}
      ],
      cards: [
        %{id: "family_mother", template: "This is my _", answer: "mother", description: "Introducing family members"},
        %{id: "family_father", template: "My _ works hard", answer: "father", description: "Describing family members"},
        %{id: "family_sister", template: "I have two _", answer: "sisters", description: "Talking about siblings"},
        %{id: "family_brother", template: "My _ is funny", answer: "brother", description: "Describing personality"},
        %{id: "family_grandmother", template: "My _ tells stories", answer: "grandmother", description: "Family activities"},
        %{id: "family_grandfather", template: "My _ is wise", answer: "grandfather", description: "Describing characteristics"},
        %{id: "family_baby", template: "The _ is cute", answer: "baby", description: "Describing young family members"},
        %{id: "family_family", template: "I love my _", answer: "family", description: "Expressing emotions"},
        %{id: "family_aunt", template: "My _ brings gifts", answer: "aunt", description: "Extended family activities"},
        %{id: "family_uncle", template: "My _ is tall", answer: "uncle", description: "Physical descriptions"}
      ]
    }
  end

  # Spanish content
  defp get_spanish_content do
    %{
      title: "Familia",
      description: "Aprende las relaciones familiares y descripciones",
      emoji: "👨‍👩‍👧‍👦",
      vocabulary: [
        %{id: "family_mother", word: "Madre", emoji: "👩", pronunciation: "MAH-dreh", meaning: "Progenitor femenino", example: "Mi madre es amable y cariñosa"},
        %{id: "family_father", word: "Padre", emoji: "👨", pronunciation: "PAH-dreh", meaning: "Progenitor masculino", example: "Mi padre trabaja duro todos los días"},
        %{id: "family_sister", word: "Hermana", emoji: "👧", pronunciation: "er-MAH-na", meaning: "Hermano femenino", example: "Tengo una hermana menor"},
        %{id: "family_brother", word: "Hermano", emoji: "👦", pronunciation: "er-MAH-no", meaning: "Hermano masculino", example: "Mi hermano es muy divertido"},
        %{id: "family_grandmother", word: "Abuela", emoji: "👵", pronunciation: "ah-BWEH-la", meaning: "Madre de los padres", example: "Mi abuela cuenta historias increíbles"},
        %{id: "family_grandfather", word: "Abuelo", emoji: "👴", pronunciation: "ah-BWEH-lo", meaning: "Padre de los padres", example: "Mi abuelo es muy sabio"},
        %{id: "family_baby", word: "Bebé", emoji: "👶", pronunciation: "beh-BEH", meaning: "Niño muy pequeño", example: "El bebé duerme tranquilamente"},
        %{id: "family_family", word: "Familia", emoji: "👨‍👩‍👧‍👦", pronunciation: "fa-MEE-lee-ah", meaning: "Grupo de personas relacionadas", example: "Me encanta pasar tiempo con mi familia"},
        %{id: "family_aunt", word: "Tía", emoji: "👸", pronunciation: "TEE-ah", meaning: "Hermana de los padres", example: "Mi tía siempre trae regalos"},
        %{id: "family_uncle", word: "Tío", emoji: "🤴", pronunciation: "TEE-oh", meaning: "Hermano de los padres", example: "Mi tío me enseña guitarra"}
      ],
      game_objects: [
        %{id: "family_mother", emoji: "👩", word: "Madre", pronunciation: "MAH-dreh"},
        %{id: "family_father", emoji: "👨", word: "Padre", pronunciation: "PAH-dreh"},
        %{id: "family_sister", emoji: "👧", word: "Hermana", pronunciation: "er-MAH-na"},
        %{id: "family_brother", emoji: "👦", word: "Hermano", pronunciation: "er-MAH-no"},
        %{id: "family_grandmother", emoji: "👵", word: "Abuela", pronunciation: "ah-BWEH-la"},
        %{id: "family_grandfather", emoji: "👴", word: "Abuelo", pronunciation: "ah-BWEH-lo"},
        %{id: "family_baby", emoji: "👶", word: "Bebé", pronunciation: "beh-BEH"},
        %{id: "family_family", emoji: "👨‍👩‍👧‍👦", word: "Familia", pronunciation: "fa-MEE-lee-ah"},
        %{id: "family_aunt", emoji: "👸", word: "Tía", pronunciation: "TEE-ah"},
        %{id: "family_uncle", emoji: "🤴", word: "Tío", pronunciation: "TEE-oh"}
      ],
      cards: [
        %{id: "family_mother", template: "Esta es mi _", answer: "madre", description: "Presentar miembros de la familia"},
        %{id: "family_father", template: "Mi _ trabaja duro", answer: "padre", description: "Describir miembros de la familia"},
        %{id: "family_sister", template: "Tengo dos _", answer: "hermanas", description: "Hablar de hermanos"},
        %{id: "family_brother", template: "Mi _ es divertido", answer: "hermano", description: "Describir personalidad"},
        %{id: "family_grandmother", template: "Mi _ cuenta historias", answer: "abuela", description: "Actividades familiares"},
        %{id: "family_grandfather", template: "Mi _ es sabio", answer: "abuelo", description: "Describir características"},
        %{id: "family_baby", template: "El _ es lindo", answer: "bebé", description: "Describir miembros jóvenes"},
        %{id: "family_family", template: "Amo a mi _", answer: "familia", description: "Expresar emociones"},
        %{id: "family_aunt", template: "Mi _ trae regalos", answer: "tía", description: "Actividades de familia extendida"},
        %{id: "family_uncle", template: "Mi _ es alto", answer: "tío", description: "Descripciones físicas"}
      ]
    }
  end

  # Chinese content
  defp get_chinese_content do
    %{
      title: "家庭",
      description: "学习家庭关系和描述",
      emoji: "👨‍👩‍👧‍👦",
      vocabulary: [
        %{id: "family_mother", word: "妈妈", emoji: "👩", pronunciation: "mā ma", romanization: "mā ma", meaning: "女性父母", example: "我的妈妈很善良和关爱", example_romanization: "wǒ de mā ma hěn shàn liáng hé guān ài"},
        %{id: "family_father", word: "爸爸", emoji: "👨", pronunciation: "bà ba", romanization: "bà ba", meaning: "男性父母", example: "我的爸爸每天都很努力工作", example_romanization: "wǒ de bà ba měi tiān dōu hěn nǔ lì gōng zuò"},
        %{id: "family_sister", word: "姐妹", emoji: "👧", pronunciation: "jiě mèi", romanization: "jiě mèi", meaning: "女性兄弟姐妹", example: "我有一个妹妹", example_romanization: "wǒ yǒu yī gè mèi mèi"},
        %{id: "family_brother", word: "兄弟", emoji: "👦", pronunciation: "xiōng dì", romanization: "xiōng dì", meaning: "男性兄弟姐妹", example: "我的哥哥很有趣", example_romanization: "wǒ de gē ge hěn yǒu qù"},
        %{id: "family_grandmother", word: "奶奶", emoji: "👵", pronunciation: "nǎi nai", romanization: "nǎi nai", meaning: "父母的母亲", example: "我的奶奶讲很棒的故事", example_romanization: "wǒ de nǎi nai jiǎng hěn bàng de gù shì"},
        %{id: "family_grandfather", word: "爷爷", emoji: "👴", pronunciation: "yé ye", romanization: "yé ye", meaning: "父母的父亲", example: "我的爷爷很有智慧", example_romanization: "wǒ de yé ye hěn yǒu zhì huì"},
        %{id: "family_baby", word: "婴儿", emoji: "👶", pronunciation: "yīng ér", romanization: "yīng ér", meaning: "很小的孩子", example: "婴儿正在安静地睡觉", example_romanization: "yīng ér zhèng zài ān jìng de shuì jiào"},
        %{id: "family_family", word: "家庭", emoji: "👨‍👩‍👧‍👦", pronunciation: "jiā tíng", romanization: "jiā tíng", meaning: "相关的人群", example: "我喜欢和家人一起度过时光", example_romanization: "wǒ xǐ huān hé jiā rén yī qǐ dù guò shí guāng"},
        %{id: "family_aunt", word: "阿姨", emoji: "👸", pronunciation: "ā yí", romanization: "ā yí", meaning: "父母的姐妹", example: "我的阿姨总是带礼物", example_romanization: "wǒ de ā yí zǒng shì dài lǐ wù"},
        %{id: "family_uncle", word: "叔叔", emoji: "🤴", pronunciation: "shū shu", romanization: "shū shu", meaning: "父母的兄弟", example: "我的叔叔教我吉他", example_romanization: "wǒ de shū shu jiāo wǒ jí tā"}
      ],
      game_objects: [
        %{id: "family_mother", emoji: "👩", word: "妈妈", pronunciation: "mā ma", romanization: "mā ma"},
        %{id: "family_father", emoji: "👨", word: "爸爸", pronunciation: "bà ba", romanization: "bà ba"},
        %{id: "family_sister", emoji: "👧", word: "姐妹", pronunciation: "jiě mèi", romanization: "jiě mèi"},
        %{id: "family_brother", emoji: "👦", word: "兄弟", pronunciation: "xiōng dì", romanization: "xiōng dì"},
        %{id: "family_grandmother", emoji: "👵", word: "奶奶", pronunciation: "nǎi nai", romanization: "nǎi nai"},
        %{id: "family_grandfather", emoji: "👴", word: "爷爷", pronunciation: "yé ye", romanization: "yé ye"},
        %{id: "family_baby", emoji: "👶", word: "婴儿", pronunciation: "yīng ér", romanization: "yīng ér"},
        %{id: "family_family", emoji: "👨‍👩‍👧‍👦", word: "家庭", pronunciation: "jiā tíng", romanization: "jiā tíng"},
        %{id: "family_aunt", emoji: "👸", word: "阿姨", pronunciation: "ā yí", romanization: "ā yí"},
        %{id: "family_uncle", emoji: "🤴", word: "叔叔", pronunciation: "shū shu", romanization: "shū shu"}
      ],
      cards: [
        %{id: "family_mother", template: "这是我的_", answer: "妈妈", romanization: "mā ma", description: "介绍家庭成员"},
        %{id: "family_father", template: "我的_工作很努力", answer: "爸爸", romanization: "bà ba", description: "描述家庭成员"},
        %{id: "family_sister", template: "我有两个_", answer: "姐妹", romanization: "jiě mèi", description: "谈论兄弟姐妹"},
        %{id: "family_brother", template: "我的_很有趣", answer: "兄弟", romanization: "xiōng dì", description: "描述个性"},
        %{id: "family_grandmother", template: "我的_讲故事", answer: "奶奶", romanization: "nǎi nai", description: "家庭活动"},
        %{id: "family_grandfather", template: "我的_很有智慧", answer: "爷爷", romanization: "yé ye", description: "描述特征"},
        %{id: "family_baby", template: "_很可爱", answer: "婴儿", romanization: "yīng ér", description: "描述年轻家庭成员"},
        %{id: "family_family", template: "我爱我的_", answer: "家庭", romanization: "jiā tíng", description: "表达情感"},
        %{id: "family_aunt", template: "我的_带礼物", answer: "阿姨", romanization: "ā yí", description: "大家庭活动"},
        %{id: "family_uncle", template: "我的_很高", answer: "叔叔", romanization: "shū shu", description: "身体描述"}
      ]
    }
  end

  # French content
  defp get_french_content do
    %{
      title: "Famille",
      description: "Apprendre les relations familiales et les descriptions",
      emoji: "👨‍👩‍👧‍👦",
      vocabulary: [
        %{id: "family_mother", word: "Mère", emoji: "👩", pronunciation: "mair", meaning: "Parent féminin", example: "Ma mère est gentille et attentionnée"},
        %{id: "family_father", word: "Père", emoji: "👨", pronunciation: "pair", meaning: "Parent masculin", example: "Mon père travaille dur chaque jour"},
        %{id: "family_sister", word: "Sœur", emoji: "👧", pronunciation: "sur", meaning: "Frère féminin", example: "J'ai une sœur cadette"},
        %{id: "family_brother", word: "Frère", emoji: "👦", pronunciation: "frair", meaning: "Frère masculin", example: "Mon frère est très drôle"},
        %{id: "family_grandmother", word: "Grand-mère", emoji: "👵", pronunciation: "grahn-mair", meaning: "Mère des parents", example: "Ma grand-mère raconte de superbes histoires"},
        %{id: "family_grandfather", word: "Grand-père", emoji: "👴", pronunciation: "grahn-pair", meaning: "Père des parents", example: "Mon grand-père est très sage"},
        %{id: "family_baby", word: "Bébé", emoji: "👶", pronunciation: "beh-beh", meaning: "Très jeune enfant", example: "Le bébé dort paisiblement"},
        %{id: "family_family", word: "Famille", emoji: "👨‍👩‍👧‍👦", pronunciation: "fa-mee", meaning: "Groupe de personnes liées", example: "J'aime passer du temps avec ma famille"},
        %{id: "family_aunt", word: "Tante", emoji: "👸", pronunciation: "tahnt", meaning: "Sœur des parents", example: "Ma tante apporte toujours des cadeaux"},
        %{id: "family_uncle", word: "Oncle", emoji: "🤴", pronunciation: "ohn-kluh", meaning: "Frère des parents", example: "Mon oncle m'apprend la guitare"}
      ],
      game_objects: [
        %{id: "family_mother", emoji: "👩", word: "Mère", pronunciation: "mair"},
        %{id: "family_father", emoji: "👨", word: "Père", pronunciation: "pair"},
        %{id: "family_sister", emoji: "👧", word: "Sœur", pronunciation: "sur"},
        %{id: "family_brother", emoji: "👦", word: "Frère", pronunciation: "frair"},
        %{id: "family_grandmother", emoji: "👵", word: "Grand-mère", pronunciation: "grahn-mair"},
        %{id: "family_grandfather", emoji: "👴", word: "Grand-père", pronunciation: "grahn-pair"},
        %{id: "family_baby", emoji: "👶", word: "Bébé", pronunciation: "beh-beh"},
        %{id: "family_family", emoji: "👨‍👩‍👧‍👦", word: "Famille", pronunciation: "fa-mee"},
        %{id: "family_aunt", emoji: "👸", word: "Tante", pronunciation: "tahnt"},
        %{id: "family_uncle", emoji: "🤴", word: "Oncle", pronunciation: "ohn-kluh"}
      ],
      cards: [
        %{id: "family_mother", template: "Voici ma _", answer: "mère", description: "Présenter les membres de la famille"},
        %{id: "family_father", template: "Mon _ travaille dur", answer: "père", description: "Décrire les membres de la famille"},
        %{id: "family_sister", template: "J'ai deux _", answer: "sœurs", description: "Parler des frères et sœurs"},
        %{id: "family_brother", template: "Mon _ est drôle", answer: "frère", description: "Décrire la personnalité"},
        %{id: "family_grandmother", template: "Ma _ raconte des histoires", answer: "grand-mère", description: "Activités familiales"},
        %{id: "family_grandfather", template: "Mon _ est sage", answer: "grand-père", description: "Décrire les caractéristiques"},
        %{id: "family_baby", template: "Le _ est mignon", answer: "bébé", description: "Décrire les jeunes membres de la famille"},
        %{id: "family_family", template: "J'aime ma _", answer: "famille", description: "Exprimer les émotions"},
        %{id: "family_aunt", template: "Ma _ apporte des cadeaux", answer: "tante", description: "Activités de la famille élargie"},
        %{id: "family_uncle", template: "Mon _ est grand", answer: "oncle", description: "Descriptions physiques"}
      ]
    }
  end

  # Russian content
  defp get_russian_content do
    %{
      title: "Семья",
      description: "Изучение семейных отношений и описаний",
      emoji: "👨‍👩‍👧‍👦",
      vocabulary: [
        %{id: "family_mother", word: "Мама", emoji: "👩", pronunciation: "MAH-ma", romanization: "mama", meaning: "Женский родитель", example: "Моя мама добрая и заботливая", example_romanization: "moya mama dobraya i zabotlivaya"},
        %{id: "family_father", word: "Папа", emoji: "👨", pronunciation: "PAH-pa", romanization: "papa", meaning: "Мужской родитель", example: "Мой папа каждый день усердно работает", example_romanization: "moy papa kazhdyy den' userdno rabotayet"},
        %{id: "family_sister", word: "Сестра", emoji: "👧", pronunciation: "ses-TRAH", romanization: "sestra", meaning: "Женский брат или сестра", example: "У меня есть младшая сестра", example_romanization: "u menya yest' mladshaya sestra"},
        %{id: "family_brother", word: "Брат", emoji: "👦", pronunciation: "braht", romanization: "brat", meaning: "Мужской брат или сестра", example: "Мой брат очень забавный", example_romanization: "moy brat ochen' zabavnyy"},
        %{id: "family_grandmother", word: "Бабушка", emoji: "👵", pronunciation: "BAH-bush-ka", romanization: "babushka", meaning: "Мать родителей", example: "Моя бабушка рассказывает замечательные истории", example_romanization: "moya babushka rasskazyvayet zamechatel'nye istorii"},
        %{id: "family_grandfather", word: "Дедушка", emoji: "👴", pronunciation: "DEH-dush-ka", romanization: "dedushka", meaning: "Отец родителей", example: "Мой дедушка очень мудрый", example_romanization: "moy dedushka ochen' mudryy"},
        %{id: "family_baby", word: "Ребёнок", emoji: "👶", pronunciation: "reh-BYOH-nok", romanization: "rebyonok", meaning: "Очень маленький ребёнок", example: "Ребёнок спокойно спит", example_romanization: "rebyonok spokoyno spit"},
        %{id: "family_family", word: "Семья", emoji: "👨‍👩‍👧‍👦", pronunciation: "sem-YAH", romanization: "sem'ya", meaning: "Группа связанных людей", example: "Я люблю проводить время со своей семьёй", example_romanization: "ya lyublyu provodit' vremya so svoyey sem'yoy"},
        %{id: "family_aunt", word: "Тётя", emoji: "👸", pronunciation: "TYOH-tya", romanization: "tyotya", meaning: "Сестра родителей", example: "Моя тётя всегда приносит подарки", example_romanization: "moya tyotya vsegda prinosit podarki"},
        %{id: "family_uncle", word: "Дядя", emoji: "🤴", pronunciation: "DYAH-dya", romanization: "dyadya", meaning: "Брат родителей", example: "Мой дядя учит меня играть на гитаре", example_romanization: "moy dyadya uchit menya igrat' na gitare"}
      ],
      game_objects: [
        %{id: "family_mother", emoji: "👩", word: "Мама", pronunciation: "MAH-ma", romanization: "mama"},
        %{id: "family_father", emoji: "👨", word: "Папа", pronunciation: "PAH-pa", romanization: "papa"},
        %{id: "family_sister", emoji: "👧", word: "Сестра", pronunciation: "ses-TRAH", romanization: "sestra"},
        %{id: "family_brother", emoji: "👦", word: "Брат", pronunciation: "braht", romanization: "brat"},
        %{id: "family_grandmother", emoji: "👵", word: "Бабушка", pronunciation: "BAH-bush-ka", romanization: "babushka"},
        %{id: "family_grandfather", emoji: "👴", word: "Дедушка", pronunciation: "DEH-dush-ka", romanization: "dedushka"},
        %{id: "family_baby", emoji: "👶", word: "Ребёнок", pronunciation: "reh-BYOH-nok", romanization: "rebyonok"},
        %{id: "family_family", emoji: "👨‍👩‍👧‍👦", word: "Семья", pronunciation: "sem-YAH", romanization: "sem'ya"},
        %{id: "family_aunt", emoji: "👸", word: "Тётя", pronunciation: "TYOH-tya", romanization: "tyotya"},
        %{id: "family_uncle", emoji: "🤴", word: "Дядя", pronunciation: "DYAH-dya", romanization: "dyadya"}
      ],
      cards: [
        %{id: "family_mother", template: "Это моя _", answer: "мама", description: "Представление членов семьи"},
        %{id: "family_father", template: "Мой _ усердно работает", answer: "папа", description: "Описание членов семьи"},
        %{id: "family_sister", template: "У меня есть две _", answer: "сестры", description: "Разговор о братьях и сёстрах"},
        %{id: "family_brother", template: "Мой _ забавный", answer: "брат", description: "Описание личности"},
        %{id: "family_grandmother", template: "Моя _ рассказывает истории", answer: "бабушка", description: "Семейные занятия"},
        %{id: "family_grandfather", template: "Мой _ мудрый", answer: "дедушка", description: "Описание характеристик"},
        %{id: "family_baby", template: "_ симпатичный", answer: "ребёнок", description: "Описание маленьких членов семьи"},
        %{id: "family_family", template: "Я люблю свою _", answer: "семью", description: "Выражение эмоций"},
        %{id: "family_aunt", template: "Моя _ приносит подарки", answer: "тётя", description: "Деятельность большой семьи"},
        %{id: "family_uncle", template: "Мой _ высокий", answer: "дядя", description: "Физические описания"}
      ]
    }
  end

  # Japanese content
  defp get_japanese_content do
    %{
      title: "家族",
      description: "家族関係と説明を学ぶ",
      emoji: "👨‍👩‍👧‍👦",
      vocabulary: [
        %{id: "family_mother", word: "お母さん", emoji: "👩", pronunciation: "o-kah-san", romanization: "okaasan", meaning: "女性の親", example: "私のお母さんは優しくて思いやりがあります", example_romanization: "watashi no okaasan wa yasashikute omoiyari ga arimasu"},
        %{id: "family_father", word: "お父さん", emoji: "👨", pronunciation: "o-toh-san", romanization: "otousan", meaning: "男性の親", example: "私のお父さんは毎日一生懸命働きます", example_romanization: "watashi no otousan wa mainichi isshoukenmei hatarakimasu"},
        %{id: "family_sister", word: "姉妹", emoji: "👧", pronunciation: "shee-my", romanization: "shimai", meaning: "女性の兄弟姉妹", example: "私には妹が一人います", example_romanization: "watashi ni wa imouto ga hitori imasu"},
        %{id: "family_brother", word: "兄弟", emoji: "👦", pronunciation: "kyoh-dai", romanization: "kyoudai", meaning: "男性の兄弟姉妹", example: "私の兄弟はとても面白いです", example_romanization: "watashi no kyoudai wa totemo omoshiroi desu"},
        %{id: "family_grandmother", word: "おばあさん", emoji: "👵", pronunciation: "o-bah-san", romanization: "obaasan", meaning: "親の母親", example: "私のおばあさんは素晴らしい話をします", example_romanization: "watashi no obaasan wa subarashii hanashi wo shimasu"},
        %{id: "family_grandfather", word: "おじいさん", emoji: "👴", pronunciation: "o-jee-san", romanization: "ojiisan", meaning: "親の父親", example: "私のおじいさんはとても賢いです", example_romanization: "watashi no ojiisan wa totemo kashikoi desu"},
        %{id: "family_baby", word: "赤ちゃん", emoji: "👶", pronunciation: "ah-kah-chan", romanization: "akachan", meaning: "とても小さな子供", example: "赤ちゃんは静かに眠っています", example_romanization: "akachan wa shizuka ni nemutte imasu"},
        %{id: "family_family", word: "家族", emoji: "👨‍👩‍👧‍👦", pronunciation: "kah-zok", romanization: "kazoku", meaning: "関連する人々のグループ", example: "私は家族と時間を過ごすのが好きです", example_romanization: "watashi wa kazoku to jikan wo sugosu no ga suki desu"},
        %{id: "family_aunt", word: "おばさん", emoji: "👸", pronunciation: "o-bah-san", romanization: "obasan", meaning: "親の姉妹", example: "私のおばさんはいつもプレゼントを持ってきます", example_romanization: "watashi no obasan wa itsumo purezento wo motte kimasu"},
        %{id: "family_uncle", word: "おじさん", emoji: "🤴", pronunciation: "o-jee-san", romanization: "ojisan", meaning: "親の兄弟", example: "私のおじさんはギターを教えてくれます", example_romanization: "watashi no ojisan wa gitaa wo oshiete kuremasu"}
      ],
      game_objects: [
        %{id: "family_mother", emoji: "👩", word: "お母さん", pronunciation: "o-kah-san", romanization: "okaasan"},
        %{id: "family_father", emoji: "👨", word: "お父さん", pronunciation: "o-toh-san", romanization: "otousan"},
        %{id: "family_sister", emoji: "👧", word: "姉妹", pronunciation: "shee-my", romanization: "shimai"},
        %{id: "family_brother", emoji: "👦", word: "兄弟", pronunciation: "kyoh-dai", romanization: "kyoudai"},
        %{id: "family_grandmother", emoji: "👵", word: "おばあさん", pronunciation: "o-bah-san", romanization: "obaasan"},
        %{id: "family_grandfather", emoji: "👴", word: "おじいさん", pronunciation: "o-jee-san", romanization: "ojiisan"},
        %{id: "family_baby", emoji: "👶", word: "赤ちゃん", pronunciation: "ah-kah-chan", romanization: "akachan"},
        %{id: "family_family", emoji: "👨‍👩‍👧‍👦", word: "家族", pronunciation: "kah-zok", romanization: "kazoku"},
        %{id: "family_aunt", emoji: "👸", word: "おばさん", pronunciation: "o-bah-san", romanization: "obasan"},
        %{id: "family_uncle", emoji: "🤴", word: "おじさん", pronunciation: "o-jee-san", romanization: "ojisan"}
      ],
      cards: [
        %{id: "family_mother", template: "これは私の_です", answer: "お母さん", description: "家族メンバーを紹介する"},
        %{id: "family_father", template: "私の_は一生懸命働きます", answer: "お父さん", description: "家族メンバーを説明する"},
        %{id: "family_sister", template: "私には二人の_がいます", answer: "姉妹", description: "兄弟姉妹について話す"},
        %{id: "family_brother", template: "私の_は面白いです", answer: "兄弟", description: "性格を説明する"},
        %{id: "family_grandmother", template: "私の_は話をします", answer: "おばあさん", description: "家族の活動"},
        %{id: "family_grandfather", template: "私の_は賢いです", answer: "おじいさん", description: "特徴を説明する"},
        %{id: "family_baby", template: "_はかわいいです", answer: "赤ちゃん", description: "若い家族メンバーを説明する"},
        %{id: "family_family", template: "私は_が大好きです", answer: "家族", description: "感情を表現する"},
        %{id: "family_aunt", template: "私の_はプレゼントを持ってきます", answer: "おばさん", description: "拡大家族の活動"},
        %{id: "family_uncle", template: "私の_は背が高いです", answer: "おじさん", description: "身体的説明"}
      ]
    }
  end

  # Arabic content
  defp get_arabic_content do
    %{
      title: "العائلة",
      description: "تعلم العلاقات العائلية والأوصاف",
      emoji: "👨‍👩‍👧‍👦",
      vocabulary: [
        %{id: "family_mother", word: "أم", emoji: "👩", pronunciation: "umm", romanization: "umm", meaning: "الوالد الأنثى", example: "أمي لطيفة ومهتمة", example_romanization: "ummiy latiifa wa muhtamma"},
        %{id: "family_father", word: "أب", emoji: "👨", pronunciation: "ab", romanization: "ab", meaning: "الوالد الذكر", example: "أبي يعمل بجد كل يوم", example_romanization: "abiy ya'mal bi-jidd kull yawm"},
        %{id: "family_sister", word: "أخت", emoji: "👧", pronunciation: "ukht", romanization: "ukht", meaning: "الشقيقة الأنثى", example: "لدي أخت صغيرة واحدة", example_romanization: "ladayy ukht saghiira waahida"},
        %{id: "family_brother", word: "أخ", emoji: "👦", pronunciation: "akh", romanization: "akh", meaning: "الشقيق الذكر", example: "أخي مضحك جداً", example_romanization: "akhiy mudhik jiddan"},
        %{id: "family_grandmother", word: "جدة", emoji: "👵", pronunciation: "jadda", romanization: "jadda", meaning: "أم الوالدين", example: "جدتي تحكي قصصاً رائعة", example_romanization: "jaddatiy tahkiy qisas raa'i'a"},
        %{id: "family_grandfather", word: "جد", emoji: "👴", pronunciation: "jadd", romanization: "jadd", meaning: "أبو الوالدين", example: "جدي حكيم جداً", example_romanization: "jaddiy hakiim jiddan"},
        %{id: "family_baby", word: "طفل", emoji: "👶", pronunciation: "tifl", romanization: "tifl", meaning: "طفل صغير جداً", example: "الطفل ينام بهدوء", example_romanization: "at-tifl yanaam bi-huduu'"},
        %{id: "family_family", word: "عائلة", emoji: "👨‍👩‍👧‍👦", pronunciation: "aa-ila", romanization: "aa'ila", meaning: "مجموعة من الأشخاص المترابطين", example: "أحب قضاء الوقت مع عائلتي", example_romanization: "uhibb qadaa' al-waqt ma'a aa'ilatiy"},
        %{id: "family_aunt", word: "عمة", emoji: "👸", pronunciation: "amma", romanization: "amma", meaning: "أخت الوالدين", example: "عمتي تجلب الهدايا دائماً", example_romanization: "ammatiy tajlib al-hadaayaa daa'iman"},
        %{id: "family_uncle", word: "عم", emoji: "🤴", pronunciation: "amm", romanization: "amm", meaning: "أخ الوالدين", example: "عمي يعلمني الجيتار", example_romanization: "ammiy yu'allimniy al-jiitaar"}
      ],
      game_objects: [
        %{id: "family_mother", emoji: "👩", word: "أم", pronunciation: "umm", romanization: "umm"},
        %{id: "family_father", emoji: "👨", word: "أب", pronunciation: "ab", romanization: "ab"},
        %{id: "family_sister", emoji: "👧", word: "أخت", pronunciation: "ukht", romanization: "ukht"},
        %{id: "family_brother", emoji: "👦", word: "أخ", pronunciation: "akh", romanization: "akh"},
        %{id: "family_grandmother", emoji: "👵", word: "جدة", pronunciation: "jadda", romanization: "jadda"},
        %{id: "family_grandfather", emoji: "👴", word: "جد", pronunciation: "jadd", romanization: "jadd"},
        %{id: "family_baby", emoji: "👶", word: "طفل", pronunciation: "tifl", romanization: "tifl"},
        %{id: "family_family", emoji: "👨‍👩‍👧‍👦", word: "عائلة", pronunciation: "aa-ila", romanization: "aa'ila"},
        %{id: "family_aunt", emoji: "👸", word: "عمة", pronunciation: "amma", romanization: "amma"},
        %{id: "family_uncle", emoji: "🤴", word: "عم", pronunciation: "amm", romanization: "amm"}
      ],
      cards: [
        %{id: "family_mother", template: "هذه _", answer: "أمي", description: "تقديم أفراد العائلة"},
        %{id: "family_father", template: "_ يعمل بجد", answer: "أبي", description: "وصف أفراد العائلة"},
        %{id: "family_sister", template: "لدي _", answer: "أختان", description: "الحديث عن الإخوة والأخوات"},
        %{id: "family_brother", template: "_ مضحك", answer: "أخي", description: "وصف الشخصية"},
        %{id: "family_grandmother", template: "_ تحكي قصصاً", answer: "جدتي", description: "أنشطة العائلة"},
        %{id: "family_grandfather", template: "_ حكيم", answer: "جدي", description: "وصف الخصائص"},
        %{id: "family_baby", template: "_ لطيف", answer: "الطفل", description: "وصف أفراد العائلة الصغار"},
        %{id: "family_family", template: "أحب _", answer: "عائلتي", description: "التعبير عن المشاعر"},
        %{id: "family_aunt", template: "_ تجلب الهدايا", answer: "عمتي", description: "أنشطة العائلة الموسعة"},
        %{id: "family_uncle", template: "_ طويل", answer: "عمي", description: "الأوصاف الجسدية"}
      ]
    }
  end

  # Portuguese content
  defp get_portuguese_content do
    %{
      title: "Família",
      description: "Aprenda relacionamentos familiares e descrições",
      emoji: "👨‍👩‍👧‍👦",
      vocabulary: [
        %{id: "family_mother", word: "Mãe", emoji: "👩", pronunciation: "mah-eh", meaning: "Pai feminino", example: "Minha mãe é gentil e carinhosa"},
        %{id: "family_father", word: "Pai", emoji: "👨", pronunciation: "pai", meaning: "Pai masculino", example: "Meu pai trabalha duro todos os dias"},
        %{id: "family_sister", word: "Irmã", emoji: "👧", pronunciation: "eer-mah", meaning: "Irmão feminino", example: "Eu tenho uma irmã mais nova"},
        %{id: "family_brother", word: "Irmão", emoji: "👦", pronunciation: "eer-mah-oh", meaning: "Irmão masculino", example: "Meu irmão é muito engraçado"},
        %{id: "family_grandmother", word: "Avó", emoji: "👵", pronunciation: "a-VOH", meaning: "Mãe dos pais", example: "Minha avó conta histórias maravilhosas"},
        %{id: "family_grandfather", word: "Avô", emoji: "👴", pronunciation: "a-VOH", meaning: "Pai dos pais", example: "Meu avô é muito sábio"},
        %{id: "family_baby", word: "Bebê", emoji: "👶", pronunciation: "beh-BEH", meaning: "Criança muito pequena", example: "O bebê está dormindo tranquilamente"},
        %{id: "family_family", word: "Família", emoji: "👨‍👩‍👧‍👦", pronunciation: "fa-MEE-lee-a", meaning: "Grupo de pessoas relacionadas", example: "Eu amo passar tempo com minha família"},
        %{id: "family_aunt", word: "Tia", emoji: "👸", pronunciation: "TEE-a", meaning: "Irmã dos pais", example: "Minha tia sempre traz presentes"},
        %{id: "family_uncle", word: "Tio", emoji: "🤴", pronunciation: "TEE-oh", meaning: "Irmão dos pais", example: "Meu tio me ensina violão"}
      ],
      game_objects: [
        %{id: "family_mother", emoji: "👩", word: "Mãe", pronunciation: "mah-eh"},
        %{id: "family_father", emoji: "👨", word: "Pai", pronunciation: "pai"},
        %{id: "family_sister", emoji: "👧", word: "Irmã", pronunciation: "eer-mah"},
        %{id: "family_brother", emoji: "👦", word: "Irmão", pronunciation: "eer-mah-oh"},
        %{id: "family_grandmother", emoji: "👵", word: "Avó", pronunciation: "a-VOH"},
        %{id: "family_grandfather", emoji: "👴", word: "Avô", pronunciation: "a-VOH"},
        %{id: "family_baby", emoji: "👶", word: "Bebê", pronunciation: "beh-BEH"},
        %{id: "family_family", emoji: "👨‍👩‍👧‍👦", word: "Família", pronunciation: "fa-MEE-lee-a"},
        %{id: "family_aunt", emoji: "👸", word: "Tia", pronunciation: "TEE-a"},
        %{id: "family_uncle", emoji: "🤴", word: "Tio", pronunciation: "TEE-oh"}
      ],
      cards: [
        %{id: "family_mother", template: "Esta é minha _", answer: "mãe", description: "Apresentar membros da família"},
        %{id: "family_father", template: "Meu _ trabalha duro", answer: "pai", description: "Descrever membros da família"},
        %{id: "family_sister", template: "Eu tenho duas _", answer: "irmãs", description: "Falar sobre irmãos"},
        %{id: "family_brother", template: "Meu _ é engraçado", answer: "irmão", description: "Descrever personalidade"},
        %{id: "family_grandmother", template: "Minha _ conta histórias", answer: "avó", description: "Atividades familiares"},
        %{id: "family_grandfather", template: "Meu _ é sábio", answer: "avô", description: "Descrever características"},
        %{id: "family_baby", template: "O _ é fofo", answer: "bebê", description: "Descrever membros jovens da família"},
        %{id: "family_family", template: "Eu amo minha _", answer: "família", description: "Expressar emoções"},
        %{id: "family_aunt", template: "Minha _ traz presentes", answer: "tia", description: "Atividades da família estendida"},
        %{id: "family_uncle", template: "Meu _ é alto", answer: "tio", description: "Descrições físicas"}
      ]
    }
  end

  # Italian content
  defp get_italian_content do
    %{
      title: "Famiglia",
      description: "Impara le relazioni familiari e le descrizioni",
      emoji: "👨‍👩‍👧‍👦",
      vocabulary: [
        %{id: "family_mother", word: "Madre", emoji: "👩", pronunciation: "MAH-dreh", meaning: "Genitore femminile", example: "Mia madre è gentile e premurosa"},
        %{id: "family_father", word: "Padre", emoji: "👨", pronunciation: "PAH-dreh", meaning: "Genitore maschile", example: "Mio padre lavora sodo ogni giorno"},
        %{id: "family_sister", word: "Sorella", emoji: "👧", pronunciation: "so-REL-la", meaning: "Fratello femminile", example: "Ho una sorella più giovane"},
        %{id: "family_brother", word: "Fratello", emoji: "👦", pronunciation: "fra-TEL-lo", meaning: "Fratello maschile", example: "Mio fratello è molto divertente"},
        %{id: "family_grandmother", word: "Nonna", emoji: "👵", pronunciation: "NON-na", meaning: "Madre dei genitori", example: "La mia nonna racconta storie meravigliose"},
        %{id: "family_grandfather", word: "Nonno", emoji: "👴", pronunciation: "NON-no", meaning: "Padre dei genitori", example: "Mio nonno è molto saggio"},
        %{id: "family_baby", word: "Bambino", emoji: "👶", pronunciation: "bam-BEE-no", meaning: "Bambino molto piccolo", example: "Il bambino dorme tranquillamente"},
        %{id: "family_family", word: "Famiglia", emoji: "👨‍👩‍👧‍👦", pronunciation: "fa-MEE-lya", meaning: "Gruppo di persone imparentate", example: "Amo passare il tempo con la mia famiglia"},
        %{id: "family_aunt", word: "Zia", emoji: "👸", pronunciation: "TSEE-a", meaning: "Sorella dei genitori", example: "La mia zia porta sempre regali"},
        %{id: "family_uncle", word: "Zio", emoji: "🤴", pronunciation: "TSEE-oh", meaning: "Fratello dei genitori", example: "Mio zio mi insegna la chitarra"}
      ],
      game_objects: [
        %{id: "family_mother", emoji: "👩", word: "Madre", pronunciation: "MAH-dreh"},
        %{id: "family_father", emoji: "👨", word: "Padre", pronunciation: "PAH-dreh"},
        %{id: "family_sister", emoji: "👧", word: "Sorella", pronunciation: "so-REL-la"},
        %{id: "family_brother", emoji: "👦", word: "Fratello", pronunciation: "fra-TEL-lo"},
        %{id: "family_grandmother", emoji: "👵", word: "Nonna", pronunciation: "NON-na"},
        %{id: "family_grandfather", emoji: "👴", word: "Nonno", pronunciation: "NON-no"},
        %{id: "family_baby", emoji: "👶", word: "Bambino", pronunciation: "bam-BEE-no"},
        %{id: "family_family", emoji: "👨‍👩‍👧‍👦", word: "Famiglia", pronunciation: "fa-MEE-lya"},
        %{id: "family_aunt", emoji: "👸", word: "Zia", pronunciation: "TSEE-a"},
        %{id: "family_uncle", emoji: "🤴", word: "Zio", pronunciation: "TSEE-oh"}
      ],
      cards: [
        %{id: "family_mother", template: "Questa è mia _", answer: "madre", description: "Presentare i membri della famiglia"},
        %{id: "family_father", template: "Mio _ lavora sodo", answer: "padre", description: "Descrivere i membri della famiglia"},
        %{id: "family_sister", template: "Ho due _", answer: "sorelle", description: "Parlare dei fratelli"},
        %{id: "family_brother", template: "Mio _ è divertente", answer: "fratello", description: "Descrivere la personalità"},
        %{id: "family_grandmother", template: "La mia _ racconta storie", answer: "nonna", description: "Attività familiari"},
        %{id: "family_grandfather", template: "Mio _ è saggio", answer: "nonno", description: "Descrivere caratteristiche"},
        %{id: "family_baby", template: "Il _ è carino", answer: "bambino", description: "Descrivere i membri giovani della famiglia"},
        %{id: "family_family", template: "Amo la mia _", answer: "famiglia", description: "Esprimere emozioni"},
        %{id: "family_aunt", template: "La mia _ porta regali", answer: "zia", description: "Attività della famiglia allargata"},
        %{id: "family_uncle", template: "Mio _ è alto", answer: "zio", description: "Descrizioni fisiche"}
      ]
    }
  end
end