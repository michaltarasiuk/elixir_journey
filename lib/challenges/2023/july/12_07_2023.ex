defmodule ElixirJourney.Challenges.TwelvethOfJuly2023 do
  defmodule GenerateAcronyms do
    def generate_acronyms(strings) do
      Enum.map(strings, fn string ->
        string
        |> String.split(" ")
        |> Enum.map_join(&String.at(&1, 0))
      end)
    end

    def example do
      # ["PNG", "WHO", "ASAP"]
      generate_acronyms([
        "Portable Network Graphics",
        "World Health Organization",
        "As Soon As Possible"
      ])
    end
  end

  defmodule CountCharacterOccurrences do
    defp count_character_occurrences(words) do
      words
      |> Enum.flat_map(&String.split(&1, "", trim: true))
      |> Enum.frequencies()
    end

    def example do
      # %{
      #   "a" => 4,
      #   "b" => 1,
      #   "c" => 1,
      #   "e" => 2,
      #   "h" => 1,
      #   "l" => 1,
      #   "n" => 2,
      #   "p" => 2,
      #   "r" => 2,
      #   "y" => 1
      # }
      count_character_occurrences(["apple", "banana", "cherry"])
    end
  end
end
