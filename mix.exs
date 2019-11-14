defmodule FlokiWithPoison.MixProject do
  use Mix.Project

  def project do
    [
      app: :flokoison,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.6"},
      {:floki, "~> 0.23.0"},
      {:earmark, "~> 1.4", [only: :dev]},
      {:ex_doc, "~> 0.21.2", [only: :dev]}
    ]
  end
end
