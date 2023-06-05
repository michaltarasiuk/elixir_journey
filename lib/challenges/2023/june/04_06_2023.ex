defmodule ElixirJourney.Challenges.FourthOfJune2023.FormTask do
  @example [1, 2, 3, 4]

  def solution_1 do
    @example
    |> Enum.with_index(fn element, index -> {index, element} end)
    |> Enum.into(%{})
  end
end
