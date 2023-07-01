defmodule ElixirJourney.Challenges.NineteenthOfJune2023.MostCommonWords do
  defp find_most_common_word(words) do
    word_counts =
      words
      |> Enum.group_by(&Function.identity/1)
      |> Enum.map(fn {word_name, word_list} -> {word_name, Enum.count(word_list)} end)

    word_counts
    |> Enum.reduce({nil, 0}, fn word_count, acc ->
      if elem(word_count, 1) > elem(acc, 1) do
        word_count
      else
        acc
      end
    end)
    |> elem(0)
  end

  def example do
    # apple
    find_most_common_word(["apple", "banana", "apple", "orange", "banana", "apple"])
  end
end
