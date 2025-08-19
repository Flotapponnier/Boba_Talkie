defmodule BobaTalkie.LanguageManager do
  @moduledoc """
  Manages two types of languages:
  1. Interface Language: The language the user sees the app interface in
  2. Learning Language: The language the user wants to learn/practice
  """

  @interface_languages %{
    "en" => %{name: "English", flag: "🇺🇸", code: "en"},
    "fr" => %{name: "Français", flag: "🇫🇷", code: "fr"},
    "es" => %{name: "Español", flag: "🇪🇸", code: "es"},
    "zh" => %{name: "中文", flag: "🇨🇳", code: "zh"},
    "ru" => %{name: "Русский", flag: "🇷🇺", code: "ru"},
    "ja" => %{name: "日本語", flag: "🇯🇵", code: "ja"},
    "it" => %{name: "Italiano", flag: "🇮🇹", code: "it"},
    "ar" => %{name: "العربية", flag: "🇸🇦", code: "ar"},
    "pt" => %{name: "Português", flag: "🇵🇹", code: "pt"}
  }

  @learning_languages %{
    "en" => %{name: "English", flag: "🇺🇸", code: "en", native_name: "English"},
    "fr" => %{name: "French", flag: "🇫🇷", code: "fr", native_name: "Français"},
    "es" => %{name: "Spanish", flag: "🇪🇸", code: "es", native_name: "Español"},
    "zh" => %{name: "Chinese", flag: "🇨🇳", code: "zh", native_name: "中文", has_pinyin: true},
    "ru" => %{name: "Russian", flag: "🇷🇺", code: "ru", native_name: "Русский"},
    "ja" => %{name: "Japanese", flag: "🇯🇵", code: "ja", native_name: "日本語"},
    "it" => %{name: "Italian", flag: "🇮🇹", code: "it", native_name: "Italiano"},
    "ar" => %{name: "Arabic", flag: "🇸🇦", code: "ar", native_name: "العربية", rtl: true},
    "pt" => %{name: "Portuguese", flag: "🇵🇹", code: "pt", native_name: "Português"}
  }

  def get_interface_languages, do: @interface_languages
  def get_learning_languages, do: @learning_languages

  def get_interface_language(code) when is_binary(code) do
    Map.get(@interface_languages, code)
  end

  def get_learning_language(code) when is_binary(code) do
    Map.get(@learning_languages, code)
  end

  def default_interface_language, do: "en"
  def default_learning_language, do: "en"

  def valid_interface_language?(code) when is_binary(code) do
    Map.has_key?(@interface_languages, code)
  end

  def valid_learning_language?(code) when is_binary(code) do
    Map.has_key?(@learning_languages, code)
  end

  def has_pinyin?(lang_code) do
    case get_learning_language(lang_code) do
      %{has_pinyin: true} -> true
      _ -> false
    end
  end

  def is_rtl?(lang_code) do
    case get_learning_language(lang_code) do
      %{rtl: true} -> true
      _ -> false
    end
  end
end