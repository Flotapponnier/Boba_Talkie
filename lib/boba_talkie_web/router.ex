defmodule BobaTalkieWeb.Router do
  use BobaTalkieWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {BobaTalkieWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug BobaTalkieWeb.LocalePlug
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BobaTalkieWeb do
    pipe_through :browser

    live "/", IndexLive, :index
    live "/maps", MapSelectionLive, :index
    live "/tutorial/:topic", TutorialLive, :show
    live "/game", GameLive, :show
    live "/game/:topic", GameLive, :show
    get "/health", PageController, :home
  end

  # Other scopes may use custom stacks.
  # scope "/api", BobaTalkieWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard in development
  if Application.compile_env(:boba_talkie, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: BobaTalkieWeb.Telemetry
    end
  end
end
