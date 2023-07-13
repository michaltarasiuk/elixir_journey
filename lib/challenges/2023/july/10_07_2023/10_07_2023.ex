defmodule ElixirJourney.Challenges.TenthOfJuly2023.CSVParser do
  defp parse_csv(file) do
    [header | rows] =
      file
      |> String.split("\n")
      |> Enum.map(&String.split(&1, ","))

    Enum.map(rows, &(Enum.zip(header, &1) |> Map.new()))
  end

  def example do
    file = Path.expand("./data.csv", __DIR__) |> File.read!()

    # [
    #   %{
    #     "age" => "25",
    #     "city" => "New York",
    #     "name" => "John"
    #   },
    #   %{
    #     "age" => "30",
    #     "city" => "San Francisco",
    #     "name" => "Jane"
    #   }
    # ]
    parse_csv(file)
  end
end
