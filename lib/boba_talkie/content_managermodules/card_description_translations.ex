defmodule BobaTalkie.ContentManagerModules.CardDescriptionTranslations do
  @moduledoc """
  Translations for card descriptions in all interface languages.
  Maps card templates to their translated descriptions.
  """

  @doc """
  Get translated description for a card template in the specified interface language.
  """
  def get_card_description_translation(template, interface_language) do
    translations = get_all_card_description_translations()
    
    case Map.get(translations, template) do
      nil -> template  # Fallback to original if no translation
      lang_map -> Map.get(lang_map, interface_language, template)
    end
  end

  @doc """
  Get all card description translations mapping.
  Structure: %{template => %{language_code => translated_description}}
  """
  def get_all_card_description_translations do
    %{
      # Introduction cards
      "Say _ to greet someone" => %{
        "en" => "Say _ to greet someone",
        "fr" => "Dis _ pour saluer quelqu'un",
        "es" => "Di _ para saludar a alguien", 
        "zh" => "说_来问候某人",
        "ru" => "Скажи _ чтобы поприветствовать кого-то",
        "ja" => "_と言って誰かに挨拶する",
        "it" => "Dì _ per salutare qualcuno",
        "ar" => "قل _ لتحية شخص ما",
        "pt" => "Diga _ para cumprimentar alguém"
      },
      "My _ is Sarah" => %{
        "en" => "My _ is Sarah",
        "fr" => "Mon _ est Sarah",
        "es" => "Mi _ es Sarah",
        "zh" => "我的_是Sarah", 
        "ru" => "Моё _ Сара",
        "ja" => "私の_はサラです",
        "it" => "Il mio _ è Sarah",
        "ar" => "_ي هو سارة",
        "pt" => "Meu _ é Sarah"
      },
      "_ for helping me" => %{
        "en" => "_ for helping me",
        "fr" => "_ de m'avoir aidé",
        "es" => "_ por ayudarme",
        "zh" => "_帮助我",
        "ru" => "_ за помощь",
        "ja" => "助けてくれて_",
        "it" => "_ per avermi aiutato",
        "ar" => "_ لمساعدتي",
        "pt" => "_ por me ajudar"
      },
      "_ to meet you" => %{
        "en" => "_ to meet you",
        "fr" => "_ de te rencontrer",
        "es" => "_ conocerte",
        "zh" => "_遇见你",
        "ru" => "_ познакомиться с тобой",
        "ja" => "お会いできて_",
        "it" => "_ conoscerti",
        "ar" => "_ للقائك",
        "pt" => "_ conhecer você"
      },
      "I am _" => %{
        "en" => "I am _",
        "fr" => "Je suis _",
        "es" => "Yo estoy _",
        "zh" => "我很_",
        "ru" => "Я _",
        "ja" => "私は_です",
        "it" => "Io sono _",
        "ar" => "أنا _",
        "pt" => "Eu estou _"
      },

      # Fruits cards
      "Eat the _" => %{
        "en" => "Eat the _",
        "fr" => "Mange la/le _",
        "es" => "Come la/el _",
        "zh" => "吃_",
        "ru" => "Ешь _",
        "ja" => "_を食べる",
        "it" => "Mangia la/il _",
        "ar" => "كُل الـ_",
        "pt" => "Come a/o _"
      },
      "This is a _" => %{
        "en" => "This is a _",
        "fr" => "C'est un/une _",
        "es" => "Esto es un/una _",
        "zh" => "这是一个_",
        "ru" => "Это _",
        "ja" => "これは_です",
        "it" => "Questo è un/una _",
        "ar" => "هذا/هذه _",
        "pt" => "Isto é um/uma _"
      },
      "The _ is yellow" => %{
        "en" => "The _ is yellow",
        "fr" => "Le/La _ est jaune",
        "es" => "El/La _ es amarillo/a",
        "zh" => "_是黄色的",
        "ru" => "_ жёлтый/жёлтая",
        "ja" => "_は黄色です",
        "it" => "Il/La _ è giallo/a",
        "ar" => "الـ_ أصفر/صفراء",
        "pt" => "O/A _ é amarelo/a"
      },
      "The _ is red" => %{
        "en" => "The _ is red",
        "fr" => "Le/La _ est rouge", 
        "es" => "El/La _ es rojo/a",
        "zh" => "_是红色的",
        "ru" => "_ красный/красная",
        "ja" => "_は赤です",
        "it" => "Il/La _ è rosso/a",
        "ar" => "الـ_ أحمر/حمراء",
        "pt" => "O/A _ é vermelho/a"
      },
      "Cette _ est juteuse" => %{
        "en" => "This _ is juicy",
        "fr" => "Cette _ est juteuse",
        "es" => "Esta _ está jugosa",
        "zh" => "这个_很多汁",
        "ru" => "Этот/Эта _ сочный/сочная",
        "ja" => "この_はジューシーです",
        "it" => "Questa _ è succosa",
        "ar" => "هذا/هذه _ عصير/عصيرة",
        "pt" => "Esta _ está suculenta"
      },
      "Le _ peut courir vite" => %{
        "en" => "The _ can run fast",
        "fr" => "Le _ peut courir vite",
        "es" => "El _ puede correr rápido",
        "zh" => "_可以跑得很快",
        "ru" => "_ может быстро бегать",
        "ja" => "_は速く走ることができます",
        "it" => "Il _ può correre veloce",
        "ar" => "الـ_ يستطيع الجري بسرعة",
        "pt" => "O _ pode correr rápido"
      },
      "J'aime les _ violets" => %{
        "en" => "I like purple _",
        "fr" => "J'aime les _ violets",
        "es" => "Me gustan los _ morados",
        "zh" => "我喜欢紫色的_",
        "ru" => "Мне нравятся фиолетовые _",
        "ja" => "紫の_が好きです",
        "it" => "Mi piacciono i _ viola",
        "ar" => "أحب الـ_ البنفسجية",
        "pt" => "Eu gosto dos _ roxos"
      },
      "Le _ saute dans les arbres" => %{
        "en" => "The _ jumps in the trees",
        "fr" => "Le _ saute dans les arbres",
        "es" => "El _ salta en los árboles",
        "zh" => "_在树上跳跃",
        "ru" => "_ прыгает по деревьям",
        "ja" => "_は木の上で跳ねます",
        "it" => "Il _ salta sugli alberi",
        "ar" => "الـ_ يقفز في الأشجار",
        "pt" => "O _ pula nas árvores"
      },

      # Numbers cards
      "Count to _" => %{
        "en" => "Count to _",
        "fr" => "Compte jusqu'à _",
        "es" => "Cuenta hasta _",
        "zh" => "数到_",
        "ru" => "Считай до _",
        "ja" => "_まで数える",
        "it" => "Conta fino a _",
        "ar" => "عُد إلى _",
        "pt" => "Conta até _"
      },
      "I have _ apples" => %{
        "en" => "I have _ apples",
        "fr" => "J'ai _ pommes",
        "es" => "Tengo _ manzanas",
        "zh" => "我有_个苹果",
        "ru" => "У меня _ яблок",
        "ja" => "_個のリンゴがあります",
        "it" => "Ho _ mele",
        "ar" => "لدي _ تفاحات",
        "pt" => "Eu tenho _ maçãs"
      },

      # Colors cards  
      "The sky is _" => %{
        "en" => "The sky is _",
        "fr" => "Le ciel est _",
        "es" => "El cielo es _",
        "zh" => "天空是_的",
        "ru" => "Небо _",
        "ja" => "空は_です",
        "it" => "Il cielo è _",
        "ar" => "السماء _",
        "pt" => "O céu é _"
      },
      "My shirt is _" => %{
        "en" => "My shirt is _",
        "fr" => "Ma chemise est _",
        "es" => "Mi camisa es _",
        "zh" => "我的衬衫是_的",
        "ru" => "Моя рубашка _",
        "ja" => "私のシャツは_です",
        "it" => "La mia camicia è _",
        "ar" => "قميصي _",
        "pt" => "Minha camisa é _"
      },
      "I like the color _" => %{
        "en" => "I like the color _",
        "fr" => "J'aime la couleur _",
        "es" => "Me gusta el color _",
        "zh" => "我喜欢_颜色",
        "ru" => "Мне нравится _ цвет",
        "ja" => "_色が好きです",
        "it" => "Mi piace il colore _",
        "ar" => "أحب اللون الـ_",
        "pt" => "Eu gosto da cor _"
      },
      "The grass is _" => %{
        "en" => "The grass is _",
        "fr" => "L'herbe est _",
        "es" => "La hierba es _",
        "zh" => "草是_的",
        "ru" => "Трава _",
        "ja" => "草は_です",
        "it" => "L'erba è _",
        "ar" => "العشب _",
        "pt" => "A grama é _"
      },

      # Bakery cards
      "I want a _" => %{
        "en" => "I want a _",
        "fr" => "Je veux un/une _",
        "es" => "Quiero un/una _",
        "zh" => "我想要一个_",
        "ru" => "Я хочу _",
        "ja" => "_が欲しいです",
        "it" => "Voglio un/una _",
        "ar" => "أريد _",
        "pt" => "Eu quero um/uma _"
      },
      "This _ is delicious" => %{
        "en" => "This _ is delicious",
        "fr" => "Ce/Cette _ est délicieux/se",
        "es" => "Este/Esta _ está delicioso/a",
        "zh" => "这个_很美味",
        "ru" => "Этот/Эта _ очень вкусный/вкусная",
        "ja" => "この_は美味しいです",
        "it" => "Questo/Questa _ è delizioso/a",
        "ar" => "هذا/هذه _ لذيذ/لذيذة",
        "pt" => "Este/Esta _ está delicioso/a"
      },

      # Animals cards
      "The _ is cute" => %{
        "en" => "The _ is cute",
        "fr" => "Le/La _ est mignon/ne",
        "es" => "El/La _ es lindo/a",
        "zh" => "_很可爱",
        "ru" => "_ милый/милая",
        "ja" => "_はかわいいです",
        "it" => "Il/La _ è carino/a",
        "ar" => "الـ_ لطيف/لطيفة",
        "pt" => "O/A _ é fofo/a"
      },
      "I have a pet _" => %{
        "en" => "I have a pet _",
        "fr" => "J'ai un/une _ comme animal de compagnie",
        "es" => "Tengo un/una _ como mascota",
        "zh" => "我有一只宠物_",
        "ru" => "У меня есть домашний _",
        "ja" => "ペットの_を飼っています",
        "it" => "Ho un/una _ come animale domestico",
        "ar" => "لدي حيوان أليف _",
        "pt" => "Eu tenho um/uma _ como animal de estimação"
      },
      "Le _ se balance dans les arbres" => %{
        "en" => "The _ swings in the trees",
        "fr" => "Le _ se balance dans les arbres",
        "es" => "El _ se balancea en los árboles",
        "zh" => "_在树上摇摆",
        "ru" => "_ качается на деревьях",
        "ja" => "_は木でぶら下がります",
        "it" => "Il _ si dondola sugli alberi",
        "ar" => "الـ_ يتأرجح في الأشجار",
        "pt" => "O _ se balança nas árvores"
      },

      # Restaurant cards
      "I'd like to order _" => %{
        "en" => "I'd like to order _",
        "fr" => "Je voudrais commander _",
        "es" => "Me gustaría pedir _",
        "zh" => "我想要点_",
        "ru" => "Я хочу заказать _",
        "ja" => "_を注文したいです",
        "it" => "Vorrei ordinare _",
        "ar" => "أود طلب _",
        "pt" => "Eu gostaria de pedir _"
      },
      "Can I have the _" => %{
        "en" => "Can I have the _",
        "fr" => "Puis-je avoir le/la _",
        "es" => "¿Puedo tener el/la _?",
        "zh" => "我可以要_吗",
        "ru" => "Можно мне _",
        "ja" => "_をいただけますか",
        "it" => "Posso avere il/la _",
        "ar" => "هل يمكنني الحصول على الـ_",
        "pt" => "Posso ter o/a _"
      },

      # Family cards
      "This is my _" => %{
        "en" => "This is my _",
        "fr" => "Voici mon/ma _",
        "es" => "Este/Esta es mi _",
        "zh" => "这是我的_",
        "ru" => "Это мой/моя _",
        "ja" => "これは私の_です",
        "it" => "Questo/Questa è il/la mio/a _",
        "ar" => "هذا/هذه _ي",
        "pt" => "Este/Esta é meu/minha _"
      },
      "I have two _" => %{
        "en" => "I have two _",
        "fr" => "J'ai deux _",
        "es" => "Tengo dos _",
        "zh" => "我有两个_",
        "ru" => "У меня два/две _",
        "ja" => "_が二人います",
        "it" => "Ho due _",
        "ar" => "لدي اثنان من الـ_",
        "pt" => "Eu tenho dois/duas _"
      },
      "My _ is kind" => %{
        "en" => "My _ is kind",
        "fr" => "Mon/Ma _ est gentil/le",
        "es" => "Mi _ es amable",
        "zh" => "我的_很善良",
        "ru" => "Мой/Моя _ добрый/добрая",
        "ja" => "私の_は優しいです",
        "it" => "Il/La mio/a _ è gentile",
        "ar" => "_ي لطيف/لطيفة",
        "pt" => "Meu/Minha _ é gentil"
      },
      "I love my _" => %{
        "en" => "I love my _",
        "fr" => "J'aime mon/ma _",
        "es" => "Amo a mi _",
        "zh" => "我爱我的_",
        "ru" => "Я люблю свою/своего _",
        "ja" => "私の_を愛しています",
        "it" => "Amo il/la mio/a _",
        "ar" => "أحب _ي",
        "pt" => "Eu amo meu/minha _"
      },

      # Countries cards
      "I am from _" => %{
        "en" => "I am from _",
        "fr" => "Je viens de _",
        "es" => "Soy de _",
        "zh" => "我来自_",
        "ru" => "Я из _",
        "ja" => "_出身です",
        "it" => "Vengo da _",
        "ar" => "أنا من _",
        "pt" => "Eu sou de _"
      },
      "He is _" => %{
        "en" => "He is _",
        "fr" => "Il est _",
        "es" => "Él es _",
        "zh" => "他是_人",
        "ru" => "Он _",
        "ja" => "彼は_人です",
        "it" => "Lui è _",
        "ar" => "هو _",
        "pt" => "Ele é _"
      },
      "I visited _" => %{
        "en" => "I visited _",
        "fr" => "J'ai visité _",
        "es" => "Visité _",
        "zh" => "我访问过_",
        "ru" => "Я посещал _",
        "ja" => "_を訪れました",
        "it" => "Ho visitato _",
        "ar" => "زرت _",
        "pt" => "Eu visitei _"
      },

      # Additional animal cards - French
      "Le _ est fidèle" => %{
        "en" => "The _ is loyal",
        "fr" => "Le _ est fidèle",
        "es" => "El _ es leal",
        "zh" => "_很忠诚",
        "ru" => "_ верная/верный",
        "ja" => "_は忠実です",
        "it" => "Il _ è leale",
        "ar" => "الـ_ مخلص/مخلصة",
        "pt" => "O _ é leal"
      },
      "Le _ dort au soleil" => %{
        "en" => "The _ sleeps in the sun",
        "fr" => "Le _ dort au soleil",
        "es" => "El _ duerme al sol",
        "zh" => "_在阳光下睡觉",
        "ru" => "_ спит на солнце",
        "ja" => "_は日向で寝ています",
        "it" => "Il _ dorme al sole",
        "ar" => "الـ_ ينام في الشمس",
        "pt" => "O _ dorme no sol"
      },
      "Le _ saute rapidement" => %{
        "en" => "The _ jumps quickly",
        "fr" => "Le _ saute rapidement",
        "es" => "El _ salta rápidamente",
        "zh" => "_跳得很快",
        "ru" => "_ быстро прыгает",
        "ja" => "_は素早く跳びます",
        "it" => "Il _ salta velocemente",
        "ar" => "الـ_ يقفز بسرعة",
        "pt" => "O _ pula rapidamente"
      },
      "L'_ vit dans la forêt" => %{
        "en" => "The _ lives in the forest",
        "fr" => "L'_ vit dans la forêt",
        "es" => "El _ vive en el bosque",
        "zh" => "_住在森林里",
        "ru" => "_ живёт в лесу",
        "ja" => "_は森に住んでいます",
        "it" => "L'_ vive nella foresta",
        "ar" => "الـ_ يعيش في الغابة",
        "pt" => "O _ vive na floresta"
      },
      "Le _ mange du bambou" => %{
        "en" => "The _ eats bamboo",
        "fr" => "Le _ mange du bambou",
        "es" => "El _ come bambú",
        "zh" => "_吃竹子",
        "ru" => "_ ест бамбук",
        "ja" => "_は竹を食べます",
        "it" => "Il _ mangia bambù",
        "ar" => "الـ_ تأكل الخيزران",
        "pt" => "O _ come bambu"
      },
      "Le _ est le roi de la jungle" => %{
        "en" => "The _ is the king of the jungle",
        "fr" => "Le _ est le roi de la jungle",
        "es" => "El _ es el rey de la selva",
        "zh" => "_是丛林之王",
        "ru" => "_ царь зверей",
        "ja" => "_はジャングルの王です",
        "it" => "Il _ è il re della giungla",
        "ar" => "الـ_ ملك الغابة",
        "pt" => "O _ é o rei da selva"
      },
      "Le _ a des rayures" => %{
        "en" => "The _ has stripes",
        "fr" => "Le _ a des rayures",
        "es" => "El _ tiene rayas",
        "zh" => "_有条纹",
        "ru" => "У _ есть полосы",
        "ja" => "_には縞模様があります",
        "it" => "La _ ha le strisce",
        "ar" => "لدى الـ_ خطوط",
        "pt" => "O _ tem listras"
      },
      "L'_ a une longue trompe" => %{
        "en" => "The _ has a long trunk",
        "fr" => "L'_ a une longue trompe",
        "es" => "El _ tiene una trompa larga",
        "zh" => "_有长鼻子",
        "ru" => "У _ длинный хобот",
        "ja" => "_は長い鼻を持っています",
        "it" => "L'_ ha una lunga proboscide",
        "ar" => "لدى الـ_ خرطوم طويل",
        "pt" => "O _ tem uma tromba longa"
      },
      "La _ donne du lait" => %{
        "en" => "The _ gives milk",
        "fr" => "La _ donne du lait",
        "es" => "La _ da leche",
        "zh" => "_产牛奶",
        "ru" => "_ даёт молоко",
        "ja" => "_はミルクを作ります",
        "it" => "La _ dà il latte",
        "ar" => "الـ_ تعطي الحليب",
        "pt" => "A _ dá leite"
      },
      "Le _ est rose" => %{
        "en" => "The _ is pink",
        "fr" => "Le _ est rose",
        "es" => "El _ es rosa",
        "zh" => "_是粉红色的",
        "ru" => "_ розовая/розовый",
        "ja" => "_はピンクです",
        "it" => "Il _ è rosa",
        "ar" => "الـ_ وردي اللون",
        "pt" => "O _ é rosa"
      },

      # Additional universal templates that may appear in any language
      "The _ is loyal" => %{
        "en" => "The _ is loyal",
        "fr" => "Le/La _ est fidèle",
        "es" => "El/La _ es leal",
        "zh" => "_很忠诚",
        "ru" => "_ верная/верный",
        "ja" => "_は忠実です",
        "it" => "Il/La _ è leale",
        "ar" => "الـ_ مخلص/مخلصة",
        "pt" => "O/A _ é leal"
      },
      "The _ sleeps in the sun" => %{
        "en" => "The _ sleeps in the sun",
        "fr" => "Le/La _ dort au soleil",
        "es" => "El/La _ duerme al sol",
        "zh" => "_在阳光下睡觉",
        "ru" => "_ спит на солнце",
        "ja" => "_は日向で寝ています",
        "it" => "Il/La _ dorme al sole",
        "ar" => "الـ_ ينام في الشمس",
        "pt" => "O/A _ dorme no sol"
      },
      "The _ jumps quickly" => %{
        "en" => "The _ jumps quickly",
        "fr" => "Le/La _ saute rapidement",
        "es" => "El/La _ salta rápidamente",
        "zh" => "_跳得很快",
        "ru" => "_ быстро прыгает",
        "ja" => "_は素早く跳びます",
        "it" => "Il/La _ salta velocemente",
        "ar" => "الـ_ يقفز بسرعة",
        "pt" => "O/A _ pula rapidamente"
      },
      "The _ lives in the forest" => %{
        "en" => "The _ lives in the forest",
        "fr" => "Le/La _ vit dans la forêt",
        "es" => "El/La _ vive en el bosque",
        "zh" => "_住在森林里",
        "ru" => "_ живёт в лесу",
        "ja" => "_は森に住んでいます",
        "it" => "Il/La _ vive nella foresta",
        "ar" => "الـ_ يعيش في الغابة",
        "pt" => "O/A _ vive na floresta"
      },
      "The _ eats bamboo" => %{
        "en" => "The _ eats bamboo",
        "fr" => "Le/La _ mange du bambou",
        "es" => "El/La _ come bambú",
        "zh" => "_吃竹子",
        "ru" => "_ ест бамбук",
        "ja" => "_は竹を食べます",
        "it" => "Il/La _ mangia bambù",
        "ar" => "الـ_ تأكل الخيزران",
        "pt" => "O/A _ come bambu"
      },
      "The _ is the king of the jungle" => %{
        "en" => "The _ is the king of the jungle",
        "fr" => "Le/La _ est le roi de la jungle",
        "es" => "El/La _ es el rey de la selva",
        "zh" => "_是丛林之王",
        "ru" => "_ царь зверей",
        "ja" => "_はジャングルの王です",
        "it" => "Il/La _ è il re della giungla",
        "ar" => "الـ_ ملك الغابة",
        "pt" => "O/A _ é o rei da selva"
      },
      "The _ has stripes" => %{
        "en" => "The _ has stripes",
        "fr" => "Le/La _ a des rayures",
        "es" => "El/La _ tiene rayas",
        "zh" => "_有条纹",
        "ru" => "У _ есть полосы",
        "ja" => "_には縞模様があります",
        "it" => "Il/La _ ha le strisce",
        "ar" => "لدى الـ_ خطوط",
        "pt" => "O/A _ tem listras"
      },
      "The _ has a long trunk" => %{
        "en" => "The _ has a long trunk",
        "fr" => "L'_ a une longue trompe",
        "es" => "El/La _ tiene una trompa larga",
        "zh" => "_有长鼻子",
        "ru" => "У _ длинный хобот",
        "ja" => "_は長い鼻を持っています",
        "it" => "L'_ ha una lunga proboscide",
        "ar" => "لدى الـ_ خرطوم طويل",
        "pt" => "O/A _ tem uma tromba longa"
      },
      "The _ swings in trees" => %{
        "en" => "The _ swings in trees",
        "fr" => "Le/La _ se balance dans les arbres",
        "es" => "El/La _ se balancea en los árboles",
        "zh" => "_在树上荡秋千",
        "ru" => "_ качается на деревьях",
        "ja" => "_は木にぶら下がります",
        "it" => "Il/La _ dondola sugli alberi",
        "ar" => "الـ_ يتأرجح في الأشجار",
        "pt" => "O/A _ balança nas árvores"
      },
      "The _ can run fast" => %{
        "en" => "The _ can run fast",
        "fr" => "Le/La _ peut courir vite",
        "es" => "El/La _ puede correr rápido",
        "zh" => "_能跑得很快",
        "ru" => "_ может быстро бежать",
        "ja" => "_は早く走れます",
        "it" => "Il/La _ può correre veloce",
        "ar" => "الـ_ يمكنه الجري بسرعة",
        "pt" => "O/A _ pode correr rápido"
      },
      "The _ gives milk" => %{
        "en" => "The _ gives milk",
        "fr" => "La _ donne du lait",
        "es" => "La _ da leche",
        "zh" => "_产牛奶",
        "ru" => "_ даёт молоко",
        "ja" => "_はミルクを作ります",
        "it" => "La _ dà il latte",
        "ar" => "الـ_ تعطي الحليب",
        "pt" => "A _ dá leite"
      },
      "The _ is pink" => %{
        "en" => "The _ is pink",
        "fr" => "Le/La _ est rose",
        "es" => "El/La _ es rosa",
        "zh" => "_是粉红色的",
        "ru" => "_ розовая/розовый",
        "ja" => "_はピンクです",
        "it" => "Il/La _ è rosa",
        "ar" => "الـ_ وردي اللون",
        "pt" => "O/A _ é rosa"
      },

      # Additional bakery cards
      "The _ is buttery" => %{
        "en" => "The _ is buttery",
        "fr" => "Le/La _ est beurré/e",
        "es" => "El/La _ está mantecoso/a",
        "zh" => "_很黄油味",
        "ru" => "_ маслянистый/маслянистая",
        "ja" => "_はバター味です",
        "it" => "Il/La _ è burroso/a",
        "ar" => "الـ_ طعمه زبدة",
        "pt" => "O/A _ tem gosto de manteiga"
      },
      "How much is the _" => %{
        "en" => "How much is the _",
        "fr" => "Combien coûte le/la _",
        "es" => "¿Cuánto cuesta el/la _?",
        "zh" => "_多少钱",
        "ru" => "Сколько стоит _",
        "ja" => "_はいくらですか",
        "it" => "Quanto costa il/la _",
        "ar" => "كم سعر الـ_",
        "pt" => "Quanto custa o/a _"
      },
      "I'll take two _" => %{
        "en" => "I'll take two _",
        "fr" => "Je prendrai deux _",
        "es" => "Me llevo dos _",
        "zh" => "我要两个_",
        "ru" => "Я возьму два/две _",
        "ja" => "_を二つください",
        "it" => "Prendo due _",
        "ar" => "سآخذ اثنين من الـ_",
        "pt" => "Vou levar dois/duas _"
      },
      "The birthday _ is ready" => %{
        "en" => "The birthday _ is ready",
        "fr" => "Le/La _ d'anniversaire est prêt/e",
        "es" => "El/La _ de cumpleaños está listo/a",
        "zh" => "生日_准备好了",
        "ru" => "Праздничный/праздничная _ готов/готова",
        "ja" => "誕生日_ができました",
        "it" => "Il/La _ di compleanno è pronto/a",
        "ar" => "_ عيد الميلاد جاهز/جاهزة",
        "pt" => "O/A _ de aniversário está pronto/a"
      },
      "I'd like a chocolate _" => %{
        "en" => "I'd like a chocolate _",
        "fr" => "Je voudrais un/une _ au chocolat",
        "es" => "Me gustaría un/una _ de chocolate",
        "zh" => "我想要一个巧克力_",
        "ru" => "Я хочу шоколадный/шоколадную _",
        "ja" => "チョコレート_がほしいです",
        "it" => "Vorrei un/una _ al cioccolato",
        "ar" => "أريد _ بالشوكولاتة",
        "pt" => "Gostaria de um/uma _ de chocolate"
      },
      "The glazed _ looks good" => %{
        "en" => "The glazed _ looks good",
        "fr" => "Le/La _ glacé/e a l'air bon/ne",
        "es" => "El/La _ glaseado/a se ve bien",
        "zh" => "上釉的_看起来不错",
        "ru" => "Глазированный/глазированная _ выглядит хорошо",
        "ja" => "艶をかけた_は美味しそうです",
        "it" => "Il/La _ glassato/a sembra buono/a",
        "ar" => "الـ_ المُزجج يبدو جيداً",
        "pt" => "O/A _ vidrado/a parece bom/boa"
      },
      "These _ are fresh" => %{
        "en" => "These _ are fresh",
        "fr" => "Ces _ sont frais/fraîches",
        "es" => "Estos/estas _ están frescos/as",
        "zh" => "这些_很新鲜",
        "ru" => "Эти _ свежие",
        "ja" => "これらの_は新鮮です",
        "it" => "Questi/queste _ sono freschi/e",
        "ar" => "هذه الـ_ طازجة",
        "pt" => "Estes/estas _ estão frescos/as"
      },
      "The apple _ smells amazing" => %{
        "en" => "The apple _ smells amazing",
        "fr" => "La _ aux pommes sent incroyable",
        "es" => "La _ de manzana huele increíble",
        "zh" => "苹果_闻起来很棒",
        "ru" => "Яблочный/яблочная _ пахнет потрясающе",
        "ja" => "りんごの_はいい匂いがします",
        "it" => "La _ di mele profuma benissimo",
        "ar" => "_ التفاح رائحته مذهلة",
        "pt" => "A _ de maçã cheira incrível"
      },

      # Numbers cards
      "I have _ apple" => %{
        "en" => "I have _ apple",
        "fr" => "J'ai _ pomme",
        "es" => "Tengo _ manzana",
        "zh" => "我有_个苹果",
        "ru" => "У меня есть _ яблоко",
        "ja" => "りんごが_つあります",
        "it" => "Ho _ mela",
        "ar" => "عندي تفاحة _",
        "pt" => "Eu tenho _ maçã"
      },
      "_ cats playing" => %{
        "en" => "_ cats playing",
        "fr" => "_ chats jouent",
        "es" => "_ gatos jugando",
        "zh" => "_只猫在玩",
        "ru" => "_ кошки играют",
        "ja" => "_匹の猫が遊んでいます",
        "it" => "_ gatti stanno giocando",
        "ar" => "_ قطتان تلعبان",
        "pt" => "_ gatos estão brincando"
      },
      "_ toes on feet" => %{
        "en" => "_ toes on feet",
        "fr" => "_ orteils sur les pieds",
        "es" => "_ dedos de los pies",
        "zh" => "脚有_个脚趾",
        "ru" => "На ногах _ пальцев",
        "ja" => "足には_本の指があります",
        "it" => "_ dita dei piedi",
        "ar" => "في القدمين _ أصابع",
        "pt" => "_ dedos dos pés"
      },

      # Colors cards
      "The _ fruit is orange" => %{
        "en" => "The _ fruit is orange",
        "fr" => "Le fruit _ est orange",
        "es" => "La fruta _ es naranja",
        "zh" => "_水果是橙色的",
        "ru" => "Фрукт _ оранжевый",
        "ja" => "_の果物はオレンジ色です",
        "it" => "Il frutto _ è arancione",
        "ar" => "فاكهة الـ_ برتقالية",
        "pt" => "A fruta _ é laranja"
      },

      # Restaurant cards
      "I'll drink _" => %{
        "en" => "I'll drink _",
        "fr" => "Je boirai _",
        "es" => "Beberé _",
        "zh" => "我要喝_",
        "ru" => "Я буду пить _",
        "ja" => "_を飲みます",
        "it" => "Berrò _",
        "ar" => "سأشرب _",
        "pt" => "Vou beber _"
      },
      "The _ is ready" => %{
        "en" => "The _ is ready",
        "fr" => "Le/La _ est prêt/e",
        "es" => "El/La _ está listo/a",
        "zh" => "_做好了",
        "ru" => "_ готов/готова",
        "ja" => "_ができました",
        "it" => "Il/La _ è pronto/a",
        "ar" => "الـ_ جاهز/جاهزة",
        "pt" => "O/A _ está pronto/a"
      },

      # Countries cards
      "_ is famous for cuisine" => %{
        "en" => "_ is famous for cuisine",
        "fr" => "_ est célèbre pour sa cuisine",
        "es" => "_ es famosa por su cocina",
        "zh" => "_以美食闻名",
        "ru" => "_ славится кухней",
        "ja" => "_は料理で有名です",
        "it" => "_ è famosa per la cucina",
        "ar" => "_ مشهورة بالمأكولات",
        "pt" => "_ é famosa pela culinária"
      },
      "_ has cherry blossoms" => %{
        "en" => "_ has cherry blossoms",
        "fr" => "_ a des fleurs de cerisier",
        "es" => "_ tiene flores de cerezo",
        "zh" => "_有樱花",
        "ru" => "В _ красивая сакура",
        "ja" => "_には桜があります",
        "it" => "_ ha fiori di ciliegio",
        "ar" => "_ لديها أزهار الكرz",
        "pt" => "_ tem flores de cerejeira"
      },

      # Additional fruit cards (from French content)
      "La _ est jaune" => %{
        "en" => "The _ is yellow",
        "fr" => "La _ est jaune",
        "es" => "La _ es amarilla",
        "zh" => "_是黄色的",
        "ru" => "_ жёлтый/жёлтая",
        "ja" => "_は黄色です",
        "it" => "La _ è gialla",
        "ar" => "الـ_ أصفر/صفراء",
        "pt" => "A _ é amarela"
      },
      "La _ est rouge" => %{
        "en" => "The _ is red",
        "fr" => "La _ est rouge",
        "es" => "La _ es roja",
        "zh" => "_是红色的",
        "ru" => "_ красный/красная",
        "ja" => "_は赤です",
        "it" => "La _ è rossa",
        "ar" => "الـ_ أحمر/حمراء",
        "pt" => "A _ é vermelha"
      },
      "La _ est mûre" => %{
        "en" => "The _ is ripe",
        "fr" => "La _ est mûre",
        "es" => "La _ está madura",
        "zh" => "_熟了",
        "ru" => "_ спелый/спелая",
        "ja" => "_は熟しています",
        "it" => "La _ è matura",
        "ar" => "الـ_ ناضج/ناضجة",
        "pt" => "A _ está madura"
      },
      "L'_ est tropical" => %{
        "en" => "The _ is tropical",
        "fr" => "L'_ est tropical",
        "es" => "La _ es tropical",
        "zh" => "_是热带的",
        "ru" => "_ тропический/тропическая",
        "ja" => "_は熱帯の果物です",
        "it" => "L'_ è tropicale",
        "ar" => "الـ_ استوائي/استوائية",
        "pt" => "A _ é tropical"
      },
      "La _ est rafraîchissante" => %{
        "en" => "The _ is refreshing",
        "fr" => "La _ est rafraîchissante",
        "es" => "La _ es refrescante",
        "zh" => "_很解渴",
        "ru" => "_ освежающий/освежающая",
        "ja" => "_はさわやかです",
        "it" => "La _ è rinfrescante",
        "ar" => "الـ_ منعش/منعشة",
        "pt" => "A _ é refrescante"
      },
      "Le _ est acide" => %{
        "en" => "The _ is sour",
        "fr" => "Le _ est acide",
        "es" => "El _ es ácido",
        "zh" => "_是酸的",
        "ru" => "_ кислый/кислая",
        "ja" => "_は酸っぱいです",
        "it" => "Il _ è acido",
        "ar" => "الـ_ حامض/حامضة",
        "pt" => "O _ é azedo"
      },
      "L'_ est vert" => %{
        "en" => "The _ is green",
        "fr" => "L'_ est vert",
        "es" => "El _ es verde",
        "zh" => "_是绿色的",
        "ru" => "_ зелёный/зелёная",
        "ja" => "_は緑です",
        "it" => "L'_ è verde",
        "ar" => "الـ_ أخضر/خضراء",
        "pt" => "O _ é verde"
      },
      "La _ est dur" => %{
        "en" => "The _ is hard",
        "fr" => "La _ est dur",
        "es" => "La _ es dura",
        "zh" => "_很硬",
        "ru" => "_ твёрдый/твёрдая",
        "ja" => "_は硬いです",
        "it" => "La _ è dura",
        "ar" => "الـ_ صلب/صلبة",
        "pt" => "A _ é dura"
      },
      "La _ est exotique" => %{
        "en" => "The _ is exotic",
        "fr" => "La _ est exotique",
        "es" => "La _ es exótica",
        "zh" => "_很异国情调",
        "ru" => "_ экзотический/экзотическая",
        "ja" => "_はエキゾチックです",
        "it" => "La _ è esotica",
        "ar" => "الـ_ غريب/غريبة",
        "pt" => "A _ é exótica"
      },
      "Le _ est vert" => %{
        "en" => "The _ is green",
        "fr" => "Le _ est vert",
        "es" => "El _ es verde",
        "zh" => "_是绿色的",
        "ru" => "_ зелёный/зелёная",
        "ja" => "_は緑です",
        "it" => "Il _ è verde",
        "ar" => "الـ_ أخضر/خضراء",
        "pt" => "O _ é verde"
      },
      "Le _ est frais" => %{
        "en" => "The _ is fresh",
        "fr" => "Le _ est frais",
        "es" => "El _ está fresco",
        "zh" => "_很新鲜",
        "ru" => "_ свежий/свежая",
        "ja" => "_は新鮮です",
        "it" => "Il _ è fresco",
        "ar" => "الـ_ طازج/طازجة",
        "pt" => "O _ está fresco"
      },
      "Le _ est blanc" => %{
        "en" => "The _ is white",
        "fr" => "Le _ est blanc",
        "es" => "El _ es blanco",
        "zh" => "_是白色的",
        "ru" => "_ белый/белая",
        "ja" => "_は白です",
        "it" => "Il _ è bianco",
        "ar" => "الـ_ أبيض/بيضاء",
        "pt" => "O _ é branco"
      },
      "Le _ est délicieux" => %{
        "en" => "The _ is delicious",
        "fr" => "Le _ est délicieux",
        "es" => "El _ está delicioso",
        "zh" => "_很美味",
        "ru" => "_ вкусный/вкусная",
        "ja" => "_は美味しいです",
        "it" => "Il _ è delizioso",
        "ar" => "الـ_ لذيذ/لذيذة",
        "pt" => "O _ está delicioso"
      },
      "L'_ est blanc" => %{
        "en" => "The _ is white",
        "fr" => "L'_ est blanc",
        "es" => "El _ es blanco",
        "zh" => "_是白色的",
        "ru" => "_ белый/белая",
        "ja" => "_は白です",
        "it" => "L'_ è bianco",
        "ar" => "الـ_ أبيض/بيضاء",
        "pt" => "O _ é branco"
      },

      # Additional animal cards that were already in French but need universal templates
      "I saw a _ at the zoo" => %{
        "en" => "I saw a _ at the zoo",
        "fr" => "J'ai vu un/une _ au zoo",
        "es" => "Vi un/una _ en el zoológico",
        "zh" => "我在动物园看到了_",
        "ru" => "Я видел/видела _ в зоопарке",
        "ja" => "動物園で_を見ました",
        "it" => "Ho visto un/una _ allo zoo",
        "ar" => "رأيت _ في حديقة الحيوان",
        "pt" => "Vi um/uma _ no zoológico"
      },
      "The _ lives in the jungle" => %{
        "en" => "The _ lives in the jungle",
        "fr" => "Le/La _ vit dans la jungle",
        "es" => "El/La _ vive en la selva",
        "zh" => "_住在丛林里",
        "ru" => "_ живёт в джунглях",
        "ja" => "_はジャングルに住んでいます",
        "it" => "Il/La _ vive nella giungla",
        "ar" => "الـ_ يعيش في الأدغال",
        "pt" => "O/A _ vive na selva"
      }
    }
  end
end