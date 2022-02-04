defmodule Prime.FermatTest do
  use ExUnit.Case
  doctest Prime.Fermat

  describe "test/1" do
    test "asserts primes" do
      assert Prime.Fermat.test(3)
      assert Prime.Fermat.test(19)
      assert Prime.Fermat.test(101)
      assert Prime.Fermat.test(10_007)
      assert Prime.Fermat.test(2_000_000_011)
      assert Prime.Fermat.test(604_944_349_445_757_504_844_723_819_831)
    end

    test "refutes non-primes" do
      refute Prime.Fermat.test(9)
      refute Prime.Fermat.test(42)
      refute Prime.Fermat.test(5050)
      refute Prime.Fermat.test(314_159_265_358)
      refute Prime.Fermat.test(123_456_789_098_765_432_123_456_789)
    end

    test "gets fooled by carmichael numbers" do
      assert Prime.Fermat.test(561)
      assert Prime.Fermat.test(1105)
      assert Prime.Fermat.test(1729)
      assert Prime.Fermat.test(2465)
      assert Prime.Fermat.test(2821)
      assert Prime.Fermat.test(6601)
      assert Prime.Fermat.test(8911)
      assert Prime.Fermat.test(10585)
      assert Prime.Fermat.test(15841)
      assert Prime.Fermat.test(29341)
    end
  end
end
