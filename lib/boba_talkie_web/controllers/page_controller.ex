defmodule BobaTalkieWeb.PageController do
  use BobaTalkieWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
