defmodule BobaTalkie.ContentManagerModules.AnimalsContent do
  @moduledoc """
  Animals topic content in multiple languages.
  Contains tutorial vocabulary, game objects, and challenge cards for learning animal names.
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
      title: "Animals",
      description: "Learn animal names and their characteristics",
      emoji: "🐶",
      vocabulary: [
        %{id: "animal_dog", word: "Dog", emoji: "🐶", pronunciation: "dog", meaning: "Domestic animal", example: "The dog is man's best friend"},
        %{id: "animal_cat", word: "Cat", emoji: "🐱", pronunciation: "kat", meaning: "Domestic pet", example: "The cat is sleeping"},
        %{id: "animal_rabbit", word: "Rabbit", emoji: "🐰", pronunciation: "RAB-it", meaning: "Small mammal", example: "The rabbit hops quickly"},
        %{id: "animal_bear", word: "Bear", emoji: "🐻", pronunciation: "bair", meaning: "Large mammal", example: "The bear lives in the forest"},
        %{id: "animal_panda", word: "Panda", emoji: "🐼", pronunciation: "PAN-da", meaning: "Black and white bear", example: "The panda eats bamboo"},
        %{id: "animal_lion", word: "Lion", emoji: "🦁", pronunciation: "LIE-un", meaning: "King of jungle", example: "The lion roars loudly"},
        %{id: "animal_tiger", word: "Tiger", emoji: "🐯", pronunciation: "TIE-gur", meaning: "Striped big cat", example: "The tiger is orange and black"},
        %{id: "animal_elephant", word: "Elephant", emoji: "🐘", pronunciation: "EL-uh-funt", meaning: "Large gray animal", example: "The elephant has a long trunk"},
        %{id: "animal_monkey", word: "Monkey", emoji: "🐵", pronunciation: "MUN-kee", meaning: "Primate", example: "The monkey swings in trees"},
        %{id: "animal_horse", word: "Horse", emoji: "🐴", pronunciation: "hors", meaning: "Riding animal", example: "The horse runs fast"},
        %{id: "animal_cow", word: "Cow", emoji: "🐄", pronunciation: "kow", meaning: "Farm animal", example: "The cow gives milk"},
        %{id: "animal_pig", word: "Pig", emoji: "🐷", pronunciation: "pig", meaning: "Farm animal", example: "The pig is pink and round"}
      ],
      game_objects: [
        %{id: "animal_dog", emoji: "🐶", word: "Dog", pronunciation: "dog"},
        %{id: "animal_cat", emoji: "🐱", word: "Cat", pronunciation: "kat"},
        %{id: "animal_rabbit", emoji: "🐰", word: "Rabbit", pronunciation: "RAB-it"},
        %{id: "animal_bear", emoji: "🐻", word: "Bear", pronunciation: "bair"},
        %{id: "animal_panda", emoji: "🐼", word: "Panda", pronunciation: "PAN-da"},
        %{id: "animal_lion", emoji: "🦁", word: "Lion", pronunciation: "LIE-un"},
        %{id: "animal_tiger", emoji: "🐯", word: "Tiger", pronunciation: "TIE-gur"},
        %{id: "animal_elephant", emoji: "🐘", word: "Elephant", pronunciation: "EL-uh-funt"},
        %{id: "animal_monkey", emoji: "🐵", word: "Monkey", pronunciation: "MUN-kee"},
        %{id: "animal_horse", emoji: "🐴", word: "Horse", pronunciation: "hors"},
        %{id: "animal_cow", emoji: "🐄", word: "Cow", pronunciation: "kow"},
        %{id: "animal_pig", emoji: "🐷", word: "Pig", pronunciation: "pig"}
      ],
      cards: [
        %{id: "animal_dog", template: "The _ is loyal", answer: "dog", description: "Describe pet characteristics"},
        %{id: "animal_cat", template: "The _ sleeps in the sun", answer: "cat", description: "Describe animal behavior"},
        %{id: "animal_rabbit", template: "The _ hops quickly", answer: "rabbit", description: "Describe animal movement"},
        %{id: "animal_bear", template: "The _ lives in the forest", answer: "bear", description: "Describe animal habitat"},
        %{id: "animal_panda", template: "The _ eats bamboo", answer: "panda", description: "Describe animal diet"},
        %{id: "animal_lion", template: "The _ is the king of the jungle", answer: "lion", description: "Describe animal characteristics"},
        %{id: "animal_tiger", template: "The _ has stripes", answer: "tiger", description: "Describe animal features"},
        %{id: "animal_elephant", template: "The _ has a long trunk", answer: "elephant", description: "Describe animal features"},
        %{id: "animal_monkey", template: "The _ swings in trees", answer: "monkey", description: "Describe animal behavior"},
        %{id: "animal_horse", template: "The _ can run fast", answer: "horse", description: "Describe animal abilities"},
        %{id: "animal_cow", template: "The _ gives milk", answer: "cow", description: "Describe animal products"},
        %{id: "animal_pig", template: "The _ is pink", answer: "pig", description: "Describe animal appearance"}
      ]
    }
  end

  # Spanish content
  defp get_spanish_content do
    %{
      title: "Animales",
      description: "Aprende nombres de animales y sus características",
      emoji: "🐶",
      vocabulary: [
        %{id: "animal_dog", word: "Perro", emoji: "🐶", pronunciation: "PEH-rro", meaning: "Animal doméstico", example: "El perro es el mejor amigo del hombre"},
        %{id: "animal_cat", word: "Gato", emoji: "🐱", pronunciation: "GAH-to", meaning: "Mascota doméstica", example: "El gato duerme al sol"},
        %{id: "animal_rabbit", word: "Conejo", emoji: "🐰", pronunciation: "ko-NEH-ho", meaning: "Animal pequeño que salta", example: "El conejo salta rápidamente"},
        %{id: "animal_bear", word: "Oso", emoji: "🐻", pronunciation: "OH-so", meaning: "Animal salvaje grande", example: "El oso pardo es fuerte"},
        %{id: "animal_panda", word: "Panda", emoji: "🐼", pronunciation: "PAN-da", meaning: "Oso blanco y negro", example: "El panda come bambú"},
        %{id: "animal_lion", word: "León", emoji: "🦁", pronunciation: "le-ON", meaning: "Rey de la selva", example: "El león ruge fuerte"},
        %{id: "animal_tiger", word: "Tigre", emoji: "🐯", pronunciation: "TEE-gre", meaning: "Felino con rayas", example: "El tigre es naranja y negro"},
        %{id: "animal_elephant", word: "Elefante", emoji: "🐘", pronunciation: "e-le-FAHN-te", meaning: "Animal gris grande", example: "El elefante tiene una trompa larga"},
        %{id: "animal_monkey", word: "Mono", emoji: "🐵", pronunciation: "MOH-no", meaning: "Primate", example: "El mono se balancea en los árboles"},
        %{id: "animal_horse", word: "Caballo", emoji: "🐴", pronunciation: "ka-BAH-yo", meaning: "Animal de montar", example: "El caballo corre rápido"},
        %{id: "animal_cow", word: "Vaca", emoji: "🐄", pronunciation: "BAH-ka", meaning: "Animal de granja", example: "La vaca da leche"},
        %{id: "animal_pig", word: "Cerdo", emoji: "🐷", pronunciation: "SEHR-do", meaning: "Animal de granja", example: "El cerdo es rosado y redondo"}
      ],
      game_objects: [
        %{id: "animal_dog", emoji: "🐶", word: "Perro", pronunciation: "PEH-rro"},
        %{id: "animal_cat", emoji: "🐱", word: "Gato", pronunciation: "GAH-to"},
        %{id: "animal_rabbit", emoji: "🐰", word: "Conejo", pronunciation: "ko-NEH-ho"},
        %{id: "animal_bear", emoji: "🐻", word: "Oso", pronunciation: "OH-so"},
        %{id: "animal_panda", emoji: "🐼", word: "Panda", pronunciation: "PAN-da"},
        %{id: "animal_lion", emoji: "🦁", word: "León", pronunciation: "le-ON"},
        %{id: "animal_tiger", emoji: "🐯", word: "Tigre", pronunciation: "TEE-gre"},
        %{id: "animal_elephant", emoji: "🐘", word: "Elefante", pronunciation: "e-le-FAHN-te"},
        %{id: "animal_monkey", emoji: "🐵", word: "Mono", pronunciation: "MOH-no"},
        %{id: "animal_horse", emoji: "🐴", word: "Caballo", pronunciation: "ka-BAH-yo"},
        %{id: "animal_cow", emoji: "🐄", word: "Vaca", pronunciation: "BAH-ka"},
        %{id: "animal_pig", emoji: "🐷", word: "Cerdo", pronunciation: "SEHR-do"}
      ],
      cards: [
        %{id: "animal_dog", template: "El _ es leal", answer: "perro", description: "Describir características de mascotas"},
        %{id: "animal_cat", template: "El _ duerme al sol", answer: "gato", description: "Describir comportamiento animal"},
        %{id: "animal_rabbit", template: "El _ salta rápidamente", answer: "conejo", description: "Describir movimiento animal"},
        %{id: "animal_bear", template: "El _ vive en el bosque", answer: "oso", description: "Describir hábitat animal"},
        %{id: "animal_panda", template: "El _ come bambú", answer: "panda", description: "Describir dieta animal"},
        %{id: "animal_lion", template: "El _ es el rey de la selva", answer: "león", description: "Describir características animales"},
        %{id: "animal_tiger", template: "El _ tiene rayas", answer: "tigre", description: "Describir características animales"},
        %{id: "animal_elephant", template: "El _ tiene una trompa larga", answer: "elefante", description: "Describir características animales"},
        %{id: "animal_monkey", template: "El _ se balancea en los árboles", answer: "mono", description: "Describir comportamiento animal"},
        %{id: "animal_horse", template: "El _ puede correr rápido", answer: "caballo", description: "Describir habilidades animales"},
        %{id: "animal_cow", template: "La _ da leche", answer: "vaca", description: "Describir productos animales"},
        %{id: "animal_pig", template: "El _ es rosado", answer: "cerdo", description: "Describir apariencia animal"}
      ]
    }
  end

  # Chinese content
  defp get_chinese_content do
    %{
      title: "动物",
      description: "学习动物名称和它们的特征",
      emoji: "🐶",
      vocabulary: [
        %{id: "animal_dog", word: "狗", emoji: "🐶", pronunciation: "gǒu", romanization: "gǒu", meaning: "家庭动物", example: "狗是人类最好的朋友", example_romanization: "gǒu shì rén lèi zuì hǎo de péng yǒu"},
        %{id: "animal_cat", word: "猫", emoji: "🐱", pronunciation: "māo", romanization: "māo", meaning: "家庭宠物", example: "猫在阳光下睡觉", example_romanization: "māo zài yáng guāng xià shuì jiào"},
        %{id: "animal_rabbit", word: "兔子", emoji: "🐰", pronunciation: "tù zi", romanization: "tù zi", meaning: "小跳跃动物", example: "兔子跳得很快", example_romanization: "tù zi tiào dé hěn kuài"},
        %{id: "animal_bear", word: "熊", emoji: "🐻", pronunciation: "xióng", romanization: "xióng", meaning: "大型野生动物", example: "棕熊很强壮", example_romanization: "zōng xióng hěn qiáng zhuàng"},
        %{id: "animal_panda", word: "熊猫", emoji: "🐼", pronunciation: "xióng māo", romanization: "xióng māo", meaning: "黑白熊", example: "熊猫吃竹子", example_romanization: "xióng māo chī zhú zi"},
        %{id: "animal_lion", word: "狮子", emoji: "🦁", pronunciation: "shī zi", romanization: "shī zi", meaning: "丛林之王", example: "狮子大声咆哮", example_romanization: "shī zi dà shēng páo xiāo"},
        %{id: "animal_tiger", word: "老虎", emoji: "🐯", pronunciation: "lǎo hǔ", romanization: "lǎo hǔ", meaning: "有条纹的大猫", example: "老虎是橙色和黑色的", example_romanization: "lǎo hǔ shì chéng sè hé hēi sè de"},
        %{id: "animal_elephant", word: "大象", emoji: "🐘", pronunciation: "dà xiàng", romanization: "dà xiàng", meaning: "大灰色动物", example: "大象有长鼻子", example_romanization: "dà xiàng yǒu cháng bí zi"},
        %{id: "animal_monkey", word: "猴子", emoji: "🐵", pronunciation: "hóu zi", romanization: "hóu zi", meaning: "灵长类动物", example: "猴子在树上荡秋千", example_romanization: "hóu zi zài shù shàng dàng qiū qiān"},
        %{id: "animal_horse", word: "马", emoji: "🐴", pronunciation: "mǎ", romanization: "mǎ", meaning: "骑乘动物", example: "马跑得很快", example_romanization: "mǎ pǎo dé hěn kuài"},
        %{id: "animal_cow", word: "奶牛", emoji: "🐄", pronunciation: "nǎi niú", romanization: "nǎi niú", meaning: "农场动物", example: "奶牛产牛奶", example_romanization: "nǎi niú chǎn niú nǎi"},
        %{id: "animal_pig", word: "猪", emoji: "🐷", pronunciation: "zhū", romanization: "zhū", meaning: "农场动物", example: "猪是粉红色和圆的", example_romanization: "zhū shì fěn hóng sè hé yuán de"}
      ],
      game_objects: [
        %{id: "animal_dog", emoji: "🐶", word: "狗", pronunciation: "gǒu", romanization: "gǒu"},
        %{id: "animal_cat", emoji: "🐱", word: "猫", pronunciation: "māo", romanization: "māo"},
        %{id: "animal_rabbit", emoji: "🐰", word: "兔子", pronunciation: "tù zi", romanization: "tù zi"},
        %{id: "animal_bear", emoji: "🐻", word: "熊", pronunciation: "xióng", romanization: "xióng"},
        %{id: "animal_panda", emoji: "🐼", word: "熊猫", pronunciation: "xióng māo", romanization: "xióng māo"},
        %{id: "animal_lion", emoji: "🦁", word: "狮子", pronunciation: "shī zi", romanization: "shī zi"},
        %{id: "animal_tiger", emoji: "🐯", word: "老虎", pronunciation: "lǎo hǔ", romanization: "lǎo hǔ"},
        %{id: "animal_elephant", emoji: "🐘", word: "大象", pronunciation: "dà xiàng", romanization: "dà xiàng"},
        %{id: "animal_monkey", emoji: "🐵", word: "猴子", pronunciation: "hóu zi", romanization: "hóu zi"},
        %{id: "animal_horse", emoji: "🐴", word: "马", pronunciation: "mǎ", romanization: "mǎ"},
        %{id: "animal_cow", emoji: "🐄", word: "奶牛", pronunciation: "nǎi niú", romanization: "nǎi niú"},
        %{id: "animal_pig", emoji: "🐷", word: "猪", pronunciation: "zhū", romanization: "zhū"}
      ],
      cards: [
        %{id: "animal_dog", template: "_很忠诚", answer: "狗", romanization: "gǒu", description: "描述宠物特征"},
        %{id: "animal_cat", template: "_在阳光下睡觉", answer: "猫", romanization: "māo", description: "描述动物行为"},
        %{id: "animal_rabbit", template: "_跳得很快", answer: "兔子", romanization: "tù zi", description: "描述动物运动"},
        %{id: "animal_bear", template: "_住在森林里", answer: "熊", romanization: "xióng", description: "描述动物栖息地"},
        %{id: "animal_panda", template: "_吃竹子", answer: "熊猫", romanization: "xióng māo", description: "描述动物饮食"},
        %{id: "animal_lion", template: "_是丛林之王", answer: "狮子", romanization: "shī zi", description: "描述动物特征"},
        %{id: "animal_tiger", template: "_有条纹", answer: "老虎", romanization: "lǎo hǔ", description: "描述动物特征"},
        %{id: "animal_elephant", template: "_有长鼻子", answer: "大象", romanization: "dà xiàng", description: "描述动物特征"},
        %{id: "animal_monkey", template: "_在树上荡秋千", answer: "猴子", romanization: "hóu zi", description: "描述动物行为"},
        %{id: "animal_horse", template: "_能跑得很快", answer: "马", romanization: "mǎ", description: "描述动物能力"},
        %{id: "animal_cow", template: "_产牛奶", answer: "奶牛", romanization: "nǎi niú", description: "描述动物产品"},
        %{id: "animal_pig", template: "_是粉红色的", answer: "猪", romanization: "zhū", description: "描述动物外貌"}
      ]
    }
  end

  # French content
  defp get_french_content do
    %{
      title: "Animaux",
      description: "Apprendre les noms des animaux et leurs caractéristiques",
      emoji: "🐶",
      vocabulary: [
        %{id: "animal_dog", word: "Chien", emoji: "🐶", pronunciation: "shee-an", meaning: "Animal domestique", example: "Le chien est le meilleur ami de l'homme"},
        %{id: "animal_cat", word: "Chat", emoji: "🐱", pronunciation: "shah", meaning: "Animal domestique", example: "Le chat dort au soleil"},
        %{id: "animal_rabbit", word: "Lapin", emoji: "🐰", pronunciation: "lah-pan", meaning: "Petit animal qui saute", example: "Le lapin saute rapidement"},
        %{id: "animal_bear", word: "Ours", emoji: "🐻", pronunciation: "oors", meaning: "Grand animal sauvage", example: "L'ours brun est fort"},
        %{id: "animal_panda", word: "Panda", emoji: "🐼", pronunciation: "pan-da", meaning: "Ours noir et blanc", example: "Le panda mange du bambou"},
        %{id: "animal_lion", word: "Lion", emoji: "🦁", pronunciation: "lee-on", meaning: "Roi de la jungle", example: "Le lion rugit fort"},
        %{id: "animal_tiger", word: "Tigre", emoji: "🐯", pronunciation: "tee-gruh", meaning: "Grand chat rayé", example: "Le tigre est orange et noir"},
        %{id: "animal_elephant", word: "Éléphant", emoji: "🐘", pronunciation: "eh-leh-fan", meaning: "Grand animal gris", example: "L'éléphant a une longue trompe"},
        %{id: "animal_monkey", word: "Singe", emoji: "🐵", pronunciation: "san-zhuh", meaning: "Primate", example: "Le singe se balance dans les arbres"},
        %{id: "animal_horse", word: "Cheval", emoji: "🐴", pronunciation: "shuh-val", meaning: "Animal de monte", example: "Le cheval court vite"},
        %{id: "animal_cow", word: "Vache", emoji: "🐄", pronunciation: "vash", meaning: "Animal de ferme", example: "La vache donne du lait"},
        %{id: "animal_pig", word: "Cochon", emoji: "🐷", pronunciation: "ko-shon", meaning: "Animal de ferme", example: "Le cochon est rose et rond"}
      ],
      game_objects: [
        %{id: "animal_dog", emoji: "🐶", word: "Chien", pronunciation: "shee-an"},
        %{id: "animal_cat", emoji: "🐱", word: "Chat", pronunciation: "shah"},
        %{id: "animal_rabbit", emoji: "🐰", word: "Lapin", pronunciation: "lah-pan"},
        %{id: "animal_bear", emoji: "🐻", word: "Ours", pronunciation: "oors"},
        %{id: "animal_panda", emoji: "🐼", word: "Panda", pronunciation: "pan-da"},
        %{id: "animal_lion", emoji: "🦁", word: "Lion", pronunciation: "lee-on"},
        %{id: "animal_tiger", emoji: "🐯", word: "Tigre", pronunciation: "tee-gruh"},
        %{id: "animal_elephant", emoji: "🐘", word: "Éléphant", pronunciation: "eh-leh-fan"},
        %{id: "animal_monkey", emoji: "🐵", word: "Singe", pronunciation: "san-zhuh"},
        %{id: "animal_horse", emoji: "🐴", word: "Cheval", pronunciation: "shuh-val"},
        %{id: "animal_cow", emoji: "🐄", word: "Vache", pronunciation: "vash"},
        %{id: "animal_pig", emoji: "🐷", word: "Cochon", pronunciation: "ko-shon"}
      ],
      cards: [
        %{id: "animal_dog", template: "Le _ reste fidèle", answer: "chien", description: "Décrire les caractéristiques des animaux"},
        %{id: "animal_cat", template: "Le _ dort au soleil", answer: "chat", description: "Décrire le comportement animal"},
        %{id: "animal_rabbit", template: "Le _ saute rapidement", answer: "lapin", description: "Décrire les mouvements des animaux"},
        %{id: "animal_bear", template: "L'_ vit dans la forêt", answer: "ours", description: "Décrire l'habitat animal"},
        %{id: "animal_panda", template: "Le _ mange du bambou", answer: "panda", description: "Décrire le régime animal"},
        %{id: "animal_lion", template: "Le _ règne sur la jungle", answer: "lion", description: "Décrire les caractéristiques animales"},
        %{id: "animal_tiger", template: "Le _ a des rayures", answer: "tigre", description: "Décrire les caractéristiques animales"},
        %{id: "animal_elephant", template: "L'_ a une longue trompe", answer: "éléphant", description: "Décrire les caractéristiques animales"},
        %{id: "animal_monkey", template: "Le _ se balance dans les arbres", answer: "singe", description: "Décrire le comportement animal"},
        %{id: "animal_horse", template: "Le _ peut courir vite", answer: "cheval", description: "Décrire les capacités animales"},
        %{id: "animal_cow", template: "La _ donne du lait", answer: "vache", description: "Décrire les produits animaux"},
        %{id: "animal_pig", template: "Le _ paraît rose", answer: "cochon", description: "Décrire l'apparence animale"}
      ]
    }
  end

  # Russian content
  defp get_russian_content do
    %{
      title: "Животные",
      description: "Изучение названий животных и их характеристик",
      emoji: "🐶",
      vocabulary: [
        %{id: "animal_dog", word: "Собака", emoji: "🐶", pronunciation: "so-BAH-ka", romanization: "sobaka", meaning: "Домашнее животное", example: "Собака - лучший друг человека", example_romanization: "sobaka - luchshiy drug cheloveka"},
        %{id: "animal_cat", word: "Кот", emoji: "🐱", pronunciation: "koht", romanization: "kot", meaning: "Домашний питомец", example: "Кот спит на солнце", example_romanization: "kot spit na solntse"},
        %{id: "animal_rabbit", word: "Кролик", emoji: "🐰", pronunciation: "KROH-lik", romanization: "krolik", meaning: "Маленькое прыгающее животное", example: "Кролик быстро прыгает", example_romanization: "krolik bystro pryigayet"},
        %{id: "animal_bear", word: "Медведь", emoji: "🐻", pronunciation: "med-VEHD", romanization: "medved'", meaning: "Большое дикое животное", example: "Бурый медведь сильный", example_romanization: "buryy medved' sil'nyy"},
        %{id: "animal_panda", word: "Панда", emoji: "🐼", pronunciation: "PAN-da", romanization: "panda", meaning: "Чёрно-белый медведь", example: "Панда ест бамбук", example_romanization: "panda yest bambuk"},
        %{id: "animal_lion", word: "Лев", emoji: "🦁", pronunciation: "lev", romanization: "lev", meaning: "Царь зверей", example: "Лев громко рычит", example_romanization: "lev gromko rychit"},
        %{id: "animal_tiger", word: "Тигр", emoji: "🐯", pronunciation: "TEEG-r", romanization: "tigr", meaning: "Полосатая большая кошка", example: "Тигр оранжевый и чёрный", example_romanization: "tigr oranzhevyy i chernyy"},
        %{id: "animal_elephant", word: "Слон", emoji: "🐘", pronunciation: "slon", romanization: "slon", meaning: "Крупное серое животное", example: "У слона длинный хобот", example_romanization: "u slona dlinnyy hobot"},
        %{id: "animal_monkey", word: "Обезьяна", emoji: "🐵", pronunciation: "a-bez-YAH-na", romanization: "obez'yana", meaning: "Примат", example: "Обезьяна качается на деревьях", example_romanization: "obez'yana kachayetsya na derevy'ah"},
        %{id: "animal_horse", word: "Лошадь", emoji: "🐴", pronunciation: "LOH-shad'", romanization: "loshad'", meaning: "Животное для верховой езды", example: "Лошадь быстро бежит", example_romanization: "loshad' bystro bezhit"},
        %{id: "animal_cow", word: "Корова", emoji: "🐄", pronunciation: "ka-ROH-va", romanization: "korova", meaning: "Фермерское животное", example: "Корова даёт молоко", example_romanization: "korova dayot moloko"},
        %{id: "animal_pig", word: "Свинья", emoji: "🐷", pronunciation: "svin-YAH", romanization: "svin'ya", meaning: "Фермерское животное", example: "Свинья розовая и круглая", example_romanization: "svin'ya rozovaya i kruglaya"}
      ],
      game_objects: [
        %{id: "animal_dog", emoji: "🐶", word: "Собака", pronunciation: "so-BAH-ka", romanization: "sobaka"},
        %{id: "animal_cat", emoji: "🐱", word: "Кот", pronunciation: "koht", romanization: "kot"},
        %{id: "animal_rabbit", emoji: "🐰", word: "Кролик", pronunciation: "KROH-lik", romanization: "krolik"},
        %{id: "animal_bear", emoji: "🐻", word: "Медведь", pronunciation: "med-VEHD", romanization: "medved'"},
        %{id: "animal_panda", emoji: "🐼", word: "Панда", pronunciation: "PAN-da", romanization: "panda"},
        %{id: "animal_lion", emoji: "🦁", word: "Лев", pronunciation: "lev", romanization: "lev"},
        %{id: "animal_tiger", emoji: "🐯", word: "Тигр", pronunciation: "TEEG-r", romanization: "tigr"},
        %{id: "animal_elephant", emoji: "🐘", word: "Слон", pronunciation: "slon", romanization: "slon"},
        %{id: "animal_monkey", emoji: "🐵", word: "Обезьяна", pronunciation: "a-bez-YAH-na", romanization: "obez'yana"},
        %{id: "animal_horse", emoji: "🐴", word: "Лошадь", pronunciation: "LOH-shad'", romanization: "loshad'"},
        %{id: "animal_cow", emoji: "🐄", word: "Корова", pronunciation: "ka-ROH-va", romanization: "korova"},
        %{id: "animal_pig", emoji: "🐷", word: "Свинья", pronunciation: "svin-YAH", romanization: "svin'ya"}
      ],
      cards: [
        %{id: "animal_dog", template: "_ верная", answer: "собака", description: "Описать характеристики домашних животных"},
        %{id: "animal_cat", template: "_ спит на солнце", answer: "кот", description: "Описать поведение животных"},
        %{id: "animal_rabbit", template: "_ быстро прыгает", answer: "кролик", description: "Описать движения животных"},
        %{id: "animal_bear", template: "_ живёт в лесу", answer: "медведь", description: "Описать среду обитания животных"},
        %{id: "animal_panda", template: "_ ест бамбук", answer: "панда", description: "Описать диету животных"},
        %{id: "animal_lion", template: "_ царь зверей", answer: "лев", description: "Описать характеристики животных"},
        %{id: "animal_tiger", template: "У _ есть полосы", answer: "тигра", description: "Описать особенности животных"},
        %{id: "animal_elephant", template: "У _ длинный хобот", answer: "слона", description: "Описать особенности животных"},
        %{id: "animal_monkey", template: "_ качается на деревьях", answer: "обезьяна", description: "Описать поведение животных"},
        %{id: "animal_horse", template: "_ может быстро бежать", answer: "лошадь", description: "Описать способности животных"},
        %{id: "animal_cow", template: "_ даёт молоко", answer: "корова", description: "Описать продукты животных"},
        %{id: "animal_pig", template: "_ розовая", answer: "свинья", description: "Описать внешний вид животных"}
      ]
    }
  end

  # Japanese content
  defp get_japanese_content do
    %{
      title: "動物",
      description: "動物の名前とその特徴を学ぶ",
      emoji: "🐶",
      vocabulary: [
        %{id: "animal_dog", word: "犬", emoji: "🐶", pronunciation: "ee-nu", romanization: "inu", meaning: "家庭の動物", example: "犬は人間の最高の友達です", example_romanization: "inu wa ningen no saikou no tomodachi desu"},
        %{id: "animal_cat", word: "猫", emoji: "🐱", pronunciation: "neh-ko", romanization: "neko", meaning: "家庭のペット", example: "猫は日向で寝ています", example_romanization: "neko wa hinata de nete imasu"},
        %{id: "animal_rabbit", word: "うさぎ", emoji: "🐰", pronunciation: "oo-sah-gee", romanization: "usagi", meaning: "小さく跳ねる動物", example: "うさぎは素早く跳びます", example_romanization: "usagi wa subayaku tobimasu"},
        %{id: "animal_bear", word: "熊", emoji: "🐻", pronunciation: "koo-mah", romanization: "kuma", meaning: "大きな野生動物", example: "ヒグマは強いです", example_romanization: "higuma wa tsuyoi desu"},
        %{id: "animal_panda", word: "パンダ", emoji: "🐼", pronunciation: "pan-da", romanization: "panda", meaning: "白と黒の熊", example: "パンダは竹を食べます", example_romanization: "panda wa take wo tabemasu"},
        %{id: "animal_lion", word: "ライオン", emoji: "🦁", pronunciation: "rah-ee-on", romanization: "raion", meaning: "ジャングルの王", example: "ライオンは大きく吠えます", example_romanization: "raion wa ookiku hoaemasu"},
        %{id: "animal_tiger", word: "トラ", emoji: "🐯", pronunciation: "to-rah", romanization: "tora", meaning: "縞模様の大きな猫", example: "トラはオレンジと黒です", example_romanization: "tora wa orenji to kuro desu"},
        %{id: "animal_elephant", word: "象", emoji: "🐘", pronunciation: "zo", romanization: "zou", meaning: "大きな灰色の動物", example: "象は長い鼻を持っています", example_romanization: "zou wa nagai hana wo motte imasu"},
        %{id: "animal_monkey", word: "サル", emoji: "🐵", pronunciation: "sah-ru", romanization: "saru", meaning: "霊長類", example: "サルは木にぶら下がります", example_romanization: "saru wa ki ni burasagarimasu"},
        %{id: "animal_horse", word: "馬", emoji: "🐴", pronunciation: "oo-mah", romanization: "uma", meaning: "乗馬用の動物", example: "馬は早く走ります", example_romanization: "uma wa hayaku hashirimasu"},
        %{id: "animal_cow", word: "牛", emoji: "🐄", pronunciation: "oo-shee", romanization: "ushi", meaning: "農場の動物", example: "牛はミルクを作ります", example_romanization: "ushi wa miruku wo tsukurimasu"},
        %{id: "animal_pig", word: "豚", emoji: "🐷", pronunciation: "boo-tah", romanization: "buta", meaning: "農場の動物", example: "豚はピンクで丸いです", example_romanization: "buta wa pinku de marui desu"}
      ],
      game_objects: [
        %{id: "animal_dog", emoji: "🐶", word: "犬", pronunciation: "ee-nu", romanization: "inu"},
        %{id: "animal_cat", emoji: "🐱", word: "猫", pronunciation: "neh-ko", romanization: "neko"},
        %{id: "animal_rabbit", emoji: "🐰", word: "うさぎ", pronunciation: "oo-sah-gee", romanization: "usagi"},
        %{id: "animal_bear", emoji: "🐻", word: "熊", pronunciation: "koo-mah", romanization: "kuma"},
        %{id: "animal_panda", emoji: "🐼", word: "パンダ", pronunciation: "pan-da", romanization: "panda"},
        %{id: "animal_lion", emoji: "🦁", word: "ライオン", pronunciation: "rah-ee-on", romanization: "raion"},
        %{id: "animal_tiger", emoji: "🐯", word: "トラ", pronunciation: "to-rah", romanization: "tora"},
        %{id: "animal_elephant", emoji: "🐘", word: "象", pronunciation: "zo", romanization: "zou"},
        %{id: "animal_monkey", emoji: "🐵", word: "サル", pronunciation: "sah-ru", romanization: "saru"},
        %{id: "animal_horse", emoji: "🐴", word: "馬", pronunciation: "oo-mah", romanization: "uma"},
        %{id: "animal_cow", emoji: "🐄", word: "牛", pronunciation: "oo-shee", romanization: "ushi"},
        %{id: "animal_pig", emoji: "🐷", word: "豚", pronunciation: "boo-tah", romanization: "buta"}
      ],
      cards: [
        %{id: "animal_dog", template: "_は忠実です", answer: "犬", description: "ペットの特徴を説明"},
        %{id: "animal_cat", template: "_は日向で寝ています", answer: "猫", description: "動物の行動を説明"},
        %{id: "animal_rabbit", template: "_は素早く跳びます", answer: "うさぎ", description: "動物の動きを説明"},
        %{id: "animal_bear", template: "_は森に住んでいます", answer: "熊", description: "動物の生息地を説明"},
        %{id: "animal_panda", template: "_は竹を食べます", answer: "パンダ", description: "動物の食事を説明"},
        %{id: "animal_lion", template: "_はジャングルの王です", answer: "ライオン", description: "動物の特徴を説明"},
        %{id: "animal_tiger", template: "_には縞模様があります", answer: "トラ", description: "動物の特徴を説明"},
        %{id: "animal_elephant", template: "_は長い鼻を持っています", answer: "象", description: "動物の特徴を説明"},
        %{id: "animal_monkey", template: "_は木にぶら下がります", answer: "サル", description: "動物の行動を説明"},
        %{id: "animal_horse", template: "_は早く走れます", answer: "馬", description: "動物の能力を説明"},
        %{id: "animal_cow", template: "_はミルクを作ります", answer: "牛", description: "動物の製品を説明"},
        %{id: "animal_pig", template: "_はピンクです", answer: "豚", description: "動物の外見を説明"}
      ]
    }
  end

  # Arabic content
  defp get_arabic_content do
    %{
      title: "الحيوانات",
      description: "تعلم أسماء الحيوانات وخصائصها",
      emoji: "🐶",
      vocabulary: [
        %{id: "animal_dog", word: "كلب", emoji: "🐶", pronunciation: "kalb", romanization: "kalb", meaning: "حيوان أليف", example: "الكلب أفضل صديق للإنسان", example_romanization: "al-kalb afdal sadeeq lil-insaan"},
        %{id: "animal_cat", word: "قط", emoji: "🐱", pronunciation: "qitt", romanization: "qitt", meaning: "حيوان أليف منزلي", example: "القط ينام في الشمس", example_romanization: "al-qitt yanaam fii ash-shams"},
        %{id: "animal_rabbit", word: "أرنب", emoji: "🐰", pronunciation: "ar-nab", romanization: "arnab", meaning: "حيوان صغير يقفز", example: "الأرنب يقفز بسرعة", example_romanization: "al-arnab yaqfiz bi-sur'a"},
        %{id: "animal_bear", word: "دب", emoji: "🐻", pronunciation: "dubb", romanization: "dubb", meaning: "حيوان بري كبير", example: "الدب البني قوي", example_romanization: "ad-dubb al-bunniy qawiy"},
        %{id: "animal_panda", word: "باندا", emoji: "🐼", pronunciation: "ban-da", romanization: "banda", meaning: "دب أبيض وأسود", example: "الباندا تأكل الخيزران", example_romanization: "al-banda ta'kul al-khayzuraan"},
        %{id: "animal_lion", word: "أسد", emoji: "🦁", pronunciation: "asad", romanization: "asad", meaning: "ملك الغابة", example: "الأسد يزأر بقوة", example_romanization: "al-asad yaza'ir bi-quwwa"},
        %{id: "animal_tiger", word: "نمر", emoji: "🐯", pronunciation: "na-mir", romanization: "namir", meaning: "قط كبير مخطط", example: "النمر برتقالي وأسود", example_romanization: "an-namir burtuqaaliy wa-aswad"},
        %{id: "animal_elephant", word: "فيل", emoji: "🐘", pronunciation: "feel", romanization: "feel", meaning: "حيوان رمادي كبير", example: "للفيل خرطوم طويل", example_romanization: "lil-feel khurtuum taweel"},
        %{id: "animal_monkey", word: "قرد", emoji: "🐵", pronunciation: "qird", romanization: "qird", meaning: "رئيسيات", example: "القرد يتأرجح في الأشجار", example_romanization: "al-qird yata'arjah fil-ashjar"},
        %{id: "animal_horse", word: "حصان", emoji: "🐴", pronunciation: "hi-saan", romanization: "hisaan", meaning: "حيوان للركوب", example: "الحصان يجري بسرعة", example_romanization: "al-hisaan yajriy bi-sur'a"},
        %{id: "animal_cow", word: "بقرة", emoji: "🐄", pronunciation: "ba-qa-ra", romanization: "baqara", meaning: "حيوان مزرعة", example: "البقرة تعطي الحليب", example_romanization: "al-baqara tu'tiy al-haleeb"},
        %{id: "animal_pig", word: "خنزير", emoji: "🐷", pronunciation: "khin-zeer", romanization: "khinzeer", meaning: "حيوان مزرعة", example: "الخنزير وردي ومستدير", example_romanization: "al-khinzeer wardiy wa-mustadeer"}
      ],
      game_objects: [
        %{id: "animal_dog", emoji: "🐶", word: "كلب", pronunciation: "kalb", romanization: "kalb"},
        %{id: "animal_cat", emoji: "🐱", word: "قط", pronunciation: "qitt", romanization: "qitt"},
        %{id: "animal_rabbit", emoji: "🐰", word: "أرنب", pronunciation: "ar-nab", romanization: "arnab"},
        %{id: "animal_bear", emoji: "🐻", word: "دب", pronunciation: "dubb", romanization: "dubb"},
        %{id: "animal_panda", emoji: "🐼", word: "باندا", pronunciation: "ban-da", romanization: "banda"},
        %{id: "animal_lion", emoji: "🦁", word: "أسد", pronunciation: "asad", romanization: "asad"},
        %{id: "animal_tiger", emoji: "🐯", word: "نمر", pronunciation: "na-mir", romanization: "namir"},
        %{id: "animal_elephant", emoji: "🐘", word: "فيل", pronunciation: "feel", romanization: "feel"},
        %{id: "animal_monkey", emoji: "🐵", word: "قرد", pronunciation: "qird", romanization: "qird"},
        %{id: "animal_horse", emoji: "🐴", word: "حصان", pronunciation: "hi-saan", romanization: "hisaan"},
        %{id: "animal_cow", emoji: "🐄", word: "بقرة", pronunciation: "ba-qa-ra", romanization: "baqara"},
        %{id: "animal_pig", emoji: "🐷", word: "خنزير", pronunciation: "khin-zeer", romanization: "khinzeer"}
      ],
      cards: [
        %{id: "animal_dog", template: "_ مخلص", answer: "الكلب", description: "وصف خصائص الحيوانات الأليفة"},
        %{id: "animal_cat", template: "_ ينام في الشمس", answer: "القط", description: "وصف سلوك الحيوانات"},
        %{id: "animal_rabbit", template: "_ يقفز بسرعة", answer: "الأرنب", description: "وصف حركة الحيوانات"},
        %{id: "animal_bear", template: "_ يعيش في الغابة", answer: "الدب", description: "وصف موطن الحيوانات"},
        %{id: "animal_panda", template: "_ تأكل الخيزران", answer: "الباندا", description: "وصف نظام الحيوانات الغذائي"},
        %{id: "animal_lion", template: "_ ملك الغابة", answer: "الأسد", description: "وصف خصائص الحيوانات"},
        %{id: "animal_tiger", template: "لدى _ خطوط", answer: "النمر", description: "وصف ميزات الحيوانات"},
        %{id: "animal_elephant", template: "لدى _ خرطوم طويل", answer: "الفيل", description: "وصف ميزات الحيوانات"},
        %{id: "animal_monkey", template: "_ يتأرجح في الأشجار", answer: "القرد", description: "وصف سلوك الحيوانات"},
        %{id: "animal_horse", template: "_ يمكنه الجري بسرعة", answer: "الحصان", description: "وصف قدرات الحيوانات"},
        %{id: "animal_cow", template: "_ تعطي الحليب", answer: "البقرة", description: "وصف منتجات الحيوانات"},
        %{id: "animal_pig", template: "_ وردي اللون", answer: "الخنزير", description: "وصف مظهر الحيوانات"}
      ]
    }
  end

  # Portuguese content
  defp get_portuguese_content do
    %{
      title: "Animais",
      description: "Aprenda nomes de animais e suas características",
      emoji: "🐶",
      vocabulary: [
        %{id: "animal_dog", word: "Cachorro", emoji: "🐶", pronunciation: "ka-SHOR-roh", meaning: "Animal doméstico", example: "O cachorro é o melhor amigo do homem"},
        %{id: "animal_cat", word: "Gato", emoji: "🐱", pronunciation: "GAH-toh", meaning: "Animal de estimação doméstico", example: "O gato dorme no sol"},
        %{id: "animal_rabbit", word: "Coelho", emoji: "🐰", pronunciation: "koh-EH-lyoh", meaning: "Pequeno animal que pula", example: "O coelho pula rapidamente"},
        %{id: "animal_bear", word: "Urso", emoji: "🐻", pronunciation: "OOR-soh", meaning: "Grande animal selvagem", example: "O urso pardo é forte"},
        %{id: "animal_panda", word: "Panda", emoji: "🐼", pronunciation: "PAN-da", meaning: "Urso preto e branco", example: "O panda come bambu"},
        %{id: "animal_lion", word: "Leão", emoji: "🦁", pronunciation: "le-OW", meaning: "Rei da selva", example: "O leão ruge alto"},
        %{id: "animal_tiger", word: "Tigre", emoji: "🐯", pronunciation: "TEE-greh", meaning: "Grande gato listrado", example: "O tigre é laranja e preto"},
        %{id: "animal_elephant", word: "Elefante", emoji: "🐘", pronunciation: "e-le-FAHN-teh", meaning: "Grande animal cinza", example: "O elefante tem uma tromba longa"},
        %{id: "animal_monkey", word: "Macaco", emoji: "🐵", pronunciation: "ma-KAH-koh", meaning: "Primata", example: "O macaco balança nas árvores"},
        %{id: "animal_horse", word: "Cavalo", emoji: "🐴", pronunciation: "ka-VAH-loh", meaning: "Animal para montar", example: "O cavalo corre rápido"},
        %{id: "animal_cow", word: "Vaca", emoji: "🐄", pronunciation: "VAH-ka", meaning: "Animal da fazenda", example: "A vaca dá leite"},
        %{id: "animal_pig", word: "Porco", emoji: "🐷", pronunciation: "POR-koh", meaning: "Animal da fazenda", example: "O porco é rosa e redondo"}
      ],
      game_objects: [
        %{id: "animal_dog", emoji: "🐶", word: "Cachorro", pronunciation: "ka-SHOR-roh"},
        %{id: "animal_cat", emoji: "🐱", word: "Gato", pronunciation: "GAH-toh"},
        %{id: "animal_rabbit", emoji: "🐰", word: "Coelho", pronunciation: "koh-EH-lyoh"},
        %{id: "animal_bear", emoji: "🐻", word: "Urso", pronunciation: "OOR-soh"},
        %{id: "animal_panda", emoji: "🐼", word: "Panda", pronunciation: "PAN-da"},
        %{id: "animal_lion", emoji: "🦁", word: "Leão", pronunciation: "le-OW"},
        %{id: "animal_tiger", emoji: "🐯", word: "Tigre", pronunciation: "TEE-greh"},
        %{id: "animal_elephant", emoji: "🐘", word: "Elefante", pronunciation: "e-le-FAHN-teh"},
        %{id: "animal_monkey", emoji: "🐵", word: "Macaco", pronunciation: "ma-KAH-koh"},
        %{id: "animal_horse", emoji: "🐴", word: "Cavalo", pronunciation: "ka-VAH-loh"},
        %{id: "animal_cow", emoji: "🐄", word: "Vaca", pronunciation: "VAH-ka"},
        %{id: "animal_pig", emoji: "🐷", word: "Porco", pronunciation: "POR-koh"}
      ],
      cards: [
        %{id: "animal_dog", template: "O _ é leal", answer: "cachorro", description: "Descrever características dos animais de estimação"},
        %{id: "animal_cat", template: "O _ dorme no sol", answer: "gato", description: "Descrever comportamento animal"},
        %{id: "animal_rabbit", template: "O _ pula rapidamente", answer: "coelho", description: "Descrever movimento animal"},
        %{id: "animal_bear", template: "O _ vive na floresta", answer: "urso", description: "Descrever habitat animal"},
        %{id: "animal_panda", template: "O _ come bambu", answer: "panda", description: "Descrever dieta animal"},
        %{id: "animal_lion", template: "O _ é o rei da selva", answer: "leão", description: "Descrever características animais"},
        %{id: "animal_tiger", template: "O _ tem listras", answer: "tigre", description: "Descrever características animais"},
        %{id: "animal_elephant", template: "O _ tem uma tromba longa", answer: "elefante", description: "Descrever características animais"},
        %{id: "animal_monkey", template: "O _ balança nas árvores", answer: "macaco", description: "Descrever comportamento animal"},
        %{id: "animal_horse", template: "O _ pode correr rápido", answer: "cavalo", description: "Descrever habilidades animais"},
        %{id: "animal_cow", template: "A _ dá leite", answer: "vaca", description: "Descrever produtos animais"},
        %{id: "animal_pig", template: "O _ é rosa", answer: "porco", description: "Descrever aparência animal"}
      ]
    }
  end

  # Italian content
  defp get_italian_content do
    %{
      title: "Animali",
      description: "Impara i nomi degli animali e le loro caratteristiche",
      emoji: "🐶",
      vocabulary: [
        %{id: "animal_dog", word: "Cane", emoji: "🐶", pronunciation: "KAH-neh", meaning: "Animale domestico", example: "Il cane è il migliore amico dell'uomo"},
        %{id: "animal_cat", word: "Gatto", emoji: "🐱", pronunciation: "GAT-toh", meaning: "Animale domestico", example: "Il gatto dorme al sole"},
        %{id: "animal_rabbit", word: "Coniglio", emoji: "🐰", pronunciation: "ko-NEE-lyoh", meaning: "Piccolo animale che salta", example: "Il coniglio salta velocemente"},
        %{id: "animal_bear", word: "Orso", emoji: "🐻", pronunciation: "OR-soh", meaning: "Grande animale selvatico", example: "L'orso bruno è forte"},
        %{id: "animal_panda", word: "Panda", emoji: "🐼", pronunciation: "PAN-da", meaning: "Orso bianco e nero", example: "Il panda mangia bambù"},
        %{id: "animal_lion", word: "Leone", emoji: "🦁", pronunciation: "le-OH-neh", meaning: "Re della giungla", example: "Il leone ruggisce forte"},
        %{id: "animal_tiger", word: "Tigre", emoji: "🐯", pronunciation: "TEE-greh", meaning: "Grande gatto a strisce", example: "La tigre è arancione e nera"},
        %{id: "animal_elephant", word: "Elefante", emoji: "🐘", pronunciation: "e-le-FAHN-teh", meaning: "Grande animale grigio", example: "L'elefante ha una lunga proboscide"},
        %{id: "animal_monkey", word: "Scimmia", emoji: "🐵", pronunciation: "SHEEM-mee-ah", meaning: "Primate", example: "La scimmia dondola sugli alberi"},
        %{id: "animal_horse", word: "Cavallo", emoji: "🐴", pronunciation: "ka-VAL-loh", meaning: "Animale da cavalcare", example: "Il cavallo corre veloce"},
        %{id: "animal_cow", word: "Mucca", emoji: "🐄", pronunciation: "MOOK-ka", meaning: "Animale da fattoria", example: "La mucca dà il latte"},
        %{id: "animal_pig", word: "Maiale", emoji: "🐷", pronunciation: "ma-YAH-leh", meaning: "Animale da fattoria", example: "Il maiale è rosa e rotondo"}
      ],
      game_objects: [
        %{id: "animal_dog", emoji: "🐶", word: "Cane", pronunciation: "KAH-neh"},
        %{id: "animal_cat", emoji: "🐱", word: "Gatto", pronunciation: "GAT-toh"},
        %{id: "animal_rabbit", emoji: "🐰", word: "Coniglio", pronunciation: "ko-NEE-lyoh"},
        %{id: "animal_bear", emoji: "🐻", word: "Orso", pronunciation: "OR-soh"},
        %{id: "animal_panda", emoji: "🐼", word: "Panda", pronunciation: "PAN-da"},
        %{id: "animal_lion", emoji: "🦁", word: "Leone", pronunciation: "le-OH-neh"},
        %{id: "animal_tiger", emoji: "🐯", word: "Tigre", pronunciation: "TEE-greh"},
        %{id: "animal_elephant", emoji: "🐘", word: "Elefante", pronunciation: "e-le-FAHN-teh"},
        %{id: "animal_monkey", emoji: "🐵", word: "Scimmia", pronunciation: "SHEEM-mee-ah"},
        %{id: "animal_horse", emoji: "🐴", word: "Cavallo", pronunciation: "ka-VAL-loh"},
        %{id: "animal_cow", emoji: "🐄", word: "Mucca", pronunciation: "MOOK-ka"},
        %{id: "animal_pig", emoji: "🐷", word: "Maiale", pronunciation: "ma-YAH-leh"}
      ],
      cards: [
        %{id: "animal_dog", template: "Il _ è leale", answer: "cane", description: "Descrivere caratteristiche degli animali domestici"},
        %{id: "animal_cat", template: "Il _ dorme al sole", answer: "gatto", description: "Descrivere comportamento animale"},
        %{id: "animal_rabbit", template: "Il _ salta velocemente", answer: "coniglio", description: "Descrivere movimento animale"},
        %{id: "animal_bear", template: "L'_ vive nella foresta", answer: "orso", description: "Descrivere habitat animale"},
        %{id: "animal_panda", template: "Il _ mangia bambù", answer: "panda", description: "Descrivere dieta animale"},
        %{id: "animal_lion", template: "Il _ è il re della giungla", answer: "leone", description: "Descrivere caratteristiche animali"},
        %{id: "animal_tiger", template: "La _ ha le strisce", answer: "tigre", description: "Descrivere caratteristiche animali"},
        %{id: "animal_elephant", template: "L'_ ha una lunga proboscide", answer: "elefante", description: "Descrivere caratteristiche animali"},
        %{id: "animal_monkey", template: "La _ dondola sugli alberi", answer: "scimmia", description: "Descrivere comportamento animale"},
        %{id: "animal_horse", template: "Il _ può correre veloce", answer: "cavallo", description: "Descrivere abilità animali"},
        %{id: "animal_cow", template: "La _ dà il latte", answer: "mucca", description: "Descrivere prodotti animali"},
        %{id: "animal_pig", template: "Il _ è rosa", answer: "maiale", description: "Descrivere aspetto animale"}
      ]
    }
  end
end