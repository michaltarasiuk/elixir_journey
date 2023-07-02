defmodule ElixirJourney.Challenges.TwentySeventhOJune2023 do
  defmodule CumulativeSum do
    defp cumulative_sum(numbers) do
      Enum.scan(numbers, &+/2)
    end

    def example do
      # [1, 3, 6, 10, 15]
      cumulative_sum([1, 2, 3, 4, 5])
    end
  end

  defmodule Subsequence do
    defp find_largest_subsequence(numbers, limit) do
      numbers
      |> Enum.reduce_while([], fn num, acc ->
        new_sum = Enum.sum(acc) + num

        if new_sum <= limit do
          {:cont, [num | acc]}
        else
          {:halt, acc}
        end
      end)
      |> Enum.reverse()
    end

    def example do
      # [1, 2, 3, 4]
      find_largest_subsequence([1, 2, 3, 4, 5, 6, 7], 10)
    end
  end
end
