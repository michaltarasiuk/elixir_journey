defmodule ElixirJourney.Challenges.SixteenthOfJune2023.WordCount do
  defp word_count(sentence) do
    words =
      String.downcase(sentence)
      |> String.replace(~r/[[:punct:]]/, "")
      |> String.split()

    words
    |> Enum.group_by(&Function.identity/1)
    |> Enum.map(fn {key, value} -> {key, length(value)} end)
    |> Map.new()
  end

  def example do
    # %{
    #   "a" => 2,
    #   "is" => 2,
    #   "only" => 1,
    #   "test" => 2,
    #   "this" => 2
    # }
    word_count("This is a test. This is only a test.")
  end
end
