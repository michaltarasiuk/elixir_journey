defmodule ElixirJourney.Challenges.FivethOfJune2023.BlogTask do
  @example [
    %{id: 1, list: [1]},
    %{id: 1, list: [2]},
    %{id: 2, list: [1]},
    %{id: 3, list: [1]},
    %{id: 1, list: [3, 4, 5]},
    %{id: 2, list: [2, 3]},
    %{id: 3, list: [2, 3, 4, 5]},
    %{id: 4, list: [2, 3, 4, 5]},
    %{id: 4, list: [1]}
  ]

  @id_key :id
  @list_key :list

  def solution do
    # [
    #   %{id: 1, list: [1, 2, 3, 4, 5]},
    #   %{id: 2, list: [1, 2, 3]},
    #   %{id: 3, list: [1, 2, 3, 4, 5]},
    #   %{id: 4, list: [2, 3, 4, 5, 1]}
    # ]

    Enum.reduce(@example, %{}, fn element, acc ->
      id_value = Map.get(element, @id_key, 0)
      list_value = Map.get(element, @list_key, [])

      acc
      |> Map.update(id_value, %{id: id_value, list: list_value}, fn existing_map ->
        existing_list = Map.fetch!(existing_map, @list_key)

        %{existing_map | list: Enum.concat(existing_list, list_value)}
      end)
    end)
    |> Map.values()
  end
end
