defmodule ElixirJourney.Challenges.SeventeenthMay2023 do
  # truth_check_collection
  def truth_check_collection do
    users = [%{user: "Tinky-Winky", sex: "male"}, %{user: "Dipsy", sex: "male"}]

    # true
    Enum.all?(users, fn user -> user[:sex] end)
  end

  # common_keys
  def map_keys_to_set(map) do
    map
    |> Map.keys()
    |> MapSet.new()
  end

  def common_keys do
    user_1 = %{name: "John", age: 21}
    user_2 = %{name: "Adam"}

    # [:name]
    MapSet.intersection(map_keys_to_set(user_1), map_keys_to_set(user_2)) |> MapSet.to_list()
  end
end
