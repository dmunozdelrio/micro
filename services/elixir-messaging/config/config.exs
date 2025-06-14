import Config

config :messaging, MessagingWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: MessagingWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Messaging.PubSub,
  live_view: [signing_salt: "changeme"]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

if config_env() == :prod, do: import_config "prod.exs"
