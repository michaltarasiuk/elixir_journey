defmodule ElixirJourney.Challenges.FourthOfJune2023 do
  defmodule ForumTask1 do
    @example [1, 2, 3, 4]

    def solution do
      # %{0 => 1, 1 => 2, 2 => 3, 3 => 4}

      @example
      |> Enum.with_index(fn element, index -> {index, element} end)
      |> Enum.into(%{})
    end
  end

  defmodule ForumTask2 do
    @example [
      %{one: 1, two: 11},
      %{one: 2, two: 22},
      %{one: 3, two: 33},
      %{one: 4, two: 44}
    ]

    def solution_1 do
      # %{one: [4, 3, 2, 1], two: [44, 33, 22, 11]}

      @example
      |> Enum.flat_map(&Function.identity/1)
      |> Enum.group_by(&elem(&1, 0), &elem(&1, 1))
    end

    def solution_2 do
      # %{one: [4, 3, 2, 1], two: [44, 33, 22, 11]}

      Enum.reduce(@example, %{one: [], two: []}, fn %{one: one, two: two}, acc ->
        %{acc | one: [one | acc.one], two: [two | acc.two]}
      end)
    end
  end
end
