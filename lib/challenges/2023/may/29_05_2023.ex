defmodule ElixirJourney.Challenges.TwentyNinethMay2023.FindKey do
  @example %{
    barney: %{age: 36, active: true},
    fred: %{age: 40, active: false},
    pebbles: %{age: 1, active: true}
  }

  defp predicate(element, predicate_value) do
    cond do
      is_function(predicate_value) -> predicate_value.(element)
      is_map(predicate_value) -> Map.merge(element, predicate_value) === element
      is_atom(predicate_value) -> Map.get(element, predicate_value, false)
      is_list(predicate_value) -> get_in(element, predicate_value)
      true -> false
    end
  end

  defp find_key_impl(map, predicate_value) when is_map(map) do
    Enum.find_value(map, fn {key, value} ->
      if predicate(value, predicate_value) do
        key
      end
    end)
  end

  def find_key_example_1 do
    # :barney
    find_key_impl(@example, &(Map.get(&1, :age) < 40))
  end

  def find_key_example_2 do
    # :pebbles
    find_key_impl(@example, %{age: 1, active: true})
  end

  def find_key_example_3 do
    # :barney
    find_key_impl(@example, [:active])
  end

  def find_key_example_4 do
    # :barney
    find_key_impl(@example, :active)
  end
end
