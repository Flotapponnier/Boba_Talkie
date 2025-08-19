defmodule BobaTalkieWeb.LanguageSession do
  @moduledoc """
  Utilities for managing language preferences in LiveView sessions.
  """

  @supported_locales ["en", "fr", "es", "zh", "ru", "ja", "it", "ar", "pt"]
  @default_locale "en"

  def get_interface_language(params, session, socket_assigns \\ %{}) do
    params["interface_language"] ||
    session["interface_language"] ||
    socket_assigns[:interface_language] ||
    @default_locale
  end

  def get_learning_language(params, session, socket_assigns \\ %{}) do
    params["learning_language"] ||
    session["learning_language"] ||
    socket_assigns[:learning_language] ||
    @default_locale
  end

  def set_locale_and_assign(socket, interface_language, learning_language) do
    # Validate languages
    interface_language = if interface_language in @supported_locales, do: interface_language, else: @default_locale
    learning_language = if learning_language in @supported_locales, do: learning_language, else: @default_locale
    
    # Set the gettext locale for this process
    Gettext.put_locale(BobaTalkieWeb.Gettext, interface_language)
    
    # Assign to socket
    socket
    |> Phoenix.Component.assign(:interface_language, interface_language)
    |> Phoenix.Component.assign(:learning_language, learning_language)
  end

  def build_language_params(interface_language, learning_language) do
    "interface_language=#{interface_language}&learning_language=#{learning_language}"
  end

  def supported_locales, do: @supported_locales
  def default_locale, do: @default_locale
end