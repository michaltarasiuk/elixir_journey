defmodule ElixirJourney.Challenges.TwentythOfMay2023.Nest do
  @link :parent_id

  defp nest_impl(items, id \\ nil) do
    items
    |> Enum.filter(&(Map.fetch!(&1, @link) === id))
    |> Enum.map(fn item ->
      children = nest_impl(items, Map.get(item, :id))

      Map.put(item, :children, children)
    end)
  end

  def nest_example do
    comments = [
      %{id: 1, parent_id: nil},
      %{id: 2, parent_id: 1},
      %{id: 3, parent_id: 1},
      %{id: 4, parent_id: 2},
      %{id: 5, parent_id: 4}
    ]

    # [
    #   %{
    #     children: [
    #       %{
    #         children: [
    #           %{
    #             children: [%{children: [], id: 5, parent_id: 4}],
    #             id: 4,
    #             parent_id: 2
    #           }
    #         ],
    #         id: 2,
    #         parent_id: 1
    #       },
    #       %{children: [], id: 3, parent_id: 1}
    #     ],
    #     id: 1,
    #     parent_id: nil
    #   }
    # ]
    nest_impl(comments)
  end
end
