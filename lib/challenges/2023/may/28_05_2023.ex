defmodule ElixirJourney.Challenges.TwentyEighthMay2023 do
  defmodule Invert do
    defp invert_impl(map) do
      map
      |> Enum.map(fn {key, value} -> {value, key} end)
      |> Map.new()
    end

    def invert_example do
      map = %{a: 1, b: 2, c: 1}

      # %{1 => :c, 2 => :b}
      invert_impl(map)
    end
  end

  defmodule PullAt do
    defp pull_at_impl(list, indexes) do
      list
      |> Enum.with_index()
      |> Enum.flat_map(fn {value, index} ->
        unless Enum.member?(indexes, index), do: [value], else: []
      end)
    end

    def pull_at_example do
      list = ["a", "b", "c", "d"]
      indexes = [1, 3]

      # ["a", "c"]
      pull_at_impl(list, indexes)
    end
  end
end
