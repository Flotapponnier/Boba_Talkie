defmodule BobaTalkie.ContentManagerModules.TopicFactory do
  @moduledoc """
  Factory module for creating topic content modules.
  Centralizes topic routing and provides a clean interface for content retrieval.
  """

  alias BobaTalkie.ContentManagerModules.{
    IntroductionContent,
    FruitsContent,
    NumbersContent
  }

  @doc """
  Get content for a specific topic and language.
  Routes to the appropriate topic module.
  """
  def get_content(topic, language_code) do
    case topic do
      "introduction" -> IntroductionContent.get_content(language_code)
      "fruits" -> FruitsContent.get_content(language_code)
      "numbers" -> NumbersContent.get_content(language_code)
      "colors" -> get_placeholder_content("Colors", "🌈", language_code)
      "bakery" -> get_placeholder_content("Bakery", "🥐", language_code)
      "animals" -> get_placeholder_content("Animals", "🐶", language_code)
      "restaurant" -> get_placeholder_content("Restaurant", "🍕", language_code)
      "family" -> get_placeholder_content("Family", "👨‍👩‍👧‍👦", language_code)
      "countries" -> get_placeholder_content("Countries", "🇹🇼", language_code)
      _ -> get_default_content()
    end
  end

  # Placeholder content for topics not yet implemented with modular structure
  defp get_placeholder_content(title, emoji, _language_code) do
    %{
      title: title,
      description: "Topic content coming soon with modular architecture",
      emoji: emoji,
      vocabulary: [
        %{id: "placeholder_1", word: "Coming Soon", emoji: emoji, pronunciation: "coming-soon", meaning: "Will be implemented", example: "This content will be modularized"}
      ],
      game_objects: [
        %{id: "placeholder_1", emoji: emoji, word: "Coming Soon", pronunciation: "coming-soon"}
      ],
      cards: [
        %{id: "placeholder_1", template: "_ will be implemented", answer: "This", description: "Placeholder content"}
      ]
    }
  end

  # Default fallback content
  defp get_default_content do
    %{
      title: "Unknown Topic",
      description: "Topic not found",
      emoji: "❓",
      vocabulary: [],
      game_objects: [],
      cards: []
    }
  end
end