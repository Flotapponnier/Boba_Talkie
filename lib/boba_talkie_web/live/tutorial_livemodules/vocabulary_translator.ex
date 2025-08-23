defmodule BobaTalkieWeb.TutorialLive.VocabularyTranslator do
  @moduledoc """
  Handles vocabulary word translations between different interface languages.
  
  This module provides translations for learning vocabulary words so users can see
  the word they're learning alongside its translation in their interface language.
  """

  @doc """
  Get vocabulary word translation in interface language.
  
  Returns nil if learning and interface languages are the same.
  """
  def get_word_translation(learning_word, learning_language, interface_language) do
    # If learning and interface languages are the same, don't show translation
    if learning_language == interface_language do
      nil
    else
      get_vocabulary_translation(learning_word, interface_language)
    end
  end

  @doc """
  Get the translation of a vocabulary word in a specific interface language.
  """
  def get_vocabulary_translation(word, interface_language) do
    # Define translations for ALL vocabulary words across all topics
    translations = get_all_vocabulary_translations()
    
    word_translations = Map.get(translations, word, %{})
    interface_lang_key = String.to_atom(interface_language)
    Map.get(word_translations, interface_lang_key)
  end

  # Private function containing all vocabulary translations
  defp get_all_vocabulary_translations do
    %{
      # Introduction vocabulary - COMPLETE SET
      "Hello" => %{en: "Hello", fr: "Bonjour", es: "Hola", pt: "Olá", it: "Ciao", ru: "Привет", ja: "こんにちは", ar: "مرحبا", zh: "你好"},
      "Bonjour" => %{en: "Hello", fr: "Bonjour", es: "Hola", pt: "Olá", it: "Ciao", ru: "Привет", ja: "こんにちは", ar: "مرحبا", zh: "你好"},
      "Hola" => %{en: "Hello", fr: "Bonjour", es: "Hola", pt: "Olá", it: "Ciao", ru: "Привет", ja: "こんにちは", ar: "مرحبا", zh: "你好"},
      "Name" => %{en: "Name", fr: "Nom", es: "Nombre", pt: "Nome", it: "Nome", ru: "Имя", ja: "名前", ar: "اسم", zh: "名字"},
      "Nom" => %{en: "Name", fr: "Nom", es: "Nombre", pt: "Nome", it: "Nome", ru: "Имя", ja: "名前", ar: "اسم", zh: "名字"},
      "Nice to meet you" => %{en: "Nice to meet you", fr: "Enchanté", es: "Encantado", pt: "Prazer em conhecê-lo", it: "Piacere di conoscerti", ru: "Приятно познакомиться", ja: "はじめまして", ar: "سرور بلقائك", zh: "很高兴认识你"},
      "Enchanté" => %{en: "Nice to meet you", fr: "Enchanté", es: "Encantado", pt: "Prazer em conhecê-lo", it: "Piacere di conoscerti", ru: "Приятно познакомиться", ja: "はじめまして", ar: "سرور بلقائك", zh: "很高兴认识你"},
      "How are you?" => %{en: "How are you?", fr: "Comment allez-vous?", es: "¿Cómo estás?", pt: "Como vai?", it: "Come stai?", ru: "Как дела?", ja: "元気ですか?", ar: "كيف حالك؟", zh: "你好吗？"},
      "Fine" => %{en: "Fine", fr: "Bien", es: "Bien", pt: "Bem", it: "Bene", ru: "Хорошо", ja: "元気です", ar: "بخير", zh: "很好"},
      "Thank you" => %{en: "Thank you", fr: "Merci", es: "Gracias", pt: "Obrigado", it: "Grazie", ru: "Спасибо", ja: "ありがとう", ar: "شكرا", zh: "谢谢"},
      "Merci" => %{en: "Thank you", fr: "Merci", es: "Gracias", pt: "Obrigado", it: "Grazie", ru: "Спасибо", ja: "ありがとう", ar: "شكرا", zh: "谢谢"},
      "Gracias" => %{en: "Thank you", fr: "Merci", es: "Gracias", pt: "Obrigado", it: "Grazie", ru: "Спасибо", ja: "ありがとう", ar: "شكرا", zh: "谢谢"},
      "Please" => %{en: "Please", fr: "S'il vous plaît", es: "Por favor", pt: "Por favor", it: "Per favore", ru: "Пожалуйста", ja: "お願いします", ar: "من فضلك", zh: "请"},
      "Excuse me" => %{en: "Excuse me", fr: "Excusez-moi", es: "Disculpe", pt: "Com licença", it: "Scusi", ru: "Извините", ja: "すみません", ar: "عذراً", zh: "不好意思"},
      "Sorry" => %{en: "Sorry", fr: "Désolé", es: "Lo siento", pt: "Desculpa", it: "Scusa", ru: "Извини", ja: "ごめんなさい", ar: "آسف", zh: "对不起"},
      "Désolé" => %{en: "Sorry", fr: "Désolé", es: "Lo siento", pt: "Desculpa", it: "Scusa", ru: "Извини", ja: "ごめんなさい", ar: "آسف", zh: "对不起"},
      "Yes" => %{en: "Yes", fr: "Oui", es: "Sí", pt: "Sim", it: "Sì", ru: "Да", ja: "はい", ar: "نعم", zh: "是"},
      "No" => %{en: "No", fr: "Non", es: "No", pt: "Não", it: "No", ru: "Нет", ja: "いいえ", ar: "لا", zh: "不"},
      "Goodbye" => %{en: "Goodbye", fr: "Au revoir", es: "Adiós", pt: "Tchau", it: "Ciao", ru: "До свидания", ja: "さようなら", ar: "وداعاً", zh: "再见"},
      "Au revoir" => %{en: "Goodbye", fr: "Au revoir", es: "Adiós", pt: "Tchau", it: "Ciao", ru: "До свидания", ja: "さようなら", ar: "وداعاً", zh: "再见"},
      "See you later" => %{en: "See you later", fr: "À bientôt", es: "Hasta luego", pt: "Até logo", it: "A dopo", ru: "Увидимся позже", ja: "また後で", ar: "أراك لاحقاً", zh: "回头见"},
      "Where" => %{en: "Where", fr: "Où", es: "Dónde", pt: "Onde", it: "Dove", ru: "Где", ja: "どこ", ar: "أين", zh: "哪里"},
      "Où" => %{en: "Where", fr: "Où", es: "Dónde", pt: "Onde", it: "Dove", ru: "Где", ja: "どこ", ar: "أين", zh: "哪里"},
      "From" => %{en: "From", fr: "De", es: "De", pt: "De", it: "Da", ru: "Из", ja: "から", ar: "من", zh: "从"},
      "De" => %{en: "From", fr: "De", es: "De", pt: "De", it: "Da", ru: "Из", ja: "から", ar: "من", zh: "从"},

      # Fruits vocabulary - COMPLETE SET
      "Apple" => %{en: "Apple", fr: "Pomme", es: "Manzana", pt: "Maçã", it: "Mela", ru: "Яблоко", ja: "りんご", ar: "تفاحة", zh: "苹果"},
      "Pomme" => %{en: "Apple", fr: "Pomme", es: "Manzana", pt: "Maçã", it: "Mela", ru: "Яблоко", ja: "りんご", ar: "تفاحة", zh: "苹果"},
      "Manzana" => %{en: "Apple", fr: "Pomme", es: "Manzana", pt: "Maçã", it: "Mela", ru: "Яблоко", ja: "りんご", ar: "تفاحة", zh: "苹果"},
      "Banana" => %{en: "Banana", fr: "Banane", es: "Plátano", pt: "Banana", it: "Banana", ru: "Банан", ja: "バナナ", ar: "موز", zh: "香蕉"},
      "Banane" => %{en: "Banana", fr: "Banane", es: "Plátano", pt: "Banana", it: "Banana", ru: "Банан", ja: "バナナ", ar: "موز", zh: "香蕉"},
      "Orange" => %{en: "Orange", fr: "Orange", es: "Naranja", pt: "Laranja", it: "Arancia", ru: "Апельсин", ja: "オレンジ", ar: "برتقال", zh: "橙子"},
      "Grape" => %{en: "Grape", fr: "Raisin", es: "Uva", pt: "Uva", it: "Uva", ru: "Виноград", ja: "ぶどう", ar: "عنب", zh: "葡萄"},
      "Raisin" => %{en: "Grape", fr: "Raisin", es: "Uva", pt: "Uva", it: "Uva", ru: "Виноград", ja: "ぶどう", ar: "عنب", zh: "葡萄"},
      "Strawberry" => %{en: "Strawberry", fr: "Fraise", es: "Fresa", pt: "Morango", it: "Fragola", ru: "Клубника", ja: "いちご", ar: "فراولة", zh: "草莓"},
      "Fraise" => %{en: "Strawberry", fr: "Fraise", es: "Fresa", pt: "Morango", it: "Fragola", ru: "Клубника", ja: "いちご", ar: "فراولة", zh: "草莓"},
      "Cherry" => %{en: "Cherry", fr: "Cerise", es: "Cereza", pt: "Cereja", it: "Ciliegia", ru: "Вишня", ja: "さくらんぼ", ar: "كرز", zh: "樱桃"},
      "Cerise" => %{en: "Cherry", fr: "Cerise", es: "Cereza", pt: "Cereja", it: "Ciliegia", ru: "Вишня", ja: "さくらんぼ", ar: "كرز", zh: "樱桃"},
      "Peach" => %{en: "Peach", fr: "Pêche", es: "Durazno", pt: "Pêssego", it: "Pesca", ru: "Персик", ja: "桃", ar: "خوخ", zh: "桃子"},
      "Pêche" => %{en: "Peach", fr: "Pêche", es: "Durazno", pt: "Pêssego", it: "Pesca", ru: "Персик", ja: "桃", ar: "خوخ", zh: "桃子"},
      "Pineapple" => %{en: "Pineapple", fr: "Ananas", es: "Piña", pt: "Abacaxi", it: "Ananas", ru: "Ананас", ja: "パイナップル", ar: "أناناس", zh: "菠萝"},
      "Ananas" => %{en: "Pineapple", fr: "Ananas", es: "Piña", pt: "Abacaxi", it: "Ananas", ru: "Ананас", ja: "パイナップル", ar: "أناناس", zh: "菠萝"},
      "Watermelon" => %{en: "Watermelon", fr: "Pastèque", es: "Sandía", pt: "Melancia", it: "Anguria", ru: "Арбуз", ja: "すいか", ar: "بطيخ", zh: "西瓜"},
      "Pastèque" => %{en: "Watermelon", fr: "Pastèque", es: "Sandía", pt: "Melancia", it: "Anguria", ru: "Арбуз", ja: "すいか", ar: "بطيخ", zh: "西瓜"},
      "Lemon" => %{en: "Lemon", fr: "Citron", es: "Limón", pt: "Limão", it: "Limone", ru: "Лимон", ja: "レモン", ar: "ليمون", zh: "柠檬"},
      "Citron" => %{en: "Lemon", fr: "Citron", es: "Limón", pt: "Limão", it: "Limone", ru: "Лимон", ja: "レモン", ar: "ليمون", zh: "柠檬"},
      "Avocado" => %{en: "Avocado", fr: "Avocat", es: "Aguacate", pt: "Abacate", it: "Avocado", ru: "Авокадо", ja: "アボカド", ar: "أفوكادو", zh: "牛油果"},
      "Coconut" => %{en: "Coconut", fr: "Noix de coco", es: "Coco", pt: "Coco", it: "Cocco", ru: "Кокос", ja: "ココナッツ", ar: "جوز الهند", zh: "椰子"},
      "Mango" => %{en: "Mango", fr: "Mangue", es: "Mango", pt: "Manga", it: "Mango", ru: "Манго", ja: "マンゴー", ar: "مانجو", zh: "芒果"},
      "Kiwi" => %{en: "Kiwi", fr: "Kiwi", es: "Kiwi", pt: "Kiwi", it: "Kiwi", ru: "Киви", ja: "キウイ", ar: "كيوي", zh: "猕猴桃"},
      "Tomato" => %{en: "Tomato", fr: "Tomate", es: "Tomate", pt: "Tomate", it: "Pomodoro", ru: "Помидор", ja: "トマト", ar: "طماطم", zh: "西红柿"},
      "Carrot" => %{en: "Carrot", fr: "Carotte", es: "Zanahoria", pt: "Cenoura", it: "Carota", ru: "Морковь", ja: "にんじん", ar: "جزر", zh: "胡萝卜"},
      "Bread" => %{en: "Bread", fr: "Pain", es: "Pan", pt: "Pão", it: "Pane", ru: "Хлеб", ja: "パン", ar: "خبز", zh: "面包"},
      "Milk" => %{en: "Milk", fr: "Lait", es: "Leche", pt: "Leite", it: "Latte", ru: "Молоко", ja: "牛乳", ar: "حليب", zh: "牛奶"},
      "Lait" => %{en: "Milk", fr: "Lait", es: "Leche", pt: "Leite", it: "Latte", ru: "Молоко", ja: "牛乳", ar: "حليب", zh: "牛奶"},
      "Cheese" => %{en: "Cheese", fr: "Fromage", es: "Queso", pt: "Queijo", it: "Formaggio", ru: "Сыр", ja: "チーズ", ar: "جبن", zh: "奶酪"},
      "Fromage" => %{en: "Cheese", fr: "Fromage", es: "Queso", pt: "Queijo", it: "Formaggio", ru: "Сыр", ja: "チーズ", ar: "جبن", zh: "奶酪"},
      "Egg" => %{en: "Egg", fr: "Œuf", es: "Huevo", pt: "Ovo", it: "Uovo", ru: "Яйцо", ja: "卵", ar: "بيضة", zh: "鸡蛋"},
      "Œuf" => %{en: "Egg", fr: "Œuf", es: "Huevo", pt: "Ovo", it: "Uovo", ru: "Яйцо", ja: "卵", ar: "بيضة", zh: "鸡蛋"},

      # Numbers - COMPLETE SET
      "One" => %{en: "One", fr: "Un", es: "Uno", pt: "Um", it: "Uno", ru: "Один", ja: "一", ar: "واحد", zh: "一"},
      "Un" => %{en: "One", fr: "Un", es: "Uno", pt: "Um", it: "Uno", ru: "Один", ja: "一", ar: "واحد", zh: "一"},
      "Two" => %{en: "Two", fr: "Deux", es: "Dos", pt: "Dois", it: "Due", ru: "Два", ja: "二", ar: "اثنان", zh: "二"},
      "Three" => %{en: "Three", fr: "Trois", es: "Tres", pt: "Três", it: "Tre", ru: "Три", ja: "三", ar: "ثلاثة", zh: "三"},
      "Four" => %{en: "Four", fr: "Quatre", es: "Cuatro", pt: "Quatro", it: "Quattro", ru: "Четыре", ja: "四", ar: "أربعة", zh: "四"},
      "Five" => %{en: "Five", fr: "Cinq", es: "Cinco", pt: "Cinco", it: "Cinque", ru: "Пять", ja: "五", ar: "خمسة", zh: "五"},
      "Six" => %{en: "Six", fr: "Six", es: "Seis", pt: "Seis", it: "Sei", ru: "Шесть", ja: "六", ar: "ستة", zh: "六"},
      "Seis" => %{en: "Six", fr: "Six", es: "Seis", pt: "Seis", it: "Sei", ru: "Шесть", ja: "六", ar: "ستة", zh: "六"},
      "Seven" => %{en: "Seven", fr: "Sept", es: "Siete", pt: "Sete", it: "Sette", ru: "Семь", ja: "七", ar: "سبعة", zh: "七"},
      "Sept" => %{en: "Seven", fr: "Sept", es: "Siete", pt: "Sete", it: "Sette", ru: "Семь", ja: "七", ar: "سبعة", zh: "七"},
      "Eight" => %{en: "Eight", fr: "Huit", es: "Ocho", pt: "Oito", it: "Otto", ru: "Восемь", ja: "八", ar: "ثمانية", zh: "八"},
      "Huit" => %{en: "Eight", fr: "Huit", es: "Ocho", pt: "Oito", it: "Otto", ru: "Восемь", ja: "八", ar: "ثمانية", zh: "八"},
      "Nine" => %{en: "Nine", fr: "Neuf", es: "Nueve", pt: "Nove", it: "Nove", ru: "Девять", ja: "九", ar: "تسعة", zh: "九"},
      "Neuf" => %{en: "Nine", fr: "Neuf", es: "Nueve", pt: "Nove", it: "Nove", ru: "Девять", ja: "九", ar: "تسعة", zh: "九"},
      "Ten" => %{en: "Ten", fr: "Dix", es: "Diez", pt: "Dez", it: "Dieci", ru: "Десять", ja: "十", ar: "عشرة", zh: "十"},
      "Dix" => %{en: "Ten", fr: "Dix", es: "Diez", pt: "Dez", it: "Dieci", ru: "Десять", ja: "十", ar: "عشرة", zh: "十"},
      "First" => %{en: "First", fr: "Premier", es: "Primero", pt: "Primeiro", it: "Primo", ru: "Первый", ja: "最初", ar: "الأول", zh: "第一"},
      "Premier" => %{en: "First", fr: "Premier", es: "Primero", pt: "Primeiro", it: "Primo", ru: "Первый", ja: "最初", ar: "الأول", zh: "第一"},
      "Second" => %{en: "Second", fr: "Deuxième", es: "Segundo", pt: "Segundo", it: "Secondo", ru: "Второй", ja: "二番目", ar: "الثاني", zh: "第二"},
      "Seconde" => %{en: "Second", fr: "Seconde", es: "Segundo", pt: "Segundo", it: "Secondo", ru: "Секунда", ja: "秒", ar: "ثانية", zh: "秒"},

      # Colors - COMPLETE SET
      "Red" => %{en: "Red", fr: "Rouge", es: "Rojo", pt: "Vermelho", it: "Rosso", ru: "Красный", ja: "赤", ar: "أحمر", zh: "红色"},
      "Rouge" => %{en: "Red", fr: "Rouge", es: "Rojo", pt: "Vermelho", it: "Rosso", ru: "Красный", ja: "赤", ar: "أحمر", zh: "红色"},
      "Blue" => %{en: "Blue", fr: "Bleu", es: "Azul", pt: "Azul", it: "Blu", ru: "Синий", ja: "青", ar: "أزرق", zh: "蓝色"},
      "Green" => %{en: "Green", fr: "Vert", es: "Verde", pt: "Verde", it: "Verde", ru: "Зеленый", ja: "緑", ar: "أخضر", zh: "绿色"},
      "Yellow" => %{en: "Yellow", fr: "Jaune", es: "Amarillo", pt: "Amarelo", it: "Giallo", ru: "Желтый", ja: "黄色", ar: "أصفر", zh: "黄色"},
      "Purple" => %{en: "Purple", fr: "Violet", es: "Morado", pt: "Roxo", it: "Viola", ru: "Фиолетовый", ja: "紫", ar: "بنفسجي", zh: "紫色"},
      "Pink" => %{en: "Pink", fr: "Rose", es: "Rosa", pt: "Rosa", it: "Rosa", ru: "Розовый", ja: "ピンク", ar: "وردي", zh: "粉色"},
      "Brown" => %{en: "Brown", fr: "Marron", es: "Marrón", pt: "Marrom", it: "Marrone", ru: "Коричневый", ja: "茶色", ar: "بني", zh: "棕色"},
      "Black" => %{en: "Black", fr: "Noir", es: "Negro", pt: "Preto", it: "Nero", ru: "Черный", ja: "黒", ar: "أسود", zh: "黑色"},
      "White" => %{en: "White", fr: "Blanc", es: "Blanco", pt: "Branco", it: "Bianco", ru: "Белый", ja: "白", ar: "أبيض", zh: "白色"},
      "Gray" => %{en: "Gray", fr: "Gris", es: "Gris", pt: "Cinza", it: "Grigio", ru: "Серый", ja: "灰色", ar: "رمادي", zh: "灰色"},
      "Rainbow" => %{en: "Rainbow", fr: "Arc-en-ciel", es: "Arcoíris", pt: "Arco-íris", it: "Arcobaleno", ru: "Радуга", ja: "虹", ar: "قوس قزح", zh: "彩虹"},
      "Bright" => %{en: "Bright", fr: "Brillant", es: "Brillante", pt: "Brilhante", it: "Luminoso", ru: "Яркий", ja: "明るい", ar: "ساطع", zh: "明亮"},
      "Dark" => %{en: "Dark", fr: "Sombre", es: "Oscuro", pt: "Escuro", it: "Scuro", ru: "Темный", ja: "暗い", ar: "مظلم", zh: "暗"},
      "Light" => %{en: "Light", fr: "Clair", es: "Claro", pt: "Claro", it: "Chiaro", ru: "Светлый", ja: "明るい", ar: "فاتح", zh: "浅"},
      "Colorful" => %{en: "Colorful", fr: "Coloré", es: "Colorido", pt: "Colorido", it: "Colorato", ru: "Цветной", ja: "カラフル", ar: "ملون", zh: "多彩"},

      # Bakery - COMPLETE SET
      "Pain" => %{en: "Bread", fr: "Pain", es: "Pan", pt: "Pão", it: "Pane", ru: "Хлеб", ja: "パン", ar: "خبز", zh: "面包"},
      "Croissant" => %{en: "Croissant", fr: "Croissant", es: "Cruasán", pt: "Croissant", it: "Cornetto", ru: "Круассан", ja: "クロワッサン", ar: "كرواسون", zh: "羊角面包"},
      "Bagel" => %{en: "Bagel", fr: "Bagel", es: "Bagel", pt: "Bagel", it: "Bagel", ru: "Бейгл", ja: "ベーグル", ar: "بيجل", zh: "百吉饼"},
      "Pretzel" => %{en: "Pretzel", fr: "Bretzel", es: "Pretzel", pt: "Pretzel", it: "Pretzel", ru: "Крендель", ja: "プレッツェル", ar: "بريتزل", zh: "椒盐卷饼"},
      "Baguette" => %{en: "Baguette", fr: "Baguette", es: "Baguette", pt: "Baguete", it: "Baguette", ru: "Багет", ja: "バゲット", ar: "باغيت", zh: "法棍"},
      "Cake" => %{en: "Cake", fr: "Gâteau", es: "Pastel", pt: "Bolo", it: "Torta", ru: "Торт", ja: "ケーキ", ar: "كعكة", zh: "蛋糕"},
      "Cupcake" => %{en: "Cupcake", fr: "Cupcake", es: "Magdalena", pt: "Cupcake", it: "Cupcake", ru: "Капкейк", ja: "カップケーキ", ar: "كب كيك", zh: "纸杯蛋糕"},
      "Donut" => %{en: "Donut", fr: "Beignet", es: "Donut", pt: "Donut", it: "Ciambella", ru: "Пончик", ja: "ドーナツ", ar: "دونات", zh: "甜甜圈"},
      "Cookie" => %{en: "Cookie", fr: "Biscuit", es: "Galleta", pt: "Biscoito", it: "Biscotto", ru: "Печенье", ja: "クッキー", ar: "بسكويت", zh: "饼干"},
      "Pie" => %{en: "Pie", fr: "Tarte", es: "Pastel", pt: "Torta", it: "Crostata", ru: "Пирог", ja: "パイ", ar: "فطيرة", zh: "派"},

      # Animals - COMPLETE SET
      "Dog" => %{en: "Dog", fr: "Chien", es: "Perro", pt: "Cão", it: "Cane", ru: "Собака", ja: "犬", ar: "كلب", zh: "狗"},
      "Chien" => %{en: "Dog", fr: "Chien", es: "Perro", pt: "Cão", it: "Cane", ru: "Собака", ja: "犬", ar: "كلب", zh: "狗"},
      "Cat" => %{en: "Cat", fr: "Chat", es: "Gato", pt: "Gato", it: "Gatto", ru: "Кошка", ja: "猫", ar: "قطة", zh: "猫"},
      "Rabbit" => %{en: "Rabbit", fr: "Lapin", es: "Conejo", pt: "Coelho", it: "Coniglio", ru: "Кролик", ja: "うさぎ", ar: "أرنب", zh: "兔子"},
      "Bear" => %{en: "Bear", fr: "Ours", es: "Oso", pt: "Urso", it: "Orso", ru: "Медведь", ja: "熊", ar: "دب", zh: "熊"},
      "Panda" => %{en: "Panda", fr: "Panda", es: "Panda", pt: "Panda", it: "Panda", ru: "Панда", ja: "パンダ", ar: "باندا", zh: "熊猫"},
      "Lion" => %{en: "Lion", fr: "Lion", es: "León", pt: "Leão", it: "Leone", ru: "Лев", ja: "ライオン", ar: "أسد", zh: "狮子"},
      "Tiger" => %{en: "Tiger", fr: "Tigre", es: "Tigre", pt: "Tigre", it: "Tigre", ru: "Тигр", ja: "虎", ar: "نمر", zh: "老虎"},
      "Elephant" => %{en: "Elephant", fr: "Éléphant", es: "Elefante", pt: "Elefante", it: "Elefante", ru: "Слон", ja: "象", ar: "فيل", zh: "大象"},
      "Monkey" => %{en: "Monkey", fr: "Singe", es: "Mono", pt: "Macaco", it: "Scimmia", ru: "Обезьяна", ja: "猿", ar: "قرد", zh: "猴子"},
      "Horse" => %{en: "Horse", fr: "Cheval", es: "Caballo", pt: "Cavalo", it: "Cavallo", ru: "Лошадь", ja: "馬", ar: "حصان", zh: "马"},
      "Cow" => %{en: "Cow", fr: "Vache", es: "Vaca", pt: "Vaca", it: "Mucca", ru: "Корова", ja: "牛", ar: "بقرة", zh: "牛"},
      "Pig" => %{en: "Pig", fr: "Cochon", es: "Cerdo", pt: "Porco", it: "Maiale", ru: "Свинья", ja: "豚", ar: "خنزير", zh: "猪"},

      # Restaurant - COMPLETE SET
      "Menu" => %{en: "Menu", fr: "Menu", es: "Menú", pt: "Menu", it: "Menù", ru: "Меню", ja: "メニュー", ar: "قائمة الطعام", zh: "菜单"},
      "Pizza" => %{en: "Pizza", fr: "Pizza", es: "Pizza", pt: "Pizza", it: "Pizza", ru: "Пицца", ja: "ピザ", ar: "بيتزا", zh: "比萨"},
      "Burger" => %{en: "Burger", fr: "Hamburger", es: "Hamburguesa", pt: "Hambúrguer", it: "Hamburger", ru: "Бургер", ja: "バーガー", ar: "برجر", zh: "汉堡"},
      "Fries" => %{en: "Fries", fr: "Frites", es: "Papas fritas", pt: "Batatas fritas", it: "Patatine", ru: "Картофель фри", ja: "フライドポテト", ar: "بطاطس مقلية", zh: "薯条"},
      "Pasta" => %{en: "Pasta", fr: "Pâtes", es: "Pasta", pt: "Macarrão", it: "Pasta", ru: "Паста", ja: "パスタ", ar: "معكرونة", zh: "意大利面"},
      "Salad" => %{en: "Salad", fr: "Salade", es: "Ensalada", pt: "Salada", it: "Insalata", ru: "Салат", ja: "サラダ", ar: "سلطة", zh: "沙拉"},
      "Soup" => %{en: "Soup", fr: "Soupe", es: "Sopa", pt: "Sopa", it: "Zuppa", ru: "Суп", ja: "スープ", ar: "حساء", zh: "汤"},
      "Coffee" => %{en: "Coffee", fr: "Café", es: "Café", pt: "Café", it: "Caffè", ru: "Кофе", ja: "コーヒー", ar: "قهوة", zh: "咖啡"},
      "Water" => %{en: "Water", fr: "Eau", es: "Agua", pt: "Água", it: "Acqua", ru: "Вода", ja: "水", ar: "ماء", zh: "水"},
      "Bill" => %{en: "Bill", fr: "Addition", es: "Cuenta", pt: "Conta", it: "Conto", ru: "Счет", ja: "会計", ar: "فاتورة", zh: "账单"},
      
      # Family - COMPLETE SET
      "Mother" => %{en: "Mother", fr: "Mère", es: "Madre", pt: "Mãe", it: "Madre", ru: "Мать", ja: "母", ar: "أم", zh: "母亲"},
      "Father" => %{en: "Father", fr: "Père", es: "Padre", pt: "Pai", it: "Padre", ru: "Отец", ja: "父", ar: "أب", zh: "父亲"},
      "Sister" => %{en: "Sister", fr: "Sœur", es: "Hermana", pt: "Irmã", it: "Sorella", ru: "Сестра", ja: "姉妹", ar: "أخت", zh: "姐妹"},
      "Brother" => %{en: "Brother", fr: "Frère", es: "Hermano", pt: "Irmão", it: "Fratello", ru: "Брат", ja: "兄弟", ar: "أخ", zh: "兄弟"},
      "Grandmother" => %{en: "Grandmother", fr: "Grand-mère", es: "Abuela", pt: "Avó", it: "Nonna", ru: "Бабушка", ja: "祖母", ar: "جدة", zh: "祖母"},
      "Grandfather" => %{en: "Grandfather", fr: "Grand-père", es: "Abuelo", pt: "Avô", it: "Nonno", ru: "Дедушка", ja: "祖父", ar: "جد", zh: "祖父"},
      "Baby" => %{en: "Baby", fr: "Bébé", es: "Bebé", pt: "Bebê", it: "Bambino", ru: "Малыш", ja: "赤ちゃん", ar: "طفل", zh: "婴儿"},
      "Family" => %{en: "Family", fr: "Famille", es: "Familia", pt: "Família", it: "Famiglia", ru: "Семья", ja: "家族", ar: "عائلة", zh: "家庭"},
      "Aunt" => %{en: "Aunt", fr: "Tante", es: "Tía", pt: "Tia", it: "Zia", ru: "Тетя", ja: "おば", ar: "عمة", zh: "姑妈"},
      "Uncle" => %{en: "Uncle", fr: "Oncle", es: "Tío", pt: "Tio", it: "Zio", ru: "Дядя", ja: "おじ", ar: "عم", zh: "叔叔"},

      # Countries - COMPLETE SET
      "Taiwan" => %{en: "Taiwan", fr: "Taïwan", es: "Taiwán", pt: "Taiwan", it: "Taiwan", ru: "Тайвань", ja: "台湾", ar: "تايوان", zh: "台湾"},
      "France" => %{en: "France", fr: "France", es: "Francia", pt: "França", it: "Francia", ru: "Франция", ja: "フランス", ar: "فرنسا", zh: "法国"},
      "Germany" => %{en: "Germany", fr: "Allemagne", es: "Alemania", pt: "Alemanha", it: "Germania", ru: "Германия", ja: "ドイツ", ar: "ألمانيا", zh: "德国"},
      "Japan" => %{en: "Japan", fr: "Japon", es: "Japón", pt: "Japão", it: "Giappone", ru: "Япония", ja: "日本", ar: "اليابان", zh: "日本"},
      "USA" => %{en: "USA", fr: "États-Unis", es: "Estados Unidos", pt: "EUA", it: "Stati Uniti", ru: "США", ja: "アメリカ", ar: "أمريكا", zh: "美国"},
      "UK" => %{en: "UK", fr: "Royaume-Uni", es: "Reino Unido", pt: "Reino Unido", it: "Regno Unito", ru: "Великобритания", ja: "イギリス", ar: "المملكة المتحدة", zh: "英国"},
      "Italy" => %{en: "Italy", fr: "Italie", es: "Italia", pt: "Itália", it: "Italia", ru: "Италия", ja: "イタリア", ar: "إيطاليا", zh: "意大利"},
      "Spain" => %{en: "Spain", fr: "Espagne", es: "España", pt: "Espanha", it: "Spagna", ru: "Испания", ja: "スペイン", ar: "إسبانيا", zh: "西班牙"},
      "China" => %{en: "China", fr: "Chine", es: "China", pt: "China", it: "Cina", ru: "Китай", ja: "中国", ar: "الصين", zh: "中国"},
      "Canada" => %{en: "Canada", fr: "Canada", es: "Canadá", pt: "Canadá", it: "Canada", ru: "Канада", ja: "カナダ", ar: "كندا", zh: "加拿大"}
    }
  end
end