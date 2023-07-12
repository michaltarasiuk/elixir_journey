defmodule ElixirJourney.Challenges.EleventhOfJuly2023 do
  defmodule SwapMap do
    defp swap_map(map) do
      map
      |> Map.to_list()
      |> Map.new(fn {key, value} -> {value, key} end)
    end

    def example do
      # %{"one" => 1, "three" => 3, "two" => 2}
      swap_map(%{1 => "one", 2 => "two", 3 => "three"})
    end
  end

  defmodule GroupKeysByValue do
    defp group_keys_by_value(maps) do
      maps
      |> Enum.flat_map(&Function.identity/1)
      |> Enum.group_by(&elem(&1, 1), &elem(&1, 0))
    end

    def example do
      # %{1 => [:a, :c], 2 => [:b, :e], 3 => [:d], 4 => [:f]}
      group_keys_by_value([%{a: 1, b: 2}, %{c: 1, d: 3}, %{e: 2, f: 4}])
    end
  end

  defmodule CountKeyOccurrences do
    defp count_key_occurrences(maps) do
      maps
      |> Enum.flat_map(&Function.identity/1)
      |> Enum.frequencies_by(&elem(&1, 0))
    end

    def example do
      # %{a: 1, b: 2, c: 1, d: 1, f: 1}
      count_key_occurrences([%{a: 1, b: 2}, %{b: 1, c: 3}, %{d: 2, f: 4}])
    end
  end
end
