defmodule ElixirJourney.CollectionsAndEumerables.Enum do
  # When an element has a falsy value (false or nil) iteration stops immediately and false is returned. In all other cases true is returned.
  def all_1_example do
    # list
    result_1 = Enum.all?([])
    result_2 = Enum.all?([nil])
    result_3 = Enum.all?([1])

    # map
    result_4 = Enum.all?(%{a: 1, b: nil})
    result_5 = Enum.all?(%{})

    # {true, false, true, true, true}
    {result_1, result_2, result_3, result_4, result_5}
  end

  def all_2_example do
    # list
    list = [1.0, 2.0]

    result_1 = Enum.all?([], fn -> nil end)
    result_2 = Enum.all?(list, &(&1 == trunc(&1)))
    result_3 = Enum.all?(list, &(&1 === trunc(&1)))

    # map
    result_4 = Enum.all?(%{a: 1, b: nil}, &elem(&1, 1))
    result_5 = Enum.all?(%{a: 1, b: 2}, &elem(&1, 1))

    # {true, true, false, false, true}
    {result_1, result_2, result_3, result_4, result_5}
  end

  def any_1_example do
    # list
    result_1 = Enum.any?([])
    result_2 = Enum.any?([false, true])
    result_3 = Enum.any?([false, nil])

    # map
    result_4 = Enum.any?(%{})
    result_5 = Enum.any?(%{a: 1})

    # {false, true, false, false, true}
    {result_1, result_2, result_3, result_4, result_5}
  end

  def any_2_example do
    # list
    result_1 = Enum.any?([{:age, 18}, {:divisible, 10}], &(elem(&1, 0) > 10))

    # map
    result_2 = Enum.any?(%{a: nil, b: nil}, fn {_, x} -> x end)

    # {true, true}
    {result_1, result_2}
  end

  def at_example do
    # list
    list = [1, 2, 3, 4, 5]

    result_1 = Enum.at(list, 0)
    result_2 = Enum.at(list, 5)
    result_3 = Enum.at(list, 5, :none)

    # map
    map = %{a: 1, b: 2}

    result_4 = Enum.at(map, 0)
    result_5 = Enum.at(map, 5)
    result_6 = Enum.at(map, 5, :none)

    # {1, nil, :none, {:a, 1}, nil, :none}
    {result_1, result_2, result_3, result_4, result_5, result_6}
  end

  def chunk_by_example do
    # list
    result_1 = Enum.chunk_by([1, 2, 3, 4, 5], & &1)
    result_2 = Enum.chunk_by([1, 1, 2, 2], & &1)

    # map
    result_3 = Enum.chunk_by(%{a: 1, b: 2, c: 2}, fn {_, x} -> x end)

    # {[[1], [2], [3], [4], [5]], [[1, 1], [2, 2]], [[a: 1], [b: 2, c: 2]]}
    {result_1, result_2, result_3}
  end

  def chunk_every_2_example do
    # list
    result_1 = Enum.chunk_every([1, 2, 3, 4, 5], 2)

    # map
    result_2 = Enum.chunk_every(%{a: 1, b: 2, c: 3}, 2)

    # {[[1, 2], [3, 4], [5]], [[a: 1, b: 2], [c: 3]]}
    {result_1, result_2}
  end

  def chunk_every_3_example do
    # list
    result_1 = Enum.chunk_every([1, 2, 3, 4, 5], 2, 3)

    # map
    result_2 = Enum.chunk_every(%{a: 1, b: 2, c: 3}, 1, 2)

    # {[[1, 2], [4, 5]], [[a: 1], [c: 3]]}
    {result_1, result_2}
  end

  def chunk_every_4_example do
    # list
    result_1 = Enum.chunk_every([1, 2, 3], 2, 2, :discard)

    # map
    result_2 = Enum.chunk_every(%{a: 1, b: 2, c: 3}, 2, 2, :discard)

    # {[[1, 2]], [[a: 1, b: 2]]}
    {result_1, result_2}
  end

  # TODO
  def chunk_while_example do
  end

  def concat_1_example do
    # list
    result_1 = Enum.concat([1..3, 4..6, 7..9])
    result_2 = Enum.concat([[1, [2], 3], [4], [5, 6]])

    # {[1, 2, 3, 4, 5, 6, 7, 8, 9], [1, [2], 3, 4, 5, 6]}
    {result_1, result_2}
  end

  def concat_2_example do
    # {[1, 2, 3, 4, 5, 6], [1, 2, 3, 4, 5, 6]}
    {Enum.concat(1..3, 4..6), Enum.concat([1, 2, 3], [4, 5, 6])}
  end

  def count_1_example do
    # 2
    Enum.count([1, 2])
  end

  def count_2_example do
    # 2
    Enum.count([1, 2, 3, 4, 5], fn x -> rem(x, 2) == 0 end)
  end

  def count_until_2_example do
    # 7
    Enum.count_until(1..20, fn x -> rem(x, 2) == 0 end, 7)
  end

  def dedup_example do
    # [1, 2, 3, 1]
    Enum.dedup([1, 2, 2, 2, 3, 1])
  end

  def dedup_by_example do
    # [{1, :a}, {2, :b}, {3, :d}]
    Enum.dedup_by([{1, :a}, {2, :b}, {2, :c}, {3, :d}], fn {x, _} -> x end)
  end

  def drop_example do
    list = [1, 2, 3, 4, 5]

    # {[3, 4, 5], [1, 2, 3]}
    {Enum.drop(list, 2), Enum.drop(list, -2)}
  end

  # TODO
  def drop_every_example do
  end

  # TODO
  def drop_while_example do
  end

  def each_example do
    # :ok
    Enum.each(["some", "example"], fn x ->
      # "some"
      # "example"
      IO.puts(x)
    end)
  end

  def empty_example do
    # {true, false}
    {Enum.empty?([]), Enum.empty?([1, 2, 3])}
  end

  def fetch_example do
    # {{:ok, 2}, :error}
    {Enum.fetch([2, 4, 6], -3), Enum.fetch([2, 4, 6], 4)}
  end

  def required_fetch_example do
    # ** (Enum.OutOfBoundsError) out of bounds error
    # Enum.fetch!([2, 4, 6], 4)

    # 2
    Enum.fetch!([2, 4, 6], 0)
  end

  def filter_example do
    # [2]
    Enum.filter([1, 2, 3], fn x -> rem(x, 2) == 0 end)
  end

  def find_example do
    result_1 = Enum.find([2, 3, 4], fn x -> rem(x, 2) == 1 end)
    result_2 = Enum.find([2, 4, 6], fn x -> rem(x, 2) == 1 end)
    result_3 = Enum.find([2, 4, 6], 0, fn x -> rem(x, 2) == 1 end)

    # {3, nil, 0}
    {result_1, result_2, result_3}
  end

  def find_index_example do
    result_1 = Enum.find_index([2, 4, 6], fn x -> rem(x, 2) == 1 end)
    result_2 = Enum.find_index([2, 3, 4], fn x -> rem(x, 2) == 1 end)

    # {nil, 1}
    {result_1, result_2}
  end

  def find_value_example do
    result_1 =
      Enum.find_value([2, 3, 4], fn x ->
        if x > 2, do: x * x
      end)

    result_2 = Enum.find_value([2, 4, 6], fn x -> rem(x, 2) == 1 end)
    result_3 = Enum.find_value([2, 3, 4], fn x -> rem(x, 2) == 1 end)
    result_4 = Enum.find_value([1, 2, 3], "no bools!", &is_boolean/1)

    # {9, nil, true, "no bools!"}
    {result_1, result_2, result_3, result_4}
  end

  def flat_map_example do
    result_1 = Enum.flat_map([:a, :b, :c], fn x -> [x, x] end)
    result_2 = Enum.flat_map([{1, 3}, {4, 6}], fn {x, y} -> x..y end)
    result_3 = Enum.flat_map([:a, :b, :c], fn x -> [[x]] end)

    # {[:a, :a, :b, :b, :c, :c], [1, 2, 3, 4, 5, 6], [[:a], [:b], [:c]]}
    {result_1, result_2, result_3}
  end

  # TODO
  def flat_map_reduce_example do
  end

  def frequencies_example do
    result_1 = Enum.frequencies(["ant", "buffalo", "ant", "ant", "buffalo", "dingo"])

    # {%{"ant" => 3, "buffalo" => 2, "dingo" => 1}}
    {result_1}
  end

  def frequencies_by_example do
    result_1 = Enum.frequencies_by(["aa", "aA", "bb", "cc"], &String.downcase/1)
    result_2 = Enum.frequencies_by(~w{aaa aA bbb cc c}, &String.length/1)

    # {%{"aa" => 2, "bb" => 1, "cc" => 1}, %{1 => 1, 2 => 2, 3 => 2}}
    {result_1, result_2}
  end

  def group_by_example do
    result_1 = Enum.group_by(~w{ant buffalo cat dingo}, &String.length/1)
    result_2 = Enum.group_by(~w{ant buffalo cat dingo}, &String.length/1, &String.first/1)

    # {%{3 => ["ant", "cat"], 5 => ["dingo"], 7 => ["buffalo"]},
    #  %{3 => ["a", "c"], 5 => ["d"], 7 => ["b"]}}
    {result_1, result_2}
  end

  def intersperse_example do
    result_1 = Enum.intersperse([1, 2, 3], 0)
    result_2 = Enum.intersperse([1], 0)
    result_3 = Enum.intersperse([], 0)

    # {[1, 0, 2, 0, 3], [1], []}
    {result_1, result_2, result_3}
  end

  # TODO
  def into_2_example do
  end

  # TODO
  def into_3_example do
  end

  def join_example do
    result_1 = Enum.join([1, 2, 3])
    result_2 = Enum.join([1, 2, 3], " = ")
    result_3 = Enum.join([["a", "b"], ["c", "d", "e", ["f", "g"]], "h", "i"], " ")

    # {"123", "1 = 2 = 3", "ab cdefg h i"}
    {result_1, result_2, result_3}
  end

  def map_example do
    result_1 = Enum.map([1, 2, 3], fn x -> x * 2 end)
    result_2 = Enum.map([a: 1, b: 2], fn {k, v} -> {k, -v} end)

    # {[2, 4, 6], [a: -1, b: -2]}
    {result_1, result_2}
  end

  # TODO
  def map_every_example do
  end

  def map_intersperse_example do
    # list
    result_1 = Enum.map_intersperse([1, 2, 3], :a, &(&1 * 2))

    # map
    result_2 = Enum.map_intersperse(%{a: 1, b: 2, c: 3}, " space ", fn x -> x |> Tuple.to_list() |> Enum.join() end)

    {result_1, result_2}
  end

  def map_join_example do
    # list
    result_1 = Enum.map_join([1, 2, 3], &(&1 * 2))
    result_2 = Enum.map_join([1, 2, 3], " = ", &(&1 * 2))
    result_3 = Enum.map_join(%{a: 1, b: 2}, &(elem(&1, 1) * 2))

    # map
    result_5 = Enum.map_join(%{a: 1, b: 2}, fn x -> x |> Tuple.to_list() |> Enum.join() end)

    # {[2, :a, 4, :a, 6], ["a1", " space ", "b2", " space ", "c3"]}
    {result_1, result_2, result_3, result_5}
  end

  # TODO
  def map_reduce_example do
  end
end
