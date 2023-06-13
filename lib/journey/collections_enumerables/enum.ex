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
    # range
    result_1 = Enum.concat([1..3, 4..6, 7..9])

    # list
    result_2 = Enum.concat([[1, [2], 3], [4], [5, 6]])

    # map
    # TODO

    # {[1, 2, 3, 4, 5, 6, 7, 8, 9], [1, [2], 3, 4, 5, 6]}
    {result_1, result_2}
  end

  def concat_2_example do
    # range
    result_1 = Enum.concat(1..3, 4..6)

    # list
    result_2 = Enum.concat([1, 2, 3], [4, 5, 6])

    # map
    # TODO

    # {[1, 2, 3, 4, 5, 6], [1, 2, 3, 4, 5, 6]}
    {result_1, result_2}
  end

  def count_1_example do
    # list
    result_1 = Enum.count([1, 2])

    # map
    result_2 = Enum.count(%{a: 1, b: 2})

    # {2, 2}
    {result_1, result_2}
  end

  def count_2_example do
    # list
    result_1 = Enum.count([1, 2, 3, 4, 5], fn x -> rem(x, 2) == 0 end)

    # map
    result_2 = Enum.count(%{a: 1, b: 2}, fn {_, x} -> x > 1 end)

    # {2, 1}
    {result_1, result_2}
  end

  def count_until_2_example do
    # range
    result_1 = Enum.count_until(1..20, fn x -> rem(x, 2) == 0 end, 7)

    # map
    map =
      1..20
      |> Enum.to_list()
      |> Enum.chunk_every(2)
      |> Enum.map(fn [a, b] -> {a, b} end)
      |> Map.new()

    result_2 =
      Enum.count_until(
        map,
        5
      )

    # {7, 5}
    {result_1, result_2}
  end

  def dedup_example do
    # list
    result_1 = Enum.dedup([1, 2, 2, 2, 3, 1])

    # map
    # TODO

    # {[1, 2, 3, 1]}
    {result_1}
  end

  def dedup_by_example do
    # list
    result_1 = Enum.dedup_by([{1, :a}, {2, :b}, {2, :c}, {3, :d}], fn {x, _} -> x end)

    # map
    # TODO

    # {[{1, :a}, {2, :b}, {3, :d}]}
    {result_1}
  end

  def drop_example do
    # list
    list = [1, 2, 3, 4, 5]

    result_1 = Enum.drop(list, 2)
    result_2 = Enum.drop(list, -2)

    # map
    result_3 = Enum.drop(%{a: 1, b: 2}, 1)
    result_4 = Enum.drop(%{a: 1, b: 2}, -1)

    # {[3, 4, 5], [1, 2, 3], [b: 2], [a: 1]}
    {result_1, result_2, result_3, result_4}
  end

  # TODO
  def drop_every_example do
  end

  # TODO
  def drop_while_example do
  end

  def each_example do
    # list
    result_1 =
      Enum.each(["some", "example"], fn x ->
        # "some"
        # "example"
        IO.puts(x)
      end)

    # map
    result_2 =
      Enum.each(%{1 => "some", 2 => "example"}, fn {_, x} ->
        # "some"
        # "example"
        IO.puts(x)
      end)

    # {:ok, :ok}
    {result_1, result_2}
  end

  def empty_example do
    # list
    result_1 = Enum.empty?([])
    result_2 = Enum.empty?([1, 2, 3])

    # map
    result_3 = Enum.empty?(%{})
    result_4 = Enum.empty?(%{a: 1})

    # {true, false, true, false}
    {result_1, result_2, result_3, result_4}
  end

  def fetch_example do
    # list
    result_1 = Enum.fetch([2, 4, 6], -3)
    result_2 = Enum.fetch([2, 4, 6], 4)

    # map
    result_3 = Enum.fetch(%{a: 1, b: 2}, 2)
    result_4 = Enum.fetch(%{a: 1, b: 2}, -1)

    # {{:ok, 2}, :error, :error, {:ok, {:b, 2}}}
    {result_1, result_2, result_3, result_4}
  end

  def required_fetch_example do
    # list
    result_1 = Enum.fetch!([2, 4, 6], 0)

    # ** (Enum.OutOfBoundsError) out of bounds error
    # Enum.fetch!([2, 4, 6], 4)

    # map
    result_2 = Enum.fetch!(%{a: 1, b: 2}, 0)

    # ** (Enum.OutOfBoundsError) out of bounds error
    # Enum.fetch!(%{a: 1, b: 2}, 2)

    {result_1, result_2}
  end

  def filter_example do
    # list
    result_1 = Enum.filter([1, 2, 3], fn x -> rem(x, 2) == 0 end)

    # map
    result_2 = Enum.filter(%{a: 1, b: 2, c: 3}, fn {_, x} -> rem(x, 2) == 0 end)

    # {[2], [b: 2]}
    {result_1, result_2}
  end

  def find_example do
    # list
    result_1 = Enum.find([2, 3, 4], fn x -> rem(x, 2) == 1 end)
    result_2 = Enum.find([2, 4, 6], fn x -> rem(x, 2) == 1 end)
    result_3 = Enum.find([2, 4, 6], 0, fn x -> rem(x, 2) == 1 end)

    # map
    # TODO

    # {3, nil, 0}
    {result_1, result_2, result_3}
  end

  def find_index_example do
    # list
    result_1 = Enum.find_index([2, 4, 6], fn x -> rem(x, 2) == 1 end)
    result_2 = Enum.find_index([2, 3, 4], fn x -> rem(x, 2) == 1 end)

    # map
    # TODO

    # {nil, 1}
    {result_1, result_2}
  end

  def find_value_example do
    # list
    result_1 =
      Enum.find_value([2, 3, 4], fn x ->
        if x > 2, do: x * x
      end)

    result_2 = Enum.find_value([2, 4, 6], fn x -> rem(x, 2) == 1 end)
    result_3 = Enum.find_value([2, 3, 4], fn x -> rem(x, 2) == 1 end)
    result_4 = Enum.find_value([1, 2, 3], "no bools!", &is_boolean/1)

    # map
    # TODO

    # {9, nil, true, "no bools!"}
    {result_1, result_2, result_3, result_4}
  end

  def flat_map_example do
    # list
    result_1 = Enum.flat_map([:a, :b, :c], fn x -> [x, x] end)
    result_2 = Enum.flat_map([{1, 3}, {4, 6}], fn {x, y} -> x..y end)
    result_3 = Enum.flat_map([:a, :b, :c], fn x -> [[x]] end)

    # map
    # TODO

    # {[:a, :a, :b, :b, :c, :c], [1, 2, 3, 4, 5, 6], [[:a], [:b], [:c]]}
    {result_1, result_2, result_3}
  end

  # TODO
  def flat_map_reduce_example do
  end

  def frequencies_example do
    # list
    result_1 = Enum.frequencies(["ant", "buffalo", "ant", "ant", "buffalo", "dingo"])

    # map
    # TODO

    # {%{"ant" => 3, "buffalo" => 2, "dingo" => 1}}
    {result_1}
  end

  def frequencies_by_example do
    # list
    result_1 = Enum.frequencies_by(["aa", "aA", "bb", "cc"], &String.downcase/1)
    result_2 = Enum.frequencies_by(~w{aaa aA bbb cc c}, &String.length/1)

    # map
    # TODO

    # {%{"aa" => 2, "bb" => 1, "cc" => 1}, %{1 => 1, 2 => 2, 3 => 2}}
    {result_1, result_2}
  end

  # TODO
  def group_by_example do
    result_1 = Enum.group_by(~w{ant buffalo cat dingo}, &String.length/1)
    result_2 = Enum.group_by(~w{ant buffalo cat dingo}, &String.length/1, &String.first/1)

    # {%{3 => ["ant", "cat"], 5 => ["dingo"], 7 => ["buffalo"]},
    #  %{3 => ["a", "c"], 5 => ["d"], 7 => ["b"]}}
    {result_1, result_2}
  end

  def intersperse_example do
    # list
    result_1 = Enum.intersperse([1, 2, 3], 0)
    result_2 = Enum.intersperse([1], 0)
    result_3 = Enum.intersperse([], 0)

    # map
    # TODO

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
    # list
    result_1 = Enum.join([1, 2, 3])
    result_2 = Enum.join([1, 2, 3], " = ")
    result_3 = Enum.join([["a", "b"], ["c", "d", "e", ["f", "g"]], "h", "i"], " ")

    # map
    # TODO

    # {"123", "1 = 2 = 3", "ab cdefg h i"}
    {result_1, result_2, result_3}
  end

  def map_example do
    # list
    result_1 = Enum.map([1, 2, 3], fn x -> x * 2 end)
    result_2 = Enum.map([a: 1, b: 2], fn {k, v} -> {k, -v} end)

    # map
    result_3 = Enum.map(%{a: 1, b: 2, c: 2}, fn x -> x |> Tuple.append(:id) end)

    # {[2, 4, 6], [a: -1, b: -2], [{:a, 1, :id}, {:b, 2, :id}, {:c, 2, :id}]}
    {result_1, result_2, result_3}
  end

  # TODO
  def map_every_example do
  end

  def map_intersperse_example do
    # list
    result_1 = Enum.map_intersperse([1, 2, 3], :a, &(&1 * 2))

    # map
    result_2 =
      Enum.map_intersperse(%{a: 1, b: 2, c: 3}, " space ", fn x ->
        x |> Tuple.to_list() |> Enum.join()
      end)

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

  def max_example do
    # list
    result_1 = Enum.max([1, 2, 3])
    result_2 = Enum.max([], &>=/2, fn -> 0 end)

    # range
    result_3 = Enum.max(1..5)

    # date
    result_4 = Enum.max([~D[2017-03-31], ~D[2017-04-01]])
    result_5 = Enum.max([~D[2017-03-31], ~D[2017-04-01]], Date)

    # {3, 0, 5, ~D[2017-03-31], ~D[2017-04-01]}
    {result_1, result_2, result_3, result_4, result_5}
  end

  def max_by_example do
    # list
    result_1 = Enum.max_by(["a", "aa", "aaa"], fn x -> String.length(x) end)
    result_2 = Enum.max_by(["a", "aa", "aaa", "b", "bbb"], &String.length/1)

    users = [
      %{name: "Ellis", birthday: ~D[1943-05-11]},
      %{name: "Lovelace", birthday: ~D[1815-12-10]},
      %{name: "Turing", birthday: ~D[1912-06-23]}
    ]

    result_3 = Enum.max_by(users, & &1.birthday, Date)

    # map
    result_4 = Enum.max_by(%{John: 22, Mike: 25}, &elem(&1, 1))

    # {"aaa", "aaa", %{birthday: ~D[1943-05-11], name: "Ellis"}, {:Mike, 25}}
    {result_1, result_2, result_3, result_4}
  end

  def member_example do
    # range
    result_1 = Enum.member?(1..10, 5)
    result_2 = Enum.member?(1..10, 5.0)

    # list
    result_3 = Enum.member?([1.0, 2.0, 3.0], 2)
    result_4 = Enum.member?([1.0, 2.0, 3.0], 2.000)
    result_5 = Enum.member?([:a, :b, :c], :d)

    # map
    result_6 = Enum.member?(%{a: 1, b: 2}, {:a, 1})

    # {true, false, false, true, false, true}
    {result_1, result_2, result_3, result_4, result_5, result_6}
  end

  def mix_example do
    # list
    result_1 = Enum.min([1, 2, 3])
    result_2 = Enum.min([], &>=/2, fn -> 0 end)

    # range
    result_3 = Enum.min(1..5)

    # date
    result_4 = Enum.min([~D[2017-03-31], ~D[2017-04-01]])
    result_5 = Enum.min([~D[2017-03-31], ~D[2017-04-01]], Date)

    # {1, 0, 1, ~D[2017-04-01], ~D[2017-03-31]}
    {result_1, result_2, result_3, result_4, result_5}
  end

  def min_by_example do
    # list
    result_1 = Enum.min_by(["a", "aa", "aaa"], fn x -> String.length(x) end)
    result_2 = Enum.min_by(["a", "aa", "aaa", "b", "bbb"], &String.length/1)

    users = [
      %{name: "Ellis", birthday: ~D[1943-05-11]},
      %{name: "Lovelace", birthday: ~D[1815-12-10]},
      %{name: "Turing", birthday: ~D[1912-06-23]}
    ]

    result_3 = Enum.min_by(users, & &1.birthday, Date)

    # map
    result_4 = Enum.min_by(%{John: 22, Mike: 25}, &elem(&1, 1))

    # {"a", "a", %{birthday: ~D[1815-12-10], name: "Lovelace"}, {:John, 22}}
    {result_1, result_2, result_3, result_4}
  end

  def min_max_example do
    # list
    result_1 = Enum.min_max([2, 3, 1])
    result_2 = Enum.min_max([], fn -> {nil, nil} end)
    result_3 = Enum.min_max([1])

    # ** (Enum.EmptyError) empty error
    # Enum.min_max([])

    # map
    result_4 = Enum.min_max(%{a: 1, b: 2, c: 3})

    # range
    result_5 = Enum.min_max(1..5)

    # {{1, 3}, {nil, nil}, {1, 1}, {{:a, 1}, {:c, 3}}, {1, 5}}
    {result_1, result_2, result_3, result_4, result_5}
  end

  # TODO
  def min_max_by_example do
  end

  # TODO
  def product_example do
  end

  # TODO
  def random_example do
  end

  # TODO
  def reduce_2_example do
  end

  # TODO
  def reduce_3_example do
  end

  # TODO
  def reduce_while_example do
  end

  # TODO
  def reject_example do
  end

  # TODO
  def reverse_example do
  end

  # TODO
  def reverse_slice_example do
  end

  # TODO
  def scan_2_example do
  end

  # TODO
  def scan_3_example do
  end

  # TODO
  def shuffle_example do
  end

  # TODO
  def slice_2_example do
  end

  # TODO
  def slice_3_example do
  end

  # TODO
  def slide_example do
  end

  # TODO
  def sort_1_example do
  end

  # TODO
  def sort_2_example do
  end

  # TODO
  def sort_by_example do
  end

  # TODO
  def split_example do
  end

  # TODO
  def split_while_example do
  end

  # TODO
  def split_with_example do
  end

  def sum_example do
    # list
    result_1 = Enum.sum([1, 2, 3])

    # range
    result_2 = Enum.sum(1..10)
    result_3 = Enum.sum(1..10//2)

    # {6, 55, 25}
    {result_1, result_2, result_3}
  end

  def take_example do
    # list
    result_1 = Enum.take([1, 2, 3], 2)

    # map
    result_2 = Enum.take(%{a: 1, b: 2}, 1)

    # range
    result_3 = Enum.take(1..3, 2)

    # {[1, 2], [a: 1], [1, 2]}
    {result_1, result_2, result_3}
  end

  def take_every_example do
    # list
    result_1 = Enum.take_every([1, 2, 3], 0)

    # map
    result_2 = Enum.take_every(%{a: 1, b: 2}, 2)

    # range
    result_3 = Enum.take_every(1..3, 1)

    # {[], [a: 1], [1, 2, 3]}
    {result_1, result_2, result_3}
  end

  def take_random_example do
    # list
    result_1 = Enum.take_random([1, 2, 3], 1)

    # map
    result_2 = Enum.take_random(%{a: 1, b: 2, c: 3}, 1)

    # range
    result_3 = Enum.take_random(1..3, 1)

    # example: {[1], [c: 3], [1]}
    {result_1, result_2, result_3}
  end

  def take_while do
    # list
    result_1 = Enum.take_while([1, 2, 3], fn x -> x < 3 end)

    # map
    result_2 = Enum.take_while(%{a: 1, b: 2, c: 3}, fn {_key, value} -> value < 3 end)

    # range
    result_3 = Enum.take_while(1..3, fn x -> x < 3 end)

    # {[1, 2], [a: 1, b: 2], [1, 2]}
    {result_1, result_2, result_3}
  end

  def uniq_example do
    # [1, 2, 3]
    Enum.uniq([1, 2, 3, 3, 2, 1])
  end

  def uniq_by_example do
    result_1 = Enum.uniq_by([{1, :x}, {2, :y}, {1, :z}], fn {x, _} -> x end)
    result_2 = Enum.uniq_by([a: {:tea, 2}, b: {:tea, 2}, c: {:coffee, 1}], fn {_, y} -> y end)

    # {[{1, :x}, {2, :y}], [a: {:tea, 2}, c: {:coffee, 1}]}
    {result_1, result_2}
  end

  def unzip_example do
    result_1 = Enum.unzip([{:a, 1}, {:b, 2}, {:c, 3}])
    result_2 = Enum.unzip(%{a: 1, b: 2})

    # {{[:a, :b, :c], [1, 2, 3]}, {[:a, :b], [1, 2]}}
    {result_1, result_2}
  end

  def with_index_example do
    # list
    result_1 = Enum.with_index([1, 2], 1)

    # range
    result_2 = Enum.with_index(1..2)

    # map
    result_3 = Enum.with_index(%{a: 1, b: 2})

    # {[{1, 1}, {2, 2}], [{1, 0}, {2, 1}], [{{:a, 1}, 0}, {{:b, 2}, 1}]}
    {result_1, result_2, result_3}
  end

  def zip_1_example do
    # list
    result_1 = Enum.zip([[:a, :b], [1, 2]])
    result_2 = Enum.zip([[:a, :b, :c], [1, 2]])

    # range
    result_3 = Enum.zip(1..3, 1..2)

    # {[a: 1, b: 2], [a: 1, b: 2], [{1, 1}, {2, 2}]}
    {result_1, result_2, result_3}
  end

  def zip_2_example do
    # list
    result_1 = Enum.zip([1, 2, 3], [:a, :b, :c])

    # map
    result_2 = Enum.zip(%{a: 1, b: 2}, %{c: 3, d: 4})

    # {[{1, :a}, {2, :b}, {3, :c}], [{{:a, 1}, {:c, 3}}, {{:b, 2}, {:d, 4}}]}
    {result_1, result_2}
  end

  def zip_reduce_3_example do
    result_1 =
      Enum.zip_reduce([[1, 1], [2, 2], [3, 3]], [], fn elements, acc ->
        [List.to_tuple(elements) | acc]
      end)

    result_2 =
      Enum.zip_reduce([[1, 2], %{a: 3, b: 4}, [5, 6]], [], fn elements, acc ->
        [List.to_tuple(elements) | acc]
      end)

    {result_1, result_2}
  end

  def zip_reduce_4_example do
    result_1 = Enum.zip_reduce([1, 2], [3, 4], 0, fn x, y, acc -> x + y + acc end)
    result_2 = Enum.zip_reduce([1, 2], [3, 4], [], fn x, y, acc -> [x + y | acc] end)

    # {10, [6, 4]}
    {result_1, result_2}
  end

  # TODO
  def zip_with_2_example do
  end

  def zip_with_3_example do
    # list
    result_1 = Enum.zip_with([1, 2], [3, 4], fn a, b -> {b, a} end)
    result_2 = Enum.zip_with([1, 2], [3, 4], fn a, b -> a + b end)

    # map
    left = %{:a => 1, 1 => 3}
    right = %{:a => 1, :b => :c}

    result_3 = Enum.zip(left, right)

    # {[{3, 1}, {4, 2}], [4, 6], [{{1, 3}, {:a, 1}}, {{:a, 1}, {:b, :c}}]}
    {result_1, result_2, result_3}
  end
end
