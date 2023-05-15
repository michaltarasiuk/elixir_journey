defmodule ElixirJourney.CollectionsAndEumerables.Map do
  def delete_example do
    map = %{a: 1, b: 2}

    # {%{b: 2}, %{a: 1, b: 2}}
    {Map.delete(map, :a), Map.delete(map, :c)}
  end

  def drop_example do
    # %{a: 1}
    Map.drop(%{a: 1, b: 2}, [:b, :c])
  end

  def equal_example do
    result_1 = Map.equal?(%{a: 1, b: 2}, %{b: 2, a: 1})
    result_2 = Map.equal?(%{a: 1.0, b: 2}, %{b: 2, a: 1})

    # {true, false}
    {result_1, result_2}
  end

  def fetch_example do
    result_1 = Map.fetch(%{a: 1, b: 2}, :a)
    result_2 = Map.fetch(%{a: 1}, :b)

    # {{:ok, 1}, :error}
    {result_1, result_2}
  end

  def required_fetch_example do
    # ** (KeyError) key :b not found in: %{a: 1}
    # Map.fetch!(%{a: 1}, :b)

    # 1
    Map.fetch!(%{a: 1}, :a)
  end

  def filter_example do
    # %{a: 1, c: 3}
    Map.filter(%{a: 1, b: 2, c: 3}, fn {_key, value} -> value !== 2 end)
  end

  def from_keys_example do
    # %{a: 10, b: 10, c: 10}
    Map.from_keys([:a, :b, :c], 10)
  end

  # FIXME
  # def from_struct do
  #   defmodule User do
  #     defstruct [:name]
  #   end

  #   Map.from_struct(%User{name: "john"})
  # end

  def get_example do
    map = %{a: 1, b: 2}

    # {1, nil, 3}
    {Map.get(map, :a), Map.get(map, :c), Map.get(map, :c, 3)}
  end

  def get_and_update_example do
    map = %{a: 1}

    result_1 = Map.get_and_update(map, :a, fn value -> {value, 2} end)
    result_2 = Map.get_and_update(map, :b, fn value -> {value, 2} end)
    result_3 = Map.get_and_update(map, :a, fn _ -> :pop end)

    # {{1, %{a: 2}}, {nil, %{a: 1, b: 2}}, {1, %{}}}
    {result_1, result_2, result_3}
  end

  def required_get_and_update_example do
    map = %{a: 1}

    result_1 = Map.get_and_update!(map, :a, fn value -> {value, 2} end)
    result_2 = Map.get_and_update!(map, :a, fn _ -> :pop end)

    # ** (KeyError) key :b not found in: %{a: 1}
    # Map.get_and_update!(map, :b, fn value -> {value, 2} end)

    # {{1, %{a: 2}}, {1, %{}}}
    {result_1, result_2}
  end

  def get_lazy_example do
    map = %{a: 1}

    get_result = fn key -> Map.get_lazy(map, key, fn -> 13 end) end

    # {1, 13}
    {get_result.(:a), get_result.(:b)}
  end

  def has_key_example do
    map = %{a: 1}

    # {true, false}
    {Map.has_key?(map, :a), Map.has_key?(map, :b)}
  end

  def keys_example do
    # [:a, :b]
    Map.keys(%{a: 1, b: 2})
  end

  def merge_2_example do
    # %{a: 3, b: 2, d: 4}
    Map.merge(%{a: 1, b: 2}, %{a: 3, d: 4})
  end

  def merge_3_example do
    # %{a: 4, b: 2, d: 4}
    Map.merge(%{a: 1, b: 2}, %{a: 3, d: 4}, fn _k, v1, v2 ->
      v1 + v2
    end)
  end

  def new_0_example do
    # ${}
    Map.new()
  end

  def new_1_example do
    # %{a: 2, b: 1}
    Map.new([{:b, 1}, {:a, 2}])
  end

  def new_2_example do
    # %{a: :a, b: :b}
    Map.new([:a, :b], fn x -> {x, x} end)
  end

  def pop_example do
    map = %{a: 1}

    result_1 = Map.pop(map, :a)
    result_2 = Map.pop(map, :b)
    result_3 = Map.pop(map, :b, 2)

    # {{1, %{}}, {nil, %{a: 1}}, {2, %{a: 1}}}
    {result_1, result_2, result_3}
  end

  def required_pop_example do
    # ** (KeyError) key :b not found in: %{a: 1}
    # Map.pop!(%{a: 1}, :b)

    # %{}
    Map.pop!(%{a: 1}, :a)
  end

  def lazy_pop_example do
    map = %{a: 1}

    fun = fn ->
      # some expensive operation here
      13
    end

    result_1 = Map.pop_lazy(map, :a, fun)
    result_2 = Map.pop_lazy(map, :b, fun)

    # {{1, %{}}, {13, %{a: 1}}}
    {result_1, result_2}
  end

  def put_example do
    result_1 = Map.put(%{a: 1}, :b, 2)
    result_2 = Map.put(%{a: 1, b: 2}, :a, 3)

    # {%{a: 1, b: 2}, %{a: 3, b: 2}}
    {result_1, result_2}
  end

  def put_new_example do
    result_1 = Map.put_new(%{a: 1}, :b, 2)
    result_2 = Map.put_new(%{a: 1, b: 2}, :a, 3)

    # {%{a: 1, b: 2}, %{a: 1, b: 2}}
    {result_1, result_2}
  end

  def put_new_lazy_example do
    map = %{a: 1}

    fun = fn ->
      # some expensive operation here
      3
    end

    result_1 = Map.put_new_lazy(map, :a, fun)
    result_2 = Map.put_new_lazy(map, :b, fun)

    # {%{a: 1}, %{a: 1, b: 3}}
    {result_1, result_2}
  end

  def reject_example do
    # %{two: 2}
    Map.reject(%{one: 1, two: 2, three: 3}, fn {_key, val} -> rem(val, 2) == 1 end)
  end

  def replace_example do
    result_1 = Map.replace(%{a: 1, b: 2}, :a, 3)
    result_2 = Map.replace(%{a: 1}, :b, 2)

    # {%{a: 3, b: 2}, %{a: 1}}
    {result_1, result_2}
  end

  def required_replace_example do
    # ** (KeyError) key :b not found in: %{a: 1}
    # Map.replace!(%{a: 1}, :b, 2)

    # %{a: 2, b: 2}
    Map.replace!(%{a: 1, b: 2}, :a, 2)
  end

  def replace_lazy_example do
    map = %{a: 1, b: 2}

    result_1 = Map.replace_lazy(map, :a, fn x -> x * 2 end)
    result_2 = Map.replace_lazy(map, :c, fn x -> x * 2 end)

    # {%{a: 2, b: 2}, %{a: 1, b: 2}}
    {result_1, result_2}
  end

  def split_example do
    # {%{b: 2, c: 3}, %{a: 1}}
    Map.split(%{a: 1, b: 2, c: 3}, [:b, :c])
  end

  def to_list_example do
    result_1 = Map.to_list(%{a: 1})
    result_2 = Map.to_list(%{1 => 2})

    # {[a: 1], [{1, 2}]}
    {result_1, result_2}
  end

  def update_example do
    result_1 = Map.update(%{a: 1}, :a, 0, fn x -> x * 2 end)
    result_2 = Map.update(%{a: 1}, :b, 0, fn x -> x * 2 end)

    # {%{a: 2}, %{a: 1, b: 0}}
    {result_1, result_2}
  end

  def required_update_example do
    # ** (KeyError) key :b not found in: %{a: 1}
    # Map.update!(%{a: 1}, :b, &(&1 * 2))

    # %{a: 2}
    Map.update!(%{a: 1}, :a, &(&1 * 2))
  end

  def values_example do
    # [1, 2]
    Map.values(%{a: 1, b: 2})
  end
end
