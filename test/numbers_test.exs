defmodule NumbersTest do
  use ExUnit.Case

  test "single match" do
    assert Numbers.solutions([99, :+, 1], []) == ["99+1"]
  end

  test "no match" do
    assert Numbers.solutions([99, :+, 2], []) == []
  end

  test "no match with single number" do
    assert Numbers.solutions([], [1]) == []
  end

  test "no match with numbers" do
    assert Numbers.solutions([], [1,2,3]) == []
  end

  test "multiple matches" do
    assert Numbers.solutions([], [1,2,3,4,5,6,7,8,9]) == [
      "1+2+3-4+5+6+78+9",
      "1+2+34-5+67-8+9",
      "1+23-4+5+6+78-9",
      "1+23-4+56+7+8+9",
      "12+3+4+5-6-7+89",
      "12+3-4+5+67+8+9",
      "12-3-4+5-6+7+89",
      "123+4-5+67-89",
      "123-4-5-6-7+8-9",
      "123+45-67+8-9",
      "123-45-67+89"
    ]
  end
end
