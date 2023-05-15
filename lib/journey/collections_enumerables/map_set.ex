defmodule ElixirJourney.CollectionsAndEumerables.MapSet do
  def delete_example do
    map_set = MapSet.new([1, 2, 3])

    result_1 = MapSet.delete(map_set, 4)
    result_2 = MapSet.delete(map_set, 2)

    # {MapSet.new([1, 2, 3]), MapSet.new([1, 3])}
    {result_1, result_2}
  end

  def difference_example do
    # MapSet.new([1])
    MapSet.difference(MapSet.new([1, 2]), MapSet.new([2, 3, 4]))
  end

  def disjoint_example do
    result_1 = MapSet.disjoint?(MapSet.new([1, 2]), MapSet.new([3, 4]))
    result_2 = MapSet.disjoint?(MapSet.new([1, 2]), MapSet.new([2, 3]))

    # {true, false}
    {result_1, result_2}
  end

  def equal_example do
    result_1 = MapSet.equal?(MapSet.new([1, 2]), MapSet.new([2, 1, 1]))
    result_2 = MapSet.equal?(MapSet.new([1, 2]), MapSet.new([3, 4]))
    result_3 = MapSet.equal?(MapSet.new([1]), MapSet.new([1.0]))

    # {true, false, false}
    {result_1, result_2, result_3}
  end

  def filter_example do
    result_1 = MapSet.filter(MapSet.new(1..5), fn x -> x > 3 end)
    result_2 = MapSet.filter(MapSet.new(["a", :b, "c"]), &is_atom/1)

    # {MapSet.new([4, 5]), MapSet.new([:b])}
    {result_1, result_2}
  end

  def intersection_example do
    # MapSet.new([3, 4, 5])
    MapSet.intersection(MapSet.new(1..5), MapSet.new(3..5))
  end

  def member_example do
    result_1 = MapSet.member?(MapSet.new([1, 2, 3]), 2)
    result_2 = MapSet.member?(MapSet.new([1, 2, 3]), 4)

    # {true, false}
    {result_1, result_2}
  end

  def new_0_example do
    # MapSet.new([])
    MapSet.new()
  end

  def new_1_example do
    result_1 = MapSet.new([:b, :a, 3])
    result_2 = MapSet.new([3, 3, 3, 2, 2, 1])

    # {MapSet.new([3, :a, :b]), MapSet.new([1, 2, 3])}
    {result_1, result_2}
  end

  def new_2_example do
    # MapSet.new([2, 4])
    MapSet.new([1, 2, 1], fn x -> 2 * x end)
  end
end
