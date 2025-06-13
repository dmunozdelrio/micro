defmodule MessagingWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :messaging

  socket "/socket", MessagingWeb.UserSocket,
    websocket: true,
    longpoll: false

  plug Plug.Static,
    at: "/",
    from: :messaging,
    gzip: false,
    only: ~w()

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head

  plug MessagingWeb.Router
end
