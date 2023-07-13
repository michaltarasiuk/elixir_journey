defmodule ElixirJourney.Challenges.TwentyNinethOfJune2023.FlattenMap do
  alias ElixirJourney.Challenges.Toolbelt

  defp flatten_map(map) do
    do_flatten_map(map, [])
  end

  defp do_flatten_map(map, keys) do
    Enum.reduce(map, %{}, fn {key, value}, acc ->
      new_keys = Toolbelt.push(keys, key)

      cond do
        is_map(value) ->
          do_flatten_map(value, new_keys) |> Map.merge(acc)

        true ->
          Map.put(acc, Enum.join(new_keys, "."), value)
      end
    end)
  end

  def example do
    # %{
    #   "a" => 1,
    #   "b.c" => 2,
    #   "b.d.e" => 3,
    #   "f" => 4
    # }
    flatten_map(%{
      "a" => 1,
      "b" => %{
        "c" => 2,
        "d" => %{
          "e" => 3
        }
      },
      "f" => 4
    })
  end
end
