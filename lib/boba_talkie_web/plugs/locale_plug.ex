defmodule BobaTalkieWeb.LocalePlug do
  @moduledoc """
  Plug to handle locale setting and persistence across the application.
  Sets both the interface language (for gettext) and learning language (for content).
  """
  
  import Plug.Conn
  require Logger

  @supported_locales ["en", "fr", "es", "zh", "ru", "ja", "it", "ar", "pt"]
  @default_locale "en"

  def init(opts), do: opts

  def call(conn, _opts) do
    # Get locale from various sources in order of preference
    locale = 
      get_locale_from_params(conn) ||
      get_locale_from_session(conn) ||
      get_locale_from_header(conn) ||
      @default_locale

    learning_language = 
      get_learning_language_from_params(conn) ||
      get_learning_language_from_session(conn) ||
      @default_locale

    # Set the gettext locale
    if locale in @supported_locales do
      Gettext.put_locale(BobaTalkieWeb.Gettext, locale)
    end

    conn
    |> put_session(:interface_language, locale)
    |> put_session(:learning_language, learning_language)
    |> assign(:interface_language, locale)
    |> assign(:learning_language, learning_language)
  end

  defp get_locale_from_params(conn) do
    case conn.params do
      %{"interface_language" => locale} when locale in @supported_locales -> locale
      _ -> nil
    end
  end

  defp get_learning_language_from_params(conn) do
    case conn.params do
      %{"learning_language" => lang} when lang in @supported_locales -> lang
      _ -> nil
    end
  end

  defp get_locale_from_session(conn) do
    case get_session(conn, :interface_language) do
      locale when locale in @supported_locales -> locale
      _ -> nil
    end
  end

  defp get_learning_language_from_session(conn) do
    case get_session(conn, :learning_language) do
      lang when lang in @supported_locales -> lang
      _ -> nil
    end
  end

  defp get_locale_from_header(conn) do
    case get_req_header(conn, "accept-language") do
      [value | _] ->
        value
        |> String.split(",")
        |> List.first()
        |> String.split(";")
        |> List.first()
        |> String.split("-")
        |> List.first()
        |> case do
          locale when locale in @supported_locales -> locale
          _ -> nil
        end
      _ -> nil
    end
  end

  def get_supported_locales, do: @supported_locales
  def get_default_locale, do: @default_locale
end