defmodule BobaTalkie.ContentManagerModules.TopicFactory do
  @moduledoc """
  Factory module for creating topic content modules.
  Centralizes topic routing and provides a clean interface for content retrieval.
  """

  alias BobaTalkie.ContentManagerModules.{
    IntroductionContent,
    FruitsContent,
    NumbersContent,
    ColorsContent,
    BakeryContent,
    AnimalsContent,
    RestaurantContent,
    FamilyContent,
    CountriesContent
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
      "colors" -> ColorsContent.get_content(language_code)
      "bakery" -> BakeryContent.get_content(language_code)
      "animals" -> AnimalsContent.get_content(language_code)
      "restaurant" -> RestaurantContent.get_content(language_code)
      "family" -> FamilyContent.get_content(language_code)
      "countries" -> CountriesContent.get_content(language_code)
      _ -> get_default_content()
    end
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