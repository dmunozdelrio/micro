import Config

config :messaging, MessagingWeb.Endpoint,
  http: [ip: {0,0,0,0}, port: System.get_env("PORT") || 3009],
  secret_key_base: System.get_env("SECRET_KEY_BASE") || "SECRET"
