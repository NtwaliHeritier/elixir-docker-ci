# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :crud,
  ecto_repos: [Crud.Repo]

# Configures the endpoint
config :crud, CrudWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "jniyuGkxD+IfVSWMeYuJHMUzRVoYzwbcCcL2HPSg1u7nzn2N5cEXhIvZL2bn1vYa",
  render_errors: [view: CrudWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Crud.PubSub,
  live_view: [signing_salt: "RgzXAmdY"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
