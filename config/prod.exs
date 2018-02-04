use Mix.Config

# For production, we often load configuration from external
# sources, such as your system environment. For this reason,
# you won't find the :http configuration below, but set inside
# VoyagerWeb.Endpoint.init/2 when load_from_system_env is
# true. Any dynamic configuration should be done there.
#
# Don't forget to configure the url host to something meaningful,
# Phoenix uses this information when generating URLs.
#
# Finally, we also include the path to a cache manifest
# containing the digested version of static files. This
# manifest is generated by the mix phx.digest task
# which you typically run after static files are built.
config :voyager, VoyagerWeb.Endpoint,
  http: [port: "${PORT}"],
  url: [host: "${HOST}", port: 80],
  server: true,
  root: "."

# Do not print debug messages in production
config :logger, level: :info

# Configure your database
config :voyager, Voyager.Repo,
  username: "${POSTGRES_USER}",
  password: "${POSTGRES_PASSWORD}",
  database: "voyager_production",
  hostname: "${POSTGRES_HOST}",
  port: 5432,
  pool_size: 15

config :sentry,
  dsn: "${SENTRY_DSN}",
  environment_name: :prod,
  enable_source_code_context: true,
  root_source_code_path: File.cwd!(),
  tags: %{
    env: "production"
  }
