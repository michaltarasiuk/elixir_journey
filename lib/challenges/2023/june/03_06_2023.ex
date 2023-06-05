defmodule ElixirJourney.Challenges.ThirdOfJune2023.ForumTask do
  @example [1, 2, 3, 0, 4, 5, 0, 6, 7, 8, 0, 9]

  def solution do
    # [[1, 2, 3], [4, 5], [6, 7, 8], '\t']

    List.foldr(@example, [[]], fn
      0, acc -> [[] | acc]
      element, [head | tail] -> [[element | head] | tail]
    end)
  end
end
