defmodule ElixirJourney.Kernel.Guards do
  def not_equal_operator do
    # {true, false}
    {1 != 2, 1 != 1.0}
  end

  def strict_not_equal_operator do
    # {true, true}
    {1 !== 2, 1 !== 1.0}
  end

  def equal_operator do
    # {false, true}
    {1 == 2, 1 == 1.0}
  end

  def strict_equal_operator do
    # {false, false}
    {1 === 2, 1 === 1.0}
  end

  def elem do
    tuple = {:foo, :bar, 3}
    elem(tuple, 1)
  end

  def hd do
    # 1
    hd([1, 2, 3, 4])
  end

  def left_in_right do
    # {true, false}
    {1 in [1, 2, 3], 1 not in [1, 2, 3]}
  end

  def is_atom do
    # true
    is_atom(nil)
  end

  def is_binary do
    # true
    is_binary("foo")
  end

  def is_boolean do
    # true
    is_boolean(false)
  end

  def is_exception do
    # true
    is_exception(%RuntimeError{})
  end

  def is_float do
    # true
    is_float(1.5)
  end

  def is_function do
    # {true, true}
    {is_function(fn x -> x + x end), is_function(fn x -> x * 2 end, 1)}
  end

  def is_integer do
    # true
    is_integer(1)
  end

  def is_list do
    # true
    is_list([])
  end

  def is_map do
    is_map(%{})
  end

  def is_map_key do
    map = %{a: 1}

    # true
    is_map_key(map, :a)
  end

  def is_nil do
    # true
    is_nil(nil)
  end

  def is_number do
    # true
    is_number(1)
  end

  def is_tuple do
    # true
    is_tuple({})
  end

  def length do
    # 3
    length([1, 2, 3])
  end

  def map_size do
    # 1
    map_size(%{a: 1})
  end

  def tuple_size do
    # 2
    tuple_size({:a, 1})
  end

  def not_operator do
    not false
  end

  def left_or_right do
    # {false, true}
    {false or false, true or "A"}
  end

  def tl do
    # [2, 3]
    tl([1, 2, 3])
  end
end
