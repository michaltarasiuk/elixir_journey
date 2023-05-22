defmodule ElixirJourney.Challenges.EighteenthMay2023 do
  # map_to_query_string
  def map_to_query_string do
    example_map = %{page: "1", size: "2kg", key: nil}

    query_string_value =
      example_map
      |> Map.to_list()
      |> Enum.filter(&elem(&1, 1))
      |> Enum.map_intersperse("&", fn tuple ->
        key = elem(tuple, 0) |> Atom.to_string()
        value = elem(tuple, 1)

        "#{key}=#{value}"
      end)
      |> Enum.join()

    # "?page=1&size=2kg"
    "?" <> query_string_value
  end
end
