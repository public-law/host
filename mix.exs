defmodule Host.MixProject do
  use Mix.Project

  def project do
    [
      app: :host,
      version: "1.0.0",
      elixir: "~> 1.6",
      deps: deps(),
      package: package(),
      start_permanent: Mix.env() == :prod,

      # Docs
      description: "Reverse DNS lookups",
      source_url: "https://github.com/public-law/host"
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      maintainers: ["dogweather"],
      links: %{"GitHub" => "https://github.com/public-law/host"}
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
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
      {:dns, "~> 2.1.2"},
      {:ex_doc, "~> 0.19", only: :dev},
      {:vex, "~> 0.8.0"}
    ]
  end
end
