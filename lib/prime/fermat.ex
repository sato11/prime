defmodule Prime.Fermat do
  @moduledoc """
  Implementation of Fermat-test.

  This module provides the primality test based on
  Fermat's Little Theorem.

  The methodology is essentially probablistic, which means
  even if the result says the number given is a prime,
  there is no strong guarantee that it actually is. It only
  tells the chance is good it is. In practice, the more times
  you give it a try, the more probable the number is a prime.

  Also, there is a series of contrary evidences with which
  Fermat test is known to fail. The sequence is known as
  Carmichael numbers, and they are infinite.

  Despite the deficiency, Fermat test is largely entrusted,
  widely employed algorithm for larger primes, partly because
  Carmichael numbers are not very abundant (there are 255 of
  them below `10^8`) and they get even rarer as number gets
  bigger. [Abelson and Sussman in SICP](https://en.wikipedia.org/wiki/Prime_number_theorem)
  put it that the risk of gaining false positive is
  "less than the chance that cosmic radiation will cause
  the computer to cause an error".

  With all of that said, `Prime.MillerRabin` implements
  another famous algorithm which overcomes the pitfall.
  This module is only expected to be utilized for learning
  purpose, otherwise go look at `Prime.MillerRabin`.
  """

  @iterations 128

  @doc """
  Returns the result of fermat-test.

  ## Examples

      iex> Prime.Fermat.test(1)
      false

      iex> Prime.Fermat.test(2)
      true

      iex> Prime.Fermat.test(3)
      true

      iex> Prime.Fermat.test(42)
      false

      iex> Prime.Fermat.test(561)
      true # false positive: the first carmichael number.

  """
  @spec test(pos_integer()) :: boolean()
  def test(n) when n < 2, do: false

  def test(n) when n == 2, do: true

  def test(n) do
    do_test(n, @iterations)
  end

  defp do_test(_, 0), do: true

  defp do_test(n, k) do
    p = Enum.random(2..(n - 1))

    if powmod(p, n, n) == p do
      do_test(n, k - 1)
    else
      false
    end
  end

  defp powmod(_, exp, _) when exp == 0, do: 1

  defp powmod(base, exp, mod) when rem(exp, 2) == 0 do
    rem(powmod(base, div(exp, 2), mod) ** 2, mod)
  end

  defp powmod(base, exp, mod) do
    rem(base * powmod(base, exp - 1, mod), mod)
  end
end
