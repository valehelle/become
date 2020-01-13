defmodule BecomeWeb.PageController do
  use BecomeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
