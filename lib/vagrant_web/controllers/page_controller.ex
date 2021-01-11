defmodule VagrantWeb.PageController do
  use VagrantWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
