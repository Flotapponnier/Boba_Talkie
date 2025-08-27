defmodule BobaTalkie.ContentManager do
  @moduledoc """
  Manages learning content in different languages with ID-based translation system.
  This is separate from interface translations and contains actual learning materials.
  Each vocabulary item has a unique ID that can be used for interface language translations.
  """

  def get_learning_content(topic, language_code) do
    case {topic, language_code} do
      {"introduction", lang} -> get_introduction_content(lang)
      {"fruits", lang} -> get_fruits_content(lang)
      {"numbers", lang} -> get_numbers_content(lang)
      {"colors", lang} -> get_colors_content(lang)
      {"bakery", lang} -> get_bakery_content(lang)
      {"animals", lang} -> get_animals_content(lang)
      {"restaurant", lang} -> get_restaurant_content(lang)
      {"family", lang} -> get_family_content(lang)
      {"countries", lang} -> get_countries_content(lang)
      _ -> %{tutorial: [], game_objects: [], cards: []}
    end
  end

  @doc """
  Get translation for a vocabulary item by ID in the specified interface language.
  Returns %{word: "...", example: "..."} or nil if not found.
  """
  def get_vocabulary_translation(vocab_id, interface_language) do
    translations = get_vocabulary_translations()
    get_in(translations, [vocab_id, interface_language])
  end

  # ID-based vocabulary translations for interface language display
  defp get_vocabulary_translations do
    %{
      # Introduction vocabulary IDs
      "intro_hello" => %{
        "en" => %{word: "Hello", example: "Hello, my name is Sarah"},
        "fr" => %{word: "Bonjour", example: "Bonjour, je m'appelle Sarah"},
        "es" => %{word: "Hola", example: "Hola, mi nombre es Sarah"},
        "zh" => %{word: "你好", example: "你好，我叫莎拉"},
        "ru" => %{word: "Привет", example: "Привет, меня зовут Сара"},
        "ja" => %{word: "こんにちは", example: "こんにちは、私の名前はサラです"},
        "it" => %{word: "Ciao", example: "Ciao, il mio nome è Sarah"},
        "ar" => %{word: "مرحبا", example: "مرحبا، اسمي سارة"},
        "pt" => %{word: "Olá", example: "Olá, meu nome é Sarah"}
      },
      "intro_name" => %{
        "en" => %{word: "Name", example: "My name is John"},
        "fr" => %{word: "Nom", example: "Mon nom est John"},
        "es" => %{word: "Nombre", example: "Mi nombre es John"},
        "zh" => %{word: "名字", example: "我叫约翰"},
        "ru" => %{word: "Имя", example: "Меня зовут Джон"},
        "ja" => %{word: "名前", example: "私の名前はジョンです"},
        "it" => %{word: "Nome", example: "Il mio nome è John"},
        "ar" => %{word: "اسم", example: "اسمي جون"},
        "pt" => %{word: "Nome", example: "Meu nome é John"}
      },
      "intro_nice_meet" => %{
        "en" => %{word: "Nice to meet you", example: "Nice to meet you too!"},
        "fr" => %{word: "Enchanté", example: "Enchanté aussi!"},
        "es" => %{word: "Mucho gusto", example: "¡Mucho gusto también!"},
        "zh" => %{word: "很高兴见到你", example: "我也很高兴见到你！"},
        "ru" => %{word: "Приятно познакомиться", example: "Мне тоже приятно познакомиться!"},
        "ja" => %{word: "初めまして", example: "こちらこそ初めまして！"},
        "it" => %{word: "Piacere di conoscerti", example: "Anche per me è un piacere!"},
        "ar" => %{word: "سعيد لمقابلتك", example: "أنا أيضا سعيد لمقابلتك!"},
        "pt" => %{word: "Prazer em conhecê-lo", example: "O prazer é meu também!"}
      },
      "intro_thank_you" => %{
        "en" => %{word: "Thank you", example: "Thank you very much"},
        "fr" => %{word: "Merci", example: "Merci beaucoup"},
        "es" => %{word: "Gracias", example: "Muchas gracias"},
        "zh" => %{word: "谢谢", example: "谢谢你"},
        "ru" => %{word: "Спасибо", example: "Большое спасибо"},
        "ja" => %{word: "ありがとう", example: "どうもありがとう"},
        "it" => %{word: "Grazie", example: "Grazie mille"},
        "ar" => %{word: "شكرا", example: "شكرا جزيلا"},
        "pt" => %{word: "Obrigado", example: "Muito obrigado"}
      },
      # Fruits vocabulary IDs  
      "fruit_apple" => %{
        "en" => %{word: "Apple", example: "I eat an apple every day"},
        "fr" => %{word: "Pomme", example: "Je mange une pomme chaque jour"},
        "es" => %{word: "Manzana", example: "Como una manzana todos los días"},
        "zh" => %{word: "苹果", example: "我每天吃一个苹果"},
        "ru" => %{word: "Яблоко", example: "Я ем яблоко каждый день"},
        "ja" => %{word: "りんご", example: "毎日りんごを食べます"},
        "it" => %{word: "Mela", example: "Mangio una mela ogni giorno"},
        "ar" => %{word: "تفاحة", example: "آكل تفاحة كل يوم"},
        "pt" => %{word: "Maçã", example: "Eu como uma maçã todo dia"}
      },
      "fruit_banana" => %{
        "en" => %{word: "Banana", example: "The banana is yellow"},
        "fr" => %{word: "Banane", example: "La banane est jaune"},
        "es" => %{word: "Plátano", example: "El plátano es amarillo"},
        "zh" => %{word: "香蕉", example: "香蕉是黄色的"},
        "ru" => %{word: "Банан", example: "Банан желтый"},
        "ja" => %{word: "バナナ", example: "バナナは黄色です"},
        "it" => %{word: "Banana", example: "La banana è gialla"},
        "ar" => %{word: "موز", example: "الموز أصفر"},
        "pt" => %{word: "Banana", example: "A banana é amarela"}
      },
      "fruit_orange" => %{
        "en" => %{word: "Orange", example: "Orange juice is healthy"},
        "fr" => %{word: "Orange", example: "Le jus d'orange est sain"},
        "es" => %{word: "Naranja", example: "El jugo de naranja es saludable"},
        "zh" => %{word: "橙子", example: "橙汁很健康"},
        "ru" => %{word: "Апельсин", example: "Апельсиновый сок полезен"},
        "ja" => %{word: "オレンジ", example: "オレンジジュースは健康的です"},
        "it" => %{word: "Arancia", example: "Il succo d'arancia è salutare"},
        "ar" => %{word: "برتقال", example: "عصير البرتقال صحي"},
        "pt" => %{word: "Laranja", example: "Suco de laranja é saudável"}
      },
      "fruit_grape" => %{
        "en" => %{word: "Grape", example: "Purple grapes are sweet"},
        "fr" => %{word: "Raisin", example: "Les raisins violets sont sucrés"},
        "es" => %{word: "Uva", example: "Las uvas moradas son dulces"},
        "zh" => %{word: "葡萄", example: "紫葡萄很甜"},
        "ru" => %{word: "Виноград", example: "Фиолетовый виноград сладкий"},
        "ja" => %{word: "ぶどう", example: "紫のぶどうは甘いです"},
        "it" => %{word: "Uva", example: "L'uva viola è dolce"},
        "ar" => %{word: "عنب", example: "العنب الأرجواني حلو"},
        "pt" => %{word: "Uva", example: "As uvas roxas são doces"}
      },
      # Numbers vocabulary IDs
      "number_one" => %{
        "en" => %{word: "One", example: "I have one apple"},
        "fr" => %{word: "Un", example: "J'ai une pomme"},
        "es" => %{word: "Uno", example: "Tengo una manzana"},
        "zh" => %{word: "一", example: "我有一个苹果"},
        "ru" => %{word: "Один", example: "У меня одно яблоко"},
        "ja" => %{word: "一つ", example: "りんごを一つ持っています"},
        "it" => %{word: "Uno", example: "Ho una mela"},
        "ar" => %{word: "واحد", example: "لدي تفاحة واحدة"},
        "pt" => %{word: "Um", example: "Eu tenho uma maçã"}
      },
      "number_two" => %{
        "en" => %{word: "Two", example: "Two cats are playing"},
        "fr" => %{word: "Deux", example: "Deux chats jouent"},
        "es" => %{word: "Dos", example: "Dos gatos están jugando"},
        "zh" => %{word: "二", example: "两只猫在玩"},
        "ru" => %{word: "Два", example: "Две кошки играют"},
        "ja" => %{word: "二つ", example: "二匹の猫が遊んでいます"},
        "it" => %{word: "Due", example: "Due gatti stanno giocando"},
        "ar" => %{word: "اثنان", example: "قطتان تلعبان"},
        "pt" => %{word: "Dois", example: "Dois gatos estão brincando"}
      },
      "number_three" => %{
        "en" => %{word: "Three", example: "Count to three"},
        "fr" => %{word: "Trois", example: "Compter jusqu'à trois"},
        "es" => %{word: "Tres", example: "Cuenta hasta tres"},
        "zh" => %{word: "三", example: "数到三"},
        "ru" => %{word: "Три", example: "Считать до трёх"},
        "ja" => %{word: "三つ", example: "三まで数えます"},
        "it" => %{word: "Tre", example: "Contare fino a tre"},
        "ar" => %{word: "ثلاثة", example: "عد حتى ثلاثة"},
        "pt" => %{word: "Três", example: "Contar até três"}
      },
      "number_four" => %{
        "en" => %{word: "Four", example: "Four wheels on a car"},
        "fr" => %{word: "Quatre", example: "Quatre roues sur une voiture"},
        "es" => %{word: "Cuatro", example: "Cuatro ruedas en un coche"},
        "zh" => %{word: "四", example: "汽车有四个轮子"},
        "ru" => %{word: "Четыре", example: "Четыре колеса у машины"},
        "ja" => %{word: "四つ", example: "車には四つの車輪があります"},
        "it" => %{word: "Quattro", example: "Quattro ruote su una macchina"},
        "ar" => %{word: "أربعة", example: "أربع عجلات للسيارة"},
        "pt" => %{word: "Quatro", example: "Quatro rodas num carro"}
      },
      # Restaurant vocabulary IDs
      "restaurant_menu" => %{
        "en" => %{word: "Menu", example: "Can I see the menu please?"},
        "fr" => %{word: "Menu", example: "Puis-je voir le menu s'il vous plaît?"},
        "es" => %{word: "Menú", example: "¿Puedo ver el menú por favor?"},
        "zh" => %{word: "菜单", example: "请给我看看菜单好吗？"},
        "ru" => %{word: "Меню", example: "Можно посмотреть меню?"},
        "ja" => %{word: "メニュー", example: "メニューを見せてください"},
        "it" => %{word: "Menu", example: "Posso vedere il menu per favore?"},
        "ar" => %{word: "قائمة الطعام", example: "هل يمكنني رؤية القائمة من فضلك؟"},
        "pt" => %{word: "Menu", example: "Posso ver o menu por favor?"}
      },
      "restaurant_pizza" => %{
        "en" => %{word: "Pizza", example: "I'll have a slice of pizza"},
        "fr" => %{word: "Pizza", example: "Je vais prendre une part de pizza"},
        "es" => %{word: "Pizza", example: "Tomaré una porción de pizza"},
        "zh" => %{word: "比萨", example: "我要一片比萨"},
        "ru" => %{word: "Пицца", example: "Я буду кусочек пиццы"},
        "ja" => %{word: "ピザ", example: "ピザを一切れください"},
        "it" => %{word: "Pizza", example: "Prendo una fetta di pizza"},
        "ar" => %{word: "بيتزا", example: "سآخذ قطعة بيتزا"},
        "pt" => %{word: "Pizza", example: "Vou querer uma fatia de pizza"}
      },
      # Animal vocabulary IDs
      "animal_dog" => %{
        "en" => %{word: "Dog", example: "The dog is man's best friend"},
        "fr" => %{word: "Chien", example: "Le chien est le meilleur ami de l'homme"},
        "es" => %{word: "Perro", example: "El perro es el mejor amigo del hombre"},
        "zh" => %{word: "狗", example: "狗是人类最好的朋友"},
        "ru" => %{word: "Собака", example: "Собака - лучший друг человека"},
        "ja" => %{word: "犬", example: "犬は人間の親友です"},
        "it" => %{word: "Cane", example: "Il cane è il migliore amico dell'uomo"},
        "ar" => %{word: "كلب", example: "الكلب صديق الإنسان الوفي"},
        "pt" => %{word: "Cachorro", example: "O cachorro é o melhor amigo do homem"}
      },
      "animal_cat" => %{
        "en" => %{word: "Cat", example: "The cat sleeps in the sun"},
        "fr" => %{word: "Chat", example: "Le chat dort au soleil"},
        "es" => %{word: "Gato", example: "El gato duerme al sol"},
        "zh" => %{word: "猫", example: "猫在阳光下睡觉"},
        "ru" => %{word: "Кошка", example: "Кошка спит на солнце"},
        "ja" => %{word: "猫", example: "猫は日向で眠っています"},
        "it" => %{word: "Gatto", example: "Il gatto dorme al sole"},
        "ar" => %{word: "قطة", example: "القطة تنام في الشمس"},
        "pt" => %{word: "Gato", example: "O gato dorme ao sol"}
      },
      # Colors vocabulary IDs
      "color_red" => %{
        "en" => %{word: "Red", example: "The rose is red"},
        "fr" => %{word: "Rouge", example: "La rose est rouge"},
        "es" => %{word: "Rojo", example: "La rosa es roja"},
        "zh" => %{word: "红色", example: "玫瑰是红色的"},
        "ru" => %{word: "Красный", example: "Роза красная"},
        "ja" => %{word: "赤", example: "バラは赤いです"},
        "it" => %{word: "Rosso", example: "La rosa è rossa"},
        "ar" => %{word: "أحمر", example: "الوردة حمراء"},
        "pt" => %{word: "Vermelho", example: "A rosa é vermelha"}
      },
      "color_blue" => %{
        "en" => %{word: "Blue", example: "The sky is blue"},
        "fr" => %{word: "Bleu", example: "Le ciel est bleu"},
        "es" => %{word: "Azul", example: "El cielo es azul"},
        "zh" => %{word: "蓝色", example: "天空是蓝色的"},
        "ru" => %{word: "Синий", example: "Небо синее"},
        "ja" => %{word: "青", example: "空は青いです"},
        "it" => %{word: "Blu", example: "Il cielo è blu"},
        "ar" => %{word: "أزرق", example: "السماء زرقاء"},
        "pt" => %{word: "Azul", example: "O céu é azul"}
      },
      "color_green" => %{
        "en" => %{word: "Green", example: "Grass is green"},
        "fr" => %{word: "Vert", example: "L'herbe est verte"},
        "es" => %{word: "Verde", example: "La hierba es verde"},
        "zh" => %{word: "绿色", example: "草是绿色的"},
        "ru" => %{word: "Зелёный", example: "Трава зелёная"},
        "ja" => %{word: "緑", example: "草は緑です"},
        "it" => %{word: "Verde", example: "L'erba è verde"},
        "ar" => %{word: "أخضر", example: "العشب أخضر"},
        "pt" => %{word: "Verde", example: "A grama é verde"}
      },
      "color_yellow" => %{
        "en" => %{word: "Yellow", example: "The sun is yellow"},
        "fr" => %{word: "Jaune", example: "Le soleil est jaune"},
        "es" => %{word: "Amarillo", example: "El sol es amarillo"},
        "zh" => %{word: "黄色", example: "太阳是黄色的"},
        "ru" => %{word: "Жёлтый", example: "Солнце жёлтое"},
        "ja" => %{word: "黄色", example: "太陽は黄色です"},
        "it" => %{word: "Giallo", example: "Il sole è giallo"},
        "ar" => %{word: "أصفر", example: "الشمس صفراء"},
        "pt" => %{word: "Amarelo", example: "O sol é amarelo"}
      },
      # Bakery vocabulary IDs
      "bakery_bread" => %{
        "en" => %{word: "Bread", example: "Fresh bread smells amazing"},
        "fr" => %{word: "Pain", example: "Le pain frais sent bon"},
        "es" => %{word: "Pan", example: "El pan fresco huele increíble"},
        "zh" => %{word: "面包", example: "新鲜的面包闻起来很香"},
        "ru" => %{word: "Хлеб", example: "Свежий хлеб пахнет потрясающе"},
        "ja" => %{word: "パン", example: "焼きたてのパンはいい香りです"},
        "it" => %{word: "Pane", example: "Il pane fresco profuma benissimo"},
        "ar" => %{word: "خبز", example: "الخبز الطازج رائحته رائعة"},
        "pt" => %{word: "Pão", example: "Pão fresco tem um cheiro incrível"}
      },
      "bakery_croissant" => %{
        "en" => %{word: "Croissant", example: "A buttery French croissant"},
        "fr" => %{word: "Croissant", example: "Un croissant français au beurre"},
        "es" => %{word: "Croissant", example: "Un croissant francés con mantequilla"},
        "zh" => %{word: "羊角面包", example: "法式黄油羊角面包"},
        "ru" => %{word: "Круассан", example: "Масляный французский круассан"},
        "ja" => %{word: "クロワッサン", example: "バターたっぷりのフランスのクロワッサン"},
        "it" => %{word: "Cornetto", example: "Un cornetto francese al burro"},
        "ar" => %{word: "كرواسون", example: "كرواسون فرنسي بالزبدة"},
        "pt" => %{word: "Croissant", example: "Um croissant francês amanteigado"}
      },
      "bakery_cake" => %{
        "en" => %{word: "Cake", example: "Birthday cake with candles"},
        "fr" => %{word: "Gâteau", example: "Gâteau d'anniversaire avec des bougies"},
        "es" => %{word: "Pastel", example: "Pastel de cumpleaños con velas"},
        "zh" => %{word: "蛋糕", example: "有蜡烛的生日蛋糕"},
        "ru" => %{word: "Торт", example: "Торт ко дню рождения со свечами"},
        "ja" => %{word: "ケーキ", example: "ろうそく付きの誕生日ケーキ"},
        "it" => %{word: "Torta", example: "Torta di compleanno con candeline"},
        "ar" => %{word: "كعكة", example: "كعكة عيد ميلاد بالشموع"},
        "pt" => %{word: "Bolo", example: "Bolo de aniversário com velas"}
      },
      "bakery_cookie" => %{
        "en" => %{word: "Cookie", example: "Chocolate chip cookie"},
        "fr" => %{word: "Biscuit", example: "Biscuit aux pépites de chocolat"},
        "es" => %{word: "Galleta", example: "Galleta con chispas de chocolate"},
        "zh" => %{word: "饼干", example: "巧克力豆饼干"},
        "ru" => %{word: "Печенье", example: "Печенье с шоколадной крошкой"},
        "ja" => %{word: "クッキー", example: "チョコチップクッキー"},
        "it" => %{word: "Biscotto", example: "Biscotto con gocce di cioccolato"},
        "ar" => %{word: "بسكويت", example: "بسكويت برقائق الشوكولاتة"},
        "pt" => %{word: "Biscoito", example: "Biscoito com gotas de chocolate"}
      },
      # Family vocabulary IDs
      "family_mother" => %{
        "en" => %{word: "Mother", example: "My mother is very kind"},
        "fr" => %{word: "Mère", example: "Ma mère est très gentille"},
        "es" => %{word: "Madre", example: "Mi madre es muy amable"},
        "zh" => %{word: "妈妈", example: "我妈妈很善良"},
        "ru" => %{word: "Мама", example: "Моя мама очень добрая"},
        "ja" => %{word: "お母さん", example: "私のお母さんはとても親切です"},
        "it" => %{word: "Madre", example: "Mia madre è molto gentile"},
        "ar" => %{word: "أم", example: "أمي لطيفة جداً"},
        "pt" => %{word: "Mãe", example: "Minha mãe é muito gentil"}
      },
      "family_father" => %{
        "en" => %{word: "Father", example: "My father works hard"},
        "fr" => %{word: "Père", example: "Mon père travaille dur"},
        "es" => %{word: "Padre", example: "Mi padre trabaja duro"},
        "zh" => %{word: "爸爸", example: "我爸爸工作很努力"},
        "ru" => %{word: "Папа", example: "Мой папа много работает"},
        "ja" => %{word: "お父さん", example: "私のお父さんは一生懸命働きます"},
        "it" => %{word: "Padre", example: "Mio padre lavora sodo"},
        "ar" => %{word: "أب", example: "أبي يعمل بجد"},
        "pt" => %{word: "Pai", example: "Meu pai trabalha duro"}
      },
      "family_sister" => %{
        "en" => %{word: "Sister", example: "I have two sisters"},
        "fr" => %{word: "Sœur", example: "J'ai deux sœurs"},
        "es" => %{word: "Hermana", example: "Tengo dos hermanas"},
        "zh" => %{word: "姐妹", example: "我有两个姐妹"},
        "ru" => %{word: "Сестра", example: "У меня две сестры"},
        "ja" => %{word: "姉妹", example: "私には二人の姉妹がいます"},
        "it" => %{word: "Sorella", example: "Ho due sorelle"},
        "ar" => %{word: "أخت", example: "لدي شقيقتان"},
        "pt" => %{word: "Irmã", example: "Eu tenho duas irmãs"}
      },
      "family_brother" => %{
        "en" => %{word: "Brother", example: "My brother is younger"},
        "fr" => %{word: "Frère", example: "Mon frère est plus jeune"},
        "es" => %{word: "Hermano", example: "Mi hermano es más joven"},
        "zh" => %{word: "兄弟", example: "我弟弟比我小"},
        "ru" => %{word: "Брат", example: "Мой брат младше"},
        "ja" => %{word: "兄弟", example: "私の弟は年下です"},
        "it" => %{word: "Fratello", example: "Mio fratello è più giovane"},
        "ar" => %{word: "أخ", example: "أخي أصغر مني"},
        "pt" => %{word: "Irmão", example: "Meu irmão é mais novo"}
      },
      # Countries vocabulary IDs
      "country_usa" => %{
        "en" => %{word: "USA", example: "USA is very diverse"},
        "fr" => %{word: "États-Unis", example: "Les États-Unis sont très diversifiés"},
        "es" => %{word: "Estados Unidos", example: "Estados Unidos es muy diverso"},
        "zh" => %{word: "美国", example: "美国非常多元化"},
        "ru" => %{word: "США", example: "США очень разнообразны"},
        "ja" => %{word: "アメリカ", example: "アメリカはとても多様です"},
        "it" => %{word: "Stati Uniti", example: "Gli Stati Uniti sono molto diversi"},
        "ar" => %{word: "أمريكا", example: "أمريكا متنوعة جداً"},
        "pt" => %{word: "Estados Unidos", example: "Os Estados Unidos são muito diversos"}
      },
      "country_france" => %{
        "en" => %{word: "France", example: "France is famous for cuisine"},
        "fr" => %{word: "France", example: "La France est célèbre pour sa cuisine"},
        "es" => %{word: "Francia", example: "Francia es famosa por su cocina"},
        "zh" => %{word: "法国", example: "法国以美食闻名"},
        "ru" => %{word: "Франция", example: "Франция славится кухней"},
        "ja" => %{word: "フランス", example: "フランスは料理で有名です"},
        "it" => %{word: "Francia", example: "La Francia è famosa per la cucina"},
        "ar" => %{word: "فرنسا", example: "فرنسا مشهورة بالمطبخ"},
        "pt" => %{word: "França", example: "A França é famosa pela culinária"}
      },
      "country_japan" => %{
        "en" => %{word: "Japan", example: "Japan has beautiful cherry blossoms"},
        "fr" => %{word: "Japon", example: "Le Japon a de beaux cerisiers en fleurs"},
        "es" => %{word: "Japón", example: "Japón tiene hermosos cerezos en flor"},
        "zh" => %{word: "日本", example: "日本有美丽的樱花"},
        "ru" => %{word: "Япония", example: "В Японии красивая сакура"},
        "ja" => %{word: "日本", example: "日本には美しい桜があります"},
        "it" => %{word: "Giappone", example: "Il Giappone ha bellissimi fiori di ciliegio"},
        "ar" => %{word: "اليابان", example: "اليابان لديها أزهار الكرز الجميلة"},
        "pt" => %{word: "Japão", example: "O Japão tem lindas cerejeiras em flor"}
      },
      "country_italy" => %{
        "en" => %{word: "Italy", example: "Italy makes great pasta"},
        "fr" => %{word: "Italie", example: "L'Italie fait d'excellentes pâtes"},
        "es" => %{word: "Italia", example: "Italia hace gran pasta"},
        "zh" => %{word: "意大利", example: "意大利制作美味的意大利面"},
        "ru" => %{word: "Италия", example: "Италия делает отличную пасту"},
        "ja" => %{word: "イタリア", example: "イタリアは素晴らしいパスタを作ります"},
        "it" => %{word: "Italia", example: "L'Italia fa ottima pasta"},
        "ar" => %{word: "إيطاليا", example: "إيطاليا تصنع المعكرونة الرائعة"},
        "pt" => %{word: "Itália", example: "A Itália faz ótima massa"}
      },
      
      # Animal vocabulary IDs
      "animal_rabbit" => %{
        "en" => %{word: "Rabbit", example: "The rabbit hops quickly"},
        "fr" => %{word: "Lapin", example: "Le lapin saute rapidement"},
        "es" => %{word: "Conejo", example: "El conejo salta rápidamente"},
        "zh" => %{word: "兔子", example: "兔子跳得很快"},
        "ru" => %{word: "Кролик", example: "Кролик быстро прыгает"},
        "ja" => %{word: "うさぎ", example: "うさぎは素早く跳びます"},
        "it" => %{word: "Coniglio", example: "Il coniglio salta velocemente"},
        "ar" => %{word: "أرنب", example: "الأرنب يقفز بسرعة"},
        "pt" => %{word: "Coelho", example: "O coelho pula rapidamente"}
      },
      "animal_bear" => %{
        "en" => %{word: "Bear", example: "The brown bear is strong"},
        "fr" => %{word: "Ours", example: "L'ours brun est fort"},
        "es" => %{word: "Oso", example: "El oso pardo es fuerte"},
        "zh" => %{word: "熊", example: "棕熊很强壮"},
        "ru" => %{word: "Медведь", example: "Бурый медведь сильный"},
        "ja" => %{word: "くま", example: "茶色いくまは強いです"},
        "it" => %{word: "Orso", example: "L'orso bruno è forte"},
        "ar" => %{word: "دب", example: "الدب البني قوي"},
        "pt" => %{word: "Urso", example: "O urso pardo é forte"}
      },
      
      # Restaurant vocabulary IDs
      "restaurant_burger" => %{
        "en" => %{word: "Burger", example: "Cheeseburger with fries"},
        "fr" => %{word: "Burger", example: "Cheeseburger avec des frites"},
        "es" => %{word: "Hamburguesa", example: "Hamburguesa con queso y papas"},
        "zh" => %{word: "汉堡", example: "奶酪汉堡配薯条"},
        "ru" => %{word: "Бургер", example: "Чизбургер с картошкой фри"},
        "ja" => %{word: "ハンバーガー", example: "チーズバーガーとフライドポテト"},
        "it" => %{word: "Hamburger", example: "Cheeseburger con patatine"},
        "ar" => %{word: "برغر", example: "برغر بالجبنة مع البطاطس المقلية"},
        "pt" => %{word: "Hambúrguer", example: "Cheeseburger com batatas fritas"}
      },
      "restaurant_coffee" => %{
        "en" => %{word: "Coffee", example: "Hot black coffee"},
        "fr" => %{word: "Café", example: "Café noir chaud"},
        "es" => %{word: "Café", example: "Café negro caliente"},
        "zh" => %{word: "咖啡", example: "热黑咖啡"},
        "ru" => %{word: "Кофе", example: "Горячий чёрный кофе"},
        "ja" => %{word: "コーヒー", example: "熱いブラックコーヒー"},
        "it" => %{word: "Caffè", example: "Caffè nero caldo"},
        "ar" => %{word: "قهوة", example: "قهوة سوداء ساخنة"},
        "pt" => %{word: "Café", example: "Café preto quente"}
      },
      
      # Bakery vocabulary IDs
      "bakery_croissant" => %{
        "en" => %{word: "Croissant", example: "A buttery French croissant"},
        "fr" => %{word: "Croissant", example: "Un croissant français au beurre"},
        "es" => %{word: "Croissant", example: "Un croissant francés con mantequilla"},
        "zh" => %{word: "羊角面包", example: "黄油法式羊角面包"},
        "ru" => %{word: "Круассан", example: "Масляный французский круассан"},
        "ja" => %{word: "クロワッサン", example: "バター入りフランスのクロワッサン"},
        "it" => %{word: "Cornetto", example: "Un cornetto francese al burro"},
        "ar" => %{word: "كرواسان", example: "كرواسان فرنسي بالزبدة"},
        "pt" => %{word: "Croissant", example: "Um croissant francês com manteiga"}
      },
      "bakery_cake" => %{
        "en" => %{word: "Cake", example: "Birthday cake with candles"},
        "fr" => %{word: "Gâteau", example: "Gâteau d'anniversaire avec des bougies"},
        "es" => %{word: "Pastel", example: "Pastel de cumpleaños con velas"},
        "zh" => %{word: "蛋糕", example: "带蜡烛的生日蛋糕"},
        "ru" => %{word: "Торт", example: "Именинный торт со свечами"},
        "ja" => %{word: "ケーキ", example: "ろうそく付きの誕生日ケーキ"},
        "it" => %{word: "Torta", example: "Torta di compleanno con candeline"},
        "ar" => %{word: "كيك", example: "كيك عيد ميلاد مع شموع"},
        "pt" => %{word: "Bolo", example: "Bolo de aniversário com velas"}
      },
      "bakery_cookie" => %{
        "en" => %{word: "Cookie", example: "Chocolate chip cookie"},
        "fr" => %{word: "Biscuit", example: "Biscuit aux pépites de chocolat"},
        "es" => %{word: "Galleta", example: "Galleta con chips de chocolate"},
        "zh" => %{word: "饼干", example: "巧克力片饼干"},
        "ru" => %{word: "Печенье", example: "Печенье с шоколадными крошками"},
        "ja" => %{word: "クッキー", example: "チョコチップクッキー"},
        "it" => %{word: "Biscotto", example: "Biscotto con gocce di cioccolato"},
        "ar" => %{word: "بسكويت", example: "بسكويت برقائق الشوكولاتة"},
        "pt" => %{word: "Biscoito", example: "Biscoito com gotas de chocolate"}
      },
      
      # Family vocabulary IDs
      "family_mother" => %{
        "en" => %{word: "Mother", example: "My mother is very kind"},
        "fr" => %{word: "Mère", example: "Ma mère est très gentille"},
        "es" => %{word: "Madre", example: "Mi madre es muy amable"},
        "zh" => %{word: "妈妈", example: "我妈妈很善良"},
        "ru" => %{word: "Мама", example: "Моя мама очень добрая"},
        "ja" => %{word: "お母さん", example: "私のお母さんはとても優しいです"},
        "it" => %{word: "Madre", example: "Mia madre è molto gentile"},
        "ar" => %{word: "أم", example: "أمي لطيفة جداً"},
        "pt" => %{word: "Mãe", example: "Minha mãe é muito gentil"}
      },
      "family_father" => %{
        "en" => %{word: "Father", example: "My father works hard"},
        "fr" => %{word: "Père", example: "Mon père travaille dur"},
        "es" => %{word: "Padre", example: "Mi padre trabaja mucho"},
        "zh" => %{word: "爸爸", example: "我爸爸工作很努力"},
        "ru" => %{word: "Папа", example: "Мой папа много работает"},
        "ja" => %{word: "お父さん", example: "私のお父さんは一生懸命働きます"},
        "it" => %{word: "Padre", example: "Mio padre lavora sodo"},
        "ar" => %{word: "أب", example: "والدي يعمل بجد"},
        "pt" => %{word: "Pai", example: "Meu pai trabalha muito"}
      },
      "family_sister" => %{
        "en" => %{word: "Sister", example: "I have two sisters"},
        "fr" => %{word: "Sœur", example: "J'ai deux sœurs"},
        "es" => %{word: "Hermana", example: "Tengo dos hermanas"},
        "zh" => %{word: "姐妹", example: "我有两个姐妹"},
        "ru" => %{word: "Сестра", example: "У меня две сестры"},
        "ja" => %{word: "姉妹", example: "私には二人の姉妹がいます"},
        "it" => %{word: "Sorella", example: "Ho due sorelle"},
        "ar" => %{word: "أخت", example: "لدي أختان"},
        "pt" => %{word: "Irmã", example: "Eu tenho duas irmãs"}
      },
      "family_brother" => %{
        "en" => %{word: "Brother", example: "My brother is younger"},
        "fr" => %{word: "Frère", example: "Mon frère est plus jeune"},
        "es" => %{word: "Hermano", example: "Mi hermano es menor"},
        "zh" => %{word: "兄弟", example: "我弟弟更年轻"},
        "ru" => %{word: "Брат", example: "Мой брат младше"},
        "ja" => %{word: "兄弟", example: "私の弟は若いです"},
        "it" => %{word: "Fratello", example: "Mio fratello è più giovane"},
        "ar" => %{word: "أخ", example: "أخي أصغر مني"},
        "pt" => %{word: "Irmão", example: "Meu irmão é mais novo"}
      },
      
      # Countries vocabulary IDs
      "country_usa" => %{
        "en" => %{word: "USA", example: "USA is very diverse"},
        "fr" => %{word: "États-Unis", example: "Les États-Unis sont très diversifiés"},
        "es" => %{word: "Estados Unidos", example: "Estados Unidos es muy diverso"},
        "zh" => %{word: "美国", example: "美国非常多样化"},
        "ru" => %{word: "США", example: "США очень разнообразны"},
        "ja" => %{word: "アメリカ", example: "アメリカはとても多様です"},
        "it" => %{word: "Stati Uniti", example: "Gli Stati Uniti sono molto diversi"},
        "ar" => %{word: "الولايات المتحدة", example: "الولايات المتحدة متنوعة جداً"},
        "pt" => %{word: "Estados Unidos", example: "Os Estados Unidos são muito diversos"}
      },
      "country_france" => %{
        "en" => %{word: "France", example: "France is famous for cuisine"},
        "fr" => %{word: "France", example: "La France est célèbre pour sa cuisine"},
        "es" => %{word: "Francia", example: "Francia es famosa por su cocina"},
        "zh" => %{word: "法国", example: "法国以美食闻名"},
        "ru" => %{word: "Франция", example: "Франция знаменита своей кухней"},
        "ja" => %{word: "フランス", example: "フランスは料理で有名です"},
        "it" => %{word: "Francia", example: "La Francia è famosa per la cucina"},
        "ar" => %{word: "فرنسا", example: "فرنسا مشهورة بالمطبخ"},
        "pt" => %{word: "França", example: "A França é famosa pela culinária"}
      }
      # More vocabulary IDs will be added as needed
    }
  end

  # Introduction Content
  defp get_introduction_content("en") do
    %{
      tutorial: [
        %{id: "intro_hello", word: "Hello", emoji: "👋", pronunciation: "heh-LOH", meaning: "A greeting", example: "Hello, my name is Sarah"},
        %{id: "intro_name", word: "My name is", emoji: "📛", pronunciation: "mahy naym iz", meaning: "To introduce yourself", example: "My name is John"},
        %{id: "intro_nice_meet", word: "Nice to meet you", emoji: "🤝", pronunciation: "nahys too meet yoo", meaning: "Polite greeting", example: "Nice to meet you too!"},
        %{id: "intro_thank_you", word: "Thank you", emoji: "🙏", pronunciation: "THANGK yoo", meaning: "Expression of gratitude", example: "Thank you very much"}
      ],
      game_objects: [
        %{id: "intro_hello", emoji: "👋", word: "Hello", pronunciation: "heh-LOH"},
        %{id: "intro_name", emoji: "📛", word: "Name", pronunciation: "naym"},
        %{id: "intro_nice_meet", emoji: "🤝", word: "Nice to meet you", pronunciation: "nahys too meet yoo"},
        %{id: "intro_thank_you", emoji: "🙏", word: "Thank you", pronunciation: "THANGK yoo"}
      ],
      cards: [
        %{id: "intro_hello", template: "Say _ to greet someone", answer: "Hello", description: "Use this greeting when meeting people"},
        %{id: "intro_name", template: "My _ is Sarah", answer: "name", description: "Introduce yourself by stating your name"},
        %{id: "intro_nice_meet", template: "_ to meet you", answer: "Nice", description: "Polite response after introduction"}
      ]
    }
  end

  defp get_introduction_content("fr") do
    %{
      tutorial: [
        %{id: "intro_hello", word: "Bonjour", emoji: "👋", pronunciation: "bon-ZHOOR", meaning: "Une salutation", example: "Bonjour, je m'appelle Sarah"},
        %{id: "intro_name", word: "Je m'appelle", emoji: "📛", pronunciation: "zhuh mah-PELL", meaning: "Pour se présenter", example: "Je m'appelle John"},
        %{id: "intro_nice_meet", word: "Enchanté", emoji: "🤝", pronunciation: "ahn-shahn-TAY", meaning: "Salutation polie", example: "Enchanté aussi!"},
        %{id: "intro_thank_you", word: "Merci", emoji: "🙏", pronunciation: "mer-SEE", meaning: "Expression de gratitude", example: "Merci beaucoup"}
      ],
      game_objects: [
        %{id: "intro_hello", emoji: "👋", word: "Bonjour", pronunciation: "bon-ZHOOR"},
        %{id: "intro_name", emoji: "📛", word: "Nom", pronunciation: "nohn"},
        %{id: "intro_nice_meet", emoji: "🤝", word: "Enchanté", pronunciation: "ahn-shahn-TAY"},
        %{id: "intro_thank_you", emoji: "🙏", word: "Merci", pronunciation: "mer-SEE"}
      ],
      cards: [
        %{id: "intro_hello", template: "Dire _ pour saluer", answer: "Bonjour", description: "Utilisez cette salutation en rencontrant des gens"},
        %{id: "intro_name", template: "Je _ Sarah", answer: "m'appelle", description: "Présentez-vous en donnant votre nom"},
        %{id: "intro_nice_meet", template: "_ de vous rencontrer", answer: "Enchanté", description: "Réponse polie après présentation"}
      ]
    }
  end

  defp get_introduction_content("zh") do
    %{
      tutorial: [
        %{id: "intro_hello", word: "你好", emoji: "👋", pronunciation: "nǐ hǎo", romanization: "nǐ hǎo", meaning: "A greeting", example: "你好，我叫莎拉", example_romanization: "nǐ hǎo, wǒ jiào shā lā"},
        %{id: "intro_name", word: "我叫", emoji: "📛", pronunciation: "wǒ jiào", romanization: "wǒ jiào", meaning: "My name is", example: "我叫约翰", example_romanization: "wǒ jiào yuē hàn"},
        %{id: "intro_nice_meet", word: "很高兴见到你", emoji: "🤝", pronunciation: "hěn gāo xìng jiàn dào nǐ", romanization: "hěn gāo xìng jiàn dào nǐ", meaning: "Nice to meet you", example: "我也很高兴见到你！", example_romanization: "wǒ yě hěn gāo xìng jiàn dào nǐ!"},
        %{id: "intro_thank_you", word: "谢谢", emoji: "🙏", pronunciation: "xiè xie", romanization: "xiè xie", meaning: "Thank you", example: "谢谢你", example_romanization: "xiè xie nǐ"}
      ],
      game_objects: [
        %{id: "intro_hello", emoji: "👋", word: "你好", pronunciation: "nǐ hǎo", romanization: "nǐ hǎo"},
        %{id: "intro_name", emoji: "📛", word: "名字", pronunciation: "míng zi", romanization: "míng zi"},
        %{id: "intro_nice_meet", emoji: "🤝", word: "见面", pronunciation: "jiàn miàn", romanization: "jiàn miàn"},
        %{id: "intro_thank_you", emoji: "🙏", word: "谢谢", pronunciation: "xiè xie", romanization: "xiè xie"}
      ],
      cards: [
        %{id: "intro_hello", template: "说_来打招呼", answer: "你好", romanization: "nǐ hǎo", description: "见面时使用这个问候语"},
        %{id: "intro_name", template: "我_小明", answer: "叫", romanization: "jiào", description: "通过说出姓名来介绍自己"},
        %{id: "intro_nice_meet", template: "_见到你", answer: "很高兴", romanization: "hěn gāo xìng", description: "介绍后的礼貌回应"}
      ]
    }
  end

  defp get_introduction_content("es") do
    %{
      tutorial: [
        %{id: "intro_hello", word: "Hola", emoji: "👋", pronunciation: "OH-lah", meaning: "Un saludo", example: "Hola, mi nombre es Sarah"},
        %{id: "intro_name", word: "Me llamo", emoji: "📛", pronunciation: "meh YAH-moh", meaning: "Para presentarse", example: "Me llamo John"},
        %{id: "intro_nice_meet", word: "Mucho gusto", emoji: "🤝", pronunciation: "MOO-choh GOOS-toh", meaning: "Saludo cortés", example: "Mucho gusto también!"},
        %{id: "intro_thank_you", word: "Gracias", emoji: "🙏", pronunciation: "GRAH-see-ahs", meaning: "Expresión de gratitud", example: "Muchas gracias"}
      ],
      game_objects: [
        %{id: "intro_hello", emoji: "👋", word: "Hola", pronunciation: "OH-lah"},
        %{id: "intro_name", emoji: "📛", word: "Nombre", pronunciation: "NOHM-breh"},
        %{id: "intro_nice_meet", emoji: "🤝", word: "Mucho gusto", pronunciation: "MOO-choh GOOS-toh"},
        %{id: "intro_thank_you", emoji: "🙏", word: "Gracias", pronunciation: "GRAH-see-ahs"}
      ],
      cards: [
        %{id: "intro_hello", template: "Di _ para saludar", answer: "Hola", description: "Usa este saludo al conocer gente"},
        %{id: "intro_name", template: "_ Sarah", answer: "Me llamo", description: "Preséntate diciendo tu nombre"},
        %{id: "intro_nice_meet", template: "_ conocerte", answer: "Mucho gusto", description: "Respuesta cortés después de presentarse"}
      ]
    }
  end

  defp get_introduction_content("pt") do
    %{
      tutorial: [
        %{id: "intro_hello", word: "Olá", emoji: "👋", pronunciation: "oh-LAH", meaning: "Uma saudação", example: "Olá, meu nome é Sarah"},
        %{id: "intro_name", word: "Meu nome é", emoji: "📛", pronunciation: "MEH-oo NOH-meh eh", meaning: "Para se apresentar", example: "Meu nome é John"},
        %{id: "intro_nice_meet", word: "Prazer em conhecê-lo", emoji: "🤝", pronunciation: "prah-SEHR ehn koh-nyeh-SEH-loh", meaning: "Saudação cortês", example: "O prazer é meu também!"},
        %{id: "intro_thank_you", word: "Obrigado", emoji: "🙏", pronunciation: "oh-bree-GAH-doh", meaning: "Expressão de gratidão", example: "Muito obrigado"}
      ],
      game_objects: [
        %{id: "intro_hello", emoji: "👋", word: "Olá", pronunciation: "oh-LAH"},
        %{id: "intro_name", emoji: "📛", word: "Nome", pronunciation: "NOH-meh"},
        %{id: "intro_nice_meet", emoji: "🤝", word: "Prazer", pronunciation: "prah-SEHR"},
        %{id: "intro_thank_you", emoji: "🙏", word: "Obrigado", pronunciation: "oh-bree-GAH-doh"}
      ],
      cards: [
        %{id: "intro_hello", template: "Diga _ para cumprimentar", answer: "Olá", description: "Use esta saudação ao conhecer pessoas"},
        %{id: "intro_name", template: "_ Sarah", answer: "Meu nome é", description: "Apresente-se dizendo seu nome"},
        %{id: "intro_nice_meet", template: "_ conhecê-lo", answer: "Prazer em", description: "Resposta cortês após apresentação"}
      ]
    }
  end

  defp get_introduction_content("it") do
    %{
      tutorial: [
        %{id: "intro_hello", word: "Ciao", emoji: "👋", pronunciation: "CHAH-oh", meaning: "Un saluto", example: "Ciao, il mio nome è Sarah"},
        %{id: "intro_name", word: "Mi chiamo", emoji: "📛", pronunciation: "mee kee-AH-moh", meaning: "Per presentarsi", example: "Mi chiamo John"},
        %{id: "intro_nice_meet", word: "Piacere", emoji: "🤝", pronunciation: "pee-ah-CHEH-reh", meaning: "Saluto cortese", example: "Anche per me è un piacere!"},
        %{id: "intro_thank_you", word: "Grazie", emoji: "🙏", pronunciation: "GRAH-tsee-eh", meaning: "Espressione di gratitudine", example: "Grazie mille"}
      ],
      game_objects: [
        %{id: "intro_hello", emoji: "👋", word: "Ciao", pronunciation: "CHAH-oh"},
        %{id: "intro_name", emoji: "📛", word: "Nome", pronunciation: "NOH-meh"},
        %{id: "intro_nice_meet", emoji: "🤝", word: "Piacere", pronunciation: "pee-ah-CHEH-reh"},
        %{id: "intro_thank_you", emoji: "🙏", word: "Grazie", pronunciation: "GRAH-tsee-eh"}
      ],
      cards: [
        %{id: "intro_hello", template: "Di _ per salutare", answer: "Ciao", description: "Usa questo saluto incontrando persone"},
        %{id: "intro_name", template: "_ Sarah", answer: "Mi chiamo", description: "Presentati dicendo il tuo nome"},
        %{id: "intro_nice_meet", template: "_ conoscerti", answer: "Piacere di", description: "Risposta cortese dopo presentazione"}
      ]
    }
  end

  defp get_introduction_content("ru") do
    %{
      tutorial: [
        %{id: "intro_hello", word: "Привет", emoji: "👋", pronunciation: "pree-VYEHT", romanization: "privet", meaning: "Приветствие", example: "Привет, меня зовут Сара", example_romanization: "privet, menya zovut Sara"},
        %{id: "intro_name", word: "Меня зовут", emoji: "📛", pronunciation: "mee-NYAH zah-VOOT", romanization: "menya zovut", meaning: "Чтобы представиться", example: "Меня зовут Джон", example_romanization: "menya zovut Dzhon"},
        %{id: "intro_nice_meet", word: "Приятно познакомиться", emoji: "🤝", pronunciation: "pree-YAHT-nah pohz-nah-KOH-meet-sya", romanization: "priyatno poznakomit'sya", meaning: "Вежливое приветствие", example: "Мне тоже приятно познакомиться!", example_romanization: "mne tozhe priyatno poznakomit'sya!"},
        %{id: "intro_thank_you", word: "Спасибо", emoji: "🙏", pronunciation: "spah-SEE-bah", romanization: "spasibo", meaning: "Выражение благодарности", example: "Большое спасибо", example_romanization: "bol'shoye spasibo"}
      ],
      game_objects: [
        %{id: "intro_hello", emoji: "👋", word: "Привет", pronunciation: "pree-VYEHT", romanization: "privet"},
        %{id: "intro_name", emoji: "📛", word: "Имя", pronunciation: "EE-mya", romanization: "imya"},
        %{id: "intro_nice_meet", emoji: "🤝", word: "Знакомство", pronunciation: "znah-KOHM-stvoh", romanization: "znakomstvo"},
        %{id: "intro_thank_you", emoji: "🙏", word: "Спасибо", pronunciation: "spah-SEE-bah", romanization: "spasibo"}
      ],
      cards: [
        %{id: "intro_hello", template: "Скажи _ для приветствия", answer: "Привет", description: "Используй это приветствие при встрече"},
        %{id: "intro_name", template: "_ Сара", answer: "Меня зовут", description: "Представься, назвав своё имя"},
        %{id: "intro_nice_meet", template: "_ познакомиться", answer: "Приятно", description: "Вежливый ответ после знакомства"}
      ]
    }
  end

  defp get_introduction_content("ja") do
    %{
      tutorial: [
        %{id: "intro_hello", word: "こんにちは", emoji: "👋", pronunciation: "kohn-nee-chee-wah", romanization: "konnichiwa", meaning: "あいさつ", example: "こんにちは、私の名前はサラです", example_romanization: "konnichiwa, watashi no namae wa Sara desu"},
        %{id: "intro_name", word: "私の名前は", emoji: "📛", pronunciation: "wah-tah-shee noh nah-mah-eh wah", romanization: "watashi no namae wa", meaning: "自己紹介のため", example: "私の名前はジョンです", example_romanization: "watashi no namae wa Jon desu"},
        %{id: "intro_nice_meet", word: "初めまして", emoji: "🤝", pronunciation: "hah-jee-meh-mah-shee-teh", romanization: "hajimemashite", meaning: "丁寧な挨拶", example: "こちらこそ初めまして！", example_romanization: "kochira koso hajimemashite!"},
        %{id: "intro_thank_you", word: "ありがとう", emoji: "🙏", pronunciation: "ah-ree-gah-toh", romanization: "arigatou", meaning: "感謝の表現", example: "どうもありがとう", example_romanization: "doumo arigatou"}
      ],
      game_objects: [
        %{id: "intro_hello", emoji: "👋", word: "こんにちは", pronunciation: "kohn-nee-chee-wah", romanization: "konnichiwa"},
        %{id: "intro_name", emoji: "📛", word: "名前", pronunciation: "nah-mah-eh", romanization: "namae"},
        %{id: "intro_nice_meet", emoji: "🤝", word: "初めまして", pronunciation: "hah-jee-meh-mah-shee-teh", romanization: "hajimemashite"},
        %{id: "intro_thank_you", emoji: "🙏", word: "ありがとう", pronunciation: "ah-ree-gah-toh", romanization: "arigatou"}
      ],
      cards: [
        %{id: "intro_hello", template: "挨拶で_と言う", answer: "こんにちは", description: "人に会う時にこの挨拶を使います"},
        %{id: "intro_name", template: "_サラです", answer: "私の名前は", description: "名前を言って自己紹介します"},
        %{id: "intro_nice_meet", template: "_", answer: "初めまして", description: "紹介後の丁寧な応答"}
      ]
    }
  end

  defp get_introduction_content("ar") do
    %{
      tutorial: [
        %{id: "intro_hello", word: "مرحبا", emoji: "👋", pronunciation: "mar-ha-ban", romanization: "marhaban", meaning: "تحية", example: "مرحبا، اسمي سارة", example_romanization: "marhaban, ismi Sarah"},
        %{id: "intro_name", word: "اسمي", emoji: "📛", pronunciation: "is-mee", romanization: "ismi", meaning: "للتعريف بالنفس", example: "اسمي جون", example_romanization: "ismi John"},
        %{id: "intro_nice_meet", word: "سعيد لمقابلتك", emoji: "🤝", pronunciation: "sa-eed li-mu-qa-ba-la-tik", romanization: "sa'id limuqabalatik", meaning: "تحية مهذبة", example: "أنا أيضا سعيد لمقابلتك!", example_romanization: "ana aydan sa'id limuqabalatik!"},
        %{id: "intro_thank_you", word: "شكرا", emoji: "🙏", pronunciation: "shuk-ran", romanization: "shukran", meaning: "تعبير عن الامتنان", example: "شكرا جزيلا", example_romanization: "shukran jazeelan"}
      ],
      game_objects: [
        %{id: "intro_hello", emoji: "👋", word: "مرحبا", pronunciation: "mar-ha-ban", romanization: "marhaban"},
        %{id: "intro_name", emoji: "📛", word: "اسم", pronunciation: "ism", romanization: "ism"},
        %{id: "intro_nice_meet", emoji: "🤝", word: "لقاء", pronunciation: "li-qaa", romanization: "liqa'"},
        %{id: "intro_thank_you", emoji: "🙏", word: "شكرا", pronunciation: "shuk-ran", romanization: "shukran"}
      ],
      cards: [
        %{id: "intro_hello", template: "قل _ للترحيب", answer: "مرحبا", description: "استخدم هذه التحية عند لقاء الناس"},
        %{id: "intro_name", template: "_ سارة", answer: "اسمي", description: "عرف بنفسك بذكر اسمك"},
        %{id: "intro_nice_meet", template: "_ لمقابلتك", answer: "سعيد", description: "رد مهذب بعد التعارف"}
      ]
    }
  end

  # Placeholder for other languages - they follow the same pattern
  defp get_introduction_content(_lang), do: get_introduction_content("en")

  # Similar functions for other topics (fruits, numbers, etc.)
  # For brevity, I'll implement a few key ones and create placeholders
  
  defp get_fruits_content("en") do
    %{
      tutorial: [
        %{id: "fruit_apple", word: "Apple", emoji: "🍎", pronunciation: "AP-uhl", meaning: "A red or green fruit", example: "I eat an apple every day"},
        %{id: "fruit_banana", word: "Banana", emoji: "🍌", pronunciation: "buh-NAN-uh", meaning: "A yellow curved fruit", example: "The banana is yellow"},
        %{id: "fruit_orange", word: "Orange", emoji: "🍊", pronunciation: "OR-inj", meaning: "A citrus fruit", example: "Orange juice is healthy"},
        %{id: "fruit_grape", word: "Grape", emoji: "🍇", pronunciation: "grayp", meaning: "Small round fruit", example: "Purple grapes are sweet"}
      ],
      game_objects: [
        %{id: "fruit_apple", emoji: "🍎", word: "Apple", pronunciation: "AP-uhl"},
        %{id: "fruit_banana", emoji: "🍌", word: "Banana", pronunciation: "buh-NAN-uh"},
        %{id: "fruit_orange", emoji: "🍊", word: "Orange", pronunciation: "OR-inj"},
        %{id: "fruit_grape", emoji: "🍇", word: "Grape", pronunciation: "grayp"}
      ],
      cards: [
        %{id: "fruit_apple", template: "Eat the _", answer: "apple", description: "Action with fruit"},
        %{id: "fruit_banana", template: "The _ is yellow", answer: "banana", description: "Describe fruit color"},
        %{id: "fruit_grape", template: "I like _", answer: "grapes", description: "Express preference"}
      ]
    }
  end

  defp get_fruits_content("fr") do
    %{
      tutorial: [
        %{id: "fruit_apple", word: "Pomme", emoji: "🍎", pronunciation: "pom", meaning: "Un fruit rouge ou vert", example: "Je mange une pomme chaque jour"},
        %{id: "fruit_banana", word: "Banane", emoji: "🍌", pronunciation: "bah-NAHN", meaning: "Un fruit jaune courbé", example: "La banane est jaune"},
        %{id: "fruit_orange", word: "Orange", emoji: "🍊", pronunciation: "oh-RAHNZH", meaning: "Un agrume", example: "Le jus d'orange est sain"},
        %{id: "fruit_grape", word: "Raisin", emoji: "🍇", pronunciation: "ray-ZAN", meaning: "Petit fruit rond", example: "Les raisins violets sont sucrés"}
      ],
      game_objects: [
        %{id: "fruit_apple", emoji: "🍎", word: "Pomme", pronunciation: "pom"},
        %{id: "fruit_banana", emoji: "🍌", word: "Banane", pronunciation: "bah-NAHN"},
        %{id: "fruit_orange", emoji: "🍊", word: "Orange", pronunciation: "oh-RAHNZH"},
        %{id: "fruit_grape", emoji: "🍇", word: "Raisin", pronunciation: "ray-ZAN"}
      ],
      cards: [
        %{id: "fruit_apple", template: "Mange la _", answer: "pomme", description: "Action avec fruit"},
        %{id: "fruit_banana", template: "La _ est jaune", answer: "banane", description: "Décrire la couleur du fruit"},
        %{id: "fruit_grape", template: "J'aime les _", answer: "raisins", description: "Exprimer une préférence"}
      ]
    }
  end

  defp get_fruits_content("es") do
    %{
      tutorial: [
        %{id: "fruit_apple", word: "Manzana", emoji: "🍎", pronunciation: "mahn-SAH-nah", meaning: "Una fruta roja o verde", example: "Como una manzana todos los días"},
        %{id: "fruit_banana", word: "Plátano", emoji: "🍌", pronunciation: "PLAH-tah-noh", meaning: "Una fruta amarilla curvada", example: "El plátano es amarillo"},
        %{id: "fruit_orange", word: "Naranja", emoji: "🍊", pronunciation: "nah-RAHN-hah", meaning: "Una fruta cítrica", example: "El jugo de naranja es saludable"},
        %{id: "fruit_grape", word: "Uva", emoji: "🍇", pronunciation: "OO-bah", meaning: "Fruta pequeña y redonda", example: "Las uvas moradas son dulces"}
      ],
      game_objects: [
        %{id: "fruit_apple", emoji: "🍎", word: "Manzana", pronunciation: "mahn-SAH-nah"},
        %{id: "fruit_banana", emoji: "🍌", word: "Plátano", pronunciation: "PLAH-tah-noh"},
        %{id: "fruit_orange", emoji: "🍊", word: "Naranja", pronunciation: "nah-RAHN-hah"},
        %{id: "fruit_grape", emoji: "🍇", word: "Uva", pronunciation: "OO-bah"}
      ],
      cards: [
        %{id: "fruit_apple", template: "Come la _", answer: "manzana", description: "Acción con fruta"},
        %{id: "fruit_banana", template: "El _ es amarillo", answer: "plátano", description: "Describe el color de la fruta"},
        %{id: "fruit_grape", template: "Me gustan las _", answer: "uvas", description: "Expresa preferencia"}
      ]
    }
  end

  defp get_fruits_content("zh") do
    %{
      tutorial: [
        %{id: "fruit_apple", word: "苹果", emoji: "🍎", pronunciation: "píng guǒ", romanization: "píng guǒ", meaning: "红色或绿色的水果", example: "我每天吃一个苹果", example_romanization: "wǒ měi tiān chī yī gè píng guǒ"},
        %{id: "fruit_banana", word: "香蕉", emoji: "🍌", pronunciation: "xiāng jiāo", romanization: "xiāng jiāo", meaning: "黄色弯曲的水果", example: "香蕉是黄色的", example_romanization: "xiāng jiāo shì huáng sè de"},
        %{id: "fruit_orange", word: "橙子", emoji: "🍊", pronunciation: "chéng zi", romanization: "chéng zi", meaning: "柑橘类水果", example: "橙汁很健康", example_romanization: "chéng zhī hěn jiàn kāng"},
        %{id: "fruit_grape", word: "葡萄", emoji: "🍇", pronunciation: "pú táo", romanization: "pú táo", meaning: "小圆水果", example: "紫葡萄很甜", example_romanization: "zǐ pú táo hěn tián"}
      ],
      game_objects: [
        %{id: "fruit_apple", emoji: "🍎", word: "苹果", pronunciation: "píng guǒ", romanization: "píng guǒ"},
        %{id: "fruit_banana", emoji: "🍌", word: "香蕉", pronunciation: "xiāng jiāo", romanization: "xiāng jiāo"},
        %{id: "fruit_orange", emoji: "🍊", word: "橙子", pronunciation: "chéng zi", romanization: "chéng zi"},
        %{id: "fruit_grape", emoji: "🍇", word: "葡萄", pronunciation: "pú táo", romanization: "pú táo"}
      ],
      cards: [
        %{id: "fruit_apple", template: "吃_", answer: "苹果", romanization: "píng guǒ", description: "与水果相关的动作"},
        %{id: "fruit_banana", template: "_是黄色的", answer: "香蕉", romanization: "xiāng jiāo", description: "描述水果的颜色"},
        %{id: "fruit_grape", template: "我喜欢_", answer: "葡萄", romanization: "pú táo", description: "表达喜好"}
      ]
    }
  end

  defp get_fruits_content("ja") do
    %{
      tutorial: [
        %{id: "fruit_apple", word: "りんご", emoji: "🍎", pronunciation: "reen-goh", romanization: "ringo", meaning: "赤や緑の果物", example: "毎日りんごを食べます", example_romanization: "mainichi ringo wo tabemasu"},
        %{id: "fruit_banana", word: "バナナ", emoji: "🍌", pronunciation: "bah-nah-nah", romanization: "banana", meaning: "黄色い曲がった果物", example: "バナナは黄色です", example_romanization: "banana wa kiiro desu"},
        %{id: "fruit_orange", word: "オレンジ", emoji: "🍊", pronunciation: "oh-ren-jee", romanization: "orenji", meaning: "柑橘類の果物", example: "オレンジジュースは健康的です", example_romanization: "orenji juusu wa kenkou-teki desu"},
        %{id: "fruit_grape", word: "ぶどう", emoji: "🍇", pronunciation: "boo-doh", romanization: "budou", meaning: "小さな丸い果物", example: "紫のぶどうは甘いです", example_romanization: "murasaki no budou wa amai desu"}
      ],
      game_objects: [
        %{id: "fruit_apple", emoji: "🍎", word: "りんご", pronunciation: "reen-goh", romanization: "ringo"},
        %{id: "fruit_banana", emoji: "🍌", word: "バナナ", pronunciation: "bah-nah-nah", romanization: "banana"},
        %{id: "fruit_orange", emoji: "🍊", word: "オレンジ", pronunciation: "oh-ren-jee", romanization: "orenji"},
        %{id: "fruit_grape", emoji: "🍇", word: "ぶどう", pronunciation: "boo-doh", romanization: "budou"}
      ],
      cards: [
        %{id: "fruit_apple", template: "_を食べる", answer: "りんご", description: "果物に関する動作"},
        %{id: "fruit_banana", template: "_は黄色です", answer: "バナナ", description: "果物の色を説明"},
        %{id: "fruit_grape", template: "_が好きです", answer: "ぶどう", description: "好みを表現"}
      ]
    }
  end

  defp get_fruits_content("ar") do
    %{
      tutorial: [
        %{id: "fruit_apple", word: "تفاحة", emoji: "🍎", pronunciation: "tuf-fa-ha", romanization: "tuffaha", meaning: "فاكهة حمراء أو خضراء", example: "آكل تفاحة كل يوم", example_romanization: "akul tuffaha kull yawm"},
        %{id: "fruit_banana", word: "موز", emoji: "🍌", pronunciation: "mawz", romanization: "mawz", meaning: "فاكهة صفراء منحنية", example: "الموز أصفر", example_romanization: "al-mawz asfar"},
        %{id: "fruit_orange", word: "برتقال", emoji: "🍊", pronunciation: "bur-tu-qaal", romanization: "burtuqaal", meaning: "فاكهة حمضية", example: "عصير البرتقال صحي", example_romanization: "aseer al-burtuqaal sahhi"},
        %{id: "fruit_grape", word: "عنب", emoji: "🍇", pronunciation: "i-nab", romanization: "inab", meaning: "فاكهة صغيرة مستديرة", example: "العنب الأرجواني حلو", example_romanization: "al-inab al-urjuwaani hulw"}
      ],
      game_objects: [
        %{id: "fruit_apple", emoji: "🍎", word: "تفاحة", pronunciation: "tuf-fa-ha", romanization: "tuffaha"},
        %{id: "fruit_banana", emoji: "🍌", word: "موز", pronunciation: "mawz", romanization: "mawz"},
        %{id: "fruit_orange", emoji: "🍊", word: "برتقال", pronunciation: "bur-tu-qaal", romanization: "burtuqaal"},
        %{id: "fruit_grape", emoji: "🍇", word: "عنب", pronunciation: "i-nab", romanization: "inab"}
      ],
      cards: [
        %{id: "fruit_apple", template: "كل _", answer: "تفاحة", description: "عمل مع الفاكهة"},
        %{id: "fruit_banana", template: "_ أصفر", answer: "الموز", description: "وصف لون الفاكهة"},
        %{id: "fruit_grape", template: "أحب _", answer: "العنب", description: "تعبير عن التفضيل"}
      ]
    }
  end

  defp get_fruits_content("ru") do
    %{
      tutorial: [
        %{id: "fruit_apple", word: "Яблоко", emoji: "🍎", pronunciation: "YAHB-lah-kah", romanization: "yabloko", meaning: "Красный или зеленый фрукт", example: "Я ем яблоко каждый день", example_romanization: "ya yem yabloko kazhdyy den'"},
        %{id: "fruit_banana", word: "Банан", emoji: "🍌", pronunciation: "bah-NAHN", romanization: "banan", meaning: "Желтый изогнутый фрукт", example: "Банан желтый", example_romanization: "banan zheltyy"},
        %{id: "fruit_orange", word: "Апельсин", emoji: "🍊", pronunciation: "ah-peel-SEEN", romanization: "apel'sin", meaning: "Цитрусовый фрукт", example: "Апельсиновый сок полезен", example_romanization: "apel'sinovyy sok polezen"},
        %{id: "fruit_grape", word: "Виноград", emoji: "🍇", pronunciation: "vee-nah-GRAHT", romanization: "vinograd", meaning: "Маленький круглый фрукт", example: "Фиолетовый виноград сладкий", example_romanization: "fioletovyy vinograd sladkiy"}
      ],
      game_objects: [
        %{id: "fruit_apple", emoji: "🍎", word: "Яблоко", pronunciation: "YAHB-lah-kah", romanization: "yabloko"},
        %{id: "fruit_banana", emoji: "🍌", word: "Банан", pronunciation: "bah-NAHN", romanization: "banan"},
        %{id: "fruit_orange", emoji: "🍊", word: "Апельсин", pronunciation: "ah-peel-SEEN", romanization: "apel'sin"},
        %{id: "fruit_grape", emoji: "🍇", word: "Виноград", pronunciation: "vee-nah-GRAHT", romanization: "vinograd"}
      ],
      cards: [
        %{id: "fruit_apple", template: "Съешь _", answer: "яблоко", description: "Действие с фруктом"},
        %{id: "fruit_banana", template: "_ желтый", answer: "Банан", description: "Описание цвета фрукта"},
        %{id: "fruit_grape", template: "Мне нравится _", answer: "виноград", description: "Выражение предпочтения"}
      ]
    }
  end

  defp get_fruits_content("pt") do
    %{
      tutorial: [
        %{id: "fruit_apple", word: "Maçã", emoji: "🍎", pronunciation: "mah-SAH", meaning: "Uma fruta vermelha ou verde", example: "Eu como uma maçã todo dia"},
        %{id: "fruit_banana", word: "Banana", emoji: "🍌", pronunciation: "bah-NAH-nah", meaning: "Uma fruta amarela curvada", example: "A banana é amarela"},
        %{id: "fruit_orange", word: "Laranja", emoji: "🍊", pronunciation: "lah-RAHN-jah", meaning: "Uma fruta cítrica", example: "Suco de laranja é saudável"},
        %{id: "fruit_grape", word: "Uva", emoji: "🍇", pronunciation: "OO-vah", meaning: "Fruta pequena e redonda", example: "As uvas roxas são doces"}
      ],
      game_objects: [
        %{id: "fruit_apple", emoji: "🍎", word: "Maçã", pronunciation: "mah-SAH"},
        %{id: "fruit_banana", emoji: "🍌", word: "Banana", pronunciation: "bah-NAH-nah"},
        %{id: "fruit_orange", emoji: "🍊", word: "Laranja", pronunciation: "lah-RAHN-jah"},
        %{id: "fruit_grape", emoji: "🍇", word: "Uva", pronunciation: "OO-vah"}
      ],
      cards: [
        %{id: "fruit_apple", template: "Coma a _", answer: "maçã", description: "Ação com fruta"},
        %{id: "fruit_banana", template: "A _ é amarela", answer: "banana", description: "Descreve a cor da fruta"},
        %{id: "fruit_grape", template: "Eu gosto de _", answer: "uvas", description: "Expressa preferência"}
      ]
    }
  end

  defp get_fruits_content("it") do
    %{
      tutorial: [
        %{id: "fruit_apple", word: "Mela", emoji: "🍎", pronunciation: "MEH-lah", meaning: "Un frutto rosso o verde", example: "Mangio una mela ogni giorno"},
        %{id: "fruit_banana", word: "Banana", emoji: "🍌", pronunciation: "bah-NAH-nah", meaning: "Un frutto giallo curvo", example: "La banana è gialla"},
        %{id: "fruit_orange", word: "Arancia", emoji: "🍊", pronunciation: "ah-RAHN-chah", meaning: "Un agrume", example: "Il succo d'arancia è salutare"},
        %{id: "fruit_grape", word: "Uva", emoji: "🍇", pronunciation: "OO-vah", meaning: "Piccolo frutto rotondo", example: "L'uva viola è dolce"}
      ],
      game_objects: [
        %{id: "fruit_apple", emoji: "🍎", word: "Mela", pronunciation: "MEH-lah"},
        %{id: "fruit_banana", emoji: "🍌", word: "Banana", pronunciation: "bah-NAH-nah"},
        %{id: "fruit_orange", emoji: "🍊", word: "Arancia", pronunciation: "ah-RAHN-chah"},
        %{id: "fruit_grape", emoji: "🍇", word: "Uva", pronunciation: "OO-vah"}
      ],
      cards: [
        %{id: "fruit_apple", template: "Mangia la _", answer: "mela", description: "Azione con frutta"},
        %{id: "fruit_banana", template: "La _ è gialla", answer: "banana", description: "Descrive il colore del frutto"},
        %{id: "fruit_grape", template: "Mi piace l'_", answer: "uva", description: "Esprime preferenza"}
      ]
    }
  end

  # Placeholder implementations for other topics and languages
  defp get_fruits_content(_lang), do: get_fruits_content("en")
  
  # Numbers content
  defp get_numbers_content("en") do
    %{
      tutorial: [
        %{id: "number_one", word: "One", emoji: "1️⃣", pronunciation: "WUN", meaning: "The number 1", example: "I have one apple"},
        %{id: "number_two", word: "Two", emoji: "2️⃣", pronunciation: "TOO", meaning: "The number 2", example: "Two cats are playing"},
        %{id: "number_three", word: "Three", emoji: "3️⃣", pronunciation: "THREE", meaning: "The number 3", example: "Count to three"},
        %{id: "number_four", word: "Four", emoji: "4️⃣", pronunciation: "FOR", meaning: "The number 4", example: "Four wheels on a car"}
      ],
      game_objects: [
        %{id: "number_one", emoji: "1️⃣", word: "One", pronunciation: "WUN"},
        %{id: "number_two", emoji: "2️⃣", word: "Two", pronunciation: "TOO"},
        %{id: "number_three", emoji: "3️⃣", word: "Three", pronunciation: "THREE"},
        %{id: "number_four", emoji: "4️⃣", word: "Four", pronunciation: "FOR"}
      ],
      cards: [
        %{id: "number_one", template: "I have _ apple", answer: "one", description: "Counting objects"},
        %{id: "number_two", template: "_ cats playing", answer: "two", description: "Counting animals"},
        %{id: "number_three", template: "Count to _", answer: "three", description: "Basic counting"}
      ]
    }
  end

  defp get_numbers_content("es") do
    %{
      tutorial: [
        %{id: "number_one", word: "Uno", emoji: "1️⃣", pronunciation: "OO-noh", meaning: "El número 1", example: "Tengo una manzana"},
        %{id: "number_two", word: "Dos", emoji: "2️⃣", pronunciation: "dohs", meaning: "El número 2", example: "Dos gatos están jugando"},
        %{id: "number_three", word: "Tres", emoji: "3️⃣", pronunciation: "trehs", meaning: "El número 3", example: "Cuenta hasta tres"},
        %{id: "number_four", word: "Cuatro", emoji: "4️⃣", pronunciation: "KWAH-troh", meaning: "El número 4", example: "Cuatro ruedas en un coche"}
      ],
      game_objects: [
        %{id: "number_one", emoji: "1️⃣", word: "Uno", pronunciation: "OO-noh"},
        %{id: "number_two", emoji: "2️⃣", word: "Dos", pronunciation: "dohs"},
        %{id: "number_three", emoji: "3️⃣", word: "Tres", pronunciation: "trehs"},
        %{id: "number_four", emoji: "4️⃣", word: "Cuatro", pronunciation: "KWAH-troh"}
      ],
      cards: [
        %{id: "number_one", template: "Tengo _ manzana", answer: "una", description: "Contar objetos"},
        %{id: "number_two", template: "_ gatos jugando", answer: "dos", description: "Contar animales"},
        %{id: "number_three", template: "Cuenta hasta _", answer: "tres", description: "Conteo básico"}
      ]
    }
  end

  defp get_numbers_content("zh") do
    %{
      tutorial: [
        %{id: "number_one", word: "一", emoji: "1️⃣", pronunciation: "yī", romanization: "yī", meaning: "数字1", example: "我有一个苹果", example_romanization: "wǒ yǒu yī gè píng guǒ"},
        %{id: "number_two", word: "二", emoji: "2️⃣", pronunciation: "èr", romanization: "èr", meaning: "数字2", example: "两只猫在玩", example_romanization: "liǎng zhī māo zài wán"},
        %{id: "number_three", word: "三", emoji: "3️⃣", pronunciation: "sān", romanization: "sān", meaning: "数字3", example: "数到三", example_romanization: "shǔ dào sān"},
        %{id: "number_four", word: "四", emoji: "4️⃣", pronunciation: "sì", romanization: "sì", meaning: "数字4", example: "汽车有四个轮子", example_romanization: "qì chē yǒu sì gè lún zi"}
      ],
      game_objects: [
        %{id: "number_one", emoji: "1️⃣", word: "一", pronunciation: "yī", romanization: "yī"},
        %{id: "number_two", emoji: "2️⃣", word: "二", pronunciation: "èr", romanization: "èr"},
        %{id: "number_three", emoji: "3️⃣", word: "三", pronunciation: "sān", romanization: "sān"},
        %{id: "number_four", emoji: "4️⃣", word: "四", pronunciation: "sì", romanization: "sì"}
      ],
      cards: [
        %{id: "number_one", template: "我有_个苹果", answer: "一", romanization: "yī", description: "数物体"},
        %{id: "number_two", template: "_只猫在玩", answer: "两", romanization: "liǎng", description: "数动物"},
        %{id: "number_three", template: "数到_", answer: "三", romanization: "sān", description: "基本计数"}
      ]
    }
  end

  defp get_numbers_content("fr") do
    %{
      tutorial: [
        %{id: "number_one", word: "Un", emoji: "1️⃣", pronunciation: "uhn", meaning: "Le chiffre 1", example: "J'ai une pomme"},
        %{id: "number_two", word: "Deux", emoji: "2️⃣", pronunciation: "duh", meaning: "Le chiffre 2", example: "Deux chats jouent"},
        %{id: "number_three", word: "Trois", emoji: "3️⃣", pronunciation: "twah", meaning: "Le chiffre 3", example: "Compter jusqu'à trois"},
        %{id: "number_four", word: "Quatre", emoji: "4️⃣", pronunciation: "KAH-truh", meaning: "Le chiffre 4", example: "Quatre roues sur une voiture"}
      ],
      game_objects: [
        %{id: "number_one", emoji: "1️⃣", word: "Un", pronunciation: "uhn"},
        %{id: "number_two", emoji: "2️⃣", word: "Deux", pronunciation: "duh"},
        %{id: "number_three", emoji: "3️⃣", word: "Trois", pronunciation: "twah"},
        %{id: "number_four", emoji: "4️⃣", word: "Quatre", pronunciation: "KAH-truh"}
      ],
      cards: [
        %{id: "number_one", template: "J'ai _ pomme", answer: "une", description: "Compter des objets"},
        %{id: "number_two", template: "_ chats jouent", answer: "deux", description: "Compter des animaux"},
        %{id: "number_three", template: "Compter jusqu'à _", answer: "trois", description: "Comptage de base"}
      ]
    }
  end

  defp get_numbers_content("ru") do
    %{
      tutorial: [
        %{id: "number_one", word: "Один", emoji: "1️⃣", pronunciation: "ah-DEEN", romanization: "odin", meaning: "Число 1", example: "У меня одно яблоко", example_romanization: "u menya odno yabloko"},
        %{id: "number_two", word: "Два", emoji: "2️⃣", pronunciation: "dva", romanization: "dva", meaning: "Число 2", example: "Две кошки играют", example_romanization: "dve koshki igrayut"},
        %{id: "number_three", word: "Три", emoji: "3️⃣", pronunciation: "tree", romanization: "tri", meaning: "Число 3", example: "Считать до трёх", example_romanization: "schitat' do tryokh"},
        %{id: "number_four", word: "Четыре", emoji: "4️⃣", pronunciation: "cheh-TY-reh", romanization: "chetyre", meaning: "Число 4", example: "Четыре колеса у машины", example_romanization: "chetyre kolesa u mashiny"}
      ],
      game_objects: [
        %{id: "number_one", emoji: "1️⃣", word: "Один", pronunciation: "ah-DEEN", romanization: "odin"},
        %{id: "number_two", emoji: "2️⃣", word: "Два", pronunciation: "dva", romanization: "dva"},
        %{id: "number_three", emoji: "3️⃣", word: "Три", pronunciation: "tree", romanization: "tri"},
        %{id: "number_four", emoji: "4️⃣", word: "Четыре", pronunciation: "cheh-TY-reh", romanization: "chetyre"}
      ],
      cards: [
        %{id: "number_one", template: "У меня _ яблоко", answer: "одно", description: "Считать предметы"},
        %{id: "number_two", template: "_ кошки играют", answer: "две", description: "Считать животных"},
        %{id: "number_three", template: "Считать до _", answer: "трёх", description: "Базовый счёт"}
      ]
    }
  end

  defp get_numbers_content("ja") do
    %{
      tutorial: [
        %{id: "number_one", word: "一", emoji: "1️⃣", pronunciation: "ee-chee", romanization: "ichi", meaning: "数字の1", example: "りんごを一つ持っています", example_romanization: "ringo wo hitotsu motte imasu"},
        %{id: "number_two", word: "二", emoji: "2️⃣", pronunciation: "nee", romanization: "ni", meaning: "数字の2", example: "二匹の猫が遊んでいます", example_romanization: "ni-hiki no neko ga asonde imasu"},
        %{id: "number_three", word: "三", emoji: "3️⃣", pronunciation: "sahn", romanization: "san", meaning: "数字の3", example: "三まで数えます", example_romanization: "san made kazemasu"},
        %{id: "number_four", word: "四", emoji: "4️⃣", pronunciation: "yohn", romanization: "yon", meaning: "数字の4", example: "車には四つの車輪があります", example_romanization: "kuruma ni wa yottsu no sharin ga arimasu"}
      ],
      game_objects: [
        %{id: "number_one", emoji: "1️⃣", word: "一", pronunciation: "ee-chee", romanization: "ichi"},
        %{id: "number_two", emoji: "2️⃣", word: "二", pronunciation: "nee", romanization: "ni"},
        %{id: "number_three", emoji: "3️⃣", word: "三", pronunciation: "sahn", romanization: "san"},
        %{id: "number_four", emoji: "4️⃣", word: "四", pronunciation: "yohn", romanization: "yon"}
      ],
      cards: [
        %{id: "number_one", template: "りんごを_つ持っています", answer: "一", description: "物を数える"},
        %{id: "number_two", template: "_匹の猫が遊んでいます", answer: "二", description: "動物を数える"},
        %{id: "number_three", template: "_まで数えます", answer: "三", description: "基本的な数え方"}
      ]
    }
  end

  defp get_numbers_content("ar") do
    %{
      tutorial: [
        %{id: "number_one", word: "واحد", emoji: "1️⃣", pronunciation: "waa-hid", romanization: "wahid", meaning: "الرقم 1", example: "لدي تفاحة واحدة", example_romanization: "ladi tuffahah wahidah"},
        %{id: "number_two", word: "اثنان", emoji: "2️⃣", pronunciation: "ith-naan", romanization: "ithnaan", meaning: "الرقم 2", example: "قطتان تلعبان", example_romanization: "qittataan tal'abaan"},
        %{id: "number_three", word: "ثلاثة", emoji: "3️⃣", pronunciation: "tha-laa-tha", romanization: "thalaatha", meaning: "الرقم 3", example: "عد حتى ثلاثة", example_romanization: "udd hatta thalaatha"},
        %{id: "number_four", word: "أربعة", emoji: "4️⃣", pronunciation: "ar-ba-aa", romanization: "arba'a", meaning: "الرقم 4", example: "أربع عجلات للسيارة", example_romanization: "arba' ajlaat lil-sayyaara"}
      ],
      game_objects: [
        %{id: "number_one", emoji: "1️⃣", word: "واحد", pronunciation: "waa-hid", romanization: "wahid"},
        %{id: "number_two", emoji: "2️⃣", word: "اثنان", pronunciation: "ith-naan", romanization: "ithnaan"},
        %{id: "number_three", emoji: "3️⃣", word: "ثلاثة", pronunciation: "tha-laa-tha", romanization: "thalaatha"},
        %{id: "number_four", emoji: "4️⃣", word: "أربعة", pronunciation: "ar-ba-aa", romanization: "arba'a"}
      ],
      cards: [
        %{id: "number_one", template: "لدي _ تفاحة", answer: "واحدة", description: "عد الأشياء"},
        %{id: "number_two", template: "_ قطتان تلعبان", answer: "اثنتان", description: "عد الحيوانات"},
        %{id: "number_three", template: "عد حتى _", answer: "ثلاثة", description: "العد الأساسي"}
      ]
    }
  end

  defp get_numbers_content("pt") do
    %{
      tutorial: [
        %{id: "number_one", word: "Um", emoji: "1️⃣", pronunciation: "oom", meaning: "O número 1", example: "Eu tenho uma maçã"},
        %{id: "number_two", word: "Dois", emoji: "2️⃣", pronunciation: "doh-ees", meaning: "O número 2", example: "Dois gatos estão brincando"},
        %{id: "number_three", word: "Três", emoji: "3️⃣", pronunciation: "trehs", meaning: "O número 3", example: "Contar até três"},
        %{id: "number_four", word: "Quatro", emoji: "4️⃣", pronunciation: "KWAH-troh", meaning: "O número 4", example: "Quatro rodas num carro"}
      ],
      game_objects: [
        %{id: "number_one", emoji: "1️⃣", word: "Um", pronunciation: "oom"},
        %{id: "number_two", emoji: "2️⃣", word: "Dois", pronunciation: "doh-ees"},
        %{id: "number_three", emoji: "3️⃣", word: "Três", pronunciation: "trehs"},
        %{id: "number_four", emoji: "4️⃣", word: "Quatro", pronunciation: "KWAH-troh"}
      ],
      cards: [
        %{id: "number_one", template: "Eu tenho _ maçã", answer: "uma", description: "Contar objetos"},
        %{id: "number_two", template: "_ gatos brincando", answer: "dois", description: "Contar animais"},
        %{id: "number_three", template: "Contar até _", answer: "três", description: "Contagem básica"}
      ]
    }
  end

  defp get_numbers_content("it") do
    %{
      tutorial: [
        %{id: "number_one", word: "Uno", emoji: "1️⃣", pronunciation: "OO-noh", meaning: "Il numero 1", example: "Ho una mela"},
        %{id: "number_two", word: "Due", emoji: "2️⃣", pronunciation: "DOO-eh", meaning: "Il numero 2", example: "Due gatti stanno giocando"},
        %{id: "number_three", word: "Tre", emoji: "3️⃣", pronunciation: "treh", meaning: "Il numero 3", example: "Contare fino a tre"},
        %{id: "number_four", word: "Quattro", emoji: "4️⃣", pronunciation: "KWAH-troh", meaning: "Il numero 4", example: "Quattro ruote su una macchina"}
      ],
      game_objects: [
        %{id: "number_one", emoji: "1️⃣", word: "Uno", pronunciation: "OO-noh"},
        %{id: "number_two", emoji: "2️⃣", word: "Due", pronunciation: "DOO-eh"},
        %{id: "number_three", emoji: "3️⃣", word: "Tre", pronunciation: "treh"},
        %{id: "number_four", emoji: "4️⃣", word: "Quattro", pronunciation: "KWAH-troh"}
      ],
      cards: [
        %{id: "number_one", template: "Ho _ mela", answer: "una", description: "Contare oggetti"},
        %{id: "number_two", template: "_ gatti giocano", answer: "due", description: "Contare animali"},
        %{id: "number_three", template: "Contare fino a _", answer: "tre", description: "Conteggio base"}
      ]
    }
  end

  defp get_numbers_content(_lang), do: get_numbers_content("en")
  
  # Colors content
  defp get_colors_content("en") do
    %{
      tutorial: [
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

  defp get_colors_content("es") do
    %{
      tutorial: [
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

  defp get_colors_content("zh") do
    %{
      tutorial: [
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

  defp get_colors_content("fr") do
    %{
      tutorial: [
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

  defp get_colors_content("ru") do
    %{
      tutorial: [
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

  defp get_colors_content("ja") do
    %{
      tutorial: [
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

  defp get_colors_content("ar") do
    %{
      tutorial: [
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

  defp get_colors_content("pt") do
    %{
      tutorial: [
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

  defp get_colors_content("it") do
    %{
      tutorial: [
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

  defp get_colors_content(_lang), do: get_colors_content("en")
  
  # Bakery content
  defp get_bakery_content("en") do
    %{
      tutorial: [
        %{id: "bakery_bread", word: "Bread", emoji: "🍞", pronunciation: "BRED", meaning: "Baked food item", example: "Fresh bread smells amazing"},
        %{id: "bakery_croissant", word: "Croissant", emoji: "🥐", pronunciation: "kwah-SAHN", meaning: "French pastry", example: "A buttery French croissant"},
        %{id: "bakery_cake", word: "Cake", emoji: "🎂", pronunciation: "KAYK", meaning: "Sweet dessert", example: "Birthday cake with candles"},
        %{id: "bakery_cookie", word: "Cookie", emoji: "🍪", pronunciation: "KUK-ee", meaning: "Sweet baked treat", example: "Chocolate chip cookie"}
      ],
      game_objects: [
        %{id: "bakery_bread", emoji: "🍞", word: "Bread", pronunciation: "BRED"},
        %{id: "bakery_croissant", emoji: "🥐", word: "Croissant", pronunciation: "kwah-SAHN"},
        %{id: "bakery_cake", emoji: "🎂", word: "Cake", pronunciation: "KAYK"},
        %{id: "bakery_cookie", emoji: "🍪", word: "Cookie", pronunciation: "KUK-ee"}
      ],
      cards: [
        %{id: "bakery_bread", template: "I want fresh _", answer: "bread", description: "Ordering at bakery"},
        %{id: "bakery_croissant", template: "A buttery _", answer: "croissant", description: "Describing pastry"},
        %{id: "bakery_cake", template: "Birthday _ with candles", answer: "cake", description: "Celebration food"}
      ]
    }
  end

  defp get_bakery_content("es") do
    %{
      tutorial: [
        %{id: "bakery_bread", word: "Pan", emoji: "🍞", pronunciation: "pahn", meaning: "Alimento horneado", example: "Pan fresco huele increíble"},
        %{id: "bakery_croissant", word: "Croissant", emoji: "🥐", pronunciation: "krwa-SAHN", meaning: "Pastel francés", example: "Un croissant francés con mantequilla"},
        %{id: "bakery_cake", word: "Pastel", emoji: "🎂", pronunciation: "pas-TEHL", meaning: "Postre dulce", example: "Pastel de cumpleaños con velas"},
        %{id: "bakery_cookie", word: "Galleta", emoji: "🍪", pronunciation: "ga-YEH-ta", meaning: "Dulce horneado", example: "Galleta con chips de chocolate"}
      ],
      game_objects: [
        %{id: "bakery_bread", emoji: "🍞", word: "Pan", pronunciation: "pahn"},
        %{id: "bakery_croissant", emoji: "🥐", word: "Croissant", pronunciation: "krwa-SAHN"},
        %{id: "bakery_cake", emoji: "🎂", word: "Pastel", pronunciation: "pas-TEHL"},
        %{id: "bakery_cookie", emoji: "🍪", word: "Galleta", pronunciation: "ga-YEH-ta"}
      ],
      cards: [
        %{id: "bakery_bread", template: "Quiero _ fresco", answer: "pan", description: "Pidiendo en panadería"},
        %{id: "bakery_croissant", template: "Un _ con mantequilla", answer: "croissant", description: "Describiendo pastel"},
        %{id: "bakery_cake", template: "_ de cumpleaños con velas", answer: "Pastel", description: "Comida de celebración"}
      ]
    }
  end

  defp get_bakery_content("zh") do
    %{
      tutorial: [
        %{id: "bakery_bread", word: "面包", emoji: "🍞", pronunciation: "miàn bāo", romanization: "miàn bāo", meaning: "烘焙食品", example: "新鲜面包闻起来很香", example_romanization: "xīn xiān miàn bāo wén qǐ lái hěn xiāng"},
        %{id: "bakery_croissant", word: "羊角面包", emoji: "🥐", pronunciation: "yáng jiǎo miàn bāo", romanization: "yáng jiǎo miàn bāo", meaning: "法式糕点", example: "黄油法式羊角面包", example_romanization: "huáng yóu fǎ shì yáng jiǎo miàn bāo"},
        %{id: "bakery_cake", word: "蛋糕", emoji: "🎂", pronunciation: "dàn gāo", romanization: "dàn gāo", meaning: "甜点", example: "带蜡烛的生日蛋糕", example_romanization: "dài là zhú de shēng rì dàn gāo"},
        %{id: "bakery_cookie", word: "饼干", emoji: "🍪", pronunciation: "bǐng gān", romanization: "bǐng gān", meaning: "甜味烘焙食品", example: "巧克力片饼干", example_romanization: "qiǎo kè lì piàn bǐng gān"}
      ],
      game_objects: [
        %{id: "bakery_bread", emoji: "🍞", word: "面包", pronunciation: "miàn bāo", romanization: "miàn bāo"},
        %{id: "bakery_croissant", emoji: "🥐", word: "羊角面包", pronunciation: "yáng jiǎo miàn bāo", romanization: "yáng jiǎo miàn bāo"},
        %{id: "bakery_cake", emoji: "🎂", word: "蛋糕", pronunciation: "dàn gāo", romanization: "dàn gāo"},
        %{id: "bakery_cookie", emoji: "🍪", word: "饼干", pronunciation: "bǐng gān", romanization: "bǐng gān"}
      ],
      cards: [
        %{id: "bakery_bread", template: "我要新鲜_", answer: "面包", romanization: "miàn bāo", description: "在面包店点餐"},
        %{id: "bakery_croissant", template: "黄油_", answer: "羊角面包", romanization: "yáng jiǎo miàn bāo", description: "描述糕点"},
        %{id: "bakery_cake", template: "带蜡烛的生日_", answer: "蛋糕", romanization: "dàn gāo", description: "庆祝食品"}
      ]
    }
  end

  defp get_bakery_content(_lang), do: get_bakery_content("en")
  
  # Animals content
  defp get_animals_content("en") do
    %{
      tutorial: [
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

  defp get_animals_content("es") do
    %{
      tutorial: [
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

  defp get_animals_content("zh") do
    %{
      tutorial: [
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

  defp get_animals_content(_lang), do: get_animals_content("en")
  
  # Restaurant content
  defp get_restaurant_content("en") do
    %{
      tutorial: [
        %{id: "restaurant_menu", word: "Menu", emoji: "📋", pronunciation: "MEN-yoo", meaning: "List of food options", example: "Can I see the menu please?"},
        %{id: "restaurant_pizza", word: "Pizza", emoji: "🍕", pronunciation: "PEET-za", meaning: "Italian dish", example: "I'll have a slice of pizza"},
        %{id: "restaurant_burger", word: "Burger", emoji: "🍔", pronunciation: "BUR-gur", meaning: "Sandwich with meat", example: "Cheeseburger with fries"},
        %{id: "restaurant_coffee", word: "Coffee", emoji: "☕", pronunciation: "KAW-fee", meaning: "Hot drink", example: "Hot black coffee"}
      ],
      game_objects: [
        %{id: "restaurant_menu", emoji: "📋", word: "Menu", pronunciation: "MEN-yoo"},
        %{id: "restaurant_pizza", emoji: "🍕", word: "Pizza", pronunciation: "PEET-za"},
        %{id: "restaurant_burger", emoji: "🍔", word: "Burger", pronunciation: "BUR-gur"},
        %{id: "restaurant_coffee", emoji: "☕", word: "Coffee", pronunciation: "KAW-fee"}
      ],
      cards: [
        %{id: "restaurant_menu", template: "Can I see the _?", answer: "menu", description: "Asking for menu"},
        %{id: "restaurant_pizza", template: "I'll have a slice of _", answer: "pizza", description: "Ordering food"},
        %{id: "restaurant_coffee", template: "Hot black _", answer: "coffee", description: "Ordering drinks"}
      ]
    }
  end

  defp get_restaurant_content("es") do
    %{
      tutorial: [
        %{id: "restaurant_menu", word: "Menú", emoji: "📋", pronunciation: "meh-NOO", meaning: "Lista de opciones de comida", example: "¿Puedo ver el menú por favor?"},
        %{id: "restaurant_pizza", word: "Pizza", emoji: "🍕", pronunciation: "PEET-sa", meaning: "Plato italiano", example: "Voy a tomar una porción de pizza"},
        %{id: "restaurant_burger", word: "Hamburguesa", emoji: "🍔", pronunciation: "am-boor-GEH-sa", meaning: "Sándwich con carne", example: "Hamburguesa con queso y papas fritas"},
        %{id: "restaurant_coffee", word: "Café", emoji: "☕", pronunciation: "kah-FEH", meaning: "Bebida caliente", example: "Café negro caliente"}
      ],
      game_objects: [
        %{id: "restaurant_menu", emoji: "📋", word: "Menú", pronunciation: "meh-NOO"},
        %{id: "restaurant_pizza", emoji: "🍕", word: "Pizza", pronunciation: "PEET-sa"},
        %{id: "restaurant_burger", emoji: "🍔", word: "Hamburguesa", pronunciation: "am-boor-GEH-sa"},
        %{id: "restaurant_coffee", emoji: "☕", word: "Café", pronunciation: "kah-FEH"}
      ],
      cards: [
        %{id: "restaurant_menu", template: "¿Puedo ver el _?", answer: "menú", description: "Pidiendo el menú"},
        %{id: "restaurant_pizza", template: "Voy a tomar una porción de _", answer: "pizza", description: "Pidiendo comida"},
        %{id: "restaurant_coffee", template: "_ negro caliente", answer: "Café", description: "Pidiendo bebidas"}
      ]
    }
  end

  defp get_restaurant_content("zh") do
    %{
      tutorial: [
        %{id: "restaurant_menu", word: "菜单", emoji: "📋", pronunciation: "cài dān", romanization: "cài dān", meaning: "食物选项列表", example: "我可以看看菜单吗？", example_romanization: "wǒ kě yǐ kàn kàn cài dān ma?"},
        %{id: "restaurant_pizza", word: "比萨饼", emoji: "🍕", pronunciation: "bǐ sà bǐng", romanization: "bǐ sà bǐng", meaning: "意大利菜", example: "我要一片比萨饼", example_romanization: "wǒ yào yī piàn bǐ sà bǐng"},
        %{id: "restaurant_burger", word: "汉堡", emoji: "🍔", pronunciation: "hàn bǎo", romanization: "hàn bǎo", meaning: "肉类三明治", example: "奶酪汉堡配薯条", example_romanization: "nǎi lào hàn bǎo pèi shǔ tiáo"},
        %{id: "restaurant_coffee", word: "咖啡", emoji: "☕", pronunciation: "kā fēi", romanization: "kā fēi", meaning: "热饮", example: "热黑咖啡", example_romanization: "rè hēi kā fēi"}
      ],
      game_objects: [
        %{id: "restaurant_menu", emoji: "📋", word: "菜单", pronunciation: "cài dān", romanization: "cài dān"},
        %{id: "restaurant_pizza", emoji: "🍕", word: "比萨饼", pronunciation: "bǐ sà bǐng", romanization: "bǐ sà bǐng"},
        %{id: "restaurant_burger", emoji: "🍔", word: "汉堡", pronunciation: "hàn bǎo", romanization: "hàn bǎo"},
        %{id: "restaurant_coffee", emoji: "☕", word: "咖啡", pronunciation: "kā fēi", romanization: "kā fēi"}
      ],
      cards: [
        %{id: "restaurant_menu", template: "我可以看看_吗？", answer: "菜单", romanization: "cài dān", description: "要求看菜单"},
        %{id: "restaurant_pizza", template: "我要一片_", answer: "比萨饼", romanization: "bǐ sà bǐng", description: "点餐"},
        %{id: "restaurant_coffee", template: "热黑_", answer: "咖啡", romanization: "kā fēi", description: "点饮料"}
      ]
    }
  end

  defp get_restaurant_content(_lang), do: get_restaurant_content("en")
  
  # Family content
  defp get_family_content("en") do
    %{
      tutorial: [
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

  defp get_family_content("es") do
    %{
      tutorial: [
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

  defp get_family_content("zh") do
    %{
      tutorial: [
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

  defp get_family_content(_lang), do: get_family_content("en")
  
  # Countries content
  defp get_countries_content("en") do
    %{
      tutorial: [
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

  defp get_countries_content("es") do
    %{
      tutorial: [
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

  defp get_countries_content("zh") do
    %{
      tutorial: [
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

  defp get_countries_content(_lang), do: get_countries_content("en")
end