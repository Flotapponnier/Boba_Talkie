defmodule BobaTalkieWeb.TutorialLive.ExampleTranslator do
  @moduledoc """
  Handles example sentence translations for tutorial vocabulary.
  
  This module provides translations for example usage sentences so users can see
  how to use a vocabulary word alongside its translation in their interface language.
  """

  @doc """
  Get example sentence translation in interface language.
  
  Returns nil if learning and interface languages are the same.
  """
  def get_example_meaning(current_item_word, learning_language, interface_language) do
    # If learning and interface languages are the same, don't show translation
    if learning_language == interface_language do
      nil
    else
      get_example_translation(current_item_word, interface_language)
    end
  end

  @doc """
  Get the translation of an example sentence in a specific interface language.
  """
  def get_example_translation(word, interface_language) do
    # Define example sentence translations for ALL vocabulary words
    example_translations = get_all_example_translations()
    
    word_examples = Map.get(example_translations, word, %{})
    interface_lang_key = String.to_atom(interface_language)
    Map.get(word_examples, interface_lang_key)
  end

  # Private function containing all example translations
  defp get_all_example_translations do
    %{
      # Introduction examples - COMPLETE SET
      "Hello" => %{
        en: "Hello, my name is Sarah",
        fr: "Bonjour, je m'appelle Sarah", 
        es: "Hola, me llamo Sarah",
        pt: "Olá, meu nome é Sarah",
        it: "Ciao, mi chiamo Sarah",
        ru: "Привет, меня зовут Сара",
        ja: "こんにちは、私の名前はサラです",
        ar: "مرحبا، اسمي سارة",
        zh: "你好，我叫萨拉"
      },
      "Name" => %{
        en: "My name is John",
        fr: "Je m'appelle John",
        es: "Me llamo John", 
        pt: "Meu nome é John",
        it: "Mi chiamo John",
        ru: "Меня зовут Джон",
        ja: "私の名前はジョンです",
        ar: "اسمي جون",
        zh: "我叫约翰"
      },
      "Nice to meet you" => %{
        en: "Nice to meet you too!",
        fr: "Ravi de vous rencontrer aussi!",
        es: "¡Encantado de conocerte también!",
        pt: "Prazer em conhecê-lo também!",
        it: "Piacere di conoscerti anch'io!",
        ru: "Мне тоже приятно познакомиться!",
        ja: "こちらこそよろしく!",
        ar: "أنا أيضا سرور بلقائك!",
        zh: "我也很高兴认识你!"
      },
      "How are you?" => %{
        en: "How are you today?",
        fr: "Comment allez-vous aujourd'hui?",
        es: "¿Cómo estás hoy?",
        pt: "Como você está hoje?",
        it: "Come stai oggi?",
        ru: "Как дела сегодня?",
        ja: "今日は元気ですか?",
        ar: "كيف حالك اليوم؟",
        zh: "你今天怎么样？"
      },
      "Au revoir" => %{
        en: "Goodbye, see you later",
        fr: "Au revoir, à bientôt",
        es: "Adiós, hasta luego",
        pt: "Tchau, até logo",
        it: "Ciao, a dopo",
        ru: "До свидания, увидимся позже",
        ja: "さようなら、また後で",
        ar: "وداعاً، أراك لاحقاً",
        zh: "再见，回头见"
      },
      "À bientôt" => %{
        en: "See you later, have a good day",
        fr: "À bientôt, passez une bonne journée",
        es: "Hasta luego, que tengas un buen día",
        pt: "Até logo, tenha um bom dia",
        it: "A dopo, buona giornata",
        ru: "Увидимся позже, хорошего дня",
        ja: "また後で、良い一日を",
        ar: "أراك لاحقاً، أتمنى لك يوماً سعيداً",
        zh: "回头见，祝你今天愉快"
      },
      "Où" => %{
        en: "Where are you from?",
        fr: "D'où venez-vous?",
        es: "¿De dónde eres?",
        pt: "De onde você é?",
        it: "Di dove sei?",
        ru: "Откуда вы?",
        ja: "どこから来ましたか?",
        ar: "من أين أنت؟",
        zh: "你来自哪里？"
      },
      "De" => %{
        en: "I'm from Canada",
        fr: "Je viens du Canada",
        es: "Soy de Canadá",
        pt: "Eu sou do Canadá",
        it: "Vengo dal Canada",
        ru: "Я из Канады",
        ja: "カナダから来ました",
        ar: "أنا من كندا",
        zh: "我来自加拿大"
      },
      "Fine" => %{
        en: "I'm fine, thank you",
        fr: "Je vais bien, merci",
        es: "Estoy bien, gracias",
        pt: "Estou bem, obrigado",
        it: "Sto bene, grazie",
        ru: "Я в порядке, спасибо",
        ja: "元気です、ありがとう",
        ar: "أنا بخير، شكرا",
        zh: "我很好，谢谢"
      },
      "Thank you" => %{
        en: "Thank you very much",
        fr: "Merci beaucoup",
        es: "Muchas gracias",
        pt: "Muito obrigado",
        it: "Grazie mille",
        ru: "Большое спасибо",
        ja: "どうもありがとう",
        ar: "شكرا جزيلا",
        zh: "非常感谢"
      },
      "Désolé" => %{
        en: "I'm sorry for being late",
        fr: "Je suis désolé d'être en retard",
        es: "Lo siento por llegar tarde",
        pt: "Desculpa por chegar atrasado",
        it: "Scusa per essere in ritardo",
        ru: "Извини за опоздание",
        ja: "遅れてごめんなさい",
        ar: "آسف للتأخير",
        zh: "对不起我迟到了"
      },
      "S'il vous plaît" => %{
        en: "Please help me",
        fr: "S'il vous plaît, aidez-moi",
        es: "Por favor, ayúdame",
        pt: "Por favor, me ajude",
        it: "Per favore, aiutami",
        ru: "Пожалуйста, помогите мне",
        ja: "お願いします、助けてください",
        ar: "من فضлك ساعدني",
        zh: "请帮助我"
      },
      "Excusez-moi" => %{
        en: "Excuse me, where is the bathroom?",
        fr: "Excusez-moi, où sont les toilettes?",
        es: "Disculpe, ¿dónde está el baño?",
        pt: "Com licença, onde fica o banheiro?",
        it: "Scusi, dov'è il bagno?",
        ru: "Извините, где туалет?",
        ja: "すみません、トイレはどこですか?",
        ar: "عذراً، أين الحمام؟",
        zh: "不好意思，洗手间在哪里？"
      },
      "Please" => %{
        en: "Please help me",
        fr: "S'il vous plaît aidez-moi",
        es: "Por favor ayúdame",
        pt: "Por favor me ajude",
        it: "Per favore aiutami",
        ru: "Пожалуйста, помогите мне",
        ja: "お願いします、手伝って",
        ar: "من فضلك ساعدني",
        zh: "请帮助我"
      },
      "Excuse me" => %{
        en: "Excuse me, where is the bathroom?",
        fr: "Excusez-moi, où sont les toilettes?",
        es: "Disculpe, ¿dónde está el baño?",
        pt: "Com licença, onde fica o banheiro?",
        it: "Scusi, dov'è il bagno?",
        ru: "Извините, где туалет?",
        ja: "すみません、トイレはどこですか?",
        ar: "عذراً، أين دورة المياه؟",
        zh: "不好意思，洗手间在哪里？"
      },
      "Sorry" => %{
        en: "Sorry, I'm late",
        fr: "Désolé, je suis en retard",
        es: "Lo siento, llego tarde",
        pt: "Desculpa, estou atrasado",
        it: "Scusa, sono in ritardo",
        ru: "Извини, я опаздываю",
        ja: "ごめんなさい、遅れました",
        ar: "آسف، أنا متأخر",
        zh: "对不起，我迟到了"
      },
      "Bien" => %{
        en: "I'm fine, thank you",
        fr: "Je vais bien, merci",
        es: "Estoy bien, gracias",
        pt: "Estou bem, obrigado",
        it: "Sto bene, grazie",
        ru: "Я в порядке, спасибо",
        ja: "元気です、ありがとう",
        ar: "أنا بخير، شكراً",
        zh: "我很好，谢谢"
      },
      "Oui" => %{
        en: "Yes, I agree",
        fr: "Oui, je suis d'accord",
        es: "Sí, estoy de acuerdo",
        pt: "Sim, eu concordo",
        it: "Sì, sono d'accordo",
        ru: "Да, я согласен",
        ja: "はい、同感です",
        ar: "نعم، أوافق",
        zh: "是的，我同意"
      },
      "Non" => %{
        en: "No, I don't think so",
        fr: "Non, je ne pense pas",
        es: "No, no lo creo",
        pt: "Não, eu não acho",
        it: "No, non penso",
        ru: "Нет, я так не думаю",
        ja: "いいえ、そう思いません",
        ar: "لا، لا أعتقد ذلك",
        zh: "不，我不这么认为"
      },
      "Yes" => %{
        en: "Yes, I understand",
        fr: "Oui, je comprends",
        es: "Sí, entiendo",
        pt: "Sim, eu entendo",
        it: "Sì, capisco",
        ru: "Да, я понимаю",
        ja: "はい、わかります",
        ar: "نعم، أفهم",
        zh: "是的，我明白"
      },
      "No" => %{
        en: "No, I don't think so",
        fr: "Non, je ne pense pas",
        es: "No, no creo",
        pt: "Não, eu não acho",
        it: "No, non credo",
        ru: "Нет, я так не думаю",
        ja: "いいえ、そう思いません",
        ar: "لا، لا أعتقد ذلك",
        zh: "不，我不这么认为"
      },
      "Goodbye" => %{
        en: "Goodbye, see you later",
        fr: "Au revoir, à bientôt",
        es: "Adiós, hasta luego",
        pt: "Tchau, até logo",
        it: "Ciao, a dopo",
        ru: "До свидания, увидимся позже",
        ja: "さようなら、また後で",
        ar: "وداعاً، أراك لاحقاً",
        zh: "再见，回头见"
      },
      "See you later" => %{
        en: "See you later, have a good day",
        fr: "À bientôt, passez une bonne journée",
        es: "Hasta luego, que tengas un buen día",
        pt: "Até logo, tenha um bom dia",
        it: "A dopo, buona giornata",
        ru: "Увидимся позже, хорошего дня",
        ja: "また後で、良い一日を",
        ar: "أراك لاحقاً، أتمنى لك يوماً سعيداً",
        zh: "回头见，祝你今天愉快"
      },
      "Where" => %{
        en: "Where are you from?",
        fr: "D'où venez-vous?",
        es: "¿De dónde eres?",
        pt: "De onde você é?",
        it: "Di dove sei?",
        ru: "Откуда вы?",
        ja: "どこから来ましたか?",
        ar: "من أين أنت؟",
        zh: "你来自哪里？"
      },
      "From" => %{
        en: "I'm from Canada",
        fr: "Je viens du Canada",
        es: "Soy de Canadá",
        pt: "Eu sou do Canadá",
        it: "Vengo dal Canada",
        ru: "Я из Канады",
        ja: "カナダから来ました",
        ar: "أنا من كندا",
        zh: "我来自加拿大"
      },

      # Fruits examples - COMPLETE SET
      "Apple" => %{
        en: "I eat an apple every day",
        fr: "Je mange une pomme chaque jour",
        es: "Como una manzana cada día",
        pt: "Eu como uma maçã todos os dias",
        it: "Mangio una mela ogni giorno",
        ru: "Я ем яблоко каждый день",
        ja: "毎日りんごを食べます",
        ar: "آكل تفاحة كل يوم",
        zh: "我每天吃一个苹果"
      },
      "Banana" => %{
        en: "The banana is yellow",
        fr: "La banane est jaune",
        es: "El plátano es amarillo", 
        pt: "A banana é amarela",
        it: "La banana è gialla",
        ru: "Банан желтый",
        ja: "バナナは黄色いです",
        ar: "الموز أصفر",
        zh: "香蕉是黄色的"
      },
      "Orange" => %{
        en: "Orange juice is healthy",
        fr: "Le jus d'orange est sain",
        es: "El jugo de naranja es saludable",
        pt: "O suco de laranja é saudável",
        it: "Il succo d'arancia è salutare",
        ru: "Апельсиновый сок полезен",
        ja: "オレンジジュースは健康的です",
        ar: "عصير البرتقال صحي",
        zh: "橙汁很健康"
      },
      "Grape" => %{
        en: "Purple grapes are sweet",
        fr: "Les raisins violets sont sucrés",
        es: "Las uvas moradas son dulces",
        pt: "As uvas roxas são doces",
        it: "L'uva viola è dolce",
        ru: "Фиолетовый виноград сладкий",
        ja: "紫のぶどうは甘いです",
        ar: "العنب الأرجواني حلو",
        zh: "紫葡萄很甜"
      },
      "Raisin" => %{
        en: "Purple grapes are sweet",
        fr: "Les raisins violets sont sucrés",
        es: "Las uvas moradas son dulces",
        pt: "As uvas roxas são doces",
        it: "L'uva viola è dolce",
        ru: "Фиолетовый виноград сладкий",
        ja: "紫のぶどうは甘いです",
        ar: "العنب الأرجواني حلو",
        zh: "紫葡萄很甜"
      },
      "Strawberry" => %{
        en: "Strawberries and cream",
        fr: "Fraises à la crème",
        es: "Fresas con crema",
        pt: "Morangos com creme",
        it: "Fragole con panna",
        ru: "Клубника со сливками",
        ja: "いちごとクリーム",
        ar: "فراولة مع كريم",
        zh: "草莓配奶油"
      },
      "Fraise" => %{
        en: "Strawberries and cream",
        fr: "Fraises à la crème",
        es: "Fresas con crema",
        pt: "Morangos com creme",
        it: "Fragole con panna",
        ru: "Клубника со сливками",
        ja: "いちごとクリーム",
        ar: "فراولة مع كريم",
        zh: "草莓配奶油"
      },
      "Œuf" => %{
        en: "I had scrambled eggs for breakfast",
        fr: "J'ai pris des œufs brouillés au petit-déjeuner",
        es: "Comí huevos revueltos en el desayuno",
        pt: "Comi ovos mexidos no café da manhã",
        it: "Ho mangiato uova strapazzate a colazione",
        ru: "Я ел яичницу на завтрак",
        ja: "朝食にスクランブルエッグを食べました",
        ar: "أكلت بيض مخفوق على الفطار",
        zh: "我早餐吃了炒鸡蛋"
      },
      "Cerise" => %{
        en: "Red cherries are delicious",
        fr: "Les cerises rouges sont délicieuses",
        es: "Las cerezas rojas están deliciosas",
        pt: "As cerejas vermelhas são deliciosas",
        it: "Le ciliegie rosse sono deliziose",
        ru: "Красная вишня вкусная",
        ja: "赤いさくらんぼは美味しいです",
        ar: "الكرز الأحمر لذيذ",
        zh: "红樱桃很美味"
      },
      "Cherry" => %{
        en: "Red cherries are delicious",
        fr: "Les cerises rouges sont délicieuses",
        es: "Las cerezas rojas están deliciosas",
        pt: "As cerejas vermelhas são deliciosas",
        it: "Le ciliegie rosse sono deliziose",
        ru: "Красная вишня вкусная",
        ja: "赤いさくらんぼは美味しいです",
        ar: "الكرز الأحمر لذيذ",
        zh: "红樱桃很美味"
      },
      "Pêche" => %{
        en: "Sweet peach in summer",
        fr: "Pêche sucrée en été",
        es: "Durazno dulce en verano",
        pt: "Pêssego doce no verão",
        it: "Pesca dolce d'estate",
        ru: "Сладкий персик летом",
        ja: "夏の甘い桃",
        ar: "خوخ حلو في الصيف",
        zh: "夏天的甜桃"
      },
      "Peach" => %{
        en: "This peach is very juicy",
        fr: "Cette pêche est très juteuse",
        es: "Este durazno está muy jugoso",
        pt: "Este pêssego está muito suculento",
        it: "Questa pesca è molto succosa",
        ru: "Этот персик очень сочный",
        ja: "この桃はとてもジューシーです",
        ar: "هذا الخوخ عصاري جداً",
        zh: "这个桃子很多汁"
      },
      "Pineapple" => %{
        en: "Pineapple pizza is controversial",
        fr: "La pizza à l'ananas fait débat",
        es: "La pizza con piña es controversial",
        pt: "Pizza de abacaxi é controversa",
        it: "La pizza con ananas è controversa",
        ru: "Пицца с ананасом спорная",
        ja: "パイナップルピザは議論の的です",
        ar: "بيتزا الأناناس مثيرة للجدل",
        zh: "菠萝披萨很有争议"
      },
      "Pastèque" => %{
        en: "Fresh watermelon slices",
        fr: "Tranches de pastèque fraîche",
        es: "Rebanadas de sandía fresca",
        pt: "Fatias de melancia fresca",
        it: "Fette di anguria fresca",
        ru: "Свежие ломтики арбуза",
        ja: "新鮮なすいかのスライス",
        ar: "شرائح بطيخ طازجة",
        zh: "新鲜西瓜片"
      },
      "Ananas" => %{
        en: "Tropical pineapple juice",
        fr: "Jus d'ananas tropical",
        es: "Jugo de piña tropical",
        pt: "Suco de abacaxi tropical",
        it: "Succo di ananas tropicale",
        ru: "Тропический ананасовый сок",
        ja: "トロピカルパイナップルジュース",
        ar: "عصير أناناس استوائي",
        zh: "热带菠萝汁"
      },
      "Watermelon" => %{
        en: "Watermelon is perfect for summer",
        fr: "La pastèque est parfaite pour l'été",
        es: "La sandía es perfecta para el verano",
        pt: "Melancia é perfeita para o verão",
        it: "L'anguria è perfetta per l'estate",
        ru: "Арбуз идеален для лета",
        ja: "すいかは夏にぴったりです",
        ar: "البطيخ مثالي للصيف",
        zh: "西瓜非常适合夏天"
      },
      "Citron" => %{
        en: "Sour lemon for tea",
        fr: "Citron acide pour le thé",
        es: "Limón agrio para el té",
        pt: "Limão azedo para chá",
        it: "Limone aspro per il tè",
        ru: "Кислый лимон для чая",
        ja: "お茶用の酸っぱいレモン",
        ar: "ليمون حامض للشاي",
        zh: "泡茶用的酸柠檬"
      },
      "Lemon" => %{
        en: "Lemon water is refreshing",
        fr: "L'eau citronnée est rafraîchissante",
        es: "El agua con limón es refrescante",
        pt: "Água com limão é refrescante",
        it: "L'acqua con limone è rinfrescante",
        ru: "Лимонная вода освежает",
        ja: "レモン水は爽やかです",
        ar: "ماء الليمون منعش",
        zh: "柠檬水很清爽"
      },
      "Avocado" => %{
        en: "Avocado toast for breakfast",
        fr: "Toast à l'avocat pour le petit-déjeuner",
        es: "Tostada de aguacate para el desayuno",
        pt: "Torrada de abacate no café da manhã",
        it: "Toast con avocado per colazione",
        ru: "Тост с авокадо на завтрак",
        ja: "朝食にアボカドトースト",
        ar: "توست الأفوكادو على الإفطار",
        zh: "早餐吃牛油果吐司"
      },
      "Coconut" => %{
        en: "Coconut milk is creamy",
        fr: "Le lait de coco est crémeux",
        es: "La leche de coco es cremosa",
        pt: "O leite de coco é cremoso",
        it: "Il latte di cocco è cremoso",
        ru: "Кокосовое молоко сливочное",
        ja: "ココナッツミルクはクリーミーです",
        ar: "حليب جوز الهند كريمي",
        zh: "椰奶很香滑"
      },
      "Mango" => %{
        en: "Tropical mango smoothie",
        fr: "Smoothie à la mangue tropicale",
        es: "Batido de mango tropical",
        pt: "Vitamina de manga tropical",
        it: "Frullato di mango tropicale",
        ru: "Тропический смузи из манго",
        ja: "トロピカルマンゴースムージー",
        ar: "عصير المانجو الاستوائي",
        zh: "热带芒果奶昔"
      },
      "Kiwi" => %{
        en: "Kiwi fruit is green inside",
        fr: "Le kiwi est vert à l'intérieur",
        es: "La fruta kiwi es verde por dentro",
        pt: "A fruta kiwi é verde por dentro",
        it: "Il kiwi è verde dentro",
        ru: "Киви зеленый внутри",
        ja: "キウイの中は緑色です",
        ar: "فاكهة الكيوي خضراء من الداخل",
        zh: "猕猴桃里面是绿色的"
      },
      "Tomato" => %{
        en: "Is tomato a fruit or vegetable?",
        fr: "La tomate est-elle un fruit ou un légume?",
        es: "¿El tomate es una fruta o verdura?",
        pt: "O tomate é fruta ou legume?",
        it: "Il pomodoro è un frutto o una verdura?",
        ru: "Помидор - это фрукт или овощ?",
        ja: "トマトは果物それとも野菜？",
        ar: "هل الطماطم فاكهة أم خضار؟",
        zh: "西红柿是水果还是蔬菜？"
      },
      "Carrot" => %{
        en: "Carrots are good for your eyes",
        fr: "Les carottes sont bonnes pour les yeux",
        es: "Las zanahorias son buenas para los ojos",
        pt: "As cenouras são boas para os olhos",
        it: "Le carote fanno bene agli occhi",
        ru: "Морковь полезна для глаз",
        ja: "にんじんは目に良いです",
        ar: "الجزر مفيد للعينين",
        zh: "胡萝卜对眼睛有好处"
      },
      "Bread" => %{
        en: "Fresh bread smells amazing",
        fr: "Le pain frais sent bon",
        es: "El pan fresco huele increíble",
        pt: "Pão fresco tem um cheiro incrível",
        it: "Il pane fresco profuma meravigliosamente",
        ru: "Свежий хлеб пахнет удивительно",
        ja: "焼きたてのパンはいい匂いです",
        ar: "الخبز الطازج رائحته رائعة",
        zh: "新鲜面包闻起来很香"
      },
      "Milk" => %{
        en: "Drink your milk for strong bones",
        fr: "Buvez votre lait pour des os solides",
        es: "Bebe tu leche para huesos fuertes",
        pt: "Beba seu leite para ossos fortes",
        it: "Bevi il latte per ossa forti",
        ru: "Пейте молоко для крепких костей",
        ja: "丈夫な骨のために牛乳を飲みなさい",
        ar: "اشرب الحليب لعظام قوية",
        zh: "喝牛奶能强壮骨骼"
      },
      "Lait" => %{
        en: "Drink your milk for strong bones",
        fr: "Buvez votre lait pour des os solides",
        es: "Bebe tu leche para huesos fuertes",
        pt: "Beba seu leite para ossos fortes",
        it: "Bevi il latte per ossa forti",
        ru: "Пейте молоко для крепких костей",
        ja: "丈夫な骨のために牛乳を飲みなさい",
        ar: "اشرب الحليب لعظام قوية",
        zh: "喝牛奶能强壮骨骼"
      },
      "Fromage" => %{
        en: "I love cheese on my sandwich",
        fr: "J'adore le fromage sur mon sandwich",
        es: "Me encanta el queso en mi sándwich",
        pt: "Eu amo queijo no meu sanduíche",
        it: "Adoro il formaggio nel mio panino",
        ru: "Я люблю сыр в своем бутерброде",
        ja: "サンドイッチにチーズが大好きです",
        ar: "أحب الجبن في شطيرتي",
        zh: "我喜欢在三明治里放奶酪"
      },
      "Cheese" => %{
        en: "I love cheese on my sandwich",
        fr: "J'adore le fromage sur mon sandwich",
        es: "Me encanta el queso en mi sándwich",
        pt: "Eu amo queijo no meu sanduíche",
        it: "Adoro il formaggio nel mio panino",
        ru: "Я люблю сыр в бутерброде",
        ja: "サンドイッチにチーズが大好きです",
        ar: "أحب الجبن في شطيرتي",
        zh: "我喜欢三明治里放奶酪"
      },
      "Egg" => %{
        en: "Scrambled eggs for breakfast",
        fr: "Œufs brouillés pour le petit-déjeuner",
        es: "Huevos revueltos para el desayuno",
        pt: "Ovos mexidos no café da manhã",
        it: "Uova strapazzate per colazione",
        ru: "Яичница на завтрак",
        ja: "朝食にスクランブルエッグ",
        ar: "بيض مخفوق على الإفطار",
        zh: "早餐吃炒鸡蛋"
      },

      # Numbers examples - COMPLETE SET  
      "One" => %{
        en: "I have one apple",
        fr: "J'ai une pomme",
        es: "Tengo una manzana",
        pt: "Eu tenho uma maçã",
        it: "Ho una mela",
        ru: "У меня одно яблоко",
        ja: "りんごが一つあります",
        ar: "عندي تفاحة واحدة",
        zh: "我有一个苹果"
      },
      "Two" => %{
        en: "Two cats are playing",
        fr: "Deux chats jouent",
        es: "Dos gatos están jugando",
        pt: "Dois gatos estão brincando",
        it: "Due gatti stanno giocando", 
        ru: "Две кошки играют",
        ja: "二匹の猫が遊んでいます",
        ar: "قطتان تلعبان",
        zh: "两只猫在玩"
      },
      "Three" => %{
        en: "Count to three",
        fr: "Comptez jusqu'à trois",
        es: "Cuenta hasta tres",
        pt: "Conte até três",
        it: "Conta fino a tre",
        ru: "Считай до трех",
        ja: "三まで数えて",
        ar: "عد إلى ثلاثة",
        zh: "数到三"
      },
      "Four" => %{
        en: "Four wheels on a car",
        fr: "Quatre roues sur une voiture",
        es: "Cuatro ruedas en un coche",
        pt: "Quatro rodas em um carro",
        it: "Quattro ruote su un'auto",
        ru: "Четыре колеса у машины",
        ja: "車には四つの車輪があります",
        ar: "أربع عجلات في السيارة",
        zh: "汽车有四个轮子"
      },
      "Five" => %{
        en: "High five!",
        fr: "Tape-m'en cinq!",
        es: "¡Choca esos cinco!",
        pt: "Bate aqui!",
        it: "Batti il cinque!",
        ru: "Дай пять!",
        ja: "ハイファイブ!",
        ar: "اضرب الخمسة!",
        zh: "击掌！"
      },
      "Six" => %{
        en: "Six sides on a cube",
        fr: "Six faces sur un cube",
        es: "Seis lados en un cubo",
        pt: "Seis lados em um cubo",
        it: "Sei lati su un cubo",
        ru: "Шесть сторон у куба",
        ja: "立方体には六つの面があります",
        ar: "ستة جوانب في المكعب",
        zh: "立方体有六个面"
      },
      "Seven" => %{
        en: "Lucky number seven",
        fr: "Le chiffre porte-bonheur sept",
        es: "El número de la suerte siete",
        pt: "O número da sorte sete",
        it: "Il numero fortunato sette",
        ru: "Счастливое число семь",
        ja: "ラッキーナンバー七",
        ar: "الرقم المحظوظ سبعة",
        zh: "幸运数字七"
      },
      "Eight" => %{
        en: "Eight legs on a spider",
        fr: "Huit pattes sur une araignée",
        es: "Ocho patas en una araña",
        pt: "Oito patas em uma aranha",
        it: "Otto zampe su un ragno",
        ru: "Восемь ног у паука",
        ja: "蜘蛛には八本の足があります",
        ar: "ثمانية أرجل في العنكبوت",
        zh: "蜘蛛有八条腿"
      },
      "Nine" => %{
        en: "Nine lives of a cat",
        fr: "Neuf vies d'un chat",
        es: "Nueve vidas de un gato",
        pt: "Nove vidas de um gato",
        it: "Nove vite di un gatto",
        ru: "Девять жизней кошки",
        ja: "猫の九つの命",
        ar: "تسعة أرواح للقطة",
        zh: "猫有九条命"
      },
      "Ten" => %{
        en: "Ten fingers on your hands",
        fr: "Dix doigts sur vos mains",
        es: "Diez dedos en tus manos",
        pt: "Dez dedos em suas mãos",
        it: "Dieci dita sulle tue mani",
        ru: "Десять пальцев на руках",
        ja: "手には十本の指があります",
        ar: "عشرة أصابع في يديك",
        zh: "你手上有十个手指"
      },
      "First" => %{
        en: "You are the first in line",
        fr: "Vous êtes le premier dans la file",
        es: "Eres el primero en la fila",
        pt: "Você é o primeiro na fila",
        it: "Sei il primo in fila",
        ru: "Ты первый в очереди",
        ja: "あなたが列の最初です",
        ar: "أنت الأول في الطابور",
        zh: "你是队伍里的第一个"
      },
      "Second" => %{
        en: "Wait a second please",
        fr: "Attendez une seconde s'il vous plaît",
        es: "Espera un segundo por favor",
        pt: "Espere um segundo por favor",
        it: "Aspetta un secondo per favore",
        ru: "Подождите секунду, пожалуйста",
        ja: "ちょっと待ってください",
        ar: "انتظر ثانية من فضلك",
        zh: "请等一下"
      },

      # Colors examples - COMPLETE SET
      "Red" => %{
        en: "The rose is red",
        fr: "La rose est rouge",
        es: "La rosa es roja",
        pt: "A rosa é vermelha", 
        it: "La rosa è rossa",
        ru: "Роза красная",
        ja: "薔薇は赤いです",
        ar: "الوردة حمراء",
        zh: "玫瑰是红色的"
      },
      "Blue" => %{
        en: "The sky is blue",
        fr: "Le ciel est bleu",
        es: "El cielo es azul",
        pt: "O céu é azul",
        it: "Il cielo è blu", 
        ru: "Небо синее",
        ja: "空は青いです",
        ar: "السماء زرقاء",
        zh: "天空是蓝色的"
      },
      "Green" => %{
        en: "Grass is green",
        fr: "L'herbe est verte",
        es: "La hierba es verde",
        pt: "A grama é verde",
        it: "L'erba è verde",
        ru: "Трава зеленая",
        ja: "草は緑です",
        ar: "العشب أخضر",
        zh: "草是绿色的"
      },
      "Yellow" => %{
        en: "The sun is yellow",
        fr: "Le soleil est jaune",
        es: "El sol es amarillo",
        pt: "O sol é amarelo",
        it: "Il sole è giallo",
        ru: "Солнце желтое",
        ja: "太陽は黄色です",
        ar: "الشمس صفراء",
        zh: "太阳是黄色的"
      },
      "Purple" => %{
        en: "Purple flowers are beautiful",
        fr: "Les fleurs violettes sont belles",
        es: "Las flores moradas son hermosas",
        pt: "Flores roxas são lindas",
        it: "I fiori viola sono belli",
        ru: "Фиолетовые цветы красивые",
        ja: "紫の花は美しいです",
        ar: "الزهور البنفسجية جميلة",
        zh: "紫色的花很美丽"
      },
      "Pink" => %{
        en: "Pink flamingos in the pond",
        fr: "Flamants roses dans l'étang",
        es: "Flamencos rosas en el estanque",
        pt: "Flamingos rosa no lago",
        it: "Fenicotteri rosa nello stagno",
        ru: "Розовые фламинго в пруду",
        ja: "池にピンクのフラミンゴ",
        ar: "طيور النحام الوردية في البركة",
        zh: "池塘里的粉红火烈鸟"
      },
      "Brown" => %{
        en: "Brown bear in the forest",
        fr: "Ours brun dans la forêt",
        es: "Oso marrón en el bosque",
        pt: "Urso marrom na floresta",
        it: "Orso bruno nella foresta",
        ru: "Бурый медведь в лесу",
        ja: "森の茶色い熊",
        ar: "دب بني في الغابة",
        zh: "森林里的棕熊"
      },
      "Black" => %{
        en: "Black cat crossing the street",
        fr: "Chat noir traversant la rue",
        es: "Gato negro cruzando la calle",
        pt: "Gato preto atravessando a rua",
        it: "Gatto nero che attraversa la strada",
        ru: "Черная кошка переходит дорогу",
        ja: "道を渡る黒い猫",
        ar: "قطة سوداء تعبر الشارع",
        zh: "黑猫穿过街道"
      },
      "White" => %{
        en: "White snow on the mountain",
        fr: "Neige blanche sur la montagne",
        es: "Nieve blanca en la montaña",
        pt: "Neve branca na montanha",
        it: "Neve bianca sulla montagna",
        ru: "Белый снег на горе",
        ja: "山の白い雪",
        ar: "ثلج أبيض على الجبل",
        zh: "山上的白雪"
      },
      "Gray" => %{
        en: "Gray clouds in the sky",
        fr: "Nuages gris dans le ciel",
        es: "Nubes grises en el cielo",
        pt: "Nuvens cinzas no céu",
        it: "Nuvole grigie nel cielo",
        ru: "Серые облака в небе",
        ja: "空の灰色の雲",
        ar: "غيوم رمادية في السماء",
        zh: "天空中的灰云"
      },
      "Rainbow" => %{
        en: "Rainbow after the rain",
        fr: "Arc-en-ciel après la pluie",
        es: "Arcoíris después de la lluvia",
        pt: "Arco-íris depois da chuva",
        it: "Arcobaleno dopo la pioggia",
        ru: "Радуга после дождя",
        ja: "雨の後の虹",
        ar: "قوس قزح بعد المطر",
        zh: "雨后的彩虹"
      },
      "Bright" => %{
        en: "Bright colors are cheerful",
        fr: "Les couleurs vives sont gaies",
        es: "Los colores brillantes son alegres",
        pt: "Cores brilhantes são alegres",
        it: "I colori vivaci sono allegri",
        ru: "Яркие цвета радостные",
        ja: "明るい色は楽しいです",
        ar: "الألوان الساطعة مبهجة",
        zh: "明亮的颜色很欢快"
      },
      "Dark" => %{
        en: "Dark colors look elegant",
        fr: "Les couleurs sombres sont élégantes",
        es: "Los colores oscuros se ven elegantes",
        pt: "Cores escuras ficam elegantes",
        it: "I colori scuri sembrano eleganti",
        ru: "Темные цвета выглядят элегантно",
        ja: "暗い色はエレガントに見えます",
        ar: "الألوان الغامقة تبدو أنيقة",
        zh: "深色看起来很优雅"
      },
      "Light" => %{
        en: "Light blue like the morning sky",
        fr: "Bleu clair comme le ciel du matin",
        es: "Azul claro como el cielo matutino",
        pt: "Azul claro como o céu da manhã",
        it: "Azzurro chiaro come il cielo del mattino",
        ru: "Светло-голубой как утреннее небо",
        ja: "朝の空のような薄い青",
        ar: "أزرق فاتح مثل سماء الصباح",
        zh: "像晨空一样的浅蓝色"
      },
      "Colorful" => %{
        en: "The painting is very colorful",
        fr: "Le tableau est très coloré",
        es: "La pintura es muy colorida",
        pt: "A pintura é muito colorida",
        it: "Il quadro è molto colorato",
        ru: "Картина очень красочная",
        ja: "その絵はとてもカラフルです",
        ar: "اللوحة ملونة جداً",
        zh: "这幅画很多彩"
      },

      # Bakery examples - COMPLETE SET
      "Croissant" => %{
        en: "A buttery French croissant",
        fr: "Un croissant français au beurre",
        es: "Un cruasán francés con mantequilla",
        pt: "Um croissant francês amanteigado",
        it: "Un cornetto francese burroso",
        ru: "Французский масляный круассан",
        ja: "バター香るフランスのクロワッサン",
        ar: "كرواسون فرنسي بالزبدة",
        zh: "法式黄油羊角面包"
      },
      "Bagel" => %{
        en: "Toasted bagel with cream cheese",
        fr: "Bagel grillé avec fromage à la crème",
        es: "Bagel tostado con queso crema",
        pt: "Bagel torrado com cream cheese",
        it: "Bagel tostato con formaggio spalmabile",
        ru: "Поджаренный бейгл с сливочным сыром",
        ja: "クリームチーズのせトーストベーグル",
        ar: "بيجل محمص مع جبنة كريمية",
        zh: "烤百吉饼配奶油奶酪"
      },
      "Pretzel" => %{
        en: "Salty twisted pretzel",
        fr: "Bretzel salé torsadé",
        es: "Pretzel salado retorcido",
        pt: "Pretzel salgado torcido",
        it: "Pretzel salato attorcigliato",
        ru: "Соленый витой крендель",
        ja: "塩味のねじれたプレッツェル",
        ar: "بريتزل مملح ملتوي",
        zh: "咸味扭结椒盐卷饼"
      },
      "Baguette" => %{
        en: "Long French baguette",
        fr: "Longue baguette française",
        es: "Baguette francesa larga",
        pt: "Baguete francesa comprida",
        it: "Lunga baguette francese",
        ru: "Длинный французский багет",
        ja: "長いフランスのバゲット",
        ar: "باغيت فرنسي طويل",
        zh: "长长的法式法棍"
      },
      "Cake" => %{
        en: "Birthday cake with candles",
        fr: "Gâteau d'anniversaire avec des bougies",
        es: "Pastel de cumpleaños con velas",
        pt: "Bolo de aniversário com velas",
        it: "Torta di compleanno con candeline",
        ru: "Торт на день рождения со свечами",
        ja: "ろうそく付きの誕生日ケーキ",
        ar: "كعكة عيد ميلاد مع الشموع",
        zh: "插着蜡烛的生日蛋糕"
      },
      "Cupcake" => %{
        en: "Sweet chocolate cupcake",
        fr: "Cupcake au chocolat sucré",
        es: "Magdalena dulce de chocolate",
        pt: "Cupcake doce de chocolate",
        it: "Dolce cupcake al cioccolato",
        ru: "Сладкий шоколадный капкейк",
        ja: "甘いチョコレートカップケーキ",
        ar: "كب كيك الشوكولاتة الحلو",
        zh: "甜美的巧克力纸杯蛋糕"
      },
      "Donut" => %{
        en: "Glazed donut for breakfast",
        fr: "Beignet glacé pour le petit-déjeuner",
        es: "Donut glaseado para el desayuno",
        pt: "Donut coberto para o café da manhã",
        it: "Ciambella glassata per colazione",
        ru: "Глазированный пончик на завтрак",
        ja: "朝食にグレーズドドーナツ",
        ar: "دونات مزجج على الإفطار",
        zh: "早餐吃上糖霜的甜甜圈"
      },
      "Cookie" => %{
        en: "Chocolate chip cookie",
        fr: "Biscuit aux pépites de chocolat",
        es: "Galleta con chispas de chocolate",
        pt: "Biscoito com gotas de chocolate",
        it: "Biscotto con gocce di cioccolato",
        ru: "Печенье с шоколадной крошкой",
        ja: "チョコチップクッキー",
        ar: "بسكويت برقائق الشوكولاتة",
        zh: "巧克力豆饼干"
      },
      "Pie" => %{
        en: "Apple pie for dessert",
        fr: "Tarte aux pommes en dessert",
        es: "Pastel de manzana de postre",
        pt: "Torta de maçã de sobremesa",
        it: "Crostata di mele per dessert",
        ru: "Яблочный пирог на десерт",
        ja: "デザートにアップルパイ",
        ar: "فطيرة التفاح للحلوى",
        zh: "苹果派作甜点"
      },

      # Animals examples - COMPLETE SET
      "Dog" => %{
        en: "The dog is man's best friend",
        fr: "Le chien est le meilleur ami de l'homme",
        es: "El perro es el mejor amigo del hombre",
        pt: "O cão é o melhor amigo do homem",
        it: "Il cane è il migliore amico dell'uomo",
        ru: "Собака - лучший друг человека",
        ja: "犬は人間の親友です",
        ar: "الكلب أفضل صديق للإنسان",
        zh: "狗是人类最好的朋友"
      },
      "Cat" => %{
        en: "The cat sleeps in the sun", 
        fr: "Le chat dort au soleil",
        es: "El gato duerme al sol",
        pt: "O gato dorme no sol",
        it: "Il gatto dorme al sole",
        ru: "Кошка спит на солнце",
        ja: "猫は日向で眠ります",
        ar: "القطة تنام في الشمس",
        zh: "猫在阳光下睡觉"
      },
      "Rabbit" => %{
        en: "The rabbit hops quickly",
        fr: "Le lapin sautille rapidement",
        es: "El conejo salta rápidamente",
        pt: "O coelho pula rapidamente",
        it: "Il coniglio saltella velocemente",
        ru: "Кролик быстро прыгает",
        ja: "うさぎは素早く跳ねます",
        ar: "الأرنب يقفز بسرعة",
        zh: "兔子跳得很快"
      },
      "Bear" => %{
        en: "The brown bear is strong",
        fr: "L'ours brun est fort",
        es: "El oso marrón es fuerte",
        pt: "O urso marrom é forte",
        it: "L'orso bruno è forte",
        ru: "Бурый медведь сильный",
        ja: "茶色い熊は強いです",
        ar: "الدب البني قوي",
        zh: "棕熊很强壮"
      },
      "Panda" => %{
        en: "Giant panda eats bamboo",
        fr: "Le panda géant mange du bambou",
        es: "El panda gigante come bambú",
        pt: "O panda gigante come bambu",
        it: "Il panda gigante mangia bambù",
        ru: "Гигантская панда ест бамбук",
        ja: "ジャイアントパンダは竹を食べます",
        ar: "الباندا العملاق يأكل الخيزران",
        zh: "大熊猫吃竹子"
      },
      "Lion" => %{
        en: "The lion is king of jungle",
        fr: "Le lion est le roi de la jungle",
        es: "El león es el rey de la selva",
        pt: "O leão é o rei da selva",
        it: "Il leone è il re della giungla",
        ru: "Лев - король джунглей",
        ja: "ライオンはジャングルの王様です",
        ar: "الأسد ملك الغابة",
        zh: "狮子是丛林之王"
      },
      "Tiger" => %{
        en: "The tiger has stripes",
        fr: "Le tigre a des rayures",
        es: "El tigre tiene rayas",
        pt: "O tigre tem listras",
        it: "La tigre ha le strisce",
        ru: "У тигра есть полосы",
        ja: "虎には縞があります",
        ar: "النمر له خطوط",
        zh: "老虎有条纹"
      },
      "Elephant" => %{
        en: "The elephant is very big",
        fr: "L'éléphant est très grand",
        es: "El elefante es muy grande",
        pt: "O elefante é muito grande",
        it: "L'elefante è molto grande",
        ru: "Слон очень большой",
        ja: "象はとても大きいです",
        ar: "الفيل كبير جداً",
        zh: "大象很大"
      },
      "Monkey" => %{
        en: "The monkey swings on trees",
        fr: "Le singe se balance dans les arbres",
        es: "El mono se balancea en los árboles",
        pt: "O macaco se balança nas árvores",
        it: "La scimmia si dondola sugli alberi",
        ru: "Обезьяна качается на деревьях",
        ja: "猿は木でぶら下がります",
        ar: "القرد يتأرجح على الأشجار",
        zh: "猴子在树上荡秋千"
      },
      "Horse" => %{
        en: "The horse runs fast",
        fr: "Le cheval court vite",
        es: "El caballo corre rápido",
        pt: "O cavalo corre rápido",
        it: "Il cavallo corre veloce",
        ru: "Лошадь бегает быстро",
        ja: "馬は速く走ります",
        ar: "الحصان يجري بسرعة",
        zh: "马跑得很快"
      },
      "Cow" => %{
        en: "The cow gives milk",
        fr: "La vache donne du lait",
        es: "La vaca da leche",
        pt: "A vaca dá leite",
        it: "La mucca dà il latte",
        ru: "Корова дает молоко",
        ja: "牛は牛乳を出します",
        ar: "البقرة تعطي الحليب",
        zh: "奶牛产奶"
      },
      "Pig" => %{
        en: "The pig rolls in mud",
        fr: "Le cochon se roule dans la boue",
        es: "El cerdo se revuelca en el barro",
        pt: "O porco se rola na lama",
        it: "Il maiale si rotola nel fango",
        ru: "Свинья валяется в грязи",
        ja: "豚は泥の中を転がります",
        ar: "الخنزير يتمرغ في الطين",
        zh: "猪在泥里打滚"
      },

      # Restaurant examples - COMPLETE SET
      "Menu" => %{
        en: "Can I see the menu please?",
        fr: "Puis-je voir le menu s'il vous plaît?",
        es: "¿Puedo ver el menú por favor?",
        pt: "Posso ver o menu por favor?",
        it: "Posso vedere il menù per favore?",
        ru: "Можно посмотреть меню, пожалуйста?",
        ja: "メニューを見せてください",
        ar: "هل يمكنني رؤية القائمة من فضلك؟",
        zh: "请给我看看菜单好吗？"
      },
      "Pizza" => %{
        en: "I'll have a slice of pizza",
        fr: "Je prendrai une part de pizza",
        es: "Tomaré una rebanada de pizza",
        pt: "Vou querer uma fatia de pizza",
        it: "Prenderò una fetta di pizza",
        ru: "Я возьму кусочек пиццы",
        ja: "ピザを一切れください",
        ar: "سآخذ قطعة بيتزا",
        zh: "我要一片披萨"
      },
      "Burger" => %{
        en: "Cheeseburger with fries",
        fr: "Cheeseburger avec des frites",
        es: "Hamburguesa con queso y papas fritas",
        pt: "Cheeseburger com batatas fritas",
        it: "Cheeseburger con patatine",
        ru: "Чизбургер с картофелем фри",
        ja: "チーズバーガーとフライドポテト",
        ar: "برجر بالجبن مع البطاطس المقلية",
        zh: "芝士汉堡配薯条"
      },
      "Fries" => %{
        en: "French fries are crispy",
        fr: "Les frites françaises sont croustillantes",
        es: "Las papas fritas están crujientes",
        pt: "As batatas fritas estão crocantes",
        it: "Le patatine fritte sono croccanti",
        ru: "Картофель фри хрустящий",
        ja: "フライドポテトはサクサクです",
        ar: "البطاطس المقلية مقرمشة",
        zh: "薯条很脆"
      },
      "Pasta" => %{
        en: "Spaghetti pasta with sauce",
        fr: "Pâtes spaghetti avec sauce",
        es: "Pasta espagueti con salsa",
        pt: "Macarrão espaguete com molho",
        it: "Pasta spaghetti con sugo",
        ru: "Спагетти с соусом",
        ja: "ソース付きスパゲッティ",
        ar: "معكرونة إسباجيتي بالصلصة",
        zh: "意大利面配酱汁"
      },
      "Salad" => %{
        en: "Fresh green salad",
        fr: "Salade verte fraîche",
        es: "Ensalada verde fresca",
        pt: "Salada verde fresca",
        it: "Insalata verde fresca",
        ru: "Свежий зеленый салат",
        ja: "新鮮なグリーンサラダ",
        ar: "سلطة خضراء طازجة",
        zh: "新鲜绿沙拉"
      },
      "Soup" => %{
        en: "Hot chicken soup",
        fr: "Soupe de poulet chaude",
        es: "Sopa de pollo caliente",
        pt: "Sopa de frango quente",
        it: "Zuppa di pollo calda",
        ru: "Горячий куриный суп",
        ja: "熱いチキンスープ",
        ar: "حساء الدجاج الساخن",
        zh: "热鸡汤"
      },
      "Coffee" => %{
        en: "Hot black coffee",
        fr: "Café noir chaud",
        es: "Café negro caliente",
        pt: "Café preto quente",
        it: "Caffè nero caldo",
        ru: "Горячий черный кофе",
        ja: "熱いブラックコーヒー",
        ar: "قهوة سوداء ساخنة",
        zh: "热黑咖啡"
      },
      "Water" => %{
        en: "Glass of cold water",
        fr: "Verre d'eau froide",
        es: "Vaso de agua fría",
        pt: "Copo de água gelada",
        it: "Bicchiere d'acqua fredda",
        ru: "Стакан холодной воды",
        ja: "冷たい水一杯",
        ar: "كوب من الماء البارد",
        zh: "一杯冷水"
      },
      "Bill" => %{
        en: "Can I have the bill?",
        fr: "Puis-je avoir l'addition?",
        es: "¿Puedo tener la cuenta?",
        pt: "Posso ter a conta?",
        it: "Posso avere il conto?",
        ru: "Можно счет?",
        ja: "会計をお願いします",
        ar: "هل يمكنني الحصول على الفاتورة؟",
        zh: "可以给我账单吗？"
      },
      
      # Family examples - COMPLETE SET
      "Mother" => %{
        en: "My mother is very kind",
        fr: "Ma mère est très gentille",
        es: "Mi madre es muy amable",
        pt: "Minha mãe é muito gentil",
        it: "Mia madre è molto gentile",
        ru: "Моя мама очень добрая",
        ja: "私の母はとても優しいです",
        ar: "أمي لطيفة جداً",
        zh: "我妈妈很善良"
      },
      "Father" => %{
        en: "My father works hard",
        fr: "Mon père travaille dur",
        es: "Mi padre trabaja duro",
        pt: "Meu pai trabalha muito",
        it: "Mio padre lavora sodo",
        ru: "Мой отец много работает",
        ja: "私の父は一生懸命働きます",
        ar: "والدي يعمل بجد",
        zh: "我爸爸工作很努力"
      },
      "Sister" => %{
        en: "I have two sisters",
        fr: "J'ai deux sœurs",
        es: "Tengo dos hermanas",
        pt: "Eu tenho duas irmãs",
        it: "Ho due sorelle",
        ru: "У меня две сестры",
        ja: "私には姉妹が二人います",
        ar: "لدي أختان",
        zh: "我有两个姐妹"
      },
      "Brother" => %{
        en: "My brother is younger",
        fr: "Mon frère est plus jeune",
        es: "Mi hermano es menor",
        pt: "Meu irmão é mais novo",
        it: "Mio fratello è più giovane",
        ru: "Мой брат младше",
        ja: "私の兄弟は年下です",
        ar: "أخي أصغر",
        zh: "我弟弟比较小"
      },
      "Grandmother" => %{
        en: "Grandmother tells great stories",
        fr: "Grand-mère raconte de belles histoires",
        es: "La abuela cuenta grandes historias",
        pt: "A avó conta histórias incríveis",
        it: "La nonna racconta belle storie",
        ru: "Бабушка рассказывает замечательные истории",
        ja: "おばあちゃんは素晴らしい話をします",
        ar: "الجدة تحكي قصص رائعة",
        zh: "奶奶讲很棒的故事"
      },
      "Grandfather" => %{
        en: "Grandfather is very wise",
        fr: "Grand-père est très sage",
        es: "El abuelo es muy sabio",
        pt: "O avô é muito sábio",
        it: "Il nonno è molto saggio",
        ru: "Дедушка очень мудрый",
        ja: "おじいちゃんはとても賢いです",
        ar: "الجد حكيم جداً",
        zh: "爷爷很有智慧"
      },
      "Baby" => %{
        en: "The baby is sleeping",
        fr: "Le bébé dort",
        es: "El bebé está durmiendo",
        pt: "O bebê está dormindo",
        it: "Il bambino sta dormendo",
        ru: "Малыш спит",
        ja: "赤ちゃんが眠っています",
        ar: "الطفل ينام",
        zh: "婴儿在睡觉"
      },
      "Family" => %{
        en: "I love my family",
        fr: "J'aime ma famille",
        es: "Amo a mi familia",
        pt: "Eu amo minha família",
        it: "Amo la mia famiglia",
        ru: "Я люблю свою семью",
        ja: "私は家族を愛しています",
        ar: "أحب عائلتي",
        zh: "我爱我的家庭"
      },
      "Aunt" => %{
        en: "My aunt lives nearby",
        fr: "Ma tante habite près d'ici",
        es: "Mi tía vive cerca",
        pt: "Minha tia mora perto",
        it: "Mia zia vive vicino",
        ru: "Моя тетя живет рядом",
        ja: "私のおばは近くに住んでいます",
        ar: "عمتي تعيش بالقرب",
        zh: "我姑妈住得很近"
      },
      "Uncle" => %{
        en: "Uncle visits on weekends",
        fr: "Oncle nous visite le weekend",
        es: "El tío nos visita los fines de semana",
        pt: "O tio nos visita nos fins de semana",
        it: "Lo zio ci visita nei weekend",
        ru: "Дядя навещает по выходным",
        ja: "おじは週末に訪ねてきます",
        ar: "العم يزورنا في عطلات نهاية الأسبوع",
        zh: "叔叔周末来看我们"
      },

      # Countries examples - COMPLETE SET
      "Taiwan" => %{
        en: "Taiwan is a beautiful island",
        fr: "Taïwan est une belle île",
        es: "Taiwán es una hermosa isla",
        pt: "Taiwan é uma ilha bonita",
        it: "Taiwan è una bella isola",
        ru: "Тайвань - красивый остров",
        ja: "台湾は美しい島です",
        ar: "تايوان جزيرة جميلة",
        zh: "台湾是个美丽的岛屿"
      },
      "France" => %{
        en: "France is famous for cuisine",
        fr: "La France est célèbre pour sa cuisine",
        es: "Francia es famosa por su cocina",
        pt: "A França é famosa pela culinária",
        it: "La Francia è famosa per la cucina",
        ru: "Франция славится кухней",
        ja: "フランスは料理で有名です",
        ar: "فرنسا مشهورة بالمطبخ",
        zh: "法国以美食闻名"
      },
      "Germany" => %{
        en: "Germany has great beer",
        fr: "L'Allemagne a une excellente bière",
        es: "Alemania tiene excelente cerveza",
        pt: "A Alemanha tem ótima cerveja",
        it: "La Germania ha un'ottima birra",
        ru: "В Германии отличное пиво",
        ja: "ドイツには素晴らしいビールがあります",
        ar: "ألمانيا لديها بيرة رائعة",
        zh: "德国有很棒的啤酒"
      },
      "Japan" => %{
        en: "Japan has beautiful cherry blossoms",
        fr: "Le Japon a de belles fleurs de cerisier",
        es: "Japón tiene hermosas flores de cerezo",
        pt: "O Japão tem lindas flores de cerejeira",
        it: "Il Giappone ha bei fiori di ciliegio",
        ru: "В Японии красивая сакура",
        ja: "日本には美しい桜があります",
        ar: "اليابان لديه أزهار الكرز الجميلة",
        zh: "日本有美丽的樱花"
      },
      "USA" => %{
        en: "USA is very diverse",
        fr: "Les États-Unis sont très diversifiés",
        es: "Estados Unidos es muy diverso",
        pt: "Os EUA são muito diversos",
        it: "Gli Stati Uniti sono molto diversi",
        ru: "США очень разнообразны",
        ja: "アメリカはとても多様です",
        ar: "أمريكا متنوعة جداً",
        zh: "美国很多元化"
      },
      "UK" => %{
        en: "UK has a rich history",
        fr: "Le Royaume-Uni a une riche histoire",
        es: "El Reino Unido tiene una rica historia",
        pt: "O Reino Unido tem uma rica história",
        it: "Il Regno Unito ha una ricca storia",
        ru: "У Великобритании богатая история",
        ja: "イギリスは豊かな歴史があります",
        ar: "المملكة المتحدة لها تاريخ غني",
        zh: "英国有丰富的历史"
      },
      "Italy" => %{
        en: "Italy makes great pasta",
        fr: "L'Italie fait d'excellentes pâtes",
        es: "Italia hace excelente pasta",
        pt: "A Itália faz ótima massa",
        it: "L'Italia fa un'ottima pasta",
        ru: "Италия делает отличную пасту",
        ja: "イタリアは素晴らしいパスタを作ります",
        ar: "إيطاليا تصنع معكرونة رائعة",
        zh: "意大利做很棒的意大利面"
      },
      "Spain" => %{
        en: "Spain has flamenco dancing",
        fr: "L'Espagne a la danse flamenco",
        es: "España tiene baile flamenco",
        pt: "A Espanha tem dança flamenca",
        it: "La Spagna ha il ballo flamenco",
        ru: "В Испании есть танец фламенко",
        ja: "スペインにはフラメンコダンスがあります",
        ar: "إسبانيا لديها رقص الفلامنكو",
        zh: "西班牙有弗拉门戈舞"
      },
      "China" => %{
        en: "China has a long history",
        fr: "La Chine a une longue histoire",
        es: "China tiene una larga historia",
        pt: "A China tem uma longa história",
        it: "La Cina ha una lunga storia",
        ru: "У Китая долгая история",
        ja: "中国は長い歴史があります",
        ar: "الصين لها تاريخ طويل",
        zh: "中国有悠久的历史"
      },
      "Canada" => %{
        en: "Canada is known for maple syrup",
        fr: "Le Canada est connu pour le sirop d'érable",
        es: "Canadá es conocido por el jarabe de arce",
        pt: "O Canadá é conhecido pelo xarope de bordo",
        it: "Il Canada è noto per lo sciroppo d'acero",
        ru: "Канада известна кленовым сиропом",
        ja: "カナダはメープルシロップで有名です",
        ar: "كندا مشهورة بشراب القيقب",
        zh: "加拿大以枫糖浆闻名"
      },

      # Missing French Introduction Words - COMPLETE SET
      "Bonjour" => %{
        en: "Hello, how are you?",
        fr: "Bonjour, comment allez-vous?",
        es: "Hola, ¿cómo estás?",
        pt: "Olá, como vai?",
        it: "Ciao, come stai?",
        ru: "Привет, как дела?",
        ja: "こんにちは、元気ですか？",
        ar: "مرحبا، كيف حالك？",
        zh: "你好，你好吗？"
      },
      "Enchanté" => %{
        en: "Nice to meet you",
        fr: "Enchanté de vous rencontrer",
        es: "Encantado de conocerte",
        pt: "Prazer em conhecê-lo",
        it: "Piacere di conoscerti",
        ru: "Приятно познакомиться",
        ja: "初めまして",
        ar: "سعيد بلقائك",
        zh: "很高兴见到你"
      },
      "Merci" => %{
        en: "Thank you very much for your help",
        fr: "Merci beaucoup pour votre aide",
        es: "Muchas gracias por tu ayuda",
        pt: "Muito obrigado pela sua ajuda",
        it: "Grazie mille per il tuo aiuto",
        ru: "Большое спасибо за вашу помощь",
        ja: "ご協力ありがとうございました",
        ar: "شكرا جزيلا لمساعدتك",
        zh: "非常感谢您的帮助"
      },
      "Nom" => %{
        en: "What is your name?",
        fr: "Quel est votre nom?",
        es: "¿Cuál es tu nombre?",
        pt: "Qual é o seu nome?",
        it: "Come ti chiami?",
        ru: "Как вас зовут?",
        ja: "お名前は何ですか？",
        ar: "ما اسمك？",
        zh: "您的名字是什么？"
      },
      "Comment allez-vous?" => %{
        en: "How are you?",
        fr: "Comment allez-vous?",
        es: "¿Cómo estás?",
        pt: "Como vai?",
        it: "Come stai?",
        ru: "Как дела?",
        ja: "元気ですか？",
        ar: "كيف حالك؟",
        zh: "你好吗？"
      },

      # Missing French Basic Vocabulary - COMPLETE SET
      "Pomme" => %{
        en: "Apple is a healthy fruit",
        fr: "La pomme est un fruit sain",
        es: "La manzana es una fruta saludable",
        pt: "A maçã é uma fruta saudável",
        it: "La mela è un frutto sano",
        ru: "Яблоко - полезный фрукт",
        ja: "りんごは健康的な果物です",
        ar: "التفاح فاكهة صحية",
        zh: "苹果是健康的水果"
      },
      "Banane" => %{
        en: "Banana",
        fr: "Banane",
        es: "Plátano",
        pt: "Banana",
        it: "Banana",
        ru: "Банан",
        ja: "バナナ",
        ar: "موز",
        zh: "香蕉"
      },
      "Pain" => %{
        en: "Bread",
        fr: "Pain",
        es: "Pan",
        pt: "Pão",
        it: "Pane",
        ru: "Хлеб",
        ja: "パン",
        ar: "خبز",
        zh: "面包"
      },

      # Missing French Numbers - COMPLETE SET
      "Un" => %{
        en: "One",
        fr: "Un",
        es: "Uno",
        pt: "Um",
        it: "Uno",
        ru: "Один",
        ja: "一",
        ar: "واحد",
        zh: "一"
      },
      "Deux" => %{
        en: "Two cats are playing",
        fr: "Deux chats jouent",
        es: "Dos gatos están jugando",
        pt: "Dois gatos estão brincando",
        it: "Due gatti stanno giocando",
        ru: "Две кошки играют",
        ja: "二匹の猫が遊んでいます",
        ar: "قطتان تلعبان",
        zh: "两只猫在玩耍"
      },
      "Trois" => %{
        en: "Three birds in the sky",
        fr: "Trois oiseaux dans le ciel",
        es: "Tres pájaros en el cielo",
        pt: "Três pássaros no céu",
        it: "Tre uccelli nel cielo",
        ru: "Три птицы в небе",
        ja: "空に三羽の鳥",
        ar: "ثلاث طيور في السماء",
        zh: "天空中有三只鸟"
      },
      "Quatre" => %{
        en: "Four seasons in a year",
        fr: "Quatre saisons dans une année",
        es: "Cuatro estaciones en un año",
        pt: "Quatro estações em um ano",
        it: "Quattro stagioni in un anno",
        ru: "Четыре времени года",
        ja: "一年に四つの季節",
        ar: "أربعة فصول في السنة",
        zh: "一年有四个季节"
      },
      "Cinq" => %{
        en: "Five fingers on your hand",
        fr: "Cinq doigts sur votre main",
        es: "Cinco dedos en tu mano",
        pt: "Cinco dedos na sua mão",
        it: "Cinque dita sulla tua mano",
        ru: "Пять пальцев на руке",
        ja: "手に五本の指",
        ar: "خمسة أصابع في يدك",
        zh: "你手上有五个手指"
      },
      "Sept" => %{
        en: "Seven days in a week",
        fr: "Sept jours dans une semaine",
        es: "Siete días en una semana",
        pt: "Sete dias em uma semana",
        it: "Sette giorni in una settimana",
        ru: "Семь дней в неделе",
        ja: "一週間に七日",
        ar: "سبعة أيام في الأسبوع",
        zh: "一周有七天"
      },
      "Huit" => %{
        en: "Eight legs on a spider",
        fr: "Huit pattes sur une araignée",
        es: "Ocho patas en una araña",
        pt: "Oito patas em uma aranha",
        it: "Otto zampe su un ragno",
        ru: "Восемь ног у паука",
        ja: "蜘蛛には八本の脚",
        ar: "ثمانية أرجل على العنكبوت",
        zh: "蜘蛛有八条腿"
      },
      "Neuf" => %{
        en: "Nine lives of a cat",
        fr: "Neuf vies d'un chat",
        es: "Nueve vidas de un gato",
        pt: "Nove vidas de um gato",
        it: "Nove vite di un gatto",
        ru: "Девять жизней кота",
        ja: "猫の九つの命",
        ar: "تسع أرواح للقط",
        zh: "猫有九条命"
      },
      "Dix" => %{
        en: "Ten commandments to follow",
        fr: "Dix commandements à suivre",
        es: "Diez mandamientos que seguir",
        pt: "Dez mandamentos para seguir",
        it: "Dieci comandamenti da seguire",
        ru: "Десять заповедей для соблюдения",
        ja: "従うべき十の戒め",
        ar: "عشر وصايا للاتباع",
        zh: "要遵守的十条戒律"
      },

      # Missing French Colors - COMPLETE SET
      "Rouge" => %{
        en: "Red roses are beautiful",
        fr: "Les roses rouges sont belles",
        es: "Las rosas rojas son hermosas",
        pt: "As rosas vermelhas são lindas",
        it: "Le rose rosse sono belle",
        ru: "Красные розы прекрасны",
        ja: "赤いバラは美しい",
        ar: "الورود الحمراء جميلة",
        zh: "红玫瑰很美丽"
      },
      "Bleu" => %{
        en: "Blue sky on a clear day",
        fr: "Ciel bleu par temps clair",
        es: "Cielo azul en un día claro",
        pt: "Céu azul em um dia claro",
        it: "Cielo blu in una giornata limpida",
        ru: "Голубое небо в ясный день",
        ja: "晴れた日の青い空",
        ar: "السماء الزرقاء في يوم صاف",
        zh: "晴天的蓝色天空"
      },
      "Vert" => %{
        en: "Green grass in the garden",
        fr: "Herbe verte dans le jardin",
        es: "Hierba verde en el jardín",
        pt: "Grama verde no jardim",
        it: "Erba verde nel giardino",
        ru: "Зеленая трава в саду",
        ja: "庭の緑の草",
        ar: "العشب الأخضر في الحديقة",
        zh: "花园里的绿草"
      },
      "Jaune" => %{
        en: "Yellow sun shines bright",
        fr: "Le soleil jaune brille fort",
        es: "El sol amarillo brilla intensamente",
        pt: "O sol amarelo brilha forte",
        it: "Il sole giallo splende luminoso",
        ru: "Желтое солнце ярко светит",
        ja: "黄色い太陽が明るく輝く",
        ar: "الشمس الصفراء تشرق بقوة",
        zh: "黄色的太阳闪闪发光"
      },

      # Missing Chinese Essential Words - KEY SET
      "你好" => %{
        en: "Hello",
        fr: "Bonjour",
        es: "Hola",
        pt: "Olá",
        it: "Ciao",
        ru: "Привет",
        ja: "こんにちは",
        ar: "مرحبا",
        zh: "你好"
      },
      "谢谢" => %{
        en: "Thank you",
        fr: "Merci",
        es: "Gracias",
        pt: "Obrigado",
        it: "Grazie",
        ru: "Спасибо",
        ja: "ありがとう",
        ar: "شكرا",
        zh: "谢谢"
      },
      "名字" => %{
        en: "Name",
        fr: "Nom",
        es: "Nombre",
        pt: "Nome",
        it: "Nome",
        ru: "Имя",
        ja: "名前",
        ar: "اسم",
        zh: "名字"
      },
      "苹果" => %{
        en: "Apple",
        fr: "Pomme",
        es: "Manzana",
        pt: "Maçã",
        it: "Mela",
        ru: "Яблоко",
        ja: "りんご",
        ar: "تفاح",
        zh: "苹果"
      },
      "再见" => %{
        en: "Goodbye",
        fr: "Au revoir",
        es: "Adiós",
        pt: "Tchau",
        it: "Arrivederci",
        ru: "До свидания",
        ja: "さようなら",
        ar: "وداعا",
        zh: "再见"
      },

      # Missing Chinese ContentManager Words
      "见面" => %{
        en: "Nice to meet you",
        fr: "Ravi de vous rencontrer",
        es: "Encantado de conocerte",
        pt: "Prazer em conhecê-lo",
        it: "Piacere di conoscerti",
        ru: "Приятно познакомиться",
        ja: "はじめまして",
        ar: "سعيد بلقائك",
        zh: "见面很高兴"
      },

      # Italian Introduction Words (for when learning language = Italian)
      "Buongiorno" => %{
        en: "Hello, my name is Sarah",
        fr: "Bonjour, je m'appelle Sarah",
        es: "Hola, me llamo Sarah",
        pt: "Olá, meu nome é Sarah",
        it: "Buongiorno, mi chiamo Sarah",
        ru: "Привет, меня зовут Сара",
        ja: "こんにちは、私の名前はサラです",
        ar: "مرحبا، اسمي سارة",
        zh: "你好，我叫萨拉"
      },

      # Spanish Introduction Words (for when learning language = Spanish)  
      "Hola" => %{
        en: "Hello, my name is Sarah",
        fr: "Bonjour, je m'appelle Sarah",
        es: "Hola, me llamo Sarah",
        pt: "Olá, meu nome é Sarah",
        it: "Ciao, mi chiamo Sarah",
        ru: "Привет, меня зовут Сара",
        ja: "こんにちは、私の名前はサラです",
        ar: "مرحبا، اسمي سارة",
        zh: "你好，我叫萨拉"
      }
    }
  end
end