defmodule ElixirJourney.Challenges.ThirtiethOfJune2023.WordCounter do
  defp get_words(sentence) do
    sentence
    |> String.replace(~r/[[:punct:]]/, "")
    |> String.split()
  end

  defp unique_word_count(sentences) do
    words = Enum.flat_map(sentences, &get_words/1)

    words
    |> Enum.frequencies()
    |> Enum.filter(&(elem(&1, 1) < 2))
    |> Enum.map(&elem(&1, 0))
  end

  def example do
    # ["at", "barks", "brown", "fence", "from", "jumps", "over", "peering", "quick", "under"]
    unique_word_count([
      "The quick brown fox jumps over the lazy dog.",
      "The lazy dog, peering from under the fence, barks at the fox."
    ])
  end
end
