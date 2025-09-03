defmodule BobaTalkie.ContentManager do
  @moduledoc """
  Manages learning content in different languages with ID-based translation system.
  This is separate from interface translations and contains actual learning materials.
  Each vocabulary item has a unique ID that can be used for interface language translations.
  
  Now using modular architecture with content_managermodules/ for better organization.
  """

  alias BobaTalkie.ContentManagerModules.{
    TopicFactory,
    VocabularyTranslations,
    CardDescriptionTranslations
  }

  @doc """
  Get learning content for a specific topic and language.
  Routes through TopicFactory to appropriate content modules.
  """
  def get_learning_content(topic, language_code) do
    TopicFactory.get_content(topic, language_code)
  end

  @doc """
  Get translation for a vocabulary item by ID in the specified interface language.
  Returns %{word: "...", example: "..."} or nil if not found.
  """
  def get_vocabulary_translation(vocab_id, interface_language) do
    VocabularyTranslations.get_translation(vocab_id, interface_language)
  end

  @doc """
  Get all vocabulary translations mapping.
  Delegates to VocabularyTranslations module.
  """
  def get_vocabulary_translations do
    VocabularyTranslations.get_all_translations()
  end

  @doc """
  Get translated card description for a template in the specified interface language.
  """
  def get_card_description_translation(template, interface_language) do
    CardDescriptionTranslations.get_card_description_translation(template, interface_language)
  end

  @doc """
  Get vocabulary item by object type and learning language
  """
  def get_vocabulary_item_by_type(object_type, learning_language) do
    # Determine topic from object type (simplified mapping)
    topic = case object_type do
      type when type in [:apple, :banana, :orange, :grape, :strawberry, :cherry, :peach, :pineapple, :watermelon, :lemon, :avocado, :coconut, :mango, :kiwi, :tomato, :carrot, :bread, :milk, :cheese, :egg] -> "fruits"
      type when type in [:hello, :name, :nice_to_meet, :how_are_you, :fine, :thank_you, :please, :excuse_me, :sorry, :yes, :no, :goodbye, :see_you_later, :where, :from] -> "introduction"
      type when type in [:one, :two, :three, :four, :five, :six, :seven, :eight, :nine, :ten] -> "numbers"
      type when type in [:red, :blue, :green, :yellow, :orange, :purple, :pink, :brown, :black, :white, :gray] -> "colors"
      type when type in [:croissant, :bagel, :pretzel, :baguette, :cake, :cupcake, :donut, :cookie, :pie] -> "bakery"
      type when type in [:dog, :cat, :rabbit, :bear, :panda, :lion, :tiger, :elephant, :monkey, :horse, :cow, :pig] -> "animals"
      type when type in [:menu, :pizza, :burger, :fries, :pasta, :salad, :soup, :coffee, :water, :bill] -> "restaurant"
      type when type in [:mother, :father, :sister, :brother, :grandmother, :grandfather, :baby, :family, :aunt, :uncle] -> "family"
      type when type in [:taiwan, :france, :germany, :japan, :usa, :uk, :italy, :spain, :china, :canada] -> "countries"
      _ -> "fruits"
    end
    
    content = get_learning_content(topic, learning_language)
    
    # Handle both singular and plural topic names
    singular_topic = case topic do
      "fruits" -> "fruit"
      "animals" -> "animal"
      "countries" -> "country"
      other -> other
    end
    
    object_id = "#{singular_topic}_#{object_type}"
    
    Enum.find(content.vocabulary, fn item -> 
      item.id == object_id or 
      item.id == "#{topic}_#{object_type}" or
      String.contains?(item.id, Atom.to_string(object_type))
    end)
  end

  # Backward compatibility functions (can be removed after migration)
  
  @doc """
  Legacy function name - redirects to get_learning_content/2
  """
  def get_content(topic, language_code) do
    get_learning_content(topic, language_code)
  end
end