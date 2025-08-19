defmodule BobaTalkie.ContentManager do
  @moduledoc """
  Manages learning content in different languages.
  This is separate from interface translations and contains actual learning materials.
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

  # Introduction Content
  defp get_introduction_content("en") do
    %{
      tutorial: [
        %{phrase: "Hello", pronunciation: "heh-LOH", meaning: "A greeting"},
        %{phrase: "My name is", pronunciation: "mahy naym iz", meaning: "To introduce yourself"},
        %{phrase: "Nice to meet you", pronunciation: "nahys too meet yoo", meaning: "Polite greeting"},
        %{phrase: "Thank you", pronunciation: "THANGK yoo", meaning: "Expression of gratitude"}
      ],
      game_objects: [
        %{emoji: "👋", word: "Hello", pronunciation: "heh-LOH"},
        %{emoji: "📛", word: "Name", pronunciation: "naym"},
        %{emoji: "🤝", word: "Nice to meet you", pronunciation: "nahys too meet yoo"},
        %{emoji: "🙏", word: "Thank you", pronunciation: "THANGK yoo"}
      ],
      cards: [
        %{template: "Say _ to greet someone", answer: "Hello", description: "Use this greeting when meeting people"},
        %{template: "My _ is Sarah", answer: "name", description: "Introduce yourself by stating your name"},
        %{template: "_ to meet you", answer: "Nice", description: "Polite response after introduction"}
      ]
    }
  end

  defp get_introduction_content("fr") do
    %{
      tutorial: [
        %{phrase: "Bonjour", pronunciation: "bon-ZHOOR", meaning: "Une salutation"},
        %{phrase: "Je m'appelle", pronunciation: "zhuh mah-PELL", meaning: "Pour se présenter"},
        %{phrase: "Enchanté", pronunciation: "ahn-shahn-TAY", meaning: "Salutation polie"},
        %{phrase: "Merci", pronunciation: "mer-SEE", meaning: "Expression de gratitude"}
      ],
      game_objects: [
        %{emoji: "👋", word: "Bonjour", pronunciation: "bon-ZHOOR"},
        %{emoji: "📛", word: "Nom", pronunciation: "nohn"},
        %{emoji: "🤝", word: "Enchanté", pronunciation: "ahn-shahn-TAY"},
        %{emoji: "🙏", word: "Merci", pronunciation: "mer-SEE"}
      ],
      cards: [
        %{template: "Dire _ pour saluer", answer: "Bonjour", description: "Utilisez cette salutation en rencontrant des gens"},
        %{template: "Je _ Sarah", answer: "m'appelle", description: "Présentez-vous en donnant votre nom"},
        %{template: "_ de vous rencontrer", answer: "Enchanté", description: "Réponse polie après présentation"}
      ]
    }
  end

  defp get_introduction_content("zh") do
    %{
      tutorial: [
        %{phrase: "你好", pronunciation: "nǐ hǎo", pinyin: "nǐ hǎo", meaning: "A greeting"},
        %{phrase: "我叫", pronunciation: "wǒ jiào", pinyin: "wǒ jiào", meaning: "My name is"},
        %{phrase: "很高兴见到你", pronunciation: "hěn gāo xìng jiàn dào nǐ", pinyin: "hěn gāo xìng jiàn dào nǐ", meaning: "Nice to meet you"},
        %{phrase: "谢谢", pronunciation: "xiè xie", pinyin: "xiè xie", meaning: "Thank you"}
      ],
      game_objects: [
        %{emoji: "👋", word: "你好", pronunciation: "nǐ hǎo", pinyin: "nǐ hǎo"},
        %{emoji: "📛", word: "名字", pronunciation: "míng zi", pinyin: "míng zi"},
        %{emoji: "🤝", word: "见面", pronunciation: "jiàn miàn", pinyin: "jiàn miàn"},
        %{emoji: "🙏", word: "谢谢", pronunciation: "xiè xie", pinyin: "xiè xie"}
      ],
      cards: [
        %{template: "说_来打招呼", answer: "你好", pinyin: "nǐ hǎo", description: "见面时使用这个问候语"},
        %{template: "我_小明", answer: "叫", pinyin: "jiào", description: "通过说出姓名来介绍自己"},
        %{template: "_见到你", answer: "很高兴", pinyin: "hěn gāo xìng", description: "介绍后的礼貌回应"}
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
        %{phrase: "Apple", pronunciation: "AP-uhl", meaning: "A red or green fruit"},
        %{phrase: "Banana", pronunciation: "buh-NAN-uh", meaning: "A yellow curved fruit"},
        %{phrase: "Orange", pronunciation: "OR-inj", meaning: "A citrus fruit"},
        %{phrase: "Grape", pronunciation: "grayp", meaning: "Small round fruit"}
      ],
      game_objects: [
        %{emoji: "🍎", word: "Apple", pronunciation: "AP-uhl"},
        %{emoji: "🍌", word: "Banana", pronunciation: "buh-NAN-uh"},
        %{emoji: "🍊", word: "Orange", pronunciation: "OR-inj"},
        %{emoji: "🍇", word: "Grape", pronunciation: "grayp"}
      ],
      cards: [
        %{template: "Eat the _", answer: "apple", description: "Action with fruit"},
        %{template: "The _ is yellow", answer: "banana", description: "Describe fruit color"},
        %{template: "I like _", answer: "grapes", description: "Express preference"}
      ]
    }
  end

  defp get_fruits_content("fr") do
    %{
      tutorial: [
        %{phrase: "Pomme", pronunciation: "pom", meaning: "Un fruit rouge ou vert"},
        %{phrase: "Banane", pronunciation: "bah-NAHN", meaning: "Un fruit jaune courbé"},
        %{phrase: "Orange", pronunciation: "oh-RAHNZH", meaning: "Un agrume"},
        %{phrase: "Raisin", pronunciation: "ray-ZAN", meaning: "Petit fruit rond"}
      ],
      game_objects: [
        %{emoji: "🍎", word: "Pomme", pronunciation: "pom"},
        %{emoji: "🍌", word: "Banane", pronunciation: "bah-NAHN"},
        %{emoji: "🍊", word: "Orange", pronunciation: "oh-RAHNZH"},
        %{emoji: "🍇", word: "Raisin", pronunciation: "ray-ZAN"}
      ],
      cards: [
        %{template: "Mange la _", answer: "pomme", description: "Action avec fruit"},
        %{template: "La _ est jaune", answer: "banane", description: "Décrire la couleur du fruit"},
        %{template: "J'aime les _", answer: "raisins", description: "Exprimer une préférence"}
      ]
    }
  end

  # Placeholder implementations for other topics and languages
  defp get_fruits_content(_lang), do: get_fruits_content("en")
  defp get_numbers_content(_lang), do: get_fruits_content("en") # Placeholder
  defp get_colors_content(_lang), do: get_fruits_content("en") # Placeholder  
  defp get_bakery_content(_lang), do: get_fruits_content("en") # Placeholder
  defp get_animals_content(_lang), do: get_fruits_content("en") # Placeholder
  defp get_restaurant_content(_lang), do: get_fruits_content("en") # Placeholder
  defp get_family_content(_lang), do: get_fruits_content("en") # Placeholder
  defp get_countries_content(_lang), do: get_fruits_content("en") # Placeholder
end