defmodule Voyager.Mixfile do
  @moduledoc false
  use Mix.Project

  def project do
    [
      app: :voyager,
      version: "0.0.1",
      elixir: "~> 1.10",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Voyager.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.3.0"},
      {:phoenix_pubsub, "~> 1.0"},
      {:phoenix_ecto, "~> 3.2"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_html, "~> 2.10"},
      {:poison, "~> 3.1"},
      {:gettext, "~> 0.11"},
      {:cowboy, "~> 1.0"},

      # money
      {:ex_money, "~> 5.2"},

      # file upload
      {:arc, "~> 0.8.0"},
      {:arc_ecto, "~> 0.7.0"},
      {:ex_aws, "~> 1.1"},
      {:hackney, "~> 1.6"},
      {:sweet_xml, "~> 0.6"},

      # authentication
      {:guardian, "~> 1.0"},
      {:comeonin, "~> 4.0"},
      {:bcrypt_elixir, "~> 1.0"},
      {:ueberauth, "~> 0.4"},
      {:ueberauth_google, "~> 0.7"},

      # emails
      {:bamboo, "~> 0.8"},

      # graphql
      {:absinthe, "~> 1.4"},
      {:absinthe_plug, "~> 1.4"},
      {:kronky, "~> 0.5.0"},

      # utils
      {:secure_random, "~> 0.5"},
      {:cors_plug, "~> 1.5"},

      # error reporting
      {:sentry, "~> 6.1"},

      # dev/test
      {:bamboo_smtp, "~> 1.4.0", only: :dev},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:credo, "~> 0.8", only: [:dev, :test], runtime: false},
      {:faker, "~> 0.9", only: :test},
      {:ex_machina, "~> 2.1", only: :test},
      {:distillery, "~> 1.5", runtime: false}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
