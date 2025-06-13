defmodule MessagingWeb.Router do
  use MessagingWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MessagingWeb do
    pipe_through :api
    get "/", PingController, :index
  end
end
