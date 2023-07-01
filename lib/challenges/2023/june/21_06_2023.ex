defmodule ElixirJourney.Challenges.TwentyFirstOfJune2023.StudentGrades do
  defp calculate_average(grades) do
    Enum.sum(grades) / length(grades)
  end

  defp calculate_average_grades(students) do
    students
    |> Enum.map(fn %{name: name, grades: grades} -> {name, calculate_average(grades)} end)
    |> Map.new()
  end

  def example do
    # %{
    #   "Alice" => 85.0,
    #   "Bob" => 70.0,
    #   "Charlie" => 95.0,
    #   "Diana" => 87.33333333333333
    # }
    calculate_average_grades([
      %{name: "Alice", grades: [80, 90, 85]},
      %{name: "Bob", grades: [70, 75, 65]},
      %{name: "Charlie", grades: [95, 92, 98]},
      %{name: "Diana", grades: [85, 87, 90]}
    ])
  end
end
