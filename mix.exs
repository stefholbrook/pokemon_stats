defmodule PokemonStats.MixProject do
  use Mix.Project

  def project do
    [
      app: :pokemon_stats,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {PokemonStats.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:cowboy, "~> 2.4"},
      {:httpoison, "~> 1.7"},
      {:math, "~> 0.6.0"},
      {:poison, "~> 3.0"},
      {:plug_cowboy, "~> 2.0"}
    ]
  end
end
