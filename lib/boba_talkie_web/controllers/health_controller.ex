defmodule BobaTalkieWeb.HealthController do
  use BobaTalkieWeb, :controller

  def check(conn, _params) do
    conn
    |> put_status(:ok)
    |> text("ok")
  end
end