defmodule SumArrayOperators do
  def perf_sum([head | tail]) do
    sum_array_operators(Enum.reverse([head | tail]))
  end

  def perf_sum([]) do
    0
  end

  # only a single number
  def sum_array_operators([head | []]) do
    head
  end

  # we've got at least at least num1, operator, num2
  def sum_array_operators([num | tail]) do
    [operator | but_operator] = tail
    apply_operator(sum_array_operators(but_operator), operator, num)
  end

  # doing addition
  def apply_operator(num1, :+, num2) do
    num1 + num2
  end

  # doing subtraction
  def apply_operator(num1, :-, num2) do
    num1 - num2
  end
end