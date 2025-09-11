defmodule BobaTalkie.Release do
  @moduledoc """
  Used for executing DB release tasks when run in production without Mix
  installed.
  """
  @app :boba_talkie

  def migrate do
    load_app()
    # Note: For now, we don't have a database to migrate
    # If you add a database later, uncomment and modify this:
    # for repo <- repos() do
    #   {:ok, _, _} = Ecto.Migrator.with_repo(repo, &Ecto.Migrator.run(&1, :up, all: true))
    # end
  end

  def rollback(repo, version) do
    load_app()
    # {:ok, _, _} = Ecto.Migrator.with_repo(repo, &Ecto.Migrator.run(&1, :down, to: version))
  end

  defp load_app do
    Application.load(@app)
  end

  # defp repos do
  #   Application.fetch_env!(@app, :ecto_repos)
  # end
end