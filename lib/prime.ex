defmodule Prime do
  @moduledoc """
  The main module you'll interact with.

  This module provides two functions, `generate/1` and `test/1`,
  where the former essentially depends on the latter. That is,
  `generate/1` generates a prime by means of yielding a random
  number using `Enum.random/1` and, if the number gained is proven
  by `test/1` to be a prime, it returns the prime, and if not
  it recursively invokes `generate/1` until `Enum.random/1` successfully
  returns a prime.

  [Prime number theorem](https://en.wikipedia.org/wiki/Prime_number_theorem)
  asserts that the distribution of the number of prime numbers
  between 1 and n is approximately `n/ln(n)`. Therefore we can assume
  the probability for the randomly chosen number between 1 and n
  to be the prime number is `1/ln(n)`.

  `ln(2^128)` approximately equals to 89. This means you only need
  less than 100 attempts to find a prime number between 1 and 2^128.
  That's why it's just ok to make a loop. Note, however, that
  the probablistic nature again reside in the `test/1`, hence there is
  actually a little more than `1/ln(n)` steps to generate a prime.
  See the doc of `Prime.Fermat.test/1` for details.
  """

  alias Prime.MillerRabin

  @doc """
  Returns a random prime number of given bit size.
  """
  @spec generate(bit_size :: pos_integer()) :: pos_integer()
  def generate(bit_size) when is_number(bit_size) and 0 < bit_size do
    inf = 2
    sup = Bitwise.<<<(1, bit_size) - 1

    x = Enum.random(inf..sup)

    if test(x) do
      x
    else
      generate(bit_size)
    end
  end

  @doc """
  Tests if the given number is a prime.

  ## Examples

      iex> Prime.test(3)
      true

      iex> Prime.test(42)
      false

      iex> Prime.test(561)
      false

      iex> Prime.test(1_000_000_007)
      true

  """
  @spec test(pos_integer()) :: boolean()
  def test(n) do
    MillerRabin.test(n)
  end
end
