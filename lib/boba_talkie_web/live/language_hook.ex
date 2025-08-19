defmodule BobaTalkieWeb.LanguageHook do
  @moduledoc """
  LiveView hook to handle language persistence across all LiveView pages.
  This ensures language settings are properly maintained.
  """
  
  import Phoenix.Component

  def on_mount(:default, params, session, socket) do
    interface_language = get_interface_language(params, session)
    learning_language = get_learning_language(params, session)
    
    # Set the gettext locale immediately
    Gettext.put_locale(BobaTalkieWeb.Gettext, interface_language)
    
    # Store languages in the socket
    socket = 
      socket
      |> assign(:interface_language, interface_language)
      |> assign(:learning_language, learning_language)
    
    {:cont, socket}
  end

  defp get_interface_language(params, session) do
    # Priority: URL params > session > default
    params["interface_language"] || 
    session["interface_language"] || 
    get_stored_language("interface") ||
    "en"
  end

  defp get_learning_language(params, session) do
    params["learning_language"] || 
    session["learning_language"] || 
    get_stored_language("learning") ||
    "en"
  end

  defp get_stored_language(_type) do
    # This returns nil to let the mount process trigger browser storage check
    nil
  end

end