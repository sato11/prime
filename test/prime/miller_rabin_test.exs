defmodule Prime.MillerRabinTest do
  use ExUnit.Case
  doctest Prime.MillerRabin

  describe "test/1" do
    test "asserts primes" do
      assert Prime.MillerRabin.test(3)
      assert Prime.MillerRabin.test(19)
      assert Prime.MillerRabin.test(101)
      assert Prime.MillerRabin.test(10_007)
      assert Prime.MillerRabin.test(2_000_000_011)
      assert Prime.MillerRabin.test(604_944_349_445_757_504_844_723_819_831)
    end

    test "refutes non-primes" do
      refute Prime.MillerRabin.test(9)
      refute Prime.MillerRabin.test(42)
      refute Prime.MillerRabin.test(5050)
      refute Prime.MillerRabin.test(314_159_265_358)
      refute Prime.MillerRabin.test(123_456_789_098_765_432_123_456_789)
    end

    test "does not get fooled by carmichael numbers" do
      refute Prime.MillerRabin.test(561)
      refute Prime.MillerRabin.test(1105)
      refute Prime.MillerRabin.test(1729)
      refute Prime.MillerRabin.test(2465)
      refute Prime.MillerRabin.test(2821)
      refute Prime.MillerRabin.test(6601)
      refute Prime.MillerRabin.test(8911)
      refute Prime.MillerRabin.test(10585)
      refute Prime.MillerRabin.test(15841)
      refute Prime.MillerRabin.test(29341)
    end
  end
end
