defmodule BobaTalkie.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    # Load environment variables from .env file in development
    if Mix.env() in [:dev, :test] do
      Dotenv.load()
    end
    children = [
      BobaTalkieWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:boba_talkie, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: BobaTalkie.PubSub},
      # Start a worker by calling: BobaTalkie.Worker.start_link(arg)
      # {BobaTalkie.Worker, arg},
      # Start to serve requests, typically the last entry
      BobaTalkieWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BobaTalkie.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BobaTalkieWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
