defmodule ElixirJourney.Challenges.TwentyThreethOfJune2023 do
  defmodule OldestPerson do
    defp find_oldest_person(people) do
      people
      |> Enum.max_by(&Map.get(&1, :age))
      |> Map.get(:name)
    end

    def example do
      # "Bob"
      find_oldest_person([
        %{name: "Alice", age: 25},
        %{name: "Bob", age: 30},
        %{name: "Charlie", age: 28}
      ])
    end
  end

  defmodule AverageGrades do
    defp average(grades) do
      grades
      |> Enum.sum()
      |> then(&(&1 / length(grades)))
    end

    defp convert_to_map(student) do
      %{name: student[:name], average_grade: average(student[:grades])}
    end

    defp average_grades(people) do
      Enum.map(people, &convert_to_map/1)
    end

    def example do
      # [
      #   %{average_grade: 85.0, name: "Alice"},
      #   %{average_grade: 75.0, name: "Bob"},
      #   %{
      #     average_grade: 92.33333333333333,
      #     name: "Charlie"
      #   }
      # ]
      average_grades([
        %{name: "Alice", grades: [80, 90, 85]},
        %{name: "Bob", grades: [70, 75, 80]},
        %{name: "Charlie", grades: [90, 95, 92]}
      ])
    end
  end
end
