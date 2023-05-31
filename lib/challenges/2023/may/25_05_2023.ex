defmodule ElixirJourney.Challenges.TwentyFivethOfMay2023.Partition do
  @example [
    %{user: "barney", age: 36, active: false},
    %{user: "fred", age: 40, active: true},
    %{user: "pebbles", age: 1, active: false}
  ]

  @boolean_to_index %{
    true => 0,
    false => 1
  }

  defp get_index(element, predicate) do
    element
    |> partition_impl(predicate)
    |> then(&Map.get(@boolean_to_index, &1, false))
  end

  defp get_acc do
    @boolean_to_index
    |> Map.values()
    |> Map.from_keys([])
  end

  defp partition_impl(element, predicate) when is_map(element) do
    cond do
      is_function(predicate) -> predicate.(element)
      is_map(predicate) -> Map.merge(element, predicate) === element
      is_atom(predicate) -> Map.get(element, predicate, false)
      true -> false
    end
  end

  defp partition_impl(elements, predicate) when is_list(elements) do
    Enum.reduce(elements, get_acc(), fn element, acc ->
      index = get_index(element, predicate)

      Map.update!(acc, index, &[element | &1])
    end)
  end

  def partition_example_1 do
    # %{
    #   0 => [%{active: true, age: 40, user: "fred"}],
    #   1 => [
    #     %{active: false, age: 1, user: "pebbles"},
    #     %{active: false, age: 36, user: "barney"}
    #   ]
    # }

    partition_impl(@example, &Map.fetch!(&1, :active))
  end

  def partition_example_2 do
    # %{
    #   0 => [%{active: false, age: 1, user: "pebbles"}],
    #   1 => [
    #     %{active: true, age: 40, user: "fred"},
    #     %{active: false, age: 36, user: "barney"}
    #   ]
    # }

    partition_impl(@example, %{age: 1, active: false})
  end

  def partition_example_3 do
    # %{
    #   0 => [%{active: true, age: 40, user: "fred"}],
    #   1 => [
    #     %{active: false, age: 1, user: "pebbles"},
    #     %{active: false, age: 36, user: "barney"}
    #   ]
    # }

    partition_impl(@example, [:active])
  end

  def partition_example_4 do
    # %{
    #   0 => [%{active: true, age: 40, user: "fred"}],
    #   1 => [
    #     %{active: false, age: 1, user: "pebbles"},
    #     %{active: false, age: 36, user: "barney"}
    #   ]
    # }

    partition_impl(@example, :active)
  end
end
