defmodule Numbers do
  # when no acc, but there is only single number remaining in array
  def solutions([], [head | tail]) when tail == [] do
    solutions([head], tail)
  end

  # when no acc, but there are multiple numbers in array
  def solutions([], [head | tail]) when tail != [] do
    [tail_head | but_tail_head] = tail

    solutions([head], tail) ++
      solutions([], [(head * 10) + tail_head | but_tail_head])
  end

  # when the acc has a value but there are no numbers left
  def solutions(acc, []) do
    if SumArrayOperators.perf_sum(acc) == 100 do
      [Enum.join(acc)]
    else
      []
    end
  end

  # when acc has value and multiple values remain in array
  def solutions(acc, [head | tail]) when tail != [] do
    [tail_head | but_tail_head] = tail

    solutions(acc ++ [:+, head], tail) ++
      solutions(acc ++ [:-, head], tail) ++
      solutions(acc, [(head * 10) + tail_head | but_tail_head])
  end

  # when acc has value and there is a single value remaining in array
  def solutions(acc, [head | tail]) when tail == [] do
    solutions(acc ++ [:+, head], tail) ++
      solutions(acc ++ [:-, head], tail)
  end
end