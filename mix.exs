defmodule Prime.MixProject do
  use Mix.Project

  @version "0.1.0"
  @description "Prime is the fast-enough prime number tester and generator. Written in Elixir with no dependency."
  @source_url "https://github.com/sato11/prime"

  def project do
    [
      app: :prime,
      version: @version,
      description: @description,
      elixir: "~> 1.13",
      source_url: @source_url
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end
end
