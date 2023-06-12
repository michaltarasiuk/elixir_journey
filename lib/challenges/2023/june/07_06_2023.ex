defmodule ElixirJourney.Challenges.SeventhOfJune2023.StackOverflowTask do
  @input [
    %{company: "company_one", state: "LA", size: 100},
    %{company: "company_one", state: "LA", size: 200},
    %{company: "company_two", state: "TX", size: 200},
    %{company: "company_two", state: "LA", size: 300},
    %{company: "company_three", state: "LA", size: 400},
    %{company: "company_four", state: "TX", size: 500}
  ]

  defp value_at(map, index) when is_map(map) and is_integer(index) do
    map
    |> Enum.at(index)
    |> elem(1)
  end

  defp get_max_call_counter(list) when is_list(list) do
    list
    |> Enum.map(fn element -> Enum.count(element) - 1 end)
    |> Enum.max()
  end

  defp deep_group_by_index(list, call_counter \\ 0) do
    max_call_counter = get_max_call_counter(list)

    cond do
      call_counter > max_call_counter ->
        list

      true ->
        list
        |> Enum.group_by(&value_at(&1, call_counter))
        |> Enum.map(fn {key, value} -> {key, deep_group_by_index(value, call_counter + 1)} end)
        |> Map.new()
    end
  end

  def solution do
    # %{
    #   "company_four" => %{
    #     "TX" => %{500 => [%{company: "company_four", size: 500, state: "TX"}]}
    #   },
    #   "company_one" => %{
    #     "LA" => %{
    #       100 => [%{company: "company_one", size: 100, state: "LA"}],
    #       200 => [%{company: "company_one", size: 200, state: "LA"}]
    #     }
    #   },
    #   "company_three" => %{
    #     "LA" => %{400 => [%{company: "company_three", size: 400, state: "LA"}]}
    #   },
    #   "company_two" => %{
    #     "LA" => %{300 => [%{company: "company_two", size: 300, state: "LA"}]},
    #     "TX" => %{200 => [%{company: "company_two", size: 200, state: "TX"}]}
    #   }
    # }

    deep_group_by_index(@input)
  end
end
