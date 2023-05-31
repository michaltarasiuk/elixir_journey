defmodule ElixirJourney.Challenges.EighteenthOfMay2023.MapToQueryString do
  defp map_to_query_string_impl(term) do
    query_string_value =
      term
      |> Map.to_list()
      |> Enum.filter(&elem(&1, 1))
      |> Enum.map_intersperse("&", fn tuple ->
        key = elem(tuple, 0) |> Atom.to_string()
        value = elem(tuple, 1)

        "#{key}=#{value}"
      end)
      |> Enum.join()

    "?" <> query_string_value
  end

  def map_to_query_string_example do
    example_map = %{page: "1", size: "2kg", key: nil}

    # "?page=1&size=2kg"
    map_to_query_string_impl(example_map)
  end
end
