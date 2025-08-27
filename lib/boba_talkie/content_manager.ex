defmodule BobaTalkie.ContentManager do
  @moduledoc """
  Manages learning content in different languages with ID-based translation system.
  This is separate from interface translations and contains actual learning materials.
  Each vocabulary item has a unique ID that can be used for interface language translations.
  
  Now using modular architecture with content_managermodules/ for better organization.
  """

  alias BobaTalkie.ContentManagerModules.{
    TopicFactory,
    VocabularyTranslations
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

  # Backward compatibility functions (can be removed after migration)
  
  @doc """
  Legacy function name - redirects to get_learning_content/2
  """
  def get_content(topic, language_code) do
    get_learning_content(topic, language_code)
  end
end