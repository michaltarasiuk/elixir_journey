defmodule ElixirJourney.Challenges.TwentyNinethOfJune2023.FlattenMap do
  defp push(list, new_item) do
    list
    |> Enum.reverse()
    |> then(&[new_item | &1])
    |> Enum.reverse()
  end

  defp flatten_map(map) do
    do_flatten_map(map, [])
  end

  defp do_flatten_map(map, keys) do
    Enum.reduce(map, %{}, fn {key, value}, acc ->
      new_keys = push(keys, key)

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
