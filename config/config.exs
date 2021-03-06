# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :portfolio, Portfolio.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ZNzO90p7S2hGt8fCpqzbj1AUh2Q2ruq/v61+XdSUUcx8KGGdjcTLLWJD6VX2OZXt",
  render_errors: [view: Portfolio.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Portfolio.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :portfolio, :paths,
  database: "priv/portfolio.json"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "Grafikart",
  ttl: { 10, :days },
  allowed_drift: 2000,
  verify_issuer: true, # optional
  secret_key: "pwfnf4-ks4bp=)_1pzx@8pibvfbzu*h9$+md$5!i**07faxrf(",
  serializer: Portfolio.Serializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
