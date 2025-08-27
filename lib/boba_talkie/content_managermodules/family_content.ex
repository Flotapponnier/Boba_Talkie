defmodule BobaTalkie.ContentManagerModules.FamilyContent do
  @moduledoc """
  Family topic content in multiple languages.
  Contains tutorial vocabulary, game objects, and challenge cards for learning family relationships.
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
      description: "Learn family relationships and how to talk about family",
      emoji: "👨‍👩‍👧‍👦",
      vocabulary: [
        %{id: "family_mother", word: "Mother", emoji: "👩", pronunciation: "MUTH-ur", meaning: "Female parent", example: "My mother is very kind"},
        %{id: "family_father", word: "Father", emoji: "👨", pronunciation: "FAH-thur", meaning: "Male parent", example: "My father works hard"},
        %{id: "family_sister", word: "Sister", emoji: "👧", pronunciation: "SIS-tur", meaning: "Female sibling", example: "I have two sisters"},
        %{id: "family_brother", word: "Brother", emoji: "👦", pronunciation: "BRUTH-ur", meaning: "Male sibling", example: "My brother is younger"}
      ],
      game_objects: [
        %{id: "family_mother", emoji: "👩", word: "Mother", pronunciation: "MUTH-ur"},
        %{id: "family_father", emoji: "👨", word: "Father", pronunciation: "FAH-thur"},
        %{id: "family_sister", emoji: "👧", word: "Sister", pronunciation: "SIS-tur"},
        %{id: "family_brother", emoji: "👦", word: "Brother", pronunciation: "BRUTH-ur"}
      ],
      cards: [
        %{id: "family_mother", template: "My _ is kind", answer: "mother", description: "Describing family member"},
        %{id: "family_father", template: "My _ works hard", answer: "father", description: "Describing family member"},
        %{id: "family_sister", template: "I have two _", answer: "sisters", description: "Talking about siblings"}
      ]
    }
  end

  # Spanish content
  defp get_spanish_content do
    %{
      title: "Familia",
      description: "Aprende las relaciones familiares y cómo hablar de la familia",
      emoji: "👨‍👩‍👧‍👦",
      vocabulary: [
        %{id: "family_mother", word: "Madre", emoji: "👩", pronunciation: "MAH-dreh", meaning: "Padre femenino", example: "Mi madre es muy amable"},
        %{id: "family_father", word: "Padre", emoji: "👨", pronunciation: "PAH-dreh", meaning: "Padre masculino", example: "Mi padre trabaja mucho"},
        %{id: "family_sister", word: "Hermana", emoji: "👧", pronunciation: "er-MAH-na", meaning: "Hermano femenino", example: "Tengo dos hermanas"},
        %{id: "family_brother", word: "Hermano", emoji: "👦", pronunciation: "er-MAH-no", meaning: "Hermano masculino", example: "Mi hermano es menor"}
      ],
      game_objects: [
        %{id: "family_mother", emoji: "👩", word: "Madre", pronunciation: "MAH-dreh"},
        %{id: "family_father", emoji: "👨", word: "Padre", pronunciation: "PAH-dreh"},
        %{id: "family_sister", emoji: "👧", word: "Hermana", pronunciation: "er-MAH-na"},
        %{id: "family_brother", emoji: "👦", word: "Hermano", pronunciation: "er-MAH-no"}
      ],
      cards: [
        %{id: "family_mother", template: "Mi _ es amable", answer: "madre", description: "Describiendo miembro familiar"},
        %{id: "family_father", template: "Mi _ trabaja mucho", answer: "padre", description: "Describiendo miembro familiar"},
        %{id: "family_sister", template: "Tengo dos _", answer: "hermanas", description: "Hablando de hermanos"}
      ]
    }
  end

  # Chinese content
  defp get_chinese_content do
    %{
      title: "家庭",
      description: "学习家庭关系和如何谈论家人",
      emoji: "👨‍👩‍👧‍👦",
      vocabulary: [
        %{id: "family_mother", word: "妈妈", emoji: "👩", pronunciation: "mā ma", romanization: "mā ma", meaning: "女性父母", example: "我妈妈很善良", example_romanization: "wǒ mā ma hěn shàn liáng"},
        %{id: "family_father", word: "爸爸", emoji: "👨", pronunciation: "bà ba", romanization: "bà ba", meaning: "男性父母", example: "我爸爸工作很努力", example_romanization: "wǒ bà ba gōng zuò hěn nǔ lì"},
        %{id: "family_sister", word: "姐妹", emoji: "👧", pronunciation: "jiě mèi", romanization: "jiě mèi", meaning: "女性兄弟姐妹", example: "我有两个姐妹", example_romanization: "wǒ yǒu liǎng gè jiě mèi"},
        %{id: "family_brother", word: "兄弟", emoji: "👦", pronunciation: "xiōng dì", romanization: "xiōng dì", meaning: "男性兄弟姐妹", example: "我弟弟更年轻", example_romanization: "wǒ dì di gèng nián qīng"}
      ],
      game_objects: [
        %{id: "family_mother", emoji: "👩", word: "妈妈", pronunciation: "mā ma", romanization: "mā ma"},
        %{id: "family_father", emoji: "👨", word: "爸爸", pronunciation: "bà ba", romanization: "bà ba"},
        %{id: "family_sister", emoji: "👧", word: "姐妹", pronunciation: "jiě mèi", romanization: "jiě mèi"},
        %{id: "family_brother", emoji: "👦", word: "兄弟", pronunciation: "xiōng dì", romanization: "xiōng dì"}
      ],
      cards: [
        %{id: "family_mother", template: "我_很善良", answer: "妈妈", romanization: "mā ma", description: "描述家庭成员"},
        %{id: "family_father", template: "我_工作很努力", answer: "爸爸", romanization: "bà ba", description: "描述家庭成员"},
        %{id: "family_sister", template: "我有两个_", answer: "姐妹", romanization: "jiě mèi", description: "谈论兄弟姐妹"}
      ]
    }
  end

  # French content
  defp get_french_content do
    %{
      title: "Famille",
      description: "Apprendre les relations familiales et comment parler de la famille",
      emoji: "👨‍👩‍👧‍👦",
      vocabulary: [
        %{id: "family_mother", word: "Mère", emoji: "👩", pronunciation: "mehr", meaning: "Parent féminin", example: "Ma mère est très gentille"},
        %{id: "family_father", word: "Père", emoji: "👨", pronunciation: "pehr", meaning: "Parent masculin", example: "Mon père travaille beaucoup"},
        %{id: "family_sister", word: "Sœur", emoji: "👧", pronunciation: "sur", meaning: "Frère féminin", example: "J'ai deux sœurs"},
        %{id: "family_brother", word: "Frère", emoji: "👦", pronunciation: "frehr", meaning: "Frère masculin", example: "Mon frère est plus jeune"}
      ],
      game_objects: [
        %{id: "family_mother", emoji: "👩", word: "Mère", pronunciation: "mehr"},
        %{id: "family_father", emoji: "👨", word: "Père", pronunciation: "pehr"},
        %{id: "family_sister", emoji: "👧", word: "Sœur", pronunciation: "sur"},
        %{id: "family_brother", emoji: "👦", word: "Frère", pronunciation: "frehr"}
      ],
      cards: [
        %{id: "family_mother", template: "Ma _ est gentille", answer: "mère", description: "Décrire un membre de la famille"},
        %{id: "family_father", template: "Mon _ travaille beaucoup", answer: "père", description: "Décrire un membre de la famille"},
        %{id: "family_sister", template: "J'ai deux _", answer: "sœurs", description: "Parler des frères et sœurs"}
      ]
    }
  end

  # Russian content
  defp get_russian_content do
    %{
      title: "Семья",
      description: "Изучение семейных отношений и разговоров о семье",
      emoji: "👨‍👩‍👧‍👦",
      vocabulary: [
        %{id: "family_mother", word: "Мама", emoji: "👩", pronunciation: "MAH-ma", romanization: "mama", meaning: "Женский родитель", example: "Моя мама очень добрая", example_romanization: "moya mama ochen' dobraya"},
        %{id: "family_father", word: "Папа", emoji: "👨", pronunciation: "PAH-pa", romanization: "papa", meaning: "Мужской родитель", example: "Мой папа много работает", example_romanization: "moy papa mnogo rabotayet"},
        %{id: "family_sister", word: "Сестра", emoji: "👧", pronunciation: "ses-TRAH", romanization: "sestra", meaning: "Женский брат/сестра", example: "У меня две сестры", example_romanization: "u menya dve sestry"},
        %{id: "family_brother", word: "Брат", emoji: "👦", pronunciation: "braht", romanization: "brat", meaning: "Мужской брат/сестра", example: "Мой брат младше", example_romanization: "moy brat mladshe"}
      ],
      game_objects: [
        %{id: "family_mother", emoji: "👩", word: "Мама", pronunciation: "MAH-ma", romanization: "mama"},
        %{id: "family_father", emoji: "👨", word: "Папа", pronunciation: "PAH-pa", romanization: "papa"},
        %{id: "family_sister", emoji: "👧", word: "Сестра", pronunciation: "ses-TRAH", romanization: "sestra"},
        %{id: "family_brother", emoji: "👦", word: "Брат", pronunciation: "braht", romanization: "brat"}
      ],
      cards: [
        %{id: "family_mother", template: "Моя _ добрая", answer: "мама", description: "Описать члена семьи"},
        %{id: "family_father", template: "Мой _ много работает", answer: "папа", description: "Описать члена семьи"},
        %{id: "family_sister", template: "У меня две _", answer: "сестры", description: "Говорить о братьях и сёстрах"}
      ]
    }
  end

  # Japanese content
  defp get_japanese_content do
    %{
      title: "家族",
      description: "家族関係と家族について話す方法を学ぶ",
      emoji: "👨‍👩‍👧‍👦",
      vocabulary: [
        %{id: "family_mother", word: "母", emoji: "👩", pronunciation: "hah-ha", romanization: "haha", meaning: "女性の親", example: "私の母はとても優しいです", example_romanization: "watashi no haha wa totemo yasashii desu"},
        %{id: "family_father", word: "父", emoji: "👨", pronunciation: "chee-chee", romanization: "chichi", meaning: "男性の親", example: "私の父は一生懸命働きます", example_romanization: "watashi no chichi wa isshokenmei hatarakimasu"},
        %{id: "family_sister", word: "姉妹", emoji: "👧", pronunciation: "shee-my", romanization: "shimai", meaning: "女性の兄弟姉妹", example: "私には姉妹が二人います", example_romanization: "watashi ni wa shimai ga futari imasu"},
        %{id: "family_brother", word: "兄弟", emoji: "👦", pronunciation: "kyoh-dai", romanization: "kyoudai", meaning: "男性の兄弟姉妹", example: "私の弟は年下です", example_romanization: "watashi no otouto wa toshishita desu"}
      ],
      game_objects: [
        %{id: "family_mother", emoji: "👩", word: "母", pronunciation: "hah-ha", romanization: "haha"},
        %{id: "family_father", emoji: "👨", word: "父", pronunciation: "chee-chee", romanization: "chichi"},
        %{id: "family_sister", emoji: "👧", word: "姉妹", pronunciation: "shee-my", romanization: "shimai"},
        %{id: "family_brother", emoji: "👦", word: "兄弟", pronunciation: "kyoh-dai", romanization: "kyoudai"}
      ],
      cards: [
        %{id: "family_mother", template: "私の_は優しいです", answer: "母", description: "家族について説明する"},
        %{id: "family_father", template: "私の_は一生懸命働きます", answer: "父", description: "家族について説明する"},
        %{id: "family_sister", template: "私には_が二人います", answer: "姉妹", description: "兄弟姉妹について話す"}
      ]
    }
  end

  # Arabic content
  defp get_arabic_content do
    %{
      title: "العائلة",
      description: "تعلم العلاقات العائلية وكيفية التحدث عن العائلة",
      emoji: "👨‍👩‍👧‍👦",
      vocabulary: [
        %{id: "family_mother", word: "أم", emoji: "👩", pronunciation: "umm", romanization: "umm", meaning: "الوالد الأنثى", example: "أمي طيبة جداً", example_romanization: "ummii tayyiba jiddan"},
        %{id: "family_father", word: "أب", emoji: "👨", pronunciation: "ab", romanization: "ab", meaning: "الوالد الذكر", example: "أبي يعمل بجد", example_romanization: "abii ya'mal bi-jadd"},
        %{id: "family_sister", word: "أخت", emoji: "👧", pronunciation: "ukht", romanization: "ukht", meaning: "الشقيقة الأنثى", example: "لدي أختان", example_romanization: "ladayya ukhtaan"},
        %{id: "family_brother", word: "أخ", emoji: "👦", pronunciation: "akh", romanization: "akh", meaning: "الشقيق الذكر", example: "أخي أصغر مني", example_romanization: "akhii asghar minnii"}
      ],
      game_objects: [
        %{id: "family_mother", emoji: "👩", word: "أم", pronunciation: "umm", romanization: "umm"},
        %{id: "family_father", emoji: "👨", word: "أب", pronunciation: "ab", romanization: "ab"},
        %{id: "family_sister", emoji: "👧", word: "أخت", pronunciation: "ukht", romanization: "ukht"},
        %{id: "family_brother", emoji: "👦", word: "أخ", pronunciation: "akh", romanization: "akh"}
      ],
      cards: [
        %{id: "family_mother", template: "_ي طيبة", answer: "أم", description: "وصف أفراد العائلة"},
        %{id: "family_father", template: "_ي يعمل بجد", answer: "أب", description: "وصف أفراد العائلة"},
        %{id: "family_sister", template: "لدي _ان", answer: "أخت", description: "التحدث عن الأشقاء"}
      ]
    }
  end

  # Portuguese content
  defp get_portuguese_content do
    %{
      title: "Família",
      description: "Aprenda relacionamentos familiares e como falar sobre a família",
      emoji: "👨‍👩‍👧‍👦",
      vocabulary: [
        %{id: "family_mother", word: "Mãe", emoji: "👩", pronunciation: "mah-EH", meaning: "Pai feminino", example: "Minha mãe é muito gentil"},
        %{id: "family_father", word: "Pai", emoji: "👨", pronunciation: "pai", meaning: "Pai masculino", example: "Meu pai trabalha muito"},
        %{id: "family_sister", word: "Irmã", emoji: "👧", pronunciation: "eer-MAH", meaning: "Irmão feminino", example: "Tenho duas irmãs"},
        %{id: "family_brother", word: "Irmão", emoji: "👦", pronunciation: "eer-MAH-oo", meaning: "Irmão masculino", example: "Meu irmão é mais novo"}
      ],
      game_objects: [
        %{id: "family_mother", emoji: "👩", word: "Mãe", pronunciation: "mah-EH"},
        %{id: "family_father", emoji: "👨", word: "Pai", pronunciation: "pai"},
        %{id: "family_sister", emoji: "👧", word: "Irmã", pronunciation: "eer-MAH"},
        %{id: "family_brother", emoji: "👦", word: "Irmão", pronunciation: "eer-MAH-oo"}
      ],
      cards: [
        %{id: "family_mother", template: "Minha _ é gentil", answer: "mãe", description: "Descrever membro da família"},
        %{id: "family_father", template: "Meu _ trabalha muito", answer: "pai", description: "Descrever membro da família"},
        %{id: "family_sister", template: "Tenho duas _", answer: "irmãs", description: "Falar sobre irmãos"}
      ]
    }
  end

  # Italian content
  defp get_italian_content do
    %{
      title: "Famiglia",
      description: "Impara i rapporti familiari e come parlare della famiglia",
      emoji: "👨‍👩‍👧‍👦",
      vocabulary: [
        %{id: "family_mother", word: "Madre", emoji: "👩", pronunciation: "MAH-dreh", meaning: "Genitore femminile", example: "Mia madre è molto gentile"},
        %{id: "family_father", word: "Padre", emoji: "👨", pronunciation: "PAH-dreh", meaning: "Genitore maschile", example: "Mio padre lavora molto"},
        %{id: "family_sister", word: "Sorella", emoji: "👧", pronunciation: "so-REL-lah", meaning: "Fratello femminile", example: "Ho due sorelle"},
        %{id: "family_brother", word: "Fratello", emoji: "👦", pronunciation: "fra-TEL-loh", meaning: "Fratello maschile", example: "Mio fratello è più giovane"}
      ],
      game_objects: [
        %{id: "family_mother", emoji: "👩", word: "Madre", pronunciation: "MAH-dreh"},
        %{id: "family_father", emoji: "👨", word: "Padre", pronunciation: "PAH-dreh"},
        %{id: "family_sister", emoji: "👧", word: "Sorella", pronunciation: "so-REL-lah"},
        %{id: "family_brother", emoji: "👦", word: "Fratello", pronunciation: "fra-TEL-loh"}
      ],
      cards: [
        %{id: "family_mother", template: "Mia _ è gentile", answer: "madre", description: "Descrivere membro della famiglia"},
        %{id: "family_father", template: "Mio _ lavora molto", answer: "padre", description: "Descrivere membro della famiglia"},
        %{id: "family_sister", template: "Ho due _", answer: "sorelle", description: "Parlare di fratelli e sorelle"}
      ]
    }
  end
end