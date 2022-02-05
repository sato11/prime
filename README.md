# Prime

Prime is the fast-enough prime number tester and generator. Written in Elixir with no dependency.

## Installation

Add `prime` to your list of dependencies in `mix.exs`.

```elixir
def deps do
  [
    {:prime, "~> 0.1.0"}
  ]
end
```

## Usage
Two functions: `generate/1` and `test/1`. `generate/1` takes the bit size.

```elixir
Prime.generate(2)   # 3, or 2
Prime.generate(8)   # 233, for example
Prime.generate(32)  # 2152342891, zum Beispiel
Prime.generate(512) # s'il vous plaît.

Prime.test(7)   # true
Prime.test(42)  # false
Prime.test(907) # guess it.
```

## Contributing
Feel free.

## License
MIT
