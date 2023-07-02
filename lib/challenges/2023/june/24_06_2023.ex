defmodule ElixirJourney.Challenges.TwentyFourthOfJune2023.WordFrequency do
  defp word_frequency(sentence) do
    words =
      sentence
      |> String.downcase()
      |> String.replace(~r/[[:punct:]]/, "")
      |> String.split()

    Enum.frequencies(words)
  end

  defp frequencies_by_first_letter(words) do
    Enum.frequencies_by(words, &String.first/1)
  end

  def example_1 do
    # %{
    #   "The" => 1,
    #   "quick" => 1,
    #   "brown" => 1,
    #   "fox" => 1,
    #   "jumps" => 1,
    #   "over" => 1,
    #   "the" => 1,
    #   "lazy" => 1,
    #   "dog" => 1
    # }
    word_frequency("The quick brown fox jumps over the lazy dog.")
  end

  def example_2 do
    frequencies_by_first_letter(["cat", "dog", "elephant", "bird", "lion", "tiger"])
  end
end
