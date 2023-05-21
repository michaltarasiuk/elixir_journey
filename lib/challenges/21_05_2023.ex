defmodule ElixirJourney.Challenges.TwentyOnethMay2023 do
  def split_key(key) do
    key
    |> String.split(".")
    |> Enum.map(&Access.key(&1, %{}))
  end

  def unflatten_map(key, value) do
    splitted_key = split_key(key)

    put_in(%{}, splitted_key, value)
  end

  def unflatten_map(map) do
    Enum.reduce(map, %{}, fn {key, value}, acc ->
      Map.merge(acc, unflatten_map(key, value))
    end)
  end

  def unflatten_map_example do
    map = %{"a.b.0" => 8, "c" => "four"}

    # %{"a" => %{"b" => %{"0" => 8}}, "c" => "four"}
    unflatten_map(map)
  end
end
