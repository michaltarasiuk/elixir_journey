defmodule ElixirJourney.Challenges.SeventeenthMay2023 do
  defmodule TruthCheckCollection do
    defp truth_check_collection_impl(term_1, term_2) do
      Enum.all?(term_1, &Map.has_key?(&1, term_2))
    end

    def truth_check_collection_example do
      users = [%{user: "Tinky-Winky", sex: "male"}, %{user: "Dipsy", sex: "male"}]

      # true
      truth_check_collection_impl(users, :sex)
    end
  end

  defmodule CommonKeys do
    defp map_keys_to_set(map) do
      map
      |> Map.keys()
      |> MapSet.new()
    end

    defp common_keys_impl(term_1, term_2) do
      MapSet.intersection(map_keys_to_set(term_1), map_keys_to_set(term_2)) |> MapSet.to_list()
    end

    def common_keys_example do
      user_1 = %{name: "John", age: 21}
      user_2 = %{name: "Adam"}

      # [:name]
      common_keys_impl(user_1, user_2)
    end
  end
end
