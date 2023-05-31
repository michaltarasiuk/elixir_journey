defmodule ElixirJourney.Challenges.SixteenthOfMay2023.CsvToJSON do
  @none ""
  @line "\n"
  @delimeter ","

  defp index_of(value, search_string) do
    value
    |> String.split(@none, trim: true)
    |> Enum.with_index()
    |> Enum.find_value(&(elem(&1, 0) === search_string && elem(&1, 1)))
  end

  defp get_titles(input) do
    input
    |> String.slice(0..(index_of(input, @line) - 1))
    |> String.split(@delimeter)
    |> List.to_tuple()
  end

  defp csv_to_json_impl(term) do
    titles = get_titles(term)

    term
    |> String.slice((index_of(term, @line) + 1)..String.length(term))
    |> String.split(@line)
    |> Enum.map(fn values ->
      values
      |> String.split(@delimeter)
      |> Enum.with_index(&{elem(titles, &2), &1})
      |> Map.new()
    end)
  end

  def csv_to_json_example do
    input = "col1,col2\na,b\nc,d"

    # [%{"col1" => "a", "col2" => "b"}, %{"col1" => "c", "col2" => "d"}]
    csv_to_json_impl(input)
  end
end
