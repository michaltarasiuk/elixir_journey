defmodule ElixirJourney.Challenges.TwentythOfJune2023.PeopleStatistics do
  defp people_statistics(people) do
    count_a_names = Enum.count(people, fn %{name: name} -> String.starts_with?(name, "A") end)

    average_age =
      Enum.reduce(people, 0, fn %{age: age}, acc -> age + acc end)
      |> then(&(&1 / length(people)))

    %{
      average_age: average_age,
      count_a_names: count_a_names
    }
  end

  def example do
    # %{average_age: 30.4, count_a_names: 4}
    people_statistics([
      %{name: "Alice", age: 25},
      %{name: "Bob", age: 30},
      %{name: "Anna", age: 35},
      %{name: "Alex", age: 40},
      %{name: "Amy", age: 22}
    ])
  end
end
