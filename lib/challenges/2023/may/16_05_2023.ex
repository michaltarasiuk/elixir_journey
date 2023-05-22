defmodule ElixirJourney.Challenges.SixteenthMay2023 do
  # csv_to_json
  @delimeter ","

  defp index_of(value, search_string) do
    value
    |> String.split("", trim: true)
    |> Enum.with_index()
    |> Enum.find_value(&(elem(&1, 0) === search_string && elem(&1, 1)))
  end

  defp get_titles(input) do
    input
    |> String.slice(0..(index_of(input, "\n") - 1))
    |> String.split(@delimeter)
    |> List.to_tuple()
  end

  def csv_to_json do
    input = "col1,col2\na,b\nc,d"
    titles = get_titles(input)

    # [%{"col1" => "a", "col2" => "b"}, %{"col1" => "c", "col2" => "d"}]
    input
    |> String.slice((index_of(input, "\n") + 1)..String.length(input))
    |> String.split("\n")
    |> Enum.map(fn values ->
      values
      |> String.split(@delimeter)
      |> Enum.with_index(&{elem(titles, &2), &1})
      |> Map.new()
    end)
  end
end
