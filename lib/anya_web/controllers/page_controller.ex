defmodule AnyaWeb.PageController do
  use AnyaWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
