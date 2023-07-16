defmodule ElixirJourney.CollectionsAndEumerables.Stream do
  def chunk_by_example do
    list = [1, 2, 2, 3, 4, 4, 6, 7, 7]

    # [[1], [2, 2], [3], [4, 4, 6], '\a\a']
    list
    |> Stream.chunk_by(&(rem(&1, 2) == 1))
    |> Enum.to_list()
  end

  def chunk_every_example do
    list = [1, 2, 3, 4, 5, 6]

    result_1 = Stream.chunk_every(list, 2) |> Enum.to_list()
    result_2 = Stream.chunk_every(list, 3, 2, :discard) |> Enum.to_list()
    result_3 = Stream.chunk_every(list, 3, 2, [7]) |> Enum.to_list()

    # {[[1, 2], [3, 4], [5, 6]], [[1, 2, 3], [3, 4, 5]],
    #  [[1, 2, 3], [3, 4, 5], [5, 6, 7]]}
    {result_1, result_2, result_3}
  end

  def chunk_while_example do
    # [[1, 2], [3, 4], [5, 6], [7, 8], [9, 10]]
    1..10
    |> Stream.chunk_while(
      [],
      fn element, chunk ->
        if rem(element, 2) == 0 do
          {:cont, Enum.reverse([element | chunk]), []}
        else
          {:cont, [element | chunk]}
        end
      end,
      fn
        [] -> {:cont, []}
        acc -> {:cont, Enum.reverse(acc), []}
      end
    )
    |> Enum.to_list()
  end

  def concat_1_example do
    list = [1..3, 4..6, 7..9]

    # [1, 2, 3, 4, 5, 6, 7, 8, 9]
    list
    |> Stream.concat()
    |> Enum.to_list()
  end

  def concat_2_example do
    # [1, 2, 3, 4, 5, 6]
    Stream.concat(1..3, 4..6)
    |> Enum.to_list()
  end

  def cycle_example do
    list = [1, 2, 3]

    # [1, 2, 3, 1, 2]
    list
    |> Stream.cycle()
    |> Enum.take(5)
  end

  def dedup_example do
    list = [1, 2, 3, 3, 2, 1]

    # [1, 2, 3, 2, 1]
    list
    |> Stream.dedup()
    |> Enum.to_list()
  end

  def dedup_by_example do
    list = [{1, :x}, {2, :y}, {2, :z}, {1, :x}]

    # [{1, :x}, {2, :y}, {1, :x}]
    list
    |> Stream.dedup_by(fn {x, _} -> x end)
    |> Enum.to_list()
  end

  def drop_example do
    result_1 = Stream.drop(1..10, 5) |> Enum.to_list()
    result_2 = Stream.drop(1..10, -5) |> Enum.to_list()

    # {[6, 7, 8, 9, 10], [1, 2, 3, 4, 5]}
    {result_1, result_2}
  end

  def drop_every_example do
    result_1 = Stream.drop_every(1..10, 2) |> Enum.to_list()
    result_2 = Stream.drop_every(1..1000, 1) |> Enum.to_list()
    result_3 = Stream.drop_every([1, 2, 3, 4, 5], 0) |> Enum.to_list()

    # {[2, 4, 6, 8, 10], [], [1, 2, 3, 4, 5]}
    {result_1, result_2, result_3}
  end

  def drop_while do
    # [6, 7, 8, 9, 10]/
    1..10
    |> Stream.drop(&(&1 <= 5))
    |> Enum.to_list()
  end

  def duplicate_example do
    result_1 = Stream.duplicate("Hello", 1) |> Enum.to_list()
    result_2 = Stream.duplicate({"Hello", "World"}, 0) |> Enum.to_list()

    # {["Hello"], []}
    {result_1, result_2}
  end

  def each_example do
    Stream.each([1, 2, 3], fn x -> send(self(), x) end) |> Enum.to_list()

    # 1
    receive do: (x when is_integer(x) -> x)
  end

  def filter_example do
    list = [1, 2, 3]

    # [2]
    list
    |> Stream.filter(fn x -> rem(x, 2) == 0 end)
    |> Enum.to_list()
  end

  def flat_map_example do
    list = [1, 2, 3]

    # [1, 2, 2, 4, 3, 6]
    list
    |> Stream.flat_map(fn x -> [x, x * 2] end)
    |> Enum.to_list()
  end

  def interspace_example do
    result_1 = Stream.intersperse([1, 2, 3], 0) |> Enum.to_list()
    result_2 = Stream.intersperse([1], 0) |> Enum.to_list()
    result_3 = Stream.intersperse([], 0) |> Enum.to_list()

    # {[1, 0, 2, 0, 3], [1], []}
    {result_1, result_2, result_3}
  end

  def interval_example do
    # 0
    # 1
    # 2
    # 3
    # 4
    # 5
    # 6
    # 7
    # 8
    # 9
    # 10
    Stream.interval(1000) |> Stream.each(fn number -> IO.puts(number) end) |> Stream.run()
  end

  def into_example do
    # [{0, 1}, {1, 2}, {2, 3}]
    1..3 |> Enum.with_index(&{&2, &1}) |> Stream.into(%{}) |> Enum.to_list()
  end

  def iterate_example do
    # [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    0 |> Stream.iterate(&(&1 + 1)) |> Enum.take(10)
  end

  def map_example do
    list = [1, 2, 3]

    # [2, 4, 6]
    list
    |> Stream.map(fn x -> x * 2 end)
    |> Enum.to_list()
  end

  def map_every_example do
    result_1 = Stream.map_every(1..10, 2, fn x -> x * 2 end) |> Enum.to_list()
    result_2 = Stream.map_every([1, 2, 3, 4, 5], 1, fn x -> x * 2 end) |> Enum.to_list()
    result_3 = Stream.map_every(1..5, 0, fn x -> x * 2 end) |> Enum.to_list()

    # {[2, 2, 6, 4, 10, 6, 14, 8, 18, 10], [2, 4, 6, 8, 10], [1, 2, 3, 4, 5]}
    {result_1, result_2, result_3}
  end

  def reject_example do
    list = [1, 2, 3]

    # [1, 3]
    list
    |> Stream.reject(fn x -> rem(x, 2) == 0 end)
    |> Enum.to_list()
  end

  def repeatedly_example do
    # [82, 51, 47, 50, 16, 25, 9, 44, 30, 56]
    Stream.repeatedly(fn -> Enum.random(1..100) end) |> Enum.take(10)
  end

  def with_index do
    # [{"a", 0}, {"b", 1}, {"c", 2}, {"d", 3}]
    Stream.with_index(["a", "b", "c", "d"]) |> Enum.to_list()
  end

  def zip_example do
    # [{1, "a", -8}, {2, "b", -9}, {3, "c", -10}, {4, "d", -11}]
    Stream.zip([1..10, ["a", "b", "c", "d"], -8..-20]) |> Enum.to_list()
  end

  def zip_2_example do
    # [{1, "a"}, {2, "b"}, {3, "c"}, {4, "d"}]
    Stream.zip(1..10, ["a", "b", "c", "d"]) |> Enum.to_list()
  end
end
