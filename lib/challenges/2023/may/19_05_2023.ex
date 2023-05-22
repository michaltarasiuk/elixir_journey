defmodule ElixirJourney.Challenges.NineteenthMay2023 do
  # flatten_map
  defp to_flatten_map(term, _key) when is_map(term) do
    term |> flatten_map()
  end

  defp to_flatten_map(term, key) do
    Map.new([{key, term}])
  end

  defp flatten_map(map) do
    map
    |> Map.keys()
    |> Enum.reduce(%{}, &Map.merge(&2, Map.get(map, &1) |> to_flatten_map(&1)))
  end

  def flatten_map_example do
    example_map = %{a: 1, b: %{c: 3, d: 4, e: %{f: 6}}}

    # %{a: 1, c: 3, d: 4, f: 6}
    flatten_map(example_map)
  end
end
