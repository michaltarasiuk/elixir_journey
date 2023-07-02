defmodule ElixirJourney.Challenges.TwentySixthOfJune2023.FindStringWithSubstring do
  defp find_string_with_substring_and_reverse(strings, substring) do
    Enum.find_value(strings, fn string ->
      if String.contains?(string, substring) do
        String.reverse(string)
      end
    end)
  end

  def example do
    # "ananab"
    find_string_with_substring_and_reverse(
      ["apple", "banana", "orange", "kiwi"],
      "an"
    )
  end
end
