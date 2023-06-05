defmodule ElixirJourney.Challenges.SecondOfJune2023.ForumTask do
  @example [
    ["e5", "e7", "e7", "e8", "e8", "e2", "e2", "e0", "e0", "e0"],
    ["B5", "B5", "B5", "B3", "B1", "B1", "B1", "B0", "B1", "B1"],
    ["G5", "G5", "G5", "G2", "G2", "G2"],
    ["D7"]
  ]

  defp get_max_length(list) do
    list
    |> Enum.map(&length/1)
    |> Enum.max()
  end

  def solution do
    max_length = get_max_length(@example)

    # [
    #   {"e5", "B5", "G5", "D7"},
    #   {"e7", "B5", "G5", nil},
    #   {"e7", "B5", "G5", nil},
    #   {"e8", "B3", "G2", nil},
    #   {"e8", "B1", "G2", nil},
    #   {"e2", "B1", "G2", nil},
    #   {"e2", "B1", nil, nil},
    #   {"e0", "B0", nil, nil},
    #   {"e0", "B1", nil, nil},
    #   {"e0", "B1", nil, nil}
    # ]

    @example
    |> Enum.map(&(&1 ++ List.duplicate(nil, max_length - length(&1))))
    |> Enum.zip()
  end
end
