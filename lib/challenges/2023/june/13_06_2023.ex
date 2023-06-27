defmodule ElixirJourney.Challenges.ThirteenthOfJune2023.OccurrenceCount do
  defp occurrence_count([], _value), do: 0
  defp occurrence_count([value | tail], value), do: 1 + occurrence_count(tail, value)
  defp occurrence_count([_head | tail], value), do: occurrence_count(tail, value)

  def example do
    # 2
    occurrence_count([1, 2, 3, 1], 1)
  end
end
