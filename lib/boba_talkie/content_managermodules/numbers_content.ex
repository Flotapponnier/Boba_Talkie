defmodule BobaTalkie.ContentManagerModules.NumbersContent do
  @moduledoc """
  Numbers topic content in multiple languages.
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
      title: "Numbers",
      description: "Learn counting and number vocabulary",
      emoji: "1️⃣",
      vocabulary: [
        %{id: "number_one", word: "One", emoji: "1️⃣", pronunciation: "WUN", meaning: "The number 1", example: "I have one apple"},
        %{id: "number_two", word: "Two", emoji: "2️⃣", pronunciation: "TOO", meaning: "The number 2", example: "Two cats are playing"},
        %{id: "number_three", word: "Three", emoji: "3️⃣", pronunciation: "THREE", meaning: "The number 3", example: "Count to three"},
        %{id: "number_four", word: "Four", emoji: "4️⃣", pronunciation: "FOR", meaning: "The number 4", example: "Four wheels on a car"},
        %{id: "number_five", word: "Five", emoji: "5️⃣", pronunciation: "FAHYV", meaning: "The number 5", example: "Five fingers on a hand"},
        %{id: "number_six", word: "Six", emoji: "6️⃣", pronunciation: "SIKS", meaning: "The number 6", example: "Six sides on a cube"},
        %{id: "number_seven", word: "Seven", emoji: "7️⃣", pronunciation: "SEV-uhn", meaning: "The number 7", example: "Seven days in a week"},
        %{id: "number_eight", word: "Eight", emoji: "8️⃣", pronunciation: "AYT", meaning: "The number 8", example: "Eight legs on a spider"},
        %{id: "number_nine", word: "Nine", emoji: "9️⃣", pronunciation: "NAHYN", meaning: "The number 9", example: "Nine squares in tic-tac-toe"},
        %{id: "number_ten", word: "Ten", emoji: "🔟", pronunciation: "TEN", meaning: "The number 10", example: "Ten toes on feet"}
      ],
      game_objects: [
        %{id: "number_one", emoji: "1️⃣", word: "One", pronunciation: "WUN"},
        %{id: "number_two", emoji: "2️⃣", word: "Two", pronunciation: "TOO"},
        %{id: "number_three", emoji: "3️⃣", word: "Three", pronunciation: "THREE"},
        %{id: "number_four", emoji: "4️⃣", word: "Four", pronunciation: "FOR"},
        %{id: "number_five", emoji: "5️⃣", word: "Five", pronunciation: "FAHYV"},
        %{id: "number_ten", emoji: "🔟", word: "Ten", pronunciation: "TEN"}
      ],
      cards: [
        %{id: "number_one", template: "I have _ apple", answer: "one", description: "Counting objects"},
        %{id: "number_two", template: "_ cats playing", answer: "two", description: "Counting animals"},
        %{id: "number_three", template: "Count to _", answer: "three", description: "Basic counting"},
        %{id: "number_ten", template: "_ toes on feet", answer: "ten", description: "Counting body parts"}
      ]
    }
  end

  # Spanish content
  defp get_spanish_content do
    %{
      title: "Números",
      description: "Aprende a contar y el vocabulario de números",
      emoji: "1️⃣",
      vocabulary: [
        %{id: "number_one", word: "Uno", emoji: "1️⃣", pronunciation: "OO-noh", meaning: "El número 1", example: "Tengo una manzana"},
        %{id: "number_two", word: "Dos", emoji: "2️⃣", pronunciation: "dohs", meaning: "El número 2", example: "Dos gatos están jugando"},
        %{id: "number_three", word: "Tres", emoji: "3️⃣", pronunciation: "trehs", meaning: "El número 3", example: "Cuenta hasta tres"},
        %{id: "number_four", word: "Cuatro", emoji: "4️⃣", pronunciation: "KWAH-troh", meaning: "El número 4", example: "Cuatro ruedas en un coche"},
        %{id: "number_five", word: "Cinco", emoji: "5️⃣", pronunciation: "SEEN-koh", meaning: "El número 5", example: "Cinco dedos en una mano"},
        %{id: "number_six", word: "Seis", emoji: "6️⃣", pronunciation: "says", meaning: "El número 6", example: "Seis lados en un cubo"},
        %{id: "number_seven", word: "Siete", emoji: "7️⃣", pronunciation: "see-EH-teh", meaning: "El número 7", example: "Siete días en una semana"},
        %{id: "number_eight", word: "Ocho", emoji: "8️⃣", pronunciation: "OH-choh", meaning: "El número 8", example: "Ocho patas en una araña"},
        %{id: "number_nine", word: "Nueve", emoji: "9️⃣", pronunciation: "noo-EH-veh", meaning: "El número 9", example: "Nueve cuadrados en tres en raya"},
        %{id: "number_ten", word: "Diez", emoji: "🔟", pronunciation: "dee-EHS", meaning: "El número 10", example: "Diez dedos de los pies"}
      ],
      game_objects: [
        %{id: "number_one", emoji: "1️⃣", word: "Uno", pronunciation: "OO-noh"},
        %{id: "number_two", emoji: "2️⃣", word: "Dos", pronunciation: "dohs"},
        %{id: "number_three", emoji: "3️⃣", word: "Tres", pronunciation: "trehs"},
        %{id: "number_four", emoji: "4️⃣", word: "Cuatro", pronunciation: "KWAH-troh"},
        %{id: "number_five", emoji: "5️⃣", word: "Cinco", pronunciation: "SEEN-koh"},
        %{id: "number_ten", emoji: "🔟", word: "Diez", pronunciation: "dee-EHS"}
      ],
      cards: [
        %{id: "number_one", template: "Tengo _ manzana", answer: "una", description: "Contar objetos"},
        %{id: "number_two", template: "_ gatos jugando", answer: "dos", description: "Contar animales"},
        %{id: "number_three", template: "Cuenta hasta _", answer: "tres", description: "Conteo básico"},
        %{id: "number_ten", template: "_ dedos de los pies", answer: "diez", description: "Contar partes del cuerpo"}
      ]
    }
  end

  # Chinese content with pinyin
  defp get_chinese_content do
    %{
      title: "数字",
      description: "学习计数和数字词汇",
      emoji: "1️⃣",
      vocabulary: [
        %{id: "number_one", word: "一", emoji: "1️⃣", pronunciation: "yī", romanization: "yī", meaning: "数字1", example: "我有一个苹果", example_romanization: "wǒ yǒu yī gè píng guǒ"},
        %{id: "number_two", word: "二", emoji: "2️⃣", pronunciation: "èr", romanization: "èr", meaning: "数字2", example: "两只猫在玩", example_romanization: "liǎng zhī māo zài wán"},
        %{id: "number_three", word: "三", emoji: "3️⃣", pronunciation: "sān", romanization: "sān", meaning: "数字3", example: "数到三", example_romanization: "shù dào sān"},
        %{id: "number_four", word: "四", emoji: "4️⃣", pronunciation: "sì", romanization: "sì", meaning: "数字4", example: "汽车有四个轮子", example_romanization: "qì chē yǒu sì gè lún zi"},
        %{id: "number_five", word: "五", emoji: "5️⃣", pronunciation: "wǔ", romanization: "wǔ", meaning: "数字5", example: "一只手有五根手指", example_romanization: "yī zhī shǒu yǒu wǔ gēn shǒu zhǐ"},
        %{id: "number_six", word: "六", emoji: "6️⃣", pronunciation: "liù", romanization: "liù", meaning: "数字6", example: "正方体有六个面", example_romanization: "zhèng fāng tǐ yǒu liù gè miàn"},
        %{id: "number_seven", word: "七", emoji: "7️⃣", pronunciation: "qī", romanization: "qī", meaning: "数字7", example: "一周有七天", example_romanization: "yī zhōu yǒu qī tiān"},
        %{id: "number_eight", word: "八", emoji: "8️⃣", pronunciation: "bā", romanization: "bā", meaning: "数字8", example: "蜘蛛有八条腿", example_romanization: "zhī zhū yǒu bā tiáo tuǐ"},
        %{id: "number_nine", word: "九", emoji: "9️⃣", pronunciation: "jiǔ", romanization: "jiǔ", meaning: "数字9", example: "井字游戏有九个格子", example_romanization: "jǐng zì yóu xì yǒu jiǔ gè gé zi"},
        %{id: "number_ten", word: "十", emoji: "🔟", pronunciation: "shí", romanization: "shí", meaning: "数字10", example: "脚有十个脚趾", example_romanization: "jiǎo yǒu shí gè jiǎo zhǐ"}
      ],
      game_objects: [
        %{id: "number_one", emoji: "1️⃣", word: "一", pronunciation: "yī", romanization: "yī"},
        %{id: "number_two", emoji: "2️⃣", word: "二", pronunciation: "èr", romanization: "èr"},
        %{id: "number_three", emoji: "3️⃣", word: "三", pronunciation: "sān", romanization: "sān"},
        %{id: "number_four", emoji: "4️⃣", word: "四", pronunciation: "sì", romanization: "sì"},
        %{id: "number_five", emoji: "5️⃣", word: "五", pronunciation: "wǔ", romanization: "wǔ"},
        %{id: "number_ten", emoji: "🔟", word: "十", pronunciation: "shí", romanization: "shí"}
      ],
      cards: [
        %{id: "number_one", template: "我有_个苹果", answer: "一", romanization: "yī", description: "数物体"},
        %{id: "number_two", template: "_只猫在玩", answer: "两", romanization: "liǎng", description: "数动物"},
        %{id: "number_three", template: "数到_", answer: "三", romanization: "sān", description: "基本计数"},
        %{id: "number_ten", template: "脚有_个脚趾", answer: "十", romanization: "shí", description: "数身体部位"}
      ]
    }
  end

  # French content
  defp get_french_content do
    %{
      title: "Nombres",
      description: "Apprendre à compter et le vocabulaire des nombres",
      emoji: "1️⃣",
      vocabulary: [
        %{id: "number_one", word: "Un", emoji: "1️⃣", pronunciation: "uhn", meaning: "Le nombre 1", example: "J'ai une pomme"},
        %{id: "number_two", word: "Deux", emoji: "2️⃣", pronunciation: "duh", meaning: "Le nombre 2", example: "Deux chats jouent"},
        %{id: "number_three", word: "Trois", emoji: "3️⃣", pronunciation: "twa", meaning: "Le nombre 3", example: "Compte jusqu'à trois"},
        %{id: "number_four", word: "Quatre", emoji: "4️⃣", pronunciation: "katr", meaning: "Le nombre 4", example: "Quatre roues sur une voiture"},
        %{id: "number_five", word: "Cinq", emoji: "5️⃣", pronunciation: "sank", meaning: "Le nombre 5", example: "Cinq doigts sur une main"},
        %{id: "number_six", word: "Six", emoji: "6️⃣", pronunciation: "sees", meaning: "Le nombre 6", example: "Six faces sur un cube"},
        %{id: "number_seven", word: "Sept", emoji: "7️⃣", pronunciation: "set", meaning: "Le nombre 7", example: "Sept jours dans une semaine"},
        %{id: "number_eight", word: "Huit", emoji: "8️⃣", pronunciation: "weet", meaning: "Le nombre 8", example: "Huit pattes sur une araignée"},
        %{id: "number_nine", word: "Neuf", emoji: "9️⃣", pronunciation: "nuhf", meaning: "Le nombre 9", example: "Neuf cases dans un morpion"},
        %{id: "number_ten", word: "Dix", emoji: "🔟", pronunciation: "dees", meaning: "Le nombre 10", example: "Dix orteils sur les pieds"}
      ],
      game_objects: [
        %{id: "number_one", emoji: "1️⃣", word: "Un", pronunciation: "uhn"},
        %{id: "number_two", emoji: "2️⃣", word: "Deux", pronunciation: "duh"},
        %{id: "number_three", emoji: "3️⃣", word: "Trois", pronunciation: "twa"},
        %{id: "number_four", emoji: "4️⃣", word: "Quatre", pronunciation: "katr"},
        %{id: "number_five", emoji: "5️⃣", word: "Cinq", pronunciation: "sank"},
        %{id: "number_ten", emoji: "🔟", word: "Dix", pronunciation: "dees"}
      ],
      cards: [
        %{id: "number_one", template: "J'ai _ pomme", answer: "une", description: "Compter des objets"},
        %{id: "number_two", template: "_ chats jouent", answer: "deux", description: "Compter des animaux"},
        %{id: "number_three", template: "Compte jusqu'à _", answer: "trois", description: "Comptage de base"},
        %{id: "number_ten", template: "_ orteils sur les pieds", answer: "dix", description: "Compter les parties du corps"}
      ]
    }
  end

  # Japanese content with romanization
  defp get_japanese_content do
    %{
      title: "数字",
      description: "数を数えることと数字の語彙を学ぶ",
      emoji: "1️⃣",
      vocabulary: [
        %{id: "number_one", word: "一", emoji: "1️⃣", pronunciation: "ee-chee", romanization: "ichi", meaning: "数字の1", example: "りんごが一つあります", example_romanization: "ringo ga hitotsu arimasu"},
        %{id: "number_two", word: "二", emoji: "2️⃣", pronunciation: "nee", romanization: "ni", meaning: "数字の2", example: "二匹の猫が遊んでいます", example_romanization: "nihiki no neko ga asonde imasu"},
        %{id: "number_three", word: "三", emoji: "3️⃣", pronunciation: "sahn", romanization: "san", meaning: "数字の3", example: "三まで数える", example_romanization: "san made kazoeru"},
        %{id: "number_four", word: "四", emoji: "4️⃣", pronunciation: "shee", romanization: "shi", meaning: "数字の4", example: "車には四つの車輪があります", example_romanization: "kuruma ni wa yottsu no sharin ga arimasu"},
        %{id: "number_five", word: "五", emoji: "5️⃣", pronunciation: "goh", romanization: "go", meaning: "数字の5", example: "手には五本の指があります", example_romanization: "te ni wa gobon no yubi ga arimasu"},
        %{id: "number_six", word: "六", emoji: "6️⃣", pronunciation: "roh-koo", romanization: "roku", meaning: "数字の6", example: "立方体には六つの面があります", example_romanization: "rippoutai ni wa muttsu no men ga arimasu"},
        %{id: "number_seven", word: "七", emoji: "7️⃣", pronunciation: "shee-chee", romanization: "shichi", meaning: "数字の7", example: "一週間は七日です", example_romanization: "isshukan wa nanoka desu"},
        %{id: "number_eight", word: "八", emoji: "8️⃣", pronunciation: "hah-chee", romanization: "hachi", meaning: "数字の8", example: "蜘蛛には八本の足があります", example_romanization: "kumo ni wa happon no ashi ga arimasu"},
        %{id: "number_nine", word: "九", emoji: "9️⃣", pronunciation: "kyoo", romanization: "kyuu", meaning: "数字の9", example: "三目並べには九つのマスがあります", example_romanization: "sanmoku narabe ni wa kokonotsu no masu ga arimasu"},
        %{id: "number_ten", word: "十", emoji: "🔟", pronunciation: "joo", romanization: "juu", meaning: "数字の10", example: "足には十本の指があります", example_romanization: "ashi ni wa juppon no yubi ga arimasu"}
      ],
      game_objects: [
        %{id: "number_one", emoji: "1️⃣", word: "一", pronunciation: "ee-chee", romanization: "ichi"},
        %{id: "number_two", emoji: "2️⃣", word: "二", pronunciation: "nee", romanization: "ni"},
        %{id: "number_three", emoji: "3️⃣", word: "三", pronunciation: "sahn", romanization: "san"},
        %{id: "number_four", emoji: "4️⃣", word: "四", pronunciation: "shee", romanization: "shi"},
        %{id: "number_five", emoji: "5️⃣", word: "五", pronunciation: "goh", romanization: "go"},
        %{id: "number_ten", emoji: "🔟", word: "十", pronunciation: "joo", romanization: "juu"}
      ],
      cards: [
        %{id: "number_one", template: "りんごが_つあります", answer: "一", romanization: "hitotsu", description: "物を数える"},
        %{id: "number_two", template: "_匹の猫が遊んでいます", answer: "二", romanization: "ni", description: "動物を数える"},
        %{id: "number_three", template: "_まで数える", answer: "三", romanization: "san", description: "基本的な数え方"},
        %{id: "number_ten", template: "足には_本の指があります", answer: "十", romanization: "juu", description: "体の部位を数える"}
      ]
    }
  end

  # Russian content with romanization
  defp get_russian_content do
    %{
      title: "Числа",
      description: "Изучать счет и словарь чисел",
      emoji: "1️⃣",
      vocabulary: [
        %{id: "number_one", word: "Один", emoji: "1️⃣", pronunciation: "ah-DEEN", romanization: "odin", meaning: "Число 1", example: "У меня есть одно яблоко", example_romanization: "u menya yest' odno yabloko"},
        %{id: "number_two", word: "Два", emoji: "2️⃣", pronunciation: "dva", romanization: "dva", meaning: "Число 2", example: "Две кошки играют", example_romanization: "dve koshki igrayut"},
        %{id: "number_three", word: "Три", emoji: "3️⃣", pronunciation: "tree", romanization: "tri", meaning: "Число 3", example: "Считай до трех", example_romanization: "schitay do tryokh"},
        %{id: "number_four", word: "Четыре", emoji: "4️⃣", pronunciation: "cheh-TY-reh", romanization: "chetyre", meaning: "Число 4", example: "У машины четыре колеса", example_romanization: "u mashiny chetyre kolesa"},
        %{id: "number_five", word: "Пять", emoji: "5️⃣", pronunciation: "pyat'", romanization: "pyat'", meaning: "Число 5", example: "На руке пять пальцев", example_romanization: "na ruke pyat' pal'cev"},
        %{id: "number_six", word: "Шесть", emoji: "6️⃣", pronunciation: "shest'", romanization: "shest'", meaning: "Число 6", example: "У куба шесть граней", example_romanization: "u kuba shest' graney"},
        %{id: "number_seven", word: "Семь", emoji: "7️⃣", pronunciation: "syem'", romanization: "sem'", meaning: "Число 7", example: "В неделе семь дней", example_romanization: "v nedele sem' dney"},
        %{id: "number_eight", word: "Восемь", emoji: "8️⃣", pronunciation: "VO-syem'", romanization: "vosem'", meaning: "Число 8", example: "У паука восемь ног", example_romanization: "u pauka vosem' nog"},
        %{id: "number_nine", word: "Девять", emoji: "9️⃣", pronunciation: "DYEV-yat'", romanization: "devyat'", meaning: "Число 9", example: "В крестиках-ноликах девять клеток", example_romanization: "v krestikakh-nolikakh devyat' kletok"},
        %{id: "number_ten", word: "Десять", emoji: "🔟", pronunciation: "DYES-yat'", romanization: "desyat'", meaning: "Число 10", example: "На ногах десять пальцев", example_romanization: "na nogakh desyat' pal'cev"}
      ],
      game_objects: [
        %{id: "number_one", emoji: "1️⃣", word: "Один", pronunciation: "ah-DEEN", romanization: "odin"},
        %{id: "number_two", emoji: "2️⃣", word: "Два", pronunciation: "dva", romanization: "dva"},
        %{id: "number_three", emoji: "3️⃣", word: "Три", pronunciation: "tree", romanization: "tri"},
        %{id: "number_four", emoji: "4️⃣", word: "Четыре", pronunciation: "cheh-TY-reh", romanization: "chetyre"},
        %{id: "number_five", emoji: "5️⃣", word: "Пять", pronunciation: "pyat'", romanization: "pyat'"},
        %{id: "number_ten", emoji: "🔟", word: "Десять", pronunciation: "DYES-yat'", romanization: "desyat'"}
      ],
      cards: [
        %{id: "number_one", template: "У меня есть _ яблоко", answer: "одно", romanization: "odno", description: "Счет предметов"},
        %{id: "number_two", template: "_ кошки играют", answer: "две", romanization: "dve", description: "Счет животных"},
        %{id: "number_three", template: "Считай до _", answer: "трех", romanization: "tryokh", description: "Основной счет"},
        %{id: "number_ten", template: "На ногах _ пальцев", answer: "десять", romanization: "desyat'", description: "Счет частей тела"}
      ]
    }
  end

  # Arabic content with romanization
  defp get_arabic_content do
    %{
      title: "الأرقام",
      description: "تعلم العد ومفردات الأرقام",
      emoji: "1️⃣",
      vocabulary: [
        %{id: "number_one", word: "واحد", emoji: "1️⃣", pronunciation: "waa-hid", romanization: "waahid", meaning: "الرقم 1", example: "عندي تفاحة واحدة", example_romanization: "indi tuffaha waahida"},
        %{id: "number_two", word: "اثنان", emoji: "2️⃣", pronunciation: "ith-naan", romanization: "ithnaan", meaning: "الرقم 2", example: "قطتان تلعبان", example_romanization: "qittatan tal'abaan"},
        %{id: "number_three", word: "ثلاثة", emoji: "3️⃣", pronunciation: "tha-laa-tha", romanization: "thalaatha", meaning: "الرقم 3", example: "عُد إلى ثلاثة", example_romanization: "udd ila thalaatha"},
        %{id: "number_four", word: "أربعة", emoji: "4️⃣", pronunciation: "ar-ba-a", romanization: "arba'a", meaning: "الرقم 4", example: "للسيارة أربعة عجلات", example_romanization: "lil-sayyaara arba'a ajlaat"},
        %{id: "number_five", word: "خمسة", emoji: "5️⃣", pronunciation: "kham-sa", romanization: "khamsa", meaning: "الرقم 5", example: "في اليد خمسة أصابع", example_romanization: "fi al-yad khamsat asaabi'"},
        %{id: "number_six", word: "ستة", emoji: "6️⃣", pronunciation: "sit-ta", romanization: "sitta", meaning: "الرقم 6", example: "للمكعب ستة وجوه", example_romanization: "lil-muka'ab sittat wujuuh"},
        %{id: "number_seven", word: "سبعة", emoji: "7️⃣", pronunciation: "sab-a", romanization: "sab'a", meaning: "الرقم 7", example: "في الأسبوع سبعة أيام", example_romanization: "fi al-usbuu' sab'at ayyaam"},
        %{id: "number_eight", word: "ثمانية", emoji: "8️⃣", pronunciation: "tha-maa-ni-ya", romanization: "thamaaniya", meaning: "الرقم 8", example: "للعنكبوت ثمانية أرجل", example_romanization: "lil-'ankabut thamaaniyat arjul"},
        %{id: "number_nine", word: "تسعة", emoji: "9️⃣", pronunciation: "tis-a", romanization: "tis'a", meaning: "الرقم 9", example: "في لعبة إكس أو تسعة مربعات", example_romanization: "fi lu'bat iks aw tis'at murabba'aat"},
        %{id: "number_ten", word: "عشرة", emoji: "🔟", pronunciation: "a-sha-ra", romanization: "ashara", meaning: "الرقم 10", example: "في القدمين عشرة أصابع", example_romanization: "fi al-qadamayn asharat asaabi'"}
      ],
      game_objects: [
        %{id: "number_one", emoji: "1️⃣", word: "واحد", pronunciation: "waa-hid", romanization: "waahid"},
        %{id: "number_two", emoji: "2️⃣", word: "اثنان", pronunciation: "ith-naan", romanization: "ithnaan"},
        %{id: "number_three", emoji: "3️⃣", word: "ثلاثة", pronunciation: "tha-laa-tha", romanization: "thalaatha"},
        %{id: "number_four", emoji: "4️⃣", word: "أربعة", pronunciation: "ar-ba-a", romanization: "arba'a"},
        %{id: "number_five", emoji: "5️⃣", word: "خمسة", pronunciation: "kham-sa", romanization: "khamsa"},
        %{id: "number_ten", emoji: "🔟", word: "عشرة", pronunciation: "a-sha-ra", romanization: "ashara"}
      ],
      cards: [
        %{id: "number_one", template: "عندي تفاحة _", answer: "واحدة", romanization: "waahida", description: "عد الأشياء"},
        %{id: "number_two", template: "_ قطتان تلعبان", answer: "اثنتان", romanization: "ithnataan", description: "عد الحيوانات"},
        %{id: "number_three", template: "عُد إلى _", answer: "ثلاثة", romanization: "thalaatha", description: "العد الأساسي"},
        %{id: "number_ten", template: "في القدمين _ أصابع", answer: "عشرة", romanization: "ashara", description: "عد أجزاء الجسم"}
      ]
    }
  end

  # Italian content
  defp get_italian_content do
    %{
      title: "Numeri",
      description: "Imparare a contare e il vocabolario dei numeri",
      emoji: "1️⃣",
      vocabulary: [
        %{id: "number_one", word: "Uno", emoji: "1️⃣", pronunciation: "OO-noh", meaning: "Il numero 1", example: "Ho una mela"},
        %{id: "number_two", word: "Due", emoji: "2️⃣", pronunciation: "DOO-eh", meaning: "Il numero 2", example: "Due gatti stanno giocando"},
        %{id: "number_three", word: "Tre", emoji: "3️⃣", pronunciation: "treh", meaning: "Il numero 3", example: "Conta fino a tre"},
        %{id: "number_four", word: "Quattro", emoji: "4️⃣", pronunciation: "KWAH-troh", meaning: "Il numero 4", example: "Quattro ruote su un'auto"},
        %{id: "number_five", word: "Cinque", emoji: "5️⃣", pronunciation: "CHEEN-kweh", meaning: "Il numero 5", example: "Cinque dita su una mano"},
        %{id: "number_six", word: "Sei", emoji: "6️⃣", pronunciation: "say", meaning: "Il numero 6", example: "Sei facce su un cubo"},
        %{id: "number_seven", word: "Sette", emoji: "7️⃣", pronunciation: "SET-teh", meaning: "Il numero 7", example: "Sette giorni in una settimana"},
        %{id: "number_eight", word: "Otto", emoji: "8️⃣", pronunciation: "OH-toh", meaning: "Il numero 8", example: "Otto zampe su un ragno"},
        %{id: "number_nine", word: "Nove", emoji: "9️⃣", pronunciation: "NOH-veh", meaning: "Il numero 9", example: "Nove quadrati nel tris"},
        %{id: "number_ten", word: "Dieci", emoji: "🔟", pronunciation: "dee-EH-chee", meaning: "Il numero 10", example: "Dieci dita dei piedi"}
      ],
      game_objects: [
        %{id: "number_one", emoji: "1️⃣", word: "Uno", pronunciation: "OO-noh"},
        %{id: "number_two", emoji: "2️⃣", word: "Due", pronunciation: "DOO-eh"},
        %{id: "number_three", emoji: "3️⃣", word: "Tre", pronunciation: "treh"},
        %{id: "number_four", emoji: "4️⃣", word: "Quattro", pronunciation: "KWAH-troh"},
        %{id: "number_five", emoji: "5️⃣", word: "Cinque", pronunciation: "CHEEN-kweh"},
        %{id: "number_ten", emoji: "🔟", word: "Dieci", pronunciation: "dee-EH-chee"}
      ],
      cards: [
        %{id: "number_one", template: "Ho _ mela", answer: "una", description: "Contare oggetti"},
        %{id: "number_two", template: "_ gatti stanno giocando", answer: "due", description: "Contare animali"},
        %{id: "number_three", template: "Conta fino a _", answer: "tre", description: "Conteggio di base"},
        %{id: "number_ten", template: "_ dita dei piedi", answer: "dieci", description: "Contare parti del corpo"}
      ]
    }
  end

  # Portuguese content
  defp get_portuguese_content do
    %{
      title: "Números",
      description: "Aprenda a contar e vocabulário de números",
      emoji: "1️⃣",
      vocabulary: [
        %{id: "number_one", word: "Um", emoji: "1️⃣", pronunciation: "oom", meaning: "O número 1", example: "Eu tenho uma maçã"},
        %{id: "number_two", word: "Dois", emoji: "2️⃣", pronunciation: "doh-ees", meaning: "O número 2", example: "Dois gatos estão brincando"},
        %{id: "number_three", word: "Três", emoji: "3️⃣", pronunciation: "trehs", meaning: "O número 3", example: "Conte até três"},
        %{id: "number_four", word: "Quatro", emoji: "4️⃣", pronunciation: "KWAH-troh", meaning: "O número 4", example: "Quatro rodas em um carro"},
        %{id: "number_five", word: "Cinco", emoji: "5️⃣", pronunciation: "SEEN-koh", meaning: "O número 5", example: "Cinco dedos em uma mão"},
        %{id: "number_six", word: "Seis", emoji: "6️⃣", pronunciation: "say-s", meaning: "O número 6", example: "Seis faces em um cubo"},
        %{id: "number_seven", word: "Sete", emoji: "7️⃣", pronunciation: "SEH-chee", meaning: "O número 7", example: "Sete dias em uma semana"},
        %{id: "number_eight", word: "Oito", emoji: "8️⃣", pronunciation: "OH-ee-toh", meaning: "O número 8", example: "Oito pernas em uma aranha"},
        %{id: "number_nine", word: "Nove", emoji: "9️⃣", pronunciation: "NOH-vee", meaning: "O número 9", example: "Nove quadrados no jogo da velha"},
        %{id: "number_ten", word: "Dez", emoji: "🔟", pronunciation: "dehz", meaning: "O número 10", example: "Dez dedos dos pés"}
      ],
      game_objects: [
        %{id: "number_one", emoji: "1️⃣", word: "Um", pronunciation: "oom"},
        %{id: "number_two", emoji: "2️⃣", word: "Dois", pronunciation: "doh-ees"},
        %{id: "number_three", emoji: "3️⃣", word: "Três", pronunciation: "trehs"},
        %{id: "number_four", emoji: "4️⃣", word: "Quatro", pronunciation: "KWAH-troh"},
        %{id: "number_five", emoji: "5️⃣", word: "Cinco", pronunciation: "SEEN-koh"},
        %{id: "number_ten", emoji: "🔟", word: "Dez", pronunciation: "dehz"}
      ],
      cards: [
        %{id: "number_one", template: "Eu tenho _ maçã", answer: "uma", description: "Contando objetos"},
        %{id: "number_two", template: "_ gatos estão brincando", answer: "dois", description: "Contando animais"},
        %{id: "number_three", template: "Conte até _", answer: "três", description: "Contagem básica"},
        %{id: "number_ten", template: "_ dedos dos pés", answer: "dez", description: "Contando partes do corpo"}
      ]
    }
  end
end