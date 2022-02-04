defmodule Prime.MixProject do
  use Mix.Project

  @version "0.1.1"
  @description "Prime is the fast-enough prime number tester and generator. Written in Elixir with no dependency."
  @source_url "https://github.com/sato11/prime"

  def project do
    [
      app: :prime,
      version: @version,
      description: @description,
      elixir: "~> 1.13",
      source_url: @source_url,
      deps: deps(),
      package: package()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  def deps do
    [
      {:ex_doc, "~> 0.27", only: :dev, runtime: false}
    ]
  end

  defp package() do
    [
      licenses: ["MIT"],
      links: %{"GitHub" => @source_url}
    ]
  end
end
