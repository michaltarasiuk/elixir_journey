defmodule ElixirJourney.Challenges.TwentySecondOfJune2023 do
  defmodule Palindrome do
    defp is_palindrome(string) do
      string == String.reverse(string)
    end

    defp filter_palindromes(strings) do
      Enum.filter(strings, &is_palindrome/1)
    end

    def example do
      # ["level", "deed", "radar"]
      filter_palindromes(["level", "deed", "hello", "radar", "world"])
    end
  end

  defmodule SkillOwners do
    defp extract_skills(person) do
      Enum.map(person.skills, &%{name: person.name, skill: &1})
    end

    def skill_owners(people) do
      people
      |> Enum.flat_map(&extract_skills(&1))
      |> Enum.group_by(&Map.get(&1, :skill), &Map.get(&1, :name))
    end

    def example do
      # %{
      #   "C++" => ["Bob"],
      #   "Java" => ["Alice", "Bob"],
      #   "JavaScript" => ["Charlie", "Diana"],
      #   "Python" => ["Alice", "Charlie"]
      # }
      skill_owners([
        %{name: "Alice", skills: ["Python", "Java"]},
        %{name: "Bob", skills: ["Java", "C++"]},
        %{name: "Charlie", skills: ["Python", "JavaScript"]},
        %{name: "Diana", skills: ["JavaScript"]}
      ])
    end
  end
end
