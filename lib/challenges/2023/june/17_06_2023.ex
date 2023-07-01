defmodule ElixirJourney.Challenges.SeventeenthOfJune2023.SquareSum do
  defp square_sum(numbers) when is_list(numbers) do
    numbers
    |> Enum.filter(&(rem(&1, 2) == 0))
    |> Enum.map(&(&1 * &1))
    |> Enum.sum()
  end

  def example do
    # 56
    square_sum([1, 2, 3, 4, 5, 6])
  end
end
