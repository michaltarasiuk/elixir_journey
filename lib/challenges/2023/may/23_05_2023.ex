defmodule ElixirJourney.Challenges.TwentyThreethOfMay2023 do
  defmodule IncludesAll do
    defp includes_all_impl(term_1, term_2) do
      term_2
      |> Enum.all?(&Enum.member?(term_1, &1))
    end

    def includes_all_example do
      # {true, false}
      {includes_all_impl([1, 2, 3, 4], [1, 4]), includes_all_impl([1, 2, 3, 4], [1, 5])}
    end
  end

  defmodule CastToList do
    defp cast_to_list_impl(term) when is_list(term) do
      term
    end

    defp cast_to_list_impl(term) do
      [term]
    end

    def cast_to_list_example do
      # {[1, 2], [0]}
      {cast_to_list_impl([1, 2]), cast_to_list_impl(0)}
    end
  end
end
