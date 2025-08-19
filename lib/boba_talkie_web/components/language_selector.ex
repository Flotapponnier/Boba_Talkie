defmodule BobaTalkieWeb.LanguageSelector do
  use Phoenix.Component
  use Gettext, backend: BobaTalkieWeb.Gettext

  attr :interface_language, :string, default: "en"
  attr :learning_language, :string, default: "en"  
  attr :show_learning_selector, :boolean, default: false
  attr :class, :string, default: ""
  
  def language_selector(assigns) do
    assigns = assign(assigns, :interface_languages, BobaTalkie.LanguageManager.get_interface_languages())
    assigns = assign(assigns, :learning_languages, BobaTalkie.LanguageManager.get_learning_languages())
    
    ~H"""
    <div class={"language-selectors #{@class}"}>
      <!-- Interface Language Selector -->
      <div class="relative inline-block">
        <div class="flex items-center space-x-2 text-sm">
          <span class="text-cute font-medium"><%= gettext("Interface Language") %></span>
          <form phx-change="change_interface_language" class="relative">
            <select 
              name="value"
              class="appearance-none bg-white border border-gray-300 rounded-lg px-3 py-1 pr-8 text-sm focus:outline-none focus:ring-2 focus:ring-boba-orange focus:border-transparent cursor-pointer"
              value={@interface_language}
            >
              <%= for {code, lang} <- @interface_languages do %>
                <option value={code} selected={code == @interface_language}>
                  <%= lang.flag %> <%= lang.name %>
                </option>
              <% end %>
            </select>
            <div class="absolute inset-y-0 right-0 flex items-center px-2 pointer-events-none">
              <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
              </svg>
            </div>
          </form>
        </div>
      </div>
      
      <!-- Learning Language Selector (only shown when specified) -->
      <%= if @show_learning_selector do %>
        <div class="relative inline-block mt-3">
          <div class="flex items-center space-x-2 text-sm">
            <span class="text-cute font-medium"><%= gettext("Learning Language") %></span>
            <form phx-change="change_learning_language" class="relative">
              <select 
                name="value"
                class="appearance-none bg-white border border-gray-300 rounded-lg px-3 py-1 pr-8 text-sm focus:outline-none focus:ring-2 focus:ring-boba-blue focus:border-transparent cursor-pointer"
                value={@learning_language}
              >
                <%= for {code, lang} <- @learning_languages do %>
                  <option value={code} selected={code == @learning_language}>
                    <%= lang.flag %> <%= lang.name %>
                  </option>
                <% end %>
              </select>
              <div class="absolute inset-y-0 right-0 flex items-center px-2 pointer-events-none">
                <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
                </svg>
              </div>
            </form>
          </div>
        </div>
      <% end %>
    </div>
    """
  end

  attr :interface_language, :string, default: "en"
  attr :class, :string, default: ""
  
  def compact_language_selector(assigns) do
    assigns = assign(assigns, :interface_languages, BobaTalkie.LanguageManager.get_interface_languages())
    assigns = assign(assigns, :current_lang, Map.get(assigns.interface_languages, assigns.interface_language))
    
    ~H"""
    <div class={"compact-language-selector #{@class}"}>
      <form phx-change="change_interface_language" class="relative inline-block">
        <select 
          name="value"
          class="appearance-none bg-white/90 backdrop-blur-sm border border-white/30 rounded-lg px-2 py-1 pr-7 text-xs focus:outline-none focus:ring-2 focus:ring-white/50 cursor-pointer"
          value={@interface_language}
        >
          <%= for {code, lang} <- @interface_languages do %>
            <option value={code} selected={code == @interface_language}>
              <%= lang.flag %> <%= lang.name %>
            </option>
          <% end %>
        </select>
        <div class="absolute inset-y-0 right-0 flex items-center px-1 pointer-events-none">
          <svg class="w-3 h-3 text-gray-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
          </svg>
        </div>
      </form>
    </div>
    """
  end
end