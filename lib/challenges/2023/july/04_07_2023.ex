defmodule ElixirJourney.Challenges.FourthOfJuly2023 do
  defmodule NumberRangeCounter do
    defp count_numbers_in_range(numbers, range_list) when is_list(range_list) do
      Enum.count(numbers, &(&1 in range_list))
    end

    defp count_numbers_in_range(numbers, {x, y}) do
      count_numbers_in_range(numbers, Enum.to_list(x..y))
    end

    def example do
      numbers = [1, 5, 10, 15, 20, 25, 30]
      range = {10, 20}

      # 3
      count_numbers_in_range(numbers, range)
    end
  end

  defmodule UniqueElementsCounter do
    def count_unique_elements(lists) do
      lists
      |> List.flatten()
      |> Enum.uniq()
      |> Enum.count()
    end

    def example do
      lists = [[1, 2, 3], [2, 3, 4], [3, 4, 5, 6], [4, 5, 6, 7, 8]]

      # 8
      count_unique_elements(lists)
    end
  end
end
