defmodule SumArrayOperatorsTest do
  use ExUnit.Case

  test "when no numbers" do
    assert SumArrayOperators.perf_sum([]) == 0
  end

  test "when only single number" do
    assert SumArrayOperators.perf_sum([1]) == 1
  end

  test "when addition" do
    assert SumArrayOperators.perf_sum([2, :+, 1]) == 3
  end

  test "when subtraction" do
    assert SumArrayOperators.perf_sum([2, :-, 1]) == 1
  end

  test "when multiple" do
    assert SumArrayOperators.perf_sum([2, :-, 1, :+, 5, :-, 10]) == -4
  end
end
