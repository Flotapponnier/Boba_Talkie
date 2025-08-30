defmodule BobaTalkie.ContentManagerModules.VocabularyTranslations do
  @moduledoc """
  ID-based vocabulary translations for interface language display.
  Maps vocabulary IDs to translations in all 9 interface languages.
  """

  @doc """
  Get translation for a vocabulary item by ID in the specified interface language.
  Returns %{word: "...", example: "..."} or nil if not found.
  """
  def get_translation(vocab_id, interface_language) do
    translations = get_all_translations()
    get_in(translations, [vocab_id, interface_language])
  end

  @doc """
  Get all vocabulary translations mapping.
  Structure: %{vocab_id => %{lang_code => %{word: "...", example: "..."}}}
  """
  def get_all_translations do
    [
      introduction_translations(),
      fruits_translations(),
      numbers_translations(),
      colors_translations(),
      bakery_translations(),
      animals_translations(),
      restaurant_translations(),
      family_translations(),
      countries_translations()
    ]
    |> Enum.reduce(%{}, &Map.merge/2)
  end

  # Introduction vocabulary translations
  defp introduction_translations do
    %{
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
        "zh" => %{word: "名字", example: "我的名字是约翰"},
        "ru" => %{word: "Имя", example: "Меня зовут Джон"},
        "ja" => %{word: "名前", example: "私の名前はジョンです"},
        "it" => %{word: "Nome", example: "Il mio nome è John"},
        "ar" => %{word: "اسم", example: "اسمي جون"},
        "pt" => %{word: "Nome", example: "Meu nome é John"}
      },
      "intro_excuse_me" => %{
        "en" => %{word: "Excuse me", example: "Excuse me, where is the bathroom?"},
        "fr" => %{word: "Excusez-moi", example: "Excusez-moi, où sont les toilettes?"},
        "es" => %{word: "Disculpe", example: "Disculpe, ¿dónde está el baño?"},
        "zh" => %{word: "不好意思", example: "不好意思，厕所在哪里？"},
        "ru" => %{word: "Извините", example: "Извините, где туалет?"},
        "ja" => %{word: "すみません", example: "すみません、トイレはどこですか？"},
        "it" => %{word: "Scusi", example: "Scusi, dov'è il bagno?"},
        "ar" => %{word: "عذراً", example: "عذراً، أين الحمام؟"},
        "pt" => %{word: "Com licença", example: "Com licença, onde fica o banheiro?"}
      },
      "intro_fine" => %{
        "en" => %{word: "Fine", example: "I'm fine, thank you"},
        "fr" => %{word: "Bien", example: "Je vais bien, merci"},
        "es" => %{word: "Bien", example: "Estoy bien, gracias"},
        "zh" => %{word: "很好", example: "我很好，谢谢"},
        "ru" => %{word: "Хорошо", example: "У меня всё хорошо, спасибо"},
        "ja" => %{word: "元気", example: "元気です、ありがとう"},
        "it" => %{word: "Bene", example: "Sto bene, grazie"},
        "ar" => %{word: "بخير", example: "أنا بخير، شكراً"},
        "pt" => %{word: "Bem", example: "Estou bem, obrigado"}
      },
      "intro_from" => %{
        "en" => %{word: "From", example: "I am from Canada"},
        "fr" => %{word: "De", example: "Je viens du Canada"},
        "es" => %{word: "De", example: "Soy de Canadá"},
        "zh" => %{word: "来自", example: "我来自加拿大"},
        "ru" => %{word: "Из", example: "Я из Канады"},
        "ja" => %{word: "から", example: "私はカナダ出身です"},
        "it" => %{word: "Da", example: "Vengo dal Canada"},
        "ar" => %{word: "من", example: "أنا من كندا"},
        "pt" => %{word: "De", example: "Eu sou do Canadá"}
      },
      "intro_goodbye" => %{
        "en" => %{word: "Goodbye", example: "Goodbye, see you tomorrow"},
        "fr" => %{word: "Au revoir", example: "Au revoir, à demain"},
        "es" => %{word: "Adiós", example: "Adiós, nos vemos mañana"},
        "zh" => %{word: "再见", example: "再见，明天见"},
        "ru" => %{word: "До свидания", example: "До свидания, увидимся завтра"},
        "ja" => %{word: "さようなら", example: "さようなら、また明日"},
        "it" => %{word: "Arrivederci", example: "Arrivederci, a domani"},
        "ar" => %{word: "وداعاً", example: "وداعاً، أراك غداً"},
        "pt" => %{word: "Tchau", example: "Tchau, vejo você amanhã"}
      },
      "intro_how_are_you" => %{
        "en" => %{word: "How are you", example: "How are you today?"},
        "fr" => %{word: "Comment allez-vous", example: "Comment allez-vous aujourd'hui?"},
        "es" => %{word: "Cómo estás", example: "¿Cómo estás hoy?"},
        "zh" => %{word: "你好吗", example: "你今天好吗？"},
        "ru" => %{word: "Как дела", example: "Как у вас дела сегодня?"},
        "ja" => %{word: "元気ですか", example: "今日はお元気ですか？"},
        "it" => %{word: "Come stai", example: "Come stai oggi?"},
        "ar" => %{word: "كيف حالك", example: "كيف حالك اليوم؟"},
        "pt" => %{word: "Como você está", example: "Como você está hoje?"}
      },
      "intro_nice_meet" => %{
        "en" => %{word: "Nice to meet you", example: "Nice to meet you too"},
        "fr" => %{word: "Enchanté", example: "Enchanté également"},
        "es" => %{word: "Mucho gusto", example: "Mucho gusto también"},
        "zh" => %{word: "很高兴认识你", example: "我也很高兴认识你"},
        "ru" => %{word: "Приятно познакомиться", example: "Мне тоже приятно познакомиться"},
        "ja" => %{word: "はじめまして", example: "こちらこそはじめまして"},
        "it" => %{word: "Piacere di conoscerti", example: "Anche a me fa piacere"},
        "ar" => %{word: "سررت بلقائك", example: "وأنا كذلك سررت بلقائك"},
        "pt" => %{word: "Prazer em conhecê-lo", example: "O prazer é meu também"}
      },
      "intro_no" => %{
        "en" => %{word: "No", example: "No, I don't speak Spanish"},
        "fr" => %{word: "Non", example: "Non, je ne parle pas espagnol"},
        "es" => %{word: "No", example: "No, no hablo francés"},
        "zh" => %{word: "不", example: "不，我不会说西班牙语"},
        "ru" => %{word: "Нет", example: "Нет, я не говорю по-испански"},
        "ja" => %{word: "いいえ", example: "いいえ、スペイン語は話せません"},
        "it" => %{word: "No", example: "No, non parlo spagnolo"},
        "ar" => %{word: "لا", example: "لا، لا أتكلم الإسبانية"},
        "pt" => %{word: "Não", example: "Não, eu não falo espanhol"}
      },
      "intro_please" => %{
        "en" => %{word: "Please", example: "Please help me"},
        "fr" => %{word: "S'il vous plaît", example: "Aidez-moi s'il vous plaît"},
        "es" => %{word: "Por favor", example: "Ayúdame por favor"},
        "zh" => %{word: "请", example: "请帮助我"},
        "ru" => %{word: "Пожалуйста", example: "Помогите мне, пожалуйста"},
        "ja" => %{word: "お願いします", example: "助けてください"},
        "it" => %{word: "Per favore", example: "Aiutami per favore"},
        "ar" => %{word: "من فضلك", example: "ساعدني من فضلك"},
        "pt" => %{word: "Por favor", example: "Me ajude, por favor"}
      },
      "intro_see_later" => %{
        "en" => %{word: "See you later", example: "See you later, take care"},
        "fr" => %{word: "À plus tard", example: "À plus tard, prenez soin de vous"},
        "es" => %{word: "Hasta luego", example: "Hasta luego, cuídate"},
        "zh" => %{word: "回头见", example: "回头见，保重"},
        "ru" => %{word: "Увидимся позже", example: "Увидимся позже, берегите себя"},
        "ja" => %{word: "また後で", example: "また後で、気をつけて"},
        "it" => %{word: "A dopo", example: "A dopo, abbi cura di te"},
        "ar" => %{word: "أراك لاحقاً", example: "أراك لاحقاً، اعتن بنفسك"},
        "pt" => %{word: "Até mais", example: "Até mais, se cuide"}
      },
      "intro_sorry" => %{
        "en" => %{word: "Sorry", example: "Sorry, I don't understand"},
        "fr" => %{word: "Désolé", example: "Désolé, je ne comprends pas"},
        "es" => %{word: "Lo siento", example: "Lo siento, no entiendo"},
        "zh" => %{word: "对不起", example: "对不起，我不明白"},
        "ru" => %{word: "Извините", example: "Извините, я не понимаю"},
        "ja" => %{word: "すみません", example: "すみません、分かりません"},
        "it" => %{word: "Scusa", example: "Scusa, non capisco"},
        "ar" => %{word: "آسف", example: "آسف، لا أفهم"},
        "pt" => %{word: "Desculpe", example: "Desculpe, não entendo"}
      },
      "intro_thank_you" => %{
        "en" => %{word: "Thank you", example: "Thank you for your help"},
        "fr" => %{word: "Merci", example: "Merci pour votre aide"},
        "es" => %{word: "Gracias", example: "Gracias por tu ayuda"},
        "zh" => %{word: "谢谢", example: "谢谢你的帮助"},
        "ru" => %{word: "Спасибо", example: "Спасибо за помощь"},
        "ja" => %{word: "ありがとう", example: "手伝ってくれてありがとう"},
        "it" => %{word: "Grazie", example: "Grazie per il tuo aiuto"},
        "ar" => %{word: "شكراً", example: "شكراً لمساعدتك"},
        "pt" => %{word: "Obrigado", example: "Obrigado pela sua ajuda"}
      },
      "intro_where" => %{
        "en" => %{word: "Where", example: "Where are you from?"},
        "fr" => %{word: "Où", example: "D'où venez-vous?"},
        "es" => %{word: "Dónde", example: "¿De dónde eres?"},
        "zh" => %{word: "哪里", example: "你来自哪里？"},
        "ru" => %{word: "Где", example: "Откуда вы?"},
        "ja" => %{word: "どこ", example: "どちらの出身ですか？"},
        "it" => %{word: "Dove", example: "Di dove sei?"},
        "ar" => %{word: "أين", example: "من أين أنت؟"},
        "pt" => %{word: "Onde", example: "De onde você é?"}
      },
      "intro_yes" => %{
        "en" => %{word: "Yes", example: "Yes, I speak English"},
        "fr" => %{word: "Oui", example: "Oui, je parle français"},
        "es" => %{word: "Sí", example: "Sí, hablo español"},
        "zh" => %{word: "是", example: "是的，我说中文"},
        "ru" => %{word: "Да", example: "Да, я говорю по-русски"},
        "ja" => %{word: "はい", example: "はい、日本語を話します"},
        "it" => %{word: "Sì", example: "Sì, parlo italiano"},
        "ar" => %{word: "نعم", example: "نعم، أتكلم العربية"},
        "pt" => %{word: "Sim", example: "Sim, eu falo português"}
      }
    }
  end

  # Fruits vocabulary translations
  defp fruits_translations do
    %{
      "fruit_apple" => %{
        "en" => %{word: "Apple", example: "I eat an apple every day"},
        "fr" => %{word: "Pomme", example: "Je mange une pomme chaque jour"},
        "es" => %{word: "Manzana", example: "Como una manzana todos los días"},
        "zh" => %{word: "苹果", example: "我每天吃一个苹果"},
        "ru" => %{word: "Яблоко", example: "Я ем яблоко каждый день"},
        "ja" => %{word: "りんご", example: "毎日りんごを食べます"},
        "it" => %{word: "Mela", example: "Mangio una mela ogni giorno"},
        "ar" => %{word: "تفاحة", example: "آكل تفاحة كل يوم"},
        "pt" => %{word: "Maçã", example: "Eu como uma maçã todos os dias"}
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
      "fruit_cherry" => %{
        "en" => %{word: "Cherry", example: "Cherries are sweet and red"},
        "fr" => %{word: "Cerise", example: "Les cerises sont sucrées et rouges"},
        "es" => %{word: "Cereza", example: "Las cerezas son dulces y rojas"},
        "zh" => %{word: "樱桃", example: "樱桃又甜又红"},
        "ru" => %{word: "Вишня", example: "Вишни сладкие и красные"},
        "ja" => %{word: "さくらんぼ", example: "さくらんぼは甘くて赤いです"},
        "it" => %{word: "Ciliegia", example: "Le ciliegie sono dolci e rosse"},
        "ar" => %{word: "كرز", example: "الكرز حلو وأحمر"},
        "pt" => %{word: "Cereja", example: "As cerejas são doces e vermelhas"}
      },
      "fruit_grape" => %{
        "en" => %{word: "Grape", example: "Grapes grow in bunches"},
        "fr" => %{word: "Raisin", example: "Les raisins poussent en grappes"},
        "es" => %{word: "Uva", example: "Las uvas crecen en racimos"},
        "zh" => %{word: "葡萄", example: "葡萄成串生长"},
        "ru" => %{word: "Виноград", example: "Виноград растет гроздьями"},
        "ja" => %{word: "ぶどう", example: "ぶどうは房になって育ちます"},
        "it" => %{word: "Uva", example: "L'uva cresce a grappoli"},
        "ar" => %{word: "عنب", example: "العنب ينمو في عناقيد"},
        "pt" => %{word: "Uva", example: "As uvas crescem em cachos"}
      },
      "fruit_lemon" => %{
        "en" => %{word: "Lemon", example: "The lemon is sour"},
        "fr" => %{word: "Citron", example: "Le citron est acide"},
        "es" => %{word: "Limón", example: "El limón es ácido"},
        "zh" => %{word: "柠檬", example: "柠檬是酸的"},
        "ru" => %{word: "Лимон", example: "Лимон кислый"},
        "ja" => %{word: "レモン", example: "レモンは酸っぱいです"},
        "it" => %{word: "Limone", example: "Il limone è aspro"},
        "ar" => %{word: "ليمون", example: "الليمون حامض"},
        "pt" => %{word: "Limão", example: "O limão é azedo"}
      },
      "fruit_orange" => %{
        "en" => %{word: "Orange", example: "The orange is juicy"},
        "fr" => %{word: "Orange", example: "L'orange est juteuse"},
        "es" => %{word: "Naranja", example: "La naranja es jugosa"},
        "zh" => %{word: "橙子", example: "橙子很多汁"},
        "ru" => %{word: "Апельсин", example: "Апельсин сочный"},
        "ja" => %{word: "オレンジ", example: "オレンジはジューシーです"},
        "it" => %{word: "Arancia", example: "L'arancia è succosa"},
        "ar" => %{word: "برتقال", example: "البرتقال عصيري"},
        "pt" => %{word: "Laranja", example: "A laranja é suculenta"}
      },
      "fruit_peach" => %{
        "en" => %{word: "Peach", example: "The peach is soft"},
        "fr" => %{word: "Pêche", example: "La pêche est molle"},
        "es" => %{word: "Durazno", example: "El durazno es suave"},
        "zh" => %{word: "桃子", example: "桃子很软"},
        "ru" => %{word: "Персик", example: "Персик мягкий"},
        "ja" => %{word: "桃", example: "桃は柔らかいです"},
        "it" => %{word: "Pesca", example: "La pesca è morbida"},
        "ar" => %{word: "خوخ", example: "الخوخ طري"},
        "pt" => %{word: "Pêssego", example: "O pêssego é macio"}
      },
      "fruit_pineapple" => %{
        "en" => %{word: "Pineapple", example: "Pineapple is tropical"},
        "fr" => %{word: "Ananas", example: "L'ananas est tropical"},
        "es" => %{word: "Piña", example: "La piña es tropical"},
        "zh" => %{word: "菠萝", example: "菠萝是热带水果"},
        "ru" => %{word: "Ананас", example: "Ананас тропический"},
        "ja" => %{word: "パイナップル", example: "パイナップルは熱帯の果物です"},
        "it" => %{word: "Ananas", example: "L'ananas è tropicale"},
        "ar" => %{word: "أناناس", example: "الأناناس استوائي"},
        "pt" => %{word: "Abacaxi", example: "O abacaxi é tropical"}
      },
      "fruit_strawberry" => %{
        "en" => %{word: "Strawberry", example: "Strawberries are red"},
        "fr" => %{word: "Fraise", example: "Les fraises sont rouges"},
        "es" => %{word: "Fresa", example: "Las fresas son rojas"},
        "zh" => %{word: "草莓", example: "草莓是红色的"},
        "ru" => %{word: "Клубника", example: "Клубника красная"},
        "ja" => %{word: "いちご", example: "いちごは赤いです"},
        "it" => %{word: "Fragola", example: "Le fragole sono rosse"},
        "ar" => %{word: "فراولة", example: "الفراولة حمراء"},
        "pt" => %{word: "Morango", example: "Os morangos são vermelhos"}
      },
      "fruit_watermelon" => %{
        "en" => %{word: "Watermelon", example: "Watermelon is refreshing"},
        "fr" => %{word: "Pastèque", example: "La pastèque est rafraîchissante"},
        "es" => %{word: "Sandía", example: "La sandía es refrescante"},
        "zh" => %{word: "西瓜", example: "西瓜很清爽"},
        "ru" => %{word: "Арбуз", example: "Арбуз освежающий"},
        "ja" => %{word: "すいか", example: "すいかは爽やかです"},
        "it" => %{word: "Anguria", example: "L'anguria è rinfrescante"},
        "ar" => %{word: "بطيخ", example: "البطيخ منعش"},
        "pt" => %{word: "Melancia", example: "A melancia é refrescante"}
      }
    }
  end

  # Numbers vocabulary translations
  defp numbers_translations do
    %{
      "number_one" => %{
        "en" => %{word: "One", example: "I have one apple"},
        "fr" => %{word: "Un", example: "J'ai une pomme"},
        "es" => %{word: "Uno", example: "Tengo una manzana"},
        "zh" => %{word: "一", example: "我有一个苹果"},
        "ru" => %{word: "Один", example: "У меня одно яблоко"},
        "ja" => %{word: "一", example: "りんごが一つあります"},
        "it" => %{word: "Uno", example: "Ho una mela"},
        "ar" => %{word: "واحد", example: "عندي تفاحة واحدة"},
        "pt" => %{word: "Um", example: "Eu tenho uma maçã"}
      },
      "number_two" => %{
        "en" => %{word: "Two", example: "I see two birds"},
        "fr" => %{word: "Deux", example: "Je vois deux oiseaux"},
        "es" => %{word: "Dos", example: "Veo dos pájaros"},
        "zh" => %{word: "二", example: "我看到两只鸟"},
        "ru" => %{word: "Два", example: "Я вижу двух птиц"},
        "ja" => %{word: "二", example: "二羽の鳥が見えます"},
        "it" => %{word: "Due", example: "Vedo due uccelli"},
        "ar" => %{word: "اثنان", example: "أرى طائرين"},
        "pt" => %{word: "Dois", example: "Eu vejo dois pássaros"}
      },
      "number_three" => %{
        "en" => %{word: "Three", example: "Count to three"},
        "fr" => %{word: "Trois", example: "Comptez jusqu'à trois"},
        "es" => %{word: "Tres", example: "Cuenta hasta tres"},
        "zh" => %{word: "三", example: "数到三"},
        "ru" => %{word: "Три", example: "Считайте до трех"},
        "ja" => %{word: "三", example: "三まで数えて"},
        "it" => %{word: "Tre", example: "Conta fino a tre"},
        "ar" => %{word: "ثلاثة", example: "عد إلى ثلاثة"},
        "pt" => %{word: "Três", example: "Conte até três"}
      },
      "number_four" => %{
        "en" => %{word: "Four", example: "There are four seasons"},
        "fr" => %{word: "Quatre", example: "Il y a quatre saisons"},
        "es" => %{word: "Cuatro", example: "Hay cuatro estaciones"},
        "zh" => %{word: "四", example: "有四个季节"},
        "ru" => %{word: "Четыре", example: "Есть четыре времени года"},
        "ja" => %{word: "四", example: "四つの季節があります"},
        "it" => %{word: "Quattro", example: "Ci sono quattro stagioni"},
        "ar" => %{word: "أربعة", example: "هناك أربعة فصول"},
        "pt" => %{word: "Quatro", example: "Há quatro estações"}
      },
      "number_five" => %{
        "en" => %{word: "Five", example: "I have five fingers"},
        "fr" => %{word: "Cinq", example: "J'ai cinq doigts"},
        "es" => %{word: "Cinco", example: "Tengo cinco dedos"},
        "zh" => %{word: "五", example: "我有五个手指"},
        "ru" => %{word: "Пять", example: "У меня пять пальцев"},
        "ja" => %{word: "五", example: "五本の指があります"},
        "it" => %{word: "Cinque", example: "Ho cinque dita"},
        "ar" => %{word: "خمسة", example: "عندي خمسة أصابع"},
        "pt" => %{word: "Cinco", example: "Eu tenho cinco dedos"}
      },
      "number_six" => %{
        "en" => %{word: "Six", example: "Six is my lucky number"},
        "fr" => %{word: "Six", example: "Six est mon chiffre porte-bonheur"},
        "es" => %{word: "Seis", example: "Seis es mi número de la suerte"},
        "zh" => %{word: "六", example: "六是我的幸运数字"},
        "ru" => %{word: "Шесть", example: "Шесть - мое счастливое число"},
        "ja" => %{word: "六", example: "六は私のラッキーナンバーです"},
        "it" => %{word: "Sei", example: "Sei è il mio numero fortunato"},
        "ar" => %{word: "ستة", example: "ستة هو رقمي المحظوظ"},
        "pt" => %{word: "Seis", example: "Seis é meu número da sorte"}
      },
      "number_seven" => %{
        "en" => %{word: "Seven", example: "Seven days in a week"},
        "fr" => %{word: "Sept", example: "Sept jours dans une semaine"},
        "es" => %{word: "Siete", example: "Siete días en una semana"},
        "zh" => %{word: "七", example: "一周有七天"},
        "ru" => %{word: "Семь", example: "Семь дней в неделе"},
        "ja" => %{word: "七", example: "一週間は七日です"},
        "it" => %{word: "Sette", example: "Sette giorni in una settimana"},
        "ar" => %{word: "سبعة", example: "سبعة أيام في الأسبوع"},
        "pt" => %{word: "Sete", example: "Sete dias em uma semana"}
      },
      "number_eight" => %{
        "en" => %{word: "Eight", example: "Eight legs on a spider"},
        "fr" => %{word: "Huit", example: "Huit pattes sur une araignée"},
        "es" => %{word: "Ocho", example: "Ocho patas en una araña"},
        "zh" => %{word: "八", example: "蜘蛛有八条腿"},
        "ru" => %{word: "Восемь", example: "Восемь ног у паука"},
        "ja" => %{word: "八", example: "クモには八本の足があります"},
        "it" => %{word: "Otto", example: "Otto zampe su un ragno"},
        "ar" => %{word: "ثمانية", example: "ثمانية أرجل للعنكبوت"},
        "pt" => %{word: "Oito", example: "Oito pernas em uma aranha"}
      },
      "number_nine" => %{
        "en" => %{word: "Nine", example: "Nine planets in our system"},
        "fr" => %{word: "Neuf", example: "Neuf planètes dans notre système"},
        "es" => %{word: "Nueve", example: "Nueve planetas en nuestro sistema"},
        "zh" => %{word: "九", example: "我们系统中有九颗行星"},
        "ru" => %{word: "Девять", example: "Девять планет в нашей системе"},
        "ja" => %{word: "九", example: "私たちの系には九つの惑星があります"},
        "it" => %{word: "Nove", example: "Nove pianeti nel nostro sistema"},
        "ar" => %{word: "تسعة", example: "تسعة كواكب في نظامنا"},
        "pt" => %{word: "Nove", example: "Nove planetas em nosso sistema"}
      },
      "number_ten" => %{
        "en" => %{word: "Ten", example: "Ten is a round number"},
        "fr" => %{word: "Dix", example: "Dix est un nombre rond"},
        "es" => %{word: "Diez", example: "Diez es un número redondo"},
        "zh" => %{word: "十", example: "十是一个整数"},
        "ru" => %{word: "Десять", example: "Десять - круглое число"},
        "ja" => %{word: "十", example: "十はキリの良い数字です"},
        "it" => %{word: "Dieci", example: "Dieci è un numero tondo"},
        "ar" => %{word: "عشرة", example: "عشرة رقم مستدير"},
        "pt" => %{word: "Dez", example: "Dez é um número redondo"}
      }
    }
  end

  # Colors vocabulary translations
  defp colors_translations do
    %{
      "color_red" => %{
        "en" => %{word: "Red", example: "The apple is red"},
        "fr" => %{word: "Rouge", example: "La pomme est rouge"},
        "es" => %{word: "Rojo", example: "La manzana es roja"},
        "zh" => %{word: "红色", example: "苹果是红色的"},
        "ru" => %{word: "Красный", example: "Яблоко красное"},
        "ja" => %{word: "赤", example: "りんごは赤いです"},
        "it" => %{word: "Rosso", example: "La mela è rossa"},
        "ar" => %{word: "أحمر", example: "التفاحة حمراء"},
        "pt" => %{word: "Vermelho", example: "A maçã é vermelha"}
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
        "en" => %{word: "Green", example: "The grass is green"},
        "fr" => %{word: "Vert", example: "L'herbe est verte"},
        "es" => %{word: "Verde", example: "La hierba es verde"},
        "zh" => %{word: "绿色", example: "草是绿色的"},
        "ru" => %{word: "Зелёный", example: "Трава зеленая"},
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
        "ru" => %{word: "Жёлтый", example: "Солнце желтое"},
        "ja" => %{word: "黄色", example: "太陽は黄色です"},
        "it" => %{word: "Giallo", example: "Il sole è giallo"},
        "ar" => %{word: "أصفر", example: "الشمس صفراء"},
        "pt" => %{word: "Amarelo", example: "O sol é amarelo"}
      },
      "color_orange" => %{
        "en" => %{word: "Orange", example: "I like the color orange"},
        "fr" => %{word: "Orange", example: "J'aime la couleur orange"},
        "es" => %{word: "Naranja", example: "Me gusta el color naranja"},
        "zh" => %{word: "橙色", example: "我喜欢橙色"},
        "ru" => %{word: "Оранжевый", example: "Мне нравится оранжевый цвет"},
        "ja" => %{word: "オレンジ", example: "オレンジ色が好きです"},
        "it" => %{word: "Arancione", example: "Mi piace il colore arancione"},
        "ar" => %{word: "برتقالي", example: "أحب اللون البرتقالي"},
        "pt" => %{word: "Laranja", example: "Eu gosto da cor laranja"}
      },
      "color_purple" => %{
        "en" => %{word: "Purple", example: "The flower is purple"},
        "fr" => %{word: "Violet", example: "La fleur est violette"},
        "es" => %{word: "Morado", example: "La flor es morada"},
        "zh" => %{word: "紫色", example: "花是紫色的"},
        "ru" => %{word: "Фиолетовый", example: "Цветок фиолетовый"},
        "ja" => %{word: "紫", example: "花は紫です"},
        "it" => %{word: "Viola", example: "Il fiore è viola"},
        "ar" => %{word: "بنفسجي", example: "الزهرة بنفسجية"},
        "pt" => %{word: "Roxo", example: "A flor é roxa"}
      },
      "color_pink" => %{
        "en" => %{word: "Pink", example: "My shirt is pink"},
        "fr" => %{word: "Rose", example: "Ma chemise est rose"},
        "es" => %{word: "Rosa", example: "Mi camisa es rosa"},
        "zh" => %{word: "粉色", example: "我的衬衫是粉色的"},
        "ru" => %{word: "Розовый", example: "Моя рубашка розовая"},
        "ja" => %{word: "ピンク", example: "私のシャツはピンクです"},
        "it" => %{word: "Rosa", example: "La mia camicia è rosa"},
        "ar" => %{word: "وردي", example: "قميصي وردي"},
        "pt" => %{word: "Rosa", example: "Minha camisa é rosa"}
      },
      "color_brown" => %{
        "en" => %{word: "Brown", example: "The tree is brown"},
        "fr" => %{word: "Marron", example: "L'arbre est marron"},
        "es" => %{word: "Marrón", example: "El árbol es marrón"},
        "zh" => %{word: "棕色", example: "树是棕色的"},
        "ru" => %{word: "Коричневый", example: "Дерево коричневое"},
        "ja" => %{word: "茶色", example: "木は茶色です"},
        "it" => %{word: "Marrone", example: "L'albero è marrone"},
        "ar" => %{word: "بني", example: "الشجرة بنية"},
        "pt" => %{word: "Marrom", example: "A árvore é marrom"}
      },
      "color_black" => %{
        "en" => %{word: "Black", example: "The night is black"},
        "fr" => %{word: "Noir", example: "La nuit est noire"},
        "es" => %{word: "Negro", example: "La noche es negra"},
        "zh" => %{word: "黑色", example: "夜晚是黑色的"},
        "ru" => %{word: "Чёрный", example: "Ночь черная"},
        "ja" => %{word: "黒", example: "夜は黒いです"},
        "it" => %{word: "Nero", example: "La notte è nera"},
        "ar" => %{word: "أسود", example: "الليل أسود"},
        "pt" => %{word: "Preto", example: "A noite é preta"}
      },
      "color_white" => %{
        "en" => %{word: "White", example: "Snow is white"},
        "fr" => %{word: "Blanc", example: "La neige est blanche"},
        "es" => %{word: "Blanco", example: "La nieve es blanca"},
        "zh" => %{word: "白色", example: "雪是白色的"},
        "ru" => %{word: "Белый", example: "Снег белый"},
        "ja" => %{word: "白", example: "雪は白いです"},
        "it" => %{word: "Bianco", example: "La neve è bianca"},
        "ar" => %{word: "أبيض", example: "الثلج أبيض"},
        "pt" => %{word: "Branco", example: "A neve é branca"}
      },
      "color_gray" => %{
        "en" => %{word: "Gray", example: "The clouds are gray"},
        "fr" => %{word: "Gris", example: "Les nuages sont gris"},
        "es" => %{word: "Gris", example: "Las nubes son grises"},
        "zh" => %{word: "灰色", example: "云朵是灰色的"},
        "ru" => %{word: "Серый", example: "Облака серые"},
        "ja" => %{word: "灰色", example: "雲は灰色です"},
        "it" => %{word: "Grigio", example: "Le nuvole sono grigie"},
        "ar" => %{word: "رمادي", example: "الغيوم رمادية"},
        "pt" => %{word: "Cinza", example: "As nuvens são cinzas"}
      }
    }
  end

  # Bakery vocabulary translations
  defp bakery_translations do
    %{
      "bakery_bread" => %{
        "en" => %{word: "Bread", example: "I buy fresh bread"},
        "fr" => %{word: "Pain", example: "J'achète du pain frais"},
        "es" => %{word: "Pan", example: "Compro pan fresco"},
        "zh" => %{word: "面包", example: "我买新鲜面包"},
        "ru" => %{word: "Хлеб", example: "Я покупаю свежий хлеб"},
        "ja" => %{word: "パン", example: "新鮮なパンを買います"},
        "it" => %{word: "Pane", example: "Compro pane fresco"},
        "ar" => %{word: "خبز", example: "أشتري خبزاً طازجاً"},
        "pt" => %{word: "Pão", example: "Eu compro pão fresco"}
      },
      "bakery_croissant" => %{
        "en" => %{word: "Croissant", example: "The croissant is buttery"},
        "fr" => %{word: "Croissant", example: "Le croissant est beurré"},
        "es" => %{word: "Croissant", example: "El croissant está mantecoso"},
        "zh" => %{word: "羊角面包", example: "羊角面包很有黄油味"},
        "ru" => %{word: "Круассан", example: "Круассан масляный"},
        "ja" => %{word: "クロワッサン", example: "クロワッサンはバターがきいています"},
        "it" => %{word: "Cornetto", example: "Il cornetto è burroso"},
        "ar" => %{word: "كرواسان", example: "الكرواسان مزبد"},
        "pt" => %{word: "Croissant", example: "O croissant tem muito manteiga"}
      },
      "bakery_bagel" => %{
        "en" => %{word: "Bagel", example: "I like bagels with cream cheese"},
        "fr" => %{word: "Bagel", example: "J'aime les bagels avec du fromage frais"},
        "es" => %{word: "Bagel", example: "Me gustan los bagels con queso crema"},
        "zh" => %{word: "贝果", example: "我喜欢配奶油奶酪的贝果"},
        "ru" => %{word: "Бублик", example: "Мне нравятся бублики с сливочным сыром"},
        "ja" => %{word: "ベーグル", example: "クリームチーズ付きのベーグルが好きです"},
        "it" => %{word: "Bagel", example: "Mi piacciono i bagel con formaggio cremoso"},
        "ar" => %{word: "بيغل", example: "أحب البيغل مع الجبن الكريمي"},
        "pt" => %{word: "Bagel", example: "Eu gosto de bagels com cream cheese"}
      },
      "bakery_pretzel" => %{
        "en" => %{word: "Pretzel", example: "The pretzel is salty"},
        "fr" => %{word: "Bretzel", example: "Le bretzel est salé"},
        "es" => %{word: "Pretzel", example: "El pretzel está salado"},
        "zh" => %{word: "椒盐脆饼", example: "椒盐脆饼很咸"},
        "ru" => %{word: "Крендель", example: "Крендель соленый"},
        "ja" => %{word: "プレッツェル", example: "プレッツェルは塩辛いです"},
        "it" => %{word: "Pretzel", example: "Il pretzel è salato"},
        "ar" => %{word: "بريتزل", example: "البريتزل مالح"},
        "pt" => %{word: "Pretzel", example: "O pretzel é salgado"}
      },
      "bakery_baguette" => %{
        "en" => %{word: "Baguette", example: "The baguette is long"},
        "fr" => %{word: "Baguette", example: "La baguette est longue"},
        "es" => %{word: "Baguette", example: "La baguette es larga"},
        "zh" => %{word: "法式长棍面包", example: "法式长棍面包很长"},
        "ru" => %{word: "Багет", example: "Багет длинный"},
        "ja" => %{word: "バゲット", example: "バゲットは長いです"},
        "it" => %{word: "Baguette", example: "La baguette è lunga"},
        "ar" => %{word: "باغيت", example: "الباغيت طويل"},
        "pt" => %{word: "Baguete", example: "A baguete é comprida"}
      },
      "bakery_cake" => %{
        "en" => %{word: "Cake", example: "The birthday cake is delicious"},
        "fr" => %{word: "Gâteau", example: "Le gâteau d'anniversaire est délicieux"},
        "es" => %{word: "Pastel", example: "El pastel de cumpleaños está delicioso"},
        "zh" => %{word: "蛋糕", example: "生日蛋糕很美味"},
        "ru" => %{word: "Торт", example: "Торт на день рождения вкусный"},
        "ja" => %{word: "ケーキ", example: "誕生日ケーキは美味しいです"},
        "it" => %{word: "Torta", example: "La torta di compleanno è deliziosa"},
        "ar" => %{word: "كعكة", example: "كعكة عيد الميلاد لذيذة"},
        "pt" => %{word: "Bolo", example: "O bolo de aniversário está delicioso"}
      },
      "bakery_cupcake" => %{
        "en" => %{word: "Cupcake", example: "The cupcake has frosting"},
        "fr" => %{word: "Cupcake", example: "Le cupcake a du glaçage"},
        "es" => %{word: "Magdalena", example: "La magdalena tiene glaseado"},
        "zh" => %{word: "纸杯蛋糕", example: "纸杯蛋糕有糖霜"},
        "ru" => %{word: "Кекс", example: "На кексе есть глазурь"},
        "ja" => %{word: "カップケーキ", example: "カップケーキにはフロスティングがあります"},
        "it" => %{word: "Cupcake", example: "Il cupcake ha la glassa"},
        "ar" => %{word: "كب كيك", example: "الكب كيك عليه تزيين"},
        "pt" => %{word: "Cupcake", example: "O cupcake tem cobertura"}
      },
      "bakery_donut" => %{
        "en" => %{word: "Donut", example: "The donut is glazed"},
        "fr" => %{word: "Beignet", example: "Le beignet est glacé"},
        "es" => %{word: "Dona", example: "La dona está glaseada"},
        "zh" => %{word: "甜甜圈", example: "甜甜圈有糖霜"},
        "ru" => %{word: "Пончик", example: "Пончик покрыт глазурью"},
        "ja" => %{word: "ドーナツ", example: "ドーナツにはグレーズがかかっています"},
        "it" => %{word: "Ciambella", example: "La ciambella è glassata"},
        "ar" => %{word: "دونات", example: "الدونات مُزجج"},
        "pt" => %{word: "Rosquinha", example: "A rosquinha tem cobertura"}
      },
      "bakery_cookie" => %{
        "en" => %{word: "Cookie", example: "I love chocolate chip cookies"},
        "fr" => %{word: "Biscuit", example: "J'adore les biscuits aux pépites de chocolat"},
        "es" => %{word: "Galleta", example: "Me encantan las galletas de chocolate"},
        "zh" => %{word: "饼干", example: "我喜欢巧克力片饼干"},
        "ru" => %{word: "Печенье", example: "Я люблю печенье с шоколадными кусочками"},
        "ja" => %{word: "クッキー", example: "チョコレートチップクッキーが大好きです"},
        "it" => %{word: "Biscotto", example: "Amo i biscotti con gocce di cioccolato"},
        "ar" => %{word: "بسكويت", example: "أحب البسكويت برقائق الشوكولاتة"},
        "pt" => %{word: "Biscoito", example: "Eu amo biscoitos com gotas de chocolate"}
      },
      "bakery_pie" => %{
        "en" => %{word: "Pie", example: "The apple pie smells good"},
        "fr" => %{word: "Tarte", example: "La tarte aux pommes sent bon"},
        "es" => %{word: "Tarta", example: "La tarta de manzana huele bien"},
        "zh" => %{word: "馅饼", example: "苹果馅饼闻起来很香"},
        "ru" => %{word: "Пирог", example: "Яблочный пирог хорошо пахнет"},
        "ja" => %{word: "パイ", example: "アップルパイはいい匂いがします"},
        "it" => %{word: "Crostata", example: "La crostata di mele profuma bene"},
        "ar" => %{word: "فطيرة", example: "فطيرة التفاح رائحتها طيبة"},
        "pt" => %{word: "Torta", example: "A torta de maçã cheira bem"}
      }
    }
  end

  # Animals vocabulary translations
  defp animals_translations do
    %{
      "animal_dog" => %{
        "en" => %{word: "Dog", example: "The dog is man's best friend"},
        "fr" => %{word: "Chien", example: "Le chien est le meilleur ami de l'homme"},
        "es" => %{word: "Perro", example: "El perro es el mejor amigo del hombre"},
        "zh" => %{word: "狗", example: "狗是人类最好的朋友"},
        "ru" => %{word: "Собака", example: "Собака - лучший друг человека"},
        "ja" => %{word: "犬", example: "犬は人間の最良の友です"},
        "it" => %{word: "Cane", example: "Il cane è il migliore amico dell'uomo"},
        "ar" => %{word: "كلب", example: "الكلب أفضل صديق للإنسان"},
        "pt" => %{word: "Cachorro", example: "O cachorro é o melhor amigo do homem"}
      },
      "animal_cat" => %{
        "en" => %{word: "Cat", example: "The cat is sleeping"},
        "fr" => %{word: "Chat", example: "Le chat dort"},
        "es" => %{word: "Gato", example: "El gato está durmiendo"},
        "zh" => %{word: "猫", example: "猫在睡觉"},
        "ru" => %{word: "Кот", example: "Кот спит"},
        "ja" => %{word: "猫", example: "猫が眠っています"},
        "it" => %{word: "Gatto", example: "Il gatto sta dormendo"},
        "ar" => %{word: "قط", example: "القط نائم"},
        "pt" => %{word: "Gato", example: "O gato está dormindo"}
      },
      "animal_rabbit" => %{
        "en" => %{word: "Rabbit", example: "The rabbit is fast"},
        "fr" => %{word: "Lapin", example: "Le lapin est rapide"},
        "es" => %{word: "Conejo", example: "El conejo es rápido"},
        "zh" => %{word: "兔子", example: "兔子很快"},
        "ru" => %{word: "Кролик", example: "Кролик быстрый"},
        "ja" => %{word: "うさぎ", example: "うさぎは速いです"},
        "it" => %{word: "Coniglio", example: "Il coniglio è veloce"},
        "ar" => %{word: "أرنب", example: "الأرنب سريع"},
        "pt" => %{word: "Coelho", example: "O coelho é rápido"}
      },
      "animal_bear" => %{
        "en" => %{word: "Bear", example: "The bear is strong"},
        "fr" => %{word: "Ours", example: "L'ours est fort"},
        "es" => %{word: "Oso", example: "El oso es fuerte"},
        "zh" => %{word: "熊", example: "熊很强壮"},
        "ru" => %{word: "Медведь", example: "Медведь сильный"},
        "ja" => %{word: "熊", example: "熊は強いです"},
        "it" => %{word: "Orso", example: "L'orso è forte"},
        "ar" => %{word: "دب", example: "الدب قوي"},
        "pt" => %{word: "Urso", example: "O urso é forte"}
      },
      "animal_panda" => %{
        "en" => %{word: "Panda", example: "The panda eats bamboo"},
        "fr" => %{word: "Panda", example: "Le panda mange du bambou"},
        "es" => %{word: "Panda", example: "El panda come bambú"},
        "zh" => %{word: "熊猫", example: "熊猫吃竹子"},
        "ru" => %{word: "Панда", example: "Панда ест бамбук"},
        "ja" => %{word: "パンダ", example: "パンダは竹を食べます"},
        "it" => %{word: "Panda", example: "Il panda mangia bambù"},
        "ar" => %{word: "باندا", example: "الباندا يأكل الخيزران"},
        "pt" => %{word: "Panda", example: "O panda come bambu"}
      },
      "animal_lion" => %{
        "en" => %{word: "Lion", example: "The lion is the king"},
        "fr" => %{word: "Lion", example: "Le lion est le roi"},
        "es" => %{word: "León", example: "El león es el rey"},
        "zh" => %{word: "狮子", example: "狮子是王者"},
        "ru" => %{word: "Лев", example: "Лев - король"},
        "ja" => %{word: "ライオン", example: "ライオンは王様です"},
        "it" => %{word: "Leone", example: "Il leone è il re"},
        "ar" => %{word: "أسد", example: "الأسد هو الملك"},
        "pt" => %{word: "Leão", example: "O leão é o rei"}
      },
      "animal_tiger" => %{
        "en" => %{word: "Tiger", example: "The tiger has stripes"},
        "fr" => %{word: "Tigre", example: "Le tigre a des rayures"},
        "es" => %{word: "Tigre", example: "El tigre tiene rayas"},
        "zh" => %{word: "老虎", example: "老虎有条纹"},
        "ru" => %{word: "Тигр", example: "У тигра есть полоски"},
        "ja" => %{word: "トラ", example: "トラにはしま模様があります"},
        "it" => %{word: "Tigre", example: "La tigre ha le strisce"},
        "ar" => %{word: "نمر", example: "النمر له خطوط"},
        "pt" => %{word: "Tigre", example: "O tigre tem listras"}
      },
      "animal_elephant" => %{
        "en" => %{word: "Elephant", example: "The elephant is big"},
        "fr" => %{word: "Éléphant", example: "L'éléphant est grand"},
        "es" => %{word: "Elefante", example: "El elefante es grande"},
        "zh" => %{word: "大象", example: "大象很大"},
        "ru" => %{word: "Слон", example: "Слон большой"},
        "ja" => %{word: "象", example: "象は大きいです"},
        "it" => %{word: "Elefante", example: "L'elefante è grande"},
        "ar" => %{word: "فيل", example: "الفيل كبير"},
        "pt" => %{word: "Elefante", example: "O elefante é grande"}
      },
      "animal_monkey" => %{
        "en" => %{word: "Monkey", example: "The monkey climbs trees"},
        "fr" => %{word: "Singe", example: "Le singe grimpe aux arbres"},
        "es" => %{word: "Mono", example: "El mono trepa árboles"},
        "zh" => %{word: "猴子", example: "猴子爬树"},
        "ru" => %{word: "Обезьяна", example: "Обезьяна лазает по деревьям"},
        "ja" => %{word: "猿", example: "猿は木に登ります"},
        "it" => %{word: "Scimmia", example: "La scimmia si arrampica sugli alberi"},
        "ar" => %{word: "قرد", example: "القرد يتسلق الأشجار"},
        "pt" => %{word: "Macaco", example: "O macaco sobe em árvores"}
      },
      "animal_horse" => %{
        "en" => %{word: "Horse", example: "The horse runs fast"},
        "fr" => %{word: "Cheval", example: "Le cheval court vite"},
        "es" => %{word: "Caballo", example: "El caballo corre rápido"},
        "zh" => %{word: "马", example: "马跑得很快"},
        "ru" => %{word: "Лошадь", example: "Лошадь быстро бегает"},
        "ja" => %{word: "馬", example: "馬は速く走ります"},
        "it" => %{word: "Cavallo", example: "Il cavallo corre veloce"},
        "ar" => %{word: "حصان", example: "الحصان يجري بسرعة"},
        "pt" => %{word: "Cavalo", example: "O cavalo corre rápido"}
      },
      "animal_cow" => %{
        "en" => %{word: "Cow", example: "The cow gives milk"},
        "fr" => %{word: "Vache", example: "La vache donne du lait"},
        "es" => %{word: "Vaca", example: "La vaca da leche"},
        "zh" => %{word: "牛", example: "牛产奶"},
        "ru" => %{word: "Корова", example: "Корова дает молоко"},
        "ja" => %{word: "牛", example: "牛はミルクを出します"},
        "it" => %{word: "Mucca", example: "La mucca dà il latte"},
        "ar" => %{word: "بقرة", example: "البقرة تعطي الحليب"},
        "pt" => %{word: "Vaca", example: "A vaca dá leite"}
      },
      "animal_pig" => %{
        "en" => %{word: "Pig", example: "The pig is pink"},
        "fr" => %{word: "Cochon", example: "Le cochon est rose"},
        "es" => %{word: "Cerdo", example: "El cerdo es rosado"},
        "zh" => %{word: "猪", example: "猪是粉色的"},
        "ru" => %{word: "Свинья", example: "Свинья розовая"},
        "ja" => %{word: "豚", example: "豚はピンク色です"},
        "it" => %{word: "Maiale", example: "Il maiale è rosa"},
        "ar" => %{word: "خنزير", example: "الخنزير وردي"},
        "pt" => %{word: "Porco", example: "O porco é rosa"}
      }
    }
  end

  # Restaurant vocabulary translations
  defp restaurant_translations do
    %{
      "restaurant_menu" => %{
        "en" => %{word: "Menu", example: "Can I see the menu please?"},
        "fr" => %{word: "Menu", example: "Puis-je voir le menu s'il vous plaît?"},
        "es" => %{word: "Menú", example: "¿Puedo ver el menú por favor?"},
        "zh" => %{word: "菜单", example: "请给我看看菜单"},
        "ru" => %{word: "Меню", example: "Могу я посмотреть меню, пожалуйста?"},
        "ja" => %{word: "メニュー", example: "メニューを見せてください"},
        "it" => %{word: "Menu", example: "Posso vedere il menu per favore?"},
        "ar" => %{word: "قائمة الطعام", example: "هل يمكنني رؤية القائمة من فضلك؟"},
        "pt" => %{word: "Menu", example: "Posso ver o menu por favor?"}
      },
      "restaurant_pizza" => %{
        "en" => %{word: "Pizza", example: "I'd like to order pizza"},
        "fr" => %{word: "Pizza", example: "J'aimerais commander une pizza"},
        "es" => %{word: "Pizza", example: "Me gustaría pedir pizza"},
        "zh" => %{word: "比萨", example: "我想点比萨"},
        "ru" => %{word: "Пицца", example: "Я хотел бы заказать пиццу"},
        "ja" => %{word: "ピザ", example: "ピザを注文したいです"},
        "it" => %{word: "Pizza", example: "Vorrei ordinare una pizza"},
        "ar" => %{word: "بيتزا", example: "أريد أن أطلب بيتزا"},
        "pt" => %{word: "Pizza", example: "Eu gostaria de pedir pizza"}
      },
      "restaurant_burger" => %{
        "en" => %{word: "Burger", example: "The burger is delicious"},
        "fr" => %{word: "Burger", example: "Le burger est délicieux"},
        "es" => %{word: "Hamburguesa", example: "La hamburguesa está deliciosa"},
        "zh" => %{word: "汉堡", example: "汉堡很美味"},
        "ru" => %{word: "Бургер", example: "Бургер вкусный"},
        "ja" => %{word: "ハンバーガー", example: "ハンバーガーは美味しいです"},
        "it" => %{word: "Hamburger", example: "L'hamburger è delizioso"},
        "ar" => %{word: "برغر", example: "البرغر لذيذ"},
        "pt" => %{word: "Hambúrguer", example: "O hambúrguer está delicioso"}
      },
      "restaurant_fries" => %{
        "en" => %{word: "Fries", example: "Can I have fries with that?"},
        "fr" => %{word: "Frites", example: "Puis-je avoir des frites avec ça?"},
        "es" => %{word: "Papas fritas", example: "¿Puedo pedir papas fritas con eso?"},
        "zh" => %{word: "薯条", example: "我可以要薯条吗？"},
        "ru" => %{word: "Картошка фри", example: "Можно картошку фри к этому?"},
        "ja" => %{word: "フライドポテト", example: "それにフライドポテトをつけられますか？"},
        "it" => %{word: "Patatine", example: "Posso avere delle patatine con quello?"},
        "ar" => %{word: "بطاطس مقلية", example: "هل يمكنني الحصول على بطاطس مقلية مع ذلك؟"},
        "pt" => %{word: "Batata frita", example: "Posso pedir batata frita com isso?"}
      },
      "restaurant_pasta" => %{
        "en" => %{word: "Pasta", example: "I love Italian pasta"},
        "fr" => %{word: "Pâtes", example: "J'adore les pâtes italiennes"},
        "es" => %{word: "Pasta", example: "Me encanta la pasta italiana"},
        "zh" => %{word: "意大利面", example: "我喜欢意大利面"},
        "ru" => %{word: "Паста", example: "Я люблю итальянскую пасту"},
        "ja" => %{word: "パスタ", example: "イタリアンパスタが大好きです"},
        "it" => %{word: "Pasta", example: "Amo la pasta italiana"},
        "ar" => %{word: "مكرونة", example: "أحب المكرونة الإيطالية"},
        "pt" => %{word: "Massa", example: "Eu amo massa italiana"}
      },
      "restaurant_salad" => %{
        "en" => %{word: "Salad", example: "The salad is fresh"},
        "fr" => %{word: "Salade", example: "La salade est fraîche"},
        "es" => %{word: "Ensalada", example: "La ensalada está fresca"},
        "zh" => %{word: "沙拉", example: "沙拉很新鲜"},
        "ru" => %{word: "Салат", example: "Салат свежий"},
        "ja" => %{word: "サラダ", example: "サラダは新鮮です"},
        "it" => %{word: "Insalata", example: "L'insalata è fresca"},
        "ar" => %{word: "سلطة", example: "السلطة طازجة"},
        "pt" => %{word: "Salada", example: "A salada está fresca"}
      },
      "restaurant_soup" => %{
        "en" => %{word: "Soup", example: "The soup is hot"},
        "fr" => %{word: "Soupe", example: "La soupe est chaude"},
        "es" => %{word: "Sopa", example: "La sopa está caliente"},
        "zh" => %{word: "汤", example: "汤很热"},
        "ru" => %{word: "Суп", example: "Суп горячий"},
        "ja" => %{word: "スープ", example: "スープは熱いです"},
        "it" => %{word: "Zuppa", example: "La zuppa è calda"},
        "ar" => %{word: "حساء", example: "الحساء ساخن"},
        "pt" => %{word: "Sopa", example: "A sopa está quente"}
      },
      "restaurant_coffee" => %{
        "en" => %{word: "Coffee", example: "I'll have coffee please"},
        "fr" => %{word: "Café", example: "Je prendrai un café s'il vous plaît"},
        "es" => %{word: "Café", example: "Tomaré café por favor"},
        "zh" => %{word: "咖啡", example: "请给我一杯咖啡"},
        "ru" => %{word: "Кофе", example: "Я буду кофе, пожалуйста"},
        "ja" => %{word: "コーヒー", example: "コーヒーをください"},
        "it" => %{word: "Caffè", example: "Prenderò un caffè per favore"},
        "ar" => %{word: "قهوة", example: "سآخذ قهوة من فضلك"},
        "pt" => %{word: "Café", example: "Eu vou querer café por favor"}
      },
      "restaurant_water" => %{
        "en" => %{word: "Water", example: "Can I have water?"},
        "fr" => %{word: "Eau", example: "Puis-je avoir de l'eau?"},
        "es" => %{word: "Agua", example: "¿Puedo tener agua?"},
        "zh" => %{word: "水", example: "我可以要水吗？"},
        "ru" => %{word: "Вода", example: "Можно мне воды?"},
        "ja" => %{word: "水", example: "お水をいただけますか？"},
        "it" => %{word: "Acqua", example: "Posso avere dell'acqua?"},
        "ar" => %{word: "ماء", example: "هل يمكنني الحصول على ماء؟"},
        "pt" => %{word: "Água", example: "Posso ter água?"}
      },
      "restaurant_bill" => %{
        "en" => %{word: "Bill", example: "Can I have the bill?"},
        "fr" => %{word: "Addition", example: "Puis-je avoir l'addition?"},
        "es" => %{word: "Cuenta", example: "¿Puedo tener la cuenta?"},
        "zh" => %{word: "账单", example: "我可以要账单吗？"},
        "ru" => %{word: "Счёт", example: "Можно счёт?"},
        "ja" => %{word: "お会計", example: "お会計をお願いします"},
        "it" => %{word: "Conto", example: "Posso avere il conto?"},
        "ar" => %{word: "فاتورة", example: "هل يمكنني الحصول على الفاتورة؟"},
        "pt" => %{word: "Conta", example: "Posso ter a conta?"}
      }
    }
  end

  # Family vocabulary translations
  defp family_translations do
    %{
      "family_mother" => %{
        "en" => %{word: "Mother", example: "My mother is very kind"},
        "fr" => %{word: "Mère", example: "Ma mère est très gentille"},
        "es" => %{word: "Madre", example: "Mi madre es muy amable"},
        "zh" => %{word: "母亲", example: "我的母亲很善良"},
        "ru" => %{word: "Мать", example: "Моя мать очень добрая"},
        "ja" => %{word: "母", example: "私の母はとても優しいです"},
        "it" => %{word: "Madre", example: "Mia madre è molto gentile"},
        "ar" => %{word: "أم", example: "أمي لطيفة جداً"},
        "pt" => %{word: "Mãe", example: "Minha mãe é muito gentil"}
      },
      "family_father" => %{
        "en" => %{word: "Father", example: "My father works hard"},
        "fr" => %{word: "Père", example: "Mon père travaille dur"},
        "es" => %{word: "Padre", example: "Mi padre trabaja duro"},
        "zh" => %{word: "父亲", example: "我的父亲工作很努力"},
        "ru" => %{word: "Отец", example: "Мой отец много работает"},
        "ja" => %{word: "父", example: "私の父は一生懸命働きます"},
        "it" => %{word: "Padre", example: "Mio padre lavora sodo"},
        "ar" => %{word: "أب", example: "أبي يعمل بجد"},
        "pt" => %{word: "Pai", example: "Meu pai trabalha muito"}
      },
      "family_sister" => %{
        "en" => %{word: "Sister", example: "I have two sisters"},
        "fr" => %{word: "Sœur", example: "J'ai deux sœurs"},
        "es" => %{word: "Hermana", example: "Tengo dos hermanas"},
        "zh" => %{word: "姐妹", example: "我有两个姐妹"},
        "ru" => %{word: "Сестра", example: "У меня две сестры"},
        "ja" => %{word: "姉妹", example: "私には姉妹が二人います"},
        "it" => %{word: "Sorella", example: "Ho due sorelle"},
        "ar" => %{word: "أخت", example: "عندي أختان"},
        "pt" => %{word: "Irmã", example: "Eu tenho duas irmãs"}
      },
      "family_brother" => %{
        "en" => %{word: "Brother", example: "My brother is tall"},
        "fr" => %{word: "Frère", example: "Mon frère est grand"},
        "es" => %{word: "Hermano", example: "Mi hermano es alto"},
        "zh" => %{word: "兄弟", example: "我的兄弟很高"},
        "ru" => %{word: "Брат", example: "Мой брат высокий"},
        "ja" => %{word: "兄弟", example: "私の兄弟は背が高いです"},
        "it" => %{word: "Fratello", example: "Mio fratello è alto"},
        "ar" => %{word: "أخ", example: "أخي طويل"},
        "pt" => %{word: "Irmão", example: "Meu irmão é alto"}
      },
      "family_grandmother" => %{
        "en" => %{word: "Grandmother", example: "I love my grandmother"},
        "fr" => %{word: "Grand-mère", example: "J'aime ma grand-mère"},
        "es" => %{word: "Abuela", example: "Amo a mi abuela"},
        "zh" => %{word: "祖母", example: "我爱我的祖母"},
        "ru" => %{word: "Бабушка", example: "Я люблю свою бабушку"},
        "ja" => %{word: "おばあさん", example: "私はおばあさんが大好きです"},
        "it" => %{word: "Nonna", example: "Amo mia nonna"},
        "ar" => %{word: "جدة", example: "أحب جدتي"},
        "pt" => %{word: "Vovó", example: "Eu amo minha vovó"}
      },
      "family_grandfather" => %{
        "en" => %{word: "Grandfather", example: "This is my grandfather"},
        "fr" => %{word: "Grand-père", example: "Voici mon grand-père"},
        "es" => %{word: "Abuelo", example: "Este es mi abuelo"},
        "zh" => %{word: "祖父", example: "这是我的祖父"},
        "ru" => %{word: "Дедушка", example: "Это мой дедушка"},
        "ja" => %{word: "おじいさん", example: "これは私のおじいさんです"},
        "it" => %{word: "Nonno", example: "Questo è mio nonno"},
        "ar" => %{word: "جد", example: "هذا جدي"},
        "pt" => %{word: "Vovô", example: "Este é meu vovô"}
      },
      "family_baby" => %{
        "en" => %{word: "Baby", example: "The baby is cute"},
        "fr" => %{word: "Bébé", example: "Le bébé est mignon"},
        "es" => %{word: "Bebé", example: "El bebé es lindo"},
        "zh" => %{word: "婴儿", example: "婴儿很可爱"},
        "ru" => %{word: "Ребёнок", example: "Ребёнок милый"},
        "ja" => %{word: "赤ちゃん", example: "赤ちゃんはかわいいです"},
        "it" => %{word: "Bambino", example: "Il bambino è carino"},
        "ar" => %{word: "طفل", example: "الطفل لطيف"},
        "pt" => %{word: "Bebê", example: "O bebê é fofo"}
      },
      "family_family" => %{
        "en" => %{word: "Family", example: "I have a big family"},
        "fr" => %{word: "Famille", example: "J'ai une grande famille"},
        "es" => %{word: "Familia", example: "Tengo una familia grande"},
        "zh" => %{word: "家庭", example: "我有一个大家庭"},
        "ru" => %{word: "Семья", example: "У меня большая семья"},
        "ja" => %{word: "家族", example: "私には大きな家族がいます"},
        "it" => %{word: "Famiglia", example: "Ho una famiglia numerosa"},
        "ar" => %{word: "عائلة", example: "عندي عائلة كبيرة"},
        "pt" => %{word: "Família", example: "Eu tenho uma família grande"}
      },
      "family_aunt" => %{
        "en" => %{word: "Aunt", example: "My aunt is funny"},
        "fr" => %{word: "Tante", example: "Ma tante est drôle"},
        "es" => %{word: "Tía", example: "Mi tía es divertida"},
        "zh" => %{word: "姑妈", example: "我的姑妈很有趣"},
        "ru" => %{word: "Тётя", example: "Моя тётя забавная"},
        "ja" => %{word: "おばさん", example: "私のおばさんは面白いです"},
        "it" => %{word: "Zia", example: "Mia zia è divertente"},
        "ar" => %{word: "عمة", example: "عمتي مضحكة"},
        "pt" => %{word: "Tia", example: "Minha tia é engraçada"}
      },
      "family_uncle" => %{
        "en" => %{word: "Uncle", example: "My uncle plays guitar"},
        "fr" => %{word: "Oncle", example: "Mon oncle joue de la guitare"},
        "es" => %{word: "Tío", example: "Mi tío toca la guitarra"},
        "zh" => %{word: "叔叔", example: "我的叔叔弹吉他"},
        "ru" => %{word: "Дядя", example: "Мой дядя играет на гитаре"},
        "ja" => %{word: "おじさん", example: "私のおじさんはギターを弾きます"},
        "it" => %{word: "Zio", example: "Mio zio suona la chitarra"},
        "ar" => %{word: "عم", example: "عمي يعزف على الجيتار"},
        "pt" => %{word: "Tio", example: "Meu tio toca violão"}
      }
    }
  end

  # Countries vocabulary translations
  defp countries_translations do
    %{
      "country_usa" => %{
        "en" => %{word: "United States", example: "I am from the United States"},
        "fr" => %{word: "États-Unis", example: "Je viens des États-Unis"},
        "es" => %{word: "Estados Unidos", example: "Soy de Estados Unidos"},
        "zh" => %{word: "美国", example: "我来自美国"},
        "ru" => %{word: "США", example: "Я из США"},
        "ja" => %{word: "アメリカ", example: "私はアメリカ出身です"},
        "it" => %{word: "Stati Uniti", example: "Vengo dagli Stati Uniti"},
        "ar" => %{word: "الولايات المتحدة", example: "أنا من الولايات المتحدة"},
        "pt" => %{word: "Estados Unidos", example: "Eu sou dos Estados Unidos"}
      },
      "country_france" => %{
        "en" => %{word: "France", example: "I visited France last year"},
        "fr" => %{word: "France", example: "J'ai visité la France l'année dernière"},
        "es" => %{word: "Francia", example: "Visité Francia el año pasado"},
        "zh" => %{word: "法国", example: "我去年去了法国"},
        "ru" => %{word: "Франция", example: "Я посетил Францию в прошлом году"},
        "ja" => %{word: "フランス", example: "去年フランスを訪れました"},
        "it" => %{word: "Francia", example: "Ho visitato la Francia l'anno scorso"},
        "ar" => %{word: "فرنسا", example: "زرت فرنسا العام الماضي"},
        "pt" => %{word: "França", example: "Eu visitei a França no ano passado"}
      },
      "country_italy" => %{
        "en" => %{word: "Italy", example: "Italy has great food"},
        "fr" => %{word: "Italie", example: "L'Italie a une excellente cuisine"},
        "es" => %{word: "Italia", example: "Italia tiene excelente comida"},
        "zh" => %{word: "意大利", example: "意大利有很棒的食物"},
        "ru" => %{word: "Италия", example: "В Италии отличная еда"},
        "ja" => %{word: "イタリア", example: "イタリアには素晴らしい料理があります"},
        "it" => %{word: "Italia", example: "L'Italia ha un ottimo cibo"},
        "ar" => %{word: "إيطاليا", example: "إيطاليا لديها طعام رائع"},
        "pt" => %{word: "Itália", example: "A Itália tem comida excelente"}
      },
      "country_japan" => %{
        "en" => %{word: "Japan", example: "Japan is in Asia"},
        "fr" => %{word: "Japon", example: "Le Japon est en Asie"},
        "es" => %{word: "Japón", example: "Japón está en Asia"},
        "zh" => %{word: "日本", example: "日本在亚洲"},
        "ru" => %{word: "Япония", example: "Япония находится в Азии"},
        "ja" => %{word: "日本", example: "日本はアジアにあります"},
        "it" => %{word: "Giappone", example: "Il Giappone è in Asia"},
        "ar" => %{word: "اليابان", example: "اليابان في آسيا"},
        "pt" => %{word: "Japão", example: "O Japão fica na Ásia"}
      }
    }
  end
end