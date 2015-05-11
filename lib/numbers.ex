defmodule Numbers do
  # when the acc has a value but there are no numbers left
  # check if solution is valid
  def solutions(acc, []) do
    if SumArrayOperators.perf_sum(acc) == 100 do
      [Enum.join(acc)]
    else
      []
    end
  end

  # we're just starting when accumulator is empty
  def solutions([], [head | tail]) do
    solutions([head], tail) ++ if tail == [] do
      []
    else
      concat([], [head | tail])
    end
  end

  # we've got an accumulator and numbers remaining
  def solutions(acc, [head | tail]) do
    plus_minus(acc, [head | tail]) ++ if tail == [] do
      []
    else
      concat(acc, [head | tail])
    end
  end

  # if no numbers, no solutions
  def solutions([], []) do
    []
  end

  # figure out solutions for + and -
  def plus_minus(acc, [head | tail]) do
    solutions(acc ++ [:+, head], tail) ++
      solutions(acc ++ [:-, head], tail)
  end

  # figure out solutions with concatenation
  def concat(acc, [head | tail]) do
    [tail_head | but_tail_head] = tail
    solutions(acc, [(head * 10) + tail_head | but_tail_head])
  end
end