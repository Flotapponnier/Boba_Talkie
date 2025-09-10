defmodule BobaTalkieWeb.IndexLive do
  use BobaTalkieWeb, :live_view
  import BobaTalkieWeb.LanguageSelector
  import Phoenix.LiveView
  alias BobaTalkieWeb.LanguageSession
  
  on_mount BobaTalkieWeb.LanguageHook

  @impl true
  def mount(params, session, socket) do
    interface_language = LanguageSession.get_interface_language(params, session, socket.assigns)
    learning_language = LanguageSession.get_learning_language(params, session, socket.assigns)
    
    socket =
      socket
      |> assign(:page_title, "BobaTalkie - Voice Learning Game")
      |> LanguageSession.set_locale_and_assign(interface_language, learning_language)

    {:ok, socket}
  end

  @impl true
  def handle_event("start_game", _params, socket) do
    params = LanguageSession.build_language_params(socket.assigns.interface_language, socket.assigns.learning_language)
    {:noreply, push_navigate(socket, to: ~p"/maps?#{params}")}
  end

  @impl true
  def handle_event("start_multiplayer", _params, socket) do
    params = LanguageSession.build_language_params(socket.assigns.interface_language, socket.assigns.learning_language)
    {:noreply, push_navigate(socket, to: ~p"/multiplayer?#{params}")}
  end


  @impl true
  def handle_event("change_interface_language", %{"value" => language_code}, socket) do
    # Use JavaScript to store and reload with new language
    socket = push_event(socket, "store_and_reload", %{
      interface_language: language_code, 
      learning_language: socket.assigns.learning_language
    })
    
    {:noreply, socket}
  end

  @impl true
  def handle_event("change_learning_language", %{"value" => language_code}, socket) do
    # Use JavaScript to store and reload with new language
    socket = push_event(socket, "store_and_reload", %{
      interface_language: socket.assigns.interface_language,
      learning_language: language_code
    })
    
    {:noreply, socket}
  end
end