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

  # French content
  defp get_french_content do
    %{
      title: "Présentation Personnelle",
      description: "Apprendre les phrases de base pour se présenter",
      emoji: "👋",
      vocabulary: [
        %{id: "intro_hello", word: "Bonjour", emoji: "👋", pronunciation: "bon-ZHOOR", meaning: "Un salut", example: "Bonjour, ravi de vous rencontrer !"},
        %{id: "intro_name", word: "Nom", emoji: "📛", pronunciation: "nohn", meaning: "Comment vous vous appelez", example: "Mon nom est Sarah"},
        %{id: "intro_nice_meet", word: "Ravi de vous rencontrer", emoji: "🤝", pronunciation: "rah-vee duh voo rahn-kohn-TRAY", meaning: "Salutation polie", example: "Ravi de vous rencontrer aussi !"},
        %{id: "intro_how_are_you", word: "Comment allez-vous ?", emoji: "😊", pronunciation: "koh-mahn tah-lay voo", meaning: "Demander comment ça va", example: "Comment allez-vous aujourd'hui ?"},
        %{id: "intro_fine", word: "Bien", emoji: "👌", pronunciation: "bee-ahn", meaning: "Bon, d'accord", example: "Je vais bien, merci"},
        %{id: "intro_thank_you", word: "Merci", emoji: "🙏", pronunciation: "mer-SEE", meaning: "Expression de gratitude", example: "Merci beaucoup"},
        %{id: "intro_please", word: "S'il vous plaît", emoji: "🥺", pronunciation: "seel voo pleh", meaning: "Demande polie", example: "Aidez-moi s'il vous plaît"},
        %{id: "intro_excuse_me", word: "Excusez-moi", emoji: "🙋", pronunciation: "ek-skyu-zay mwah", meaning: "Pour attirer l'attention", example: "Excusez-moi, où sont les toilettes ?"},
        %{id: "intro_sorry", word: "Désolé", emoji: "😔", pronunciation: "day-so-LAY", meaning: "S'excuser", example: "Désolé, je suis en retard"},
        %{id: "intro_yes", word: "Oui", emoji: "✅", pronunciation: "wee", meaning: "Réponse affirmative", example: "Oui, je comprends"},
        %{id: "intro_no", word: "Non", emoji: "❌", pronunciation: "nohn", meaning: "Réponse négative", example: "Non, je ne sais pas"},
        %{id: "intro_goodbye", word: "Au revoir", emoji: "👋", pronunciation: "oh ruh-VWAHR", meaning: "Adieu", example: "Au revoir, à bientôt !"},
        %{id: "intro_see_later", word: "À bientôt", emoji: "🔄", pronunciation: "ah bee-ahn-TOH", meaning: "Adieu décontracté", example: "À bientôt, bonne journée"},
        %{id: "intro_where", word: "Où", emoji: "📍", pronunciation: "oo", meaning: "Question sur l'emplacement", example: "D'où venez-vous ?"},
        %{id: "intro_from", word: "De", emoji: "🏠", pronunciation: "duh", meaning: "Origine ou source", example: "Je viens de New York"}
      ],
      game_objects: [
        %{id: "intro_hello", emoji: "👋", word: "Bonjour", pronunciation: "bon-ZHOOR"},
        %{id: "intro_name", emoji: "📛", word: "Nom", pronunciation: "nohn"},
        %{id: "intro_nice_meet", emoji: "🤝", word: "Ravi de vous rencontrer", pronunciation: "rah-vee duh voo rahn-kohn-TRAY"},
        %{id: "intro_thank_you", emoji: "🙏", word: "Merci", pronunciation: "mer-SEE"},
        %{id: "intro_yes", emoji: "✅", word: "Oui", pronunciation: "wee"},
        %{id: "intro_no", emoji: "❌", word: "Non", pronunciation: "nohn"},
        %{id: "intro_goodbye", emoji: "👋", word: "Au revoir", pronunciation: "oh ruh-VWAHR"}
      ],
      cards: [
        %{id: "intro_hello", template: "Dites _ pour saluer quelqu'un", answer: "Bonjour", description: "Salutation de base"},
        %{id: "intro_name", template: "Mon _ est Sarah", answer: "nom", description: "Se présenter"},
        %{id: "intro_nice_meet", template: "_ de vous rencontrer", answer: "Ravi", description: "Réponse polie"},
        %{id: "intro_thank_you", template: "_ beaucoup", answer: "Merci", description: "Exprimer la gratitude"}
      ]
    }
  end

  # Russian content with romanization
  defp get_russian_content do
    %{
      title: "Самопредставление",
      description: "Изучить основные фразы для представления себя",
      emoji: "👋",
      vocabulary: [
        %{id: "intro_hello", word: "Привет", emoji: "👋", pronunciation: "pree-VYET", romanization: "privet", meaning: "Приветствие", example: "Привет, приятно познакомиться!", example_romanization: "privet, priyatno poznakomit'sya!"},
        %{id: "intro_name", word: "Имя", emoji: "📛", pronunciation: "EE-mya", romanization: "imya", meaning: "Как вас зовут", example: "Меня зовут Сара", example_romanization: "menya zovut Sara"},
        %{id: "intro_nice_meet", word: "Приятно познакомиться", emoji: "🤝", pronunciation: "pree-YAT-nah pahz-nah-KO-meet-sya", romanization: "priyatno poznakomit'sya", meaning: "Вежливое приветствие", example: "Мне тоже приятно познакомиться!", example_romanization: "mne tozhe priyatno poznakomit'sya!"},
        %{id: "intro_how_are_you", word: "Как дела?", emoji: "😊", pronunciation: "kak dee-LAH", romanization: "kak dela?", meaning: "Спрашивать о самочувствии", example: "Как у тебя дела сегодня?", example_romanization: "kak u tebya dela segodnya?"},
        %{id: "intro_fine", word: "Хорошо", emoji: "👌", pronunciation: "khah-rah-SHAW", romanization: "khorosho", meaning: "Хорошо, нормально", example: "У меня все хорошо, спасибо", example_romanization: "u menya vse khorosho, spasibo"},
        %{id: "intro_thank_you", word: "Спасибо", emoji: "🙏", pronunciation: "spah-SEE-bah", romanization: "spasibo", meaning: "Выражение благодарности", example: "Большое спасибо", example_romanization: "bol'shoe spasibo"},
        %{id: "intro_please", word: "Пожалуйста", emoji: "🥺", pronunciation: "pah-ZHAH-loo-stah", romanization: "pozhaluysta", meaning: "Вежливая просьба", example: "Помогите мне, пожалуйста", example_romanization: "pomogite mne, pozhaluysta"},
        %{id: "intro_excuse_me", word: "Извините", emoji: "🙋", pronunciation: "eez-vee-NEE-tye", romanization: "izvinite", meaning: "Чтобы привлечь внимание", example: "Извините, где туалет?", example_romanization: "izvinite, gde tualet?"},
        %{id: "intro_sorry", word: "Прости", emoji: "😔", pronunciation: "prahs-TEE", romanization: "prosti", meaning: "Извиняться", example: "Прости, я опоздал", example_romanization: "prosti, ya opozdal"},
        %{id: "intro_yes", word: "Да", emoji: "✅", pronunciation: "dah", romanization: "da", meaning: "Утвердительный ответ", example: "Да, я понимаю", example_romanization: "da, ya ponimayu"},
        %{id: "intro_no", word: "Нет", emoji: "❌", pronunciation: "nyet", romanization: "net", meaning: "Отрицательный ответ", example: "Нет, я не знаю", example_romanization: "net, ya ne znayu"},
        %{id: "intro_goodbye", word: "До свидания", emoji: "👋", pronunciation: "dah svee-DAH-nee-ya", romanization: "do svidaniya", meaning: "Прощание", example: "До свидания, увидимся позже!", example_romanization: "do svidaniya, uvidimsya pozzhe!"},
        %{id: "intro_see_later", word: "Увидимся позже", emoji: "🔄", pronunciation: "oo-VEE-deem-sya POHZ-zhye", romanization: "uvidimsya pozzhe", meaning: "Непринужденное прощание", example: "Увидимся позже, хорошего дня", example_romanization: "uvidimsya pozzhe, khoroshego dnya"},
        %{id: "intro_where", word: "Где", emoji: "📍", pronunciation: "gdye", romanization: "gde", meaning: "Вопрос о местоположении", example: "Откуда вы?", example_romanization: "otkuda vy?"},
        %{id: "intro_from", word: "Из", emoji: "🏠", pronunciation: "eez", romanization: "iz", meaning: "Происхождение или источник", example: "Я из Нью-Йорка", example_romanization: "ya iz N'yu-Yorka"}
      ],
      game_objects: [
        %{id: "intro_hello", emoji: "👋", word: "Привет", pronunciation: "pree-VYET", romanization: "privet"},
        %{id: "intro_name", emoji: "📛", word: "Имя", pronunciation: "EE-mya", romanization: "imya"},
        %{id: "intro_nice_meet", emoji: "🤝", word: "Приятно познакомиться", pronunciation: "pree-YAT-nah pahz-nah-KO-meet-sya", romanization: "priyatno poznakomit'sya"},
        %{id: "intro_thank_you", emoji: "🙏", word: "Спасибо", pronunciation: "spah-SEE-bah", romanization: "spasibo"},
        %{id: "intro_yes", emoji: "✅", word: "Да", pronunciation: "dah", romanization: "da"},
        %{id: "intro_no", emoji: "❌", word: "Нет", pronunciation: "nyet", romanization: "net"},
        %{id: "intro_goodbye", emoji: "👋", word: "До свидания", pronunciation: "dah svee-DAH-nee-ya", romanization: "do svidaniya"}
      ],
      cards: [
        %{id: "intro_hello", template: "Скажи _ чтобы поприветствовать кого-то", answer: "Привет", romanization: "privet", description: "Основное приветствие"},
        %{id: "intro_name", template: "Мое _ Сара", answer: "имя", romanization: "imya", description: "Представляться"},
        %{id: "intro_nice_meet", template: "_ познакомиться", answer: "Приятно", romanization: "priyatno", description: "Вежливый ответ"},
        %{id: "intro_thank_you", template: "_ большое", answer: "Спасибо", romanization: "spasibo", description: "Выражение благодарности"}
      ]
    }
  end

  # Japanese content with romanization
  defp get_japanese_content do
    %{
      title: "自己紹介",
      description: "自己紹介の基本的なフレーズを学ぶ",
      emoji: "👋",
      vocabulary: [
        %{id: "intro_hello", word: "こんにちは", emoji: "👋", pronunciation: "kohn-nee-chee-wah", romanization: "konnichiwa", meaning: "挨拶", example: "こんにちは、お会いできて嬉しいです！", example_romanization: "konnichiwa, oai dekite ureshii desu!"},
        %{id: "intro_name", word: "名前", emoji: "📛", pronunciation: "nah-mah-eh", romanization: "namae", meaning: "あなたの呼び方", example: "私の名前はサラです", example_romanization: "watashi no namae wa Sara desu"},
        %{id: "intro_nice_meet", word: "お会いできて嬉しいです", emoji: "🤝", pronunciation: "oh-ah-ee deh-kee-teh oo-reh-shee-ee deh-soo", romanization: "oai dekite ureshii desu", meaning: "丁寧な挨拶", example: "こちらこそお会いできて嬉しいです！", example_romanization: "kochira koso oai dekite ureshii desu!"},
        %{id: "intro_how_are_you", word: "元気ですか？", emoji: "😊", pronunciation: "gehn-kee deh-soo kah", romanization: "genki desu ka?", meaning: "体調を尋ねる", example: "今日は元気ですか？", example_romanization: "kyou wa genki desu ka?"},
        %{id: "intro_fine", word: "元気です", emoji: "👌", pronunciation: "gehn-kee deh-soo", romanization: "genki desu", meaning: "良い、大丈夫", example: "元気です、ありがとう", example_romanization: "genki desu, arigatou"},
        %{id: "intro_thank_you", word: "ありがとう", emoji: "🙏", pronunciation: "ah-ree-gah-toh", romanization: "arigatou", meaning: "感謝の表現", example: "どうもありがとう", example_romanization: "doumo arigatou"},
        %{id: "intro_please", word: "お願いします", emoji: "🥺", pronunciation: "oh-neh-gah-ee shee-mah-soo", romanization: "onegaishimasu", meaning: "丁寧なお願い", example: "手伝ってお願いします", example_romanization: "tetsudatte onegaishimasu"},
        %{id: "intro_excuse_me", word: "すみません", emoji: "🙋", pronunciation: "soo-mee-mah-sehn", romanization: "sumimasen", meaning: "注意を引くため", example: "すみません、トイレはどこですか？", example_romanization: "sumimasen, toire wa doko desu ka?"},
        %{id: "intro_sorry", word: "ごめんなさい", emoji: "😔", pronunciation: "goh-mehn-nah-sah-ee", romanization: "gomennasai", meaning: "謝る", example: "ごめんなさい、遅れました", example_romanization: "gomennasai, okuremashita"},
        %{id: "intro_yes", word: "はい", emoji: "✅", pronunciation: "hah-ee", romanization: "hai", meaning: "肯定的な答え", example: "はい、わかります", example_romanization: "hai, wakarimasu"},
        %{id: "intro_no", word: "いいえ", emoji: "❌", pronunciation: "ee-ee-eh", romanization: "iie", meaning: "否定的な答え", example: "いいえ、知りません", example_romanization: "iie, shirimasen"},
        %{id: "intro_goodbye", word: "さようなら", emoji: "👋", pronunciation: "sah-yoh-nah-rah", romanization: "sayounara", meaning: "別れ", example: "さようなら、また後で！", example_romanization: "sayounara, mata ato de!"},
        %{id: "intro_see_later", word: "また後で", emoji: "🔄", pronunciation: "mah-tah ah-toh deh", romanization: "mata ato de", meaning: "カジュアルな別れ", example: "また後で、良い一日を", example_romanization: "mata ato de, yoi ichinichi wo"},
        %{id: "intro_where", word: "どこ", emoji: "📍", pronunciation: "doh-koh", romanization: "doko", meaning: "場所についての質問", example: "どこから来ましたか？", example_romanization: "doko kara kimashita ka?"},
        %{id: "intro_from", word: "から", emoji: "🏠", pronunciation: "kah-rah", romanization: "kara", meaning: "起源や源", example: "ニューヨークから来ました", example_romanization: "Nyuu Yooku kara kimashita"}
      ],
      game_objects: [
        %{id: "intro_hello", emoji: "👋", word: "こんにちは", pronunciation: "kohn-nee-chee-wah", romanization: "konnichiwa"},
        %{id: "intro_name", emoji: "📛", word: "名前", pronunciation: "nah-mah-eh", romanization: "namae"},
        %{id: "intro_nice_meet", emoji: "🤝", word: "お会いできて嬉しいです", pronunciation: "oh-ah-ee deh-kee-teh oo-reh-shee-ee deh-soo", romanization: "oai dekite ureshii desu"},
        %{id: "intro_thank_you", emoji: "🙏", word: "ありがとう", pronunciation: "ah-ree-gah-toh", romanization: "arigatou"},
        %{id: "intro_yes", emoji: "✅", word: "はい", pronunciation: "hah-ee", romanization: "hai"},
        %{id: "intro_no", emoji: "❌", word: "いいえ", pronunciation: "ee-ee-eh", romanization: "iie"},
        %{id: "intro_goodbye", emoji: "👋", word: "さようなら", pronunciation: "sah-yoh-nah-rah", romanization: "sayounara"}
      ],
      cards: [
        %{id: "intro_hello", template: "誰かに挨拶するために_と言う", answer: "こんにちは", romanization: "konnichiwa", description: "基本的な挨拶"},
        %{id: "intro_name", template: "私の_はサラです", answer: "名前", romanization: "namae", description: "自己紹介"},
        %{id: "intro_nice_meet", template: "_できて嬉しいです", answer: "お会い", romanization: "oai", description: "丁寧な応答"},
        %{id: "intro_thank_you", template: "_ございます", answer: "ありがとう", romanization: "arigatou", description: "感謝を表現"}
      ]
    }
  end

  # Italian content
  defp get_italian_content do
    %{
      title: "Presentazione Personale",
      description: "Imparare frasi di base per presentarsi",
      emoji: "👋",
      vocabulary: [
        %{id: "intro_hello", word: "Ciao", emoji: "👋", pronunciation: "chah-oh", meaning: "Un saluto", example: "Ciao, piacere di conoscerti!"},
        %{id: "intro_name", word: "Nome", emoji: "📛", pronunciation: "NOH-meh", meaning: "Come ti chiami", example: "Il mio nome è Sarah"},
        %{id: "intro_nice_meet", word: "Piacere di conoscerti", emoji: "🤝", pronunciation: "pee-ah-CHEH-reh dee koh-noh-SHER-tee", meaning: "Saluto cortese", example: "Anche io, piacere di conoscerti!"},
        %{id: "intro_how_are_you", word: "Come stai?", emoji: "😊", pronunciation: "KOH-meh stah-ee", meaning: "Chiedere come va", example: "Come stai oggi?"},
        %{id: "intro_fine", word: "Bene", emoji: "👌", pronunciation: "BEH-neh", meaning: "Buono, va bene", example: "Sto bene, grazie"},
        %{id: "intro_thank_you", word: "Grazie", emoji: "🙏", pronunciation: "GRAH-tsee-eh", meaning: "Espressione di gratitudine", example: "Grazie mille"},
        %{id: "intro_please", word: "Per favore", emoji: "🥺", pronunciation: "pehr fah-VOH-reh", meaning: "Richiesta cortese", example: "Aiutami per favore"},
        %{id: "intro_excuse_me", word: "Scusa", emoji: "🙋", pronunciation: "SKOO-zah", meaning: "Per attirare l'attenzione", example: "Scusa, dov'è il bagno?"},
        %{id: "intro_sorry", word: "Mi dispiace", emoji: "😔", pronunciation: "mee dis-pee-AH-cheh", meaning: "Scusarsi", example: "Mi dispiace, sono in ritardo"},
        %{id: "intro_yes", word: "Sì", emoji: "✅", pronunciation: "see", meaning: "Risposta affermativa", example: "Sì, capisco"},
        %{id: "intro_no", word: "No", emoji: "❌", pronunciation: "noh", meaning: "Risposta negativa", example: "No, non lo so"},
        %{id: "intro_goodbye", word: "Arrivederci", emoji: "👋", pronunciation: "ah-ree-veh-DEHR-chee", meaning: "Addio", example: "Arrivederci, ci vediamo dopo!"},
        %{id: "intro_see_later", word: "Ci vediamo dopo", emoji: "🔄", pronunciation: "chee veh-dee-AH-moh DOH-poh", meaning: "Addio casuale", example: "Ci vediamo dopo, buona giornata"},
        %{id: "intro_where", word: "Dove", emoji: "📍", pronunciation: "DOH-veh", meaning: "Domanda sulla posizione", example: "Di dove sei?"},
        %{id: "intro_from", word: "Da", emoji: "🏠", pronunciation: "dah", meaning: "Origine o fonte", example: "Vengo da New York"}
      ],
      game_objects: [
        %{id: "intro_hello", emoji: "👋", word: "Ciao", pronunciation: "chah-oh"},
        %{id: "intro_name", emoji: "📛", word: "Nome", pronunciation: "NOH-meh"},
        %{id: "intro_nice_meet", emoji: "🤝", word: "Piacere di conoscerti", pronunciation: "pee-ah-CHEH-reh dee koh-noh-SHER-tee"},
        %{id: "intro_thank_you", emoji: "🙏", word: "Grazie", pronunciation: "GRAH-tsee-eh"},
        %{id: "intro_yes", emoji: "✅", word: "Sì", pronunciation: "see"},
        %{id: "intro_no", emoji: "❌", word: "No", pronunciation: "noh"},
        %{id: "intro_goodbye", emoji: "👋", word: "Arrivederci", pronunciation: "ah-ree-veh-DEHR-chee"}
      ],
      cards: [
        %{id: "intro_hello", template: "Di _ per salutare qualcuno", answer: "Ciao", description: "Saluto di base"},
        %{id: "intro_name", template: "Il mio _ è Sarah", answer: "nome", description: "Presentarsi"},
        %{id: "intro_nice_meet", template: "_ di conoscerti", answer: "Piacere", description: "Risposta cortese"},
        %{id: "intro_thank_you", template: "_ mille", answer: "Grazie", description: "Esprimere gratitudine"}
      ]
    }
  end

  # Arabic content with romanization
  defp get_arabic_content do
    %{
      title: "التعريف بالنفس",
      description: "تعلم العبارات الأساسية للتعريف بالنفس",
      emoji: "👋",
      vocabulary: [
        %{id: "intro_hello", word: "مرحبا", emoji: "👋", pronunciation: "mar-ha-ban", romanization: "marhaban", meaning: "تحية", example: "مرحبا، سررت بلقائك!", example_romanization: "marhaban, surirtu biliqaa'ik!"},
        %{id: "intro_name", word: "اسم", emoji: "📛", pronunciation: "ism", romanization: "ism", meaning: "ما تُدعى به", example: "اسمي سارة", example_romanization: "ismi Sarah"},
        %{id: "intro_nice_meet", word: "سررت بلقائك", emoji: "🤝", pronunciation: "su-reer-tu bi-li-qaa-ik", romanization: "surirtu biliqaa'ik", meaning: "تحية مهذبة", example: "أنا أيضاً سررت بلقائك!", example_romanization: "ana aydan surirtu biliqaa'ik!"},
        %{id: "intro_how_are_you", word: "كيف حالك؟", emoji: "😊", pronunciation: "kayf haa-lak", romanization: "kayf haalak?", meaning: "السؤال عن الحال", example: "كيف حالك اليوم؟", example_romanization: "kayf haalak al-yawm?"},
        %{id: "intro_fine", word: "بخير", emoji: "👌", pronunciation: "bi-khayr", romanization: "bikhayr", meaning: "جيد، بخير", example: "أنا بخير، شكراً", example_romanization: "ana bikhayr, shukran"},
        %{id: "intro_thank_you", word: "شكرا", emoji: "🙏", pronunciation: "shuk-ran", romanization: "shukran", meaning: "تعبير عن الامتنان", example: "شكراً جزيلاً", example_romanization: "shukran jazeelan"},
        %{id: "intro_please", word: "من فضلك", emoji: "🥺", pronunciation: "min fadh-lik", romanization: "min fadhlik", meaning: "طلب مهذب", example: "ساعدني من فضلك", example_romanization: "saa'idni min fadhlik"},
        %{id: "intro_excuse_me", word: "عذراً", emoji: "🙋", pronunciation: "udh-ran", romanization: "udhran", meaning: "لجذب الانتباه", example: "عذراً، أين الحمام؟", example_romanization: "udhran, ayna al-hammam?"},
        %{id: "intro_sorry", word: "آسف", emoji: "😔", pronunciation: "aa-sif", romanization: "aasif", meaning: "الاعتذار", example: "آسف، تأخرت", example_romanization: "aasif, ta'akhartu"},
        %{id: "intro_yes", word: "نعم", emoji: "✅", pronunciation: "na-am", romanization: "na'am", meaning: "إجابة مؤكدة", example: "نعم، أفهم", example_romanization: "na'am, afham"},
        %{id: "intro_no", word: "لا", emoji: "❌", pronunciation: "laa", romanization: "laa", meaning: "إجابة سلبية", example: "لا، لا أعرف", example_romanization: "laa, laa a'rif"},
        %{id: "intro_goodbye", word: "مع السلامة", emoji: "👋", pronunciation: "ma-a as-sa-laa-ma", romanization: "ma'a as-salama", meaning: "وداع", example: "مع السلامة، أراك لاحقاً!", example_romanization: "ma'a as-salama, araaka laahiqan!"},
        %{id: "intro_see_later", word: "أراك لاحقاً", emoji: "🔄", pronunciation: "a-raa-ka laa-hi-qan", romanization: "araaka laahiqan", meaning: "وداع عارض", example: "أراك لاحقاً، يوم سعيد", example_romanization: "araaka laahiqan, yawm sa'eed"},
        %{id: "intro_where", word: "أين", emoji: "📍", pronunciation: "ay-na", romanization: "ayna", meaning: "سؤال عن المكان", example: "من أين أنت؟", example_romanization: "min ayna anta?"},
        %{id: "intro_from", word: "من", emoji: "🏠", pronunciation: "min", romanization: "min", meaning: "الأصل أو المصدر", example: "أنا من نيويورك", example_romanization: "ana min New York"}
      ],
      game_objects: [
        %{id: "intro_hello", emoji: "👋", word: "مرحبا", pronunciation: "mar-ha-ban", romanization: "marhaban"},
        %{id: "intro_name", emoji: "📛", word: "اسم", pronunciation: "ism", romanization: "ism"},
        %{id: "intro_nice_meet", emoji: "🤝", word: "سررت بلقائك", pronunciation: "su-reer-tu bi-li-qaa-ik", romanization: "surirtu biliqaa'ik"},
        %{id: "intro_thank_you", emoji: "🙏", word: "شكرا", pronunciation: "shuk-ran", romanization: "shukran"},
        %{id: "intro_yes", emoji: "✅", word: "نعم", pronunciation: "na-am", romanization: "na'am"},
        %{id: "intro_no", emoji: "❌", word: "لا", pronunciation: "laa", romanization: "laa"},
        %{id: "intro_goodbye", emoji: "👋", word: "مع السلامة", pronunciation: "ma-a as-sa-laa-ma", romanization: "ma'a as-salama"}
      ],
      cards: [
        %{id: "intro_hello", template: "قل _ لتحيي شخصاً ما", answer: "مرحبا", romanization: "marhaban", description: "تحية أساسية"},
        %{id: "intro_name", template: "_ سارة", answer: "اسمي", romanization: "ismi", description: "التعريف بالنفس"},
        %{id: "intro_nice_meet", template: "_ بلقائك", answer: "سررت", romanization: "surirtu", description: "رد مهذب"},
        %{id: "intro_thank_you", template: "_ جزيلاً", answer: "شكراً", romanization: "shukran", description: "التعبير عن الامتنان"}
      ]
    }
  end

  # Portuguese content
  defp get_portuguese_content do
    %{
      title: "Apresentação Pessoal",
      description: "Aprenda frases básicas para se apresentar",
      emoji: "👋",
      vocabulary: [
        %{id: "intro_hello", word: "Olá", emoji: "👋", pronunciation: "oh-LAH", meaning: "Uma saudação", example: "Olá, prazer em conhecê-lo!"},
        %{id: "intro_name", word: "Nome", emoji: "📛", pronunciation: "NOH-mee", meaning: "Como você se chama", example: "Meu nome é Sarah"},
        %{id: "intro_nice_meet", word: "Prazer em conhecê-lo", emoji: "🤝", pronunciation: "prah-ZEHR ayn koh-nyeh-SEH-loh", meaning: "Saudação educada", example: "Prazer em conhecê-lo também!"},
        %{id: "intro_how_are_you", word: "Como você está?", emoji: "😊", pronunciation: "KOH-moh voh-SEH eh-STAH", meaning: "Perguntando sobre bem-estar", example: "Como você está hoje?"},
        %{id: "intro_fine", word: "Bem", emoji: "👌", pronunciation: "bayn", meaning: "Bom, tudo bem", example: "Estou bem, obrigado"},
        %{id: "intro_thank_you", word: "Obrigado", emoji: "🙏", pronunciation: "oh-bree-GAH-doh", meaning: "Expressão de gratidão", example: "Muito obrigado"},
        %{id: "intro_please", word: "Por favor", emoji: "🥺", pronunciation: "pohr fah-VOHR", meaning: "Pedido educado", example: "Me ajude por favor"},
        %{id: "intro_excuse_me", word: "Com licença", emoji: "🙋", pronunciation: "kohn lee-SEHN-sah", meaning: "Para chamar atenção", example: "Com licença, onde fica o banheiro?"},
        %{id: "intro_sorry", word: "Desculpa", emoji: "😔", pronunciation: "dehs-KOOL-pah", meaning: "Pedindo desculpas", example: "Desculpa, estou atrasado"},
        %{id: "intro_yes", word: "Sim", emoji: "✅", pronunciation: "seen", meaning: "Resposta afirmativa", example: "Sim, eu entendo"},
        %{id: "intro_no", word: "Não", emoji: "❌", pronunciation: "nown", meaning: "Resposta negativa", example: "Não, eu não sei"},
        %{id: "intro_goodbye", word: "Tchau", emoji: "👋", pronunciation: "chow", meaning: "Despedida", example: "Tchau, até mais tarde!"},
        %{id: "intro_see_later", word: "Até mais tarde", emoji: "🔄", pronunciation: "ah-TEH mahys TAHR-dee", meaning: "Despedida casual", example: "Até mais tarde, tenha um bom dia"},
        %{id: "intro_where", word: "Onde", emoji: "📍", pronunciation: "OHN-dee", meaning: "Pergunta sobre localização", example: "De onde você é?"},
        %{id: "intro_from", word: "De", emoji: "🏠", pronunciation: "dee", meaning: "Origem ou fonte", example: "Eu sou de Nova York"}
      ],
      game_objects: [
        %{id: "intro_hello", emoji: "👋", word: "Olá", pronunciation: "oh-LAH"},
        %{id: "intro_name", emoji: "📛", word: "Nome", pronunciation: "NOH-mee"},
        %{id: "intro_nice_meet", emoji: "🤝", word: "Prazer em conhecê-lo", pronunciation: "prah-ZEHR ayn koh-nyeh-SEH-loh"},
        %{id: "intro_thank_you", emoji: "🙏", word: "Obrigado", pronunciation: "oh-bree-GAH-doh"},
        %{id: "intro_yes", emoji: "✅", word: "Sim", pronunciation: "seen"},
        %{id: "intro_no", emoji: "❌", word: "Não", pronunciation: "nown"},
        %{id: "intro_goodbye", emoji: "👋", word: "Tchau", pronunciation: "chow"}
      ],
      cards: [
        %{id: "intro_hello", template: "Diga _ para cumprimentar alguém", answer: "Olá", description: "Saudação básica"},
        %{id: "intro_name", template: "Meu _ é Sarah", answer: "nome", description: "Se apresentando"},
        %{id: "intro_nice_meet", template: "_ em conhecê-lo", answer: "Prazer", description: "Resposta educada"},
        %{id: "intro_thank_you", template: "Muito _", answer: "obrigado", description: "Expressando gratidão"}
      ]
    }
  end
end