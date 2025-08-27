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
      }
      # Add more introduction translations as needed
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
      }
      # Add more fruit translations as needed
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
      }
      # Add more number translations as needed
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
      }
      # Add more color translations as needed
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
      }
      # Add more bakery translations as needed
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
      }
      # Add more animal translations as needed
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
      }
      # Add more restaurant translations as needed
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
      }
      # Add more family translations as needed
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
      }
      # Add more country translations as needed
    }
  end
end