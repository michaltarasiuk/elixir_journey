defmodule ElixirJourney.Challenges.SeventhOfJuly2023 do
  defmodule MapValueAggregator do
    defp aggregate_values(map_list) do
      Enum.reduce(map_list, &Map.merge(&2, &1, fn _, value_1, value_2 -> value_1 + value_2 end))
    end

    def example do
      # %{"a" => 1, "b" => 5, "c" => 9, "d" => 6}
      aggregate_values([%{"a" => 1, "b" => 2}, %{"b" => 3, "c" => 4}, %{"c" => 5, "d" => 6}])
    end
  end

  defmodule DeepMergeMaps do
    defp deep_merge_maps(map_list) do
      Enum.reduce(map_list, &deep_merge(&1, &2))
    end

    defp deep_merge(map_1, map_2) do
      Map.merge(map_1, map_2, fn _key, value_1, value_2 ->
        if is_map(value_1) and is_map(value_2) do
          deep_merge(value_1, value_2)
        else
          value_2
        end
      end)
    end

    def example do
      # %{"a" => 1, "b" => %{"c" => 2, "d" => 3}, "e" => 4}
      deep_merge_maps([%{"a" => 1, "b" => %{"c" => 2}}, %{"b" => %{"d" => 3}, "e" => 4}])
    end
  end
end
