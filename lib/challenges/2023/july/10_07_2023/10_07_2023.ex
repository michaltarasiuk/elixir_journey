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

    parse_csv(file)
  end
end
