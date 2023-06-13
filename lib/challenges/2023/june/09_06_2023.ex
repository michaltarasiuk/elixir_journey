defmodule ElixirJourney.Challenges.NinethOfJune2023.DownwardTriangle do
  @asteriks "*"
  @none ""

  defp get_downward_triangle(length, downward_triangle \\ @none) do
    cond do
      length == 0 ->
        downward_triangle

      true ->
        next_value = "#{String.duplicate(@asteriks, length)}\n"

        get_downward_triangle(length - 1, downward_triangle <> next_value)
    end
  end

  def example do
    # "**********\n*********\n********\n*******\n******\n*****\n****\n***\n**\n*\n"
    get_downward_triangle(10)
  end
end
