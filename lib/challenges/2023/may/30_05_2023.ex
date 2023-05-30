defmodule ElixirJourney.Challenges.ThirtiethMay2023 do
  defmodule OverSome do
    defp over_some_impl(value, predicates) do
      predicates
      |> Enum.filter(&is_function/1)
      |> Enum.any?(fn predicate -> predicate.(value) end)
    end

    def over_some_example_1 do
      # true
      over_some_impl("1", [&is_binary/1, &is_atom/1])
    end

    def over_some_example_2 do
      # false
      over_some_impl(nil, [&is_binary/1, &is_atom/1])
    end

    def over_some_example_3 do
      # true
      over_some_impl(:atom, [&is_binary/1, &is_atom/1])
    end
  end
end
