defmodule ElixirJourney.Challenges.FifteenthMay2023 do
  # rename_keys
  def rename_keys do
    map_1 = %{
      name: "Bobo",
      job: "Front-End Master",
      shoe_size: 100
    }

    map_2 = %{name: "firstName", job: "passion"}

    {common, rest} = Map.split(map_1, Map.keys(map_2))

    # %{:shoe_size => 100, "firstName" => "Bobo", "passion" => "Front-End Master"}
    Map.merge(map_2, common, fn _k, v_1, v_2 -> {v_1, v_2} end)
    |> Map.values()
    |> Map.new()
    |> Map.merge(rest)
  end

  # compact
  def is_empty(term) do
    cond do
      is_map(term) ->
        map_size(term) === 0

      is_list(term) ->
        length(term) === 0

      !term ->
        true

      true ->
        false
    end
  end

  def compact(term) do
    cond do
      is_map(term) ->
        Map.filter(term, &elem(&1, 1))

      is_list(term) ->
        Enum.filter(term, & &1)

      true ->
        term
    end
  end

  def compact_example do
    example_map = %{a: 1, b: nil, c: %{d: false, e: 2}, d: [nil, 3, false]}

    # %{a: 1, c: %{e: 2}, d: [3]}
    example_map
    |> Map.to_list()
    |> Enum.flat_map(fn {key, value} ->
      compact_value = compact(value)

      if is_empty(compact_value), do: [], else: [{key, compact_value}]
    end)
    |> Map.new()
  end

  # unwind
  def unwind do
    map = %{a: true, b: [1, 2]}

    # [%{a: true, b: 1}, %{a: true, b: 2}]
    Enum.map(map.b, fn v -> %{map | b: v} end)
  end
end
