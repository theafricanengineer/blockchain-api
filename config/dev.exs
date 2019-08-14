use Mix.Config

# For production, don't forget to configure the url host
# to something meaningful, Phoenix uses this information
# when generating URLs.
#
# Note we also include the path to a cache manifest
# containing the digested version of static files. This
# manifest is generated by the `mix phx.digest` task,
# which you should run after static files are built and
# before starting your production server.
port = String.to_integer(System.get_env("PORT") || "4000")
config :blockchain_api, BlockchainAPIWeb.Endpoint,
  http: [port: port],
  url: [host: (System.get_env("HOSTNAME") || "localhost"), port: port],
  server: true,
  root: ".",
  version: Application.spec(:blockchain_api, :vsn),
  check_origin: false,
  force_ssl: [hsts: true, rewrite_on: [:x_forwarded_proto]]
  # cache_static_manifest: "priv/static/cache_manifest.json"

# Don't connect dev to seed nodes
config :blockchain,
  seed_nodes: [],
  seed_node_dns: ''

config :blockchain_api, env: Mix.env()

config :blockchain_api, BlockchainAPIWeb.Endpoint,
  secret_key_base: System.get_env("SECRET_KEY_BASE")
config :blockchain_api, google_maps_secret: System.get_env("GOOGLE_MAPS_API_KEY")

# Configure your database
config :blockchain_api, BlockchainAPI.Repo,
  username: "postgres",
  password: "postgres",
  database: "blockchain_api_dev",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10,
  timeout: 60000,
  log: false
