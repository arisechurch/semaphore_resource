defmodule SemaphoreResource.MixProject do
  use Mix.Project

  def project do
    [
      app: :semaphore_resource,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      test_paths: ['lib']
    ]
  end

  defp package,
    do: [
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Tim Smart"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/arisechurch/semaphore_resource"}
    ]

  def application do
    []
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:semaphore, "~> 1.1"}
    ]
  end
end
