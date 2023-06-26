defmodule ElixirJourney.Challenges.EleventhOfJune2023 do
  defmodule CountKeys do
    defp count_keys(keys) when is_list(keys) do
      Enum.reduce(keys, %{}, &Map.update(&2, &1, 1, fn existing_value -> existing_value + 1 end))
    end

    def example do
      keys = [:a, :t, :c, :a, :b, :t, :o, :r, :b, :d, :f]

      # %{
      #   a: 2,
      #   b: 2,
      #   c: 1,
      #   d: 1,
      #   f: 1,
      #   o: 1,
      #   r: 1,
      #   t: 2
      # }
      count_keys(keys)
    end
  end

  defmodule ListToMap do
    defp list_to_map(list) when is_list(list) do
      list
      |> Enum.with_index(fn value, index -> {index, value} end)
      |> Map.new()
    end

    def example do
      # %{0 => 1, 1 => 2, 2 => 3, 3 => 4}
      list_to_map([1, 2, 3, 4])
    end
  end
end
