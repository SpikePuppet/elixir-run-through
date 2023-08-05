defmodule KV.MixProject do
  use Mix.Project

  # This just returns a keyword list. Remember, naked returns are a thing
  def project do
    [
      app: :kv,
      version: "0.1.0",
      elixir: "~> 1.15",
      # Mix.env lets you access env so we can configure based on it
      # Start permanent means if something goes wrong in the Elixir
      # supervision tree, the Erlang VM will crash too. Don't want
      # that in dev/test since we could use it for debugging
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
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
