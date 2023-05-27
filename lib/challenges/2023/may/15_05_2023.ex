defmodule ElixirJourney.Challenges.FifteenthMay2023 do
  defmodule RenameKeys do
    defp rename_keys_impl(term_1, term_2) when is_map(term_1) and is_map(term_2) do
      {common, rest} = Map.split(term_1, Map.keys(term_2))

      Map.merge(term_2, common, fn _k, v_1, v_2 -> {v_1, v_2} end)
      |> Map.values()
      |> Map.new()
      |> Map.merge(rest)
    end

    def rename_keys_example do
      map_1 = %{
        name: "Bobo",
        job: "Front-End Master",
        shoe_size: 100
      }

      map_2 = %{name: "firstName", job: "passion"}

      # %{:shoe_size => 100, "firstName" => "Bobo", "passion" => "Front-End Master"}
      rename_keys_impl(map_1, map_2)
    end
  end

  defmodule Compact do
    defp is_empty(term) do
      cond do
        is_map(term) ->
          map_size(term) === 0

        is_list(term) ->
          length(term) === 0

        true ->
          !term
      end
    end

    defp compact_term(term) do
      cond do
        is_map(term) ->
          Map.filter(term, &elem(&1, 1))

        is_list(term) ->
          Enum.filter(term, & &1)

        true ->
          term
      end
    end

    defp compact_impl(term) when is_map(term) do
      term
      |> Map.to_list()
      |> Enum.flat_map(fn {key, value} ->
        compact_value = compact_term(value)

        if is_empty(compact_value), do: [], else: [{key, compact_value}]
      end)
      |> Map.new()
    end

    def compact_example do
      example_map = %{a: 1, b: nil, c: %{d: false, e: 2}, d: [nil, 3, false]}

      # %{a: 1, c: %{e: 2}, d: [3]}
      compact_impl(example_map)
    end
  end

  defmodule Unwind do
    defp unwind_impl(term, key) when is_map(term) do
      term
      |> Map.fetch!(key)
      |> Enum.map(&Map.put(term, key, &1))
    end

    def unwind_example do
      map = %{a: true, b: [1, 2]}

      # [%{a: true, b: 1}, %{a: true, b: 2}]
      unwind_impl(map, :b)
    end
  end
end
