defmodule BobaTalkie.ContentManagerModules.IntroductionContent do
  @moduledoc """
  Introduction/Self-Introduction topic content in multiple languages.
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
      title: "Self-Introduction",
      description: "Learn basic greeting and introduction phrases",
      emoji: "👋",
      vocabulary: [
        %{id: "intro_hello", word: "Hello", emoji: "👋", pronunciation: "huh-loh", meaning: "A greeting", example: "Hello, nice to meet you!"},
        %{id: "intro_name", word: "Name", emoji: "📛", pronunciation: "naym", meaning: "What you are called", example: "My name is Sarah"},
        %{id: "intro_nice_meet", word: "Nice to meet you", emoji: "🤝", pronunciation: "nais-too-meet-yoo", meaning: "Polite greeting", example: "Nice to meet you too!"},
        %{id: "intro_how_are_you", word: "How are you?", emoji: "😊", pronunciation: "how-are-yoo", meaning: "Asking about wellbeing", example: "How are you today?"},
        %{id: "intro_fine", word: "Fine", emoji: "👌", pronunciation: "fain", meaning: "Good, okay", example: "I'm fine, thank you"},
        %{id: "intro_thank_you", word: "Thank you", emoji: "🙏", pronunciation: "thank-yoo", meaning: "Expression of gratitude", example: "Thank you very much"},
        %{id: "intro_please", word: "Please", emoji: "🥺", pronunciation: "pleez", meaning: "Polite request", example: "Please help me"},
        %{id: "intro_excuse_me", word: "Excuse me", emoji: "🙋", pronunciation: "ek-skyooz-mee", meaning: "To get attention", example: "Excuse me, where is the bathroom?"},
        %{id: "intro_sorry", word: "Sorry", emoji: "😔", pronunciation: "sor-ee", meaning: "Apologizing", example: "Sorry, I'm late"},
        %{id: "intro_yes", word: "Yes", emoji: "✅", pronunciation: "yes", meaning: "Affirmative answer", example: "Yes, I understand"},
        %{id: "intro_no", word: "No", emoji: "❌", pronunciation: "noh", meaning: "Negative answer", example: "No, I don't know"},
        %{id: "intro_goodbye", word: "Goodbye", emoji: "👋", pronunciation: "good-bai", meaning: "Farewell", example: "Goodbye, see you later!"},
        %{id: "intro_see_later", word: "See you later", emoji: "🔄", pronunciation: "see-yoo-lay-ter", meaning: "Casual farewell", example: "See you later, have a good day"},
        %{id: "intro_where", word: "Where", emoji: "📍", pronunciation: "wair", meaning: "Question about location", example: "Where are you from?"},
        %{id: "intro_from", word: "From", emoji: "🏠", pronunciation: "from", meaning: "Origin or source", example: "I'm from New York"}
      ],
      game_objects: [
        %{id: "intro_hello", emoji: "👋", word: "Hello", pronunciation: "huh-loh"},
        %{id: "intro_name", emoji: "📛", word: "Name", pronunciation: "naym"},
        %{id: "intro_nice_meet", emoji: "🤝", word: "Nice to meet you", pronunciation: "nais-too-meet-yoo"},
        %{id: "intro_thank_you", emoji: "🙏", word: "Thank you", pronunciation: "thank-yoo"},
        %{id: "intro_yes", emoji: "✅", word: "Yes", pronunciation: "yes"},
        %{id: "intro_no", emoji: "❌", word: "No", pronunciation: "noh"},
        %{id: "intro_goodbye", emoji: "👋", word: "Goodbye", pronunciation: "good-bai"}
      ],
      cards: [
        %{id: "intro_hello", template: "Say _ to greet someone", answer: "Hello", description: "Basic greeting"},
        %{id: "intro_name", template: "My _ is Sarah", answer: "name", description: "Introducing yourself"},
        %{id: "intro_nice_meet", template: "_ to meet you", answer: "Nice", description: "Polite response"},
        %{id: "intro_thank_you", template: "_ very much", answer: "Thank you", description: "Expressing gratitude"}
      ]
    }
  end

  # Spanish content
  defp get_spanish_content do
    %{
      title: "Presentación Personal",
      description: "Aprende frases básicas de saludo y presentación",
      emoji: "👋",
      vocabulary: [
        %{id: "intro_hello", word: "Hola", emoji: "👋", pronunciation: "oh-lah", meaning: "Un saludo", example: "¡Hola, mucho gusto!"},
        %{id: "intro_name", word: "Nombre", emoji: "📛", pronunciation: "nohm-breh", meaning: "Como te llamas", example: "Mi nombre es Sarah"},
        %{id: "intro_nice_meet", word: "Mucho gusto", emoji: "🤝", pronunciation: "moo-choh goos-toh", meaning: "Saludo cortés", example: "¡Mucho gusto en conocerte!"},
        %{id: "intro_how_are_you", word: "¿Cómo estás?", emoji: "😊", pronunciation: "koh-moh es-tahs", meaning: "Preguntando por el bienestar", example: "¿Cómo estás hoy?"},
        %{id: "intro_fine", word: "Bien", emoji: "👌", pronunciation: "bee-en", meaning: "Bueno, está bien", example: "Estoy bien, gracias"},
        %{id: "intro_thank_you", word: "Gracias", emoji: "🙏", pronunciation: "grah-see-ahs", meaning: "Expresión de gratitud", example: "Muchas gracias"},
        %{id: "intro_please", word: "Por favor", emoji: "🥺", pronunciation: "por fah-vor", meaning: "Petición cortés", example: "Por favor ayúdame"},
        %{id: "intro_excuse_me", word: "Disculpe", emoji: "🙋", pronunciation: "dis-kool-peh", meaning: "Para llamar atención", example: "Disculpe, ¿dónde está el baño?"},
        %{id: "intro_sorry", word: "Lo siento", emoji: "😔", pronunciation: "loh see-en-toh", meaning: "Disculparse", example: "Lo siento, llegué tarde"},
        %{id: "intro_yes", word: "Sí", emoji: "✅", pronunciation: "see", meaning: "Respuesta afirmativa", example: "Sí, entiendo"},
        %{id: "intro_no", word: "No", emoji: "❌", pronunciation: "noh", meaning: "Respuesta negativa", example: "No, no sé"},
        %{id: "intro_goodbye", word: "Adiós", emoji: "👋", pronunciation: "ah-dee-ohs", meaning: "Despedida", example: "¡Adiós, hasta luego!"},
        %{id: "intro_see_later", word: "Hasta luego", emoji: "🔄", pronunciation: "ahs-tah loo-eh-goh", meaning: "Despedida casual", example: "Hasta luego, que tengas buen día"},
        %{id: "intro_where", word: "Dónde", emoji: "📍", pronunciation: "don-deh", meaning: "Pregunta sobre ubicación", example: "¿De dónde eres?"},
        %{id: "intro_from", word: "De", emoji: "🏠", pronunciation: "deh", meaning: "Origen o procedencia", example: "Soy de Nueva York"}
      ],
      game_objects: [
        %{id: "intro_hello", emoji: "👋", word: "Hola", pronunciation: "oh-lah"},
        %{id: "intro_name", emoji: "📛", word: "Nombre", pronunciation: "nohm-breh"},
        %{id: "intro_nice_meet", emoji: "🤝", word: "Mucho gusto", pronunciation: "moo-choh goos-toh"},
        %{id: "intro_thank_you", emoji: "🙏", word: "Gracias", pronunciation: "grah-see-ahs"},
        %{id: "intro_yes", emoji: "✅", word: "Sí", pronunciation: "see"},
        %{id: "intro_no", emoji: "❌", word: "No", pronunciation: "noh"},
        %{id: "intro_goodbye", emoji: "👋", word: "Adiós", pronunciation: "ah-dee-ohs"}
      ],
      cards: [
        %{id: "intro_hello", template: "Di _ para saludar a alguien", answer: "Hola", description: "Saludo básico"},
        %{id: "intro_name", template: "Mi _ es Sarah", answer: "nombre", description: "Presentándote"},
        %{id: "intro_nice_meet", template: "_ en conocerte", answer: "Mucho gusto", description: "Respuesta cortés"},
        %{id: "intro_thank_you", template: "_ por tu ayuda", answer: "Gracias", description: "Expresando gratitud"}
      ]
    }
  end

  # Chinese content with pinyin
  defp get_chinese_content do
    %{
      title: "自我介绍",
      description: "学习基本的问候和介绍短语",
      emoji: "👋",
      vocabulary: [
        %{id: "intro_hello", word: "你好", emoji: "👋", pronunciation: "nǐ hǎo", romanization: "nǐ hǎo", meaning: "问候语", example: "你好，很高兴见到你！", example_romanization: "nǐ hǎo, hěn gāo xìng jiàn dào nǐ!"},
        %{id: "intro_name", word: "名字", emoji: "📛", pronunciation: "míng zì", romanization: "míng zì", meaning: "你的称呼", example: "我的名字是莎拉", example_romanization: "wǒ de míng zì shì shā lā"},
        %{id: "intro_nice_meet", word: "很高兴见到你", emoji: "🤝", pronunciation: "hěn gāo xìng jiàn dào nǐ", romanization: "hěn gāo xìng jiàn dào nǐ", meaning: "礼貌问候", example: "我也很高兴见到你！", example_romanization: "wǒ yě hěn gāo xìng jiàn dào nǐ!"},
        %{id: "intro_how_are_you", word: "你好吗？", emoji: "😊", pronunciation: "nǐ hǎo ma?", romanization: "nǐ hǎo ma?", meaning: "询问身体状况", example: "你今天好吗？", example_romanization: "nǐ jīn tiān hǎo ma?"},
        %{id: "intro_fine", word: "很好", emoji: "👌", pronunciation: "hěn hǎo", romanization: "hěn hǎo", meaning: "好，不错", example: "我很好，谢谢", example_romanization: "wǒ hěn hǎo, xiè xiè"},
        %{id: "intro_thank_you", word: "谢谢", emoji: "🙏", pronunciation: "xiè xiè", romanization: "xiè xiè", meaning: "表达感谢", example: "非常谢谢", example_romanization: "fēi cháng xiè xiè"},
        %{id: "intro_please", word: "请", emoji: "🥺", pronunciation: "qǐng", romanization: "qǐng", meaning: "礼貌请求", example: "请帮助我", example_romanization: "qǐng bāng zhù wǒ"},
        %{id: "intro_excuse_me", word: "不好意思", emoji: "🙋", pronunciation: "bù hǎo yì sī", romanization: "bù hǎo yì sī", meaning: "引起注意", example: "不好意思，厕所在哪里？", example_romanization: "bù hǎo yì sī, cè suǒ zài nǎ lǐ?"},
        %{id: "intro_sorry", word: "对不起", emoji: "😔", pronunciation: "duì bù qǐ", romanization: "duì bù qǐ", meaning: "道歉", example: "对不起，我迟到了", example_romanization: "duì bù qǐ, wǒ chí dào le"},
        %{id: "intro_yes", word: "是的", emoji: "✅", pronunciation: "shì de", romanization: "shì de", meaning: "肯定回答", example: "是的，我明白", example_romanization: "shì de, wǒ míng bái"},
        %{id: "intro_no", word: "不", emoji: "❌", pronunciation: "bù", romanization: "bù", meaning: "否定回答", example: "不，我不知道", example_romanization: "bù, wǒ bù zhī dào"},
        %{id: "intro_goodbye", word: "再见", emoji: "👋", pronunciation: "zài jiàn", romanization: "zài jiàn", meaning: "告别", example: "再见，回头见！", example_romanization: "zài jiàn, huí tóu jiàn!"},
        %{id: "intro_see_later", word: "回头见", emoji: "🔄", pronunciation: "huí tóu jiàn", romanization: "huí tóu jiàn", meaning: "随意告别", example: "回头见，祝你今天愉快", example_romanization: "huí tóu jiàn, zhù nǐ jīn tiān yú kuài"},
        %{id: "intro_where", word: "哪里", emoji: "📍", pronunciation: "nǎ lǐ", romanization: "nǎ lǐ", meaning: "询问地点", example: "你来自哪里？", example_romanization: "nǐ lái zì nǎ lǐ?"},
        %{id: "intro_from", word: "来自", emoji: "🏠", pronunciation: "lái zì", romanization: "lái zì", meaning: "起源或来源", example: "我来自纽约", example_romanization: "wǒ lái zì niǔ yuē"}
      ],
      game_objects: [
        %{id: "intro_hello", emoji: "👋", word: "你好", pronunciation: "nǐ hǎo", romanization: "nǐ hǎo"},
        %{id: "intro_name", emoji: "📛", word: "名字", pronunciation: "míng zì", romanization: "míng zì"},
        %{id: "intro_nice_meet", emoji: "🤝", word: "很高兴见到你", pronunciation: "hěn gāo xìng jiàn dào nǐ", romanization: "hěn gāo xìng jiàn dào nǐ"},
        %{id: "intro_thank_you", emoji: "🙏", word: "谢谢", pronunciation: "xiè xiè", romanization: "xiè xiè"},
        %{id: "intro_yes", emoji: "✅", word: "是的", pronunciation: "shì de", romanization: "shì de"},
        %{id: "intro_no", emoji: "❌", word: "不", pronunciation: "bù", romanization: "bù"},
        %{id: "intro_goodbye", emoji: "👋", word: "再见", pronunciation: "zài jiàn", romanization: "zài jiàn"}
      ],
      cards: [
        %{id: "intro_hello", template: "说_来问候某人", answer: "你好", romanization: "nǐ hǎo", description: "基本问候"},
        %{id: "intro_name", template: "我的_是莎拉", answer: "名字", romanization: "míng zì", description: "自我介绍"},
        %{id: "intro_nice_meet", template: "_见到你", answer: "很高兴", romanization: "hěn gāo xìng", description: "礼貌回应"},
        %{id: "intro_thank_you", template: "_你的帮助", answer: "谢谢", romanization: "xiè xiè", description: "表达感谢"}
      ]
    }
  end

  # Placeholder functions for other languages (to be implemented)
  defp get_french_content, do: get_english_content()
  defp get_russian_content, do: get_english_content()
  defp get_japanese_content, do: get_english_content()
  defp get_italian_content, do: get_english_content()
  defp get_arabic_content, do: get_english_content()
  defp get_portuguese_content, do: get_english_content()
end