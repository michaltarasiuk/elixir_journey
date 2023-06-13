defmodule ElixirJourney.Challenges.TenthOfJune2023 do
  defmodule ListMerge do
    defp list_merge(list_1, list_2) when is_list(list_1) and is_list(list_2) do
      Enum.zip_with([list_1, list_2], fn
        [a, nil] -> a
        [_, b] -> b
      end)
    end

    def example do
      list_1 = [1, nil, 3]
      list_2 = [4, 2, nil]

      # [4, 2, 3]
      list_merge(list_1, list_2)
    end
  end

  defmodule SumSimilarValues do
    def sum_similar_values(term) when is_list(term) do
      term
      |> Enum.group_by(&Map.fetch!(&1, :value), &Map.fetch!(&1, :count_id))
      |> Enum.map(fn {value, count_ids} -> %{value: value, count_id: Enum.sum(count_ids)} end)
    end

    def example do
      input = [
        %{count_id: 103, value: 9.0},
        %{count_id: 200, value: 9.0},
        %{count_id: 99, value: 10.0}
      ]

      # [%{count_id: 303, value: 9.0}, %{count_id: 99, value: 10.0}]
      sum_similar_values(input)
    end
  end
end
