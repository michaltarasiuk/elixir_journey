defmodule ElixirJourney.Challenges.TwentyThreethMay2023 do
  # includes_all
  defp includes_all(term_1, term_2) when is_list(term_1) and is_list(term_2) do
    term_2
    |> Enum.all?(&(Enum.member?(term_1, &1)))
  end

  def includes_all_example do
    # {true, false}
    {includes_all([1, 2, 3, 4], [1, 4]), includes_all([1, 2, 3, 4], [1, 5])}
  end

  # cast_to_array
  defp cast_to_list(term) when is_list(term) do
    term
  end

  defp cast_to_list(term) do
    [term]
  end

  def cast_to_list_example do
    # {[1, 2], [0]}
    {cast_to_list([1, 2]), cast_to_list(0)}
  end
end
