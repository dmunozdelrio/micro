defmodule MessagingWeb.PingController do
  use MessagingWeb, :controller

  def index(conn, _params) do
    json(conn, %{message: "pong"})
  end
end
