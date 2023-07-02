defmodule ElixirJourney.Challenges.TwentyFivethOfJune2023.CountSentencesWords do
  @sentences ["Hello, world!", "Hello, John!", "How are you today?"]

  defp get_words(sentence) do
    sentence
    |> String.replace(~r/[[:punct:]]/, "")
    |> String.split()
  end

  defp count_sentences_words(sentences) do
    sentences
    |> Enum.flat_map(&get_words/1)
    |> Enum.frequencies()
  end

  def example_1 do
    # %{
    #   "Hello" => 2,
    #   "How" => 1,
    #   "John" => 1,
    #   "are" => 1,
    #   "today" => 1,
    #   "world" => 1,
    #   "you" => 1
    # }
    count_sentences_words(@sentences)
  end

  def example_2 do
    # "Hello"
    @sentences
    |> count_sentences_words()
    |> Enum.max_by(&elem(&1, 1))
    |> elem(0)
  end
end
