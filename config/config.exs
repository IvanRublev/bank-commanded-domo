# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :bank,
  ecto_repos: [Bank.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :bank, BankWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "prm6nLI2xPzdBMBium1edIbSMmBuPIgnJpHdvRePgl3NYli70fTA08McBTJ8P+Dw",
  render_errors: [view: BankWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Bank.PubSub,
  live_view: [signing_salt: "B7g2cLHS"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :bank, Bank.Core.EventStore,
  username: "postgres",
  password: "postgres",
  database: "bank_eventstore_dev",
  hostname: "localhost",
  serializer: EventStore.TermSerializer

config :bank, event_stores: [Bank.Core.EventStore]

config :commanded_ecto_projections,
  repo: Bank.Repo

config :bank, Bank.Core.Application,
  event_store: [
    adapter: Commanded.EventStore.Adapters.EventStore,
    event_store: Bank.Core.EventStore
  ],
  pubsub: :local,
  registry: :local

config :domo, :skip_defaults, true

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
