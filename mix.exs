defmodule Host.MixProject do
  use Mix.Project

  def project do
    [
      app: :host,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: "Reverse DNS lookups via the Unix 'host' utility",
      package: package()
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      maintainers: ["dogweather"],
      links: %{"GitHub" => "https://github.com/dogweather/host"}
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
      {:ex_doc, "~> 0.18.3", only: :dev}
    ]
  end
end
