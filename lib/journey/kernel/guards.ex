defmodule ElixirJourney.Kernel.Guards do
  def not_equal_operator_example do
    # {true, false}
    {1 != 2, 1 != 1.0}
  end

  def strict_not_equal_operator_example do
    # {true, true}
    {1 !== 2, 1 !== 1.0}
  end

  def equal_operator_example do
    # {false, true}
    {1 == 2, 1 == 1.0}
  end

  def strict_equal_operator_example do
    # {false, false}
    {1 === 2, 1 === 1.0}
  end

  def elem_example do
    tuple = {:foo, :bar, 3}
    elem(tuple, 1)
  end

  def hd_example do
    # 1
    hd([1, 2, 3, 4])
  end

  def left_in_right_example do
    # {true, false}
    {1 in [1, 2, 3], 1 not in [1, 2, 3]}
  end

  def is_atom_example do
    # true
    is_atom(nil)
  end

  def is_binary_example do
    # true
    is_binary("foo")
  end

  def is_boolean_example do
    # true
    is_boolean(false)
  end

  def is_exception_example do
    # true
    is_exception(%RuntimeError{})
  end

  def is_float_example do
    # true
    is_float(1.5)
  end

  def is_function_example do
    # {true, true}
    {is_function(fn x -> x + x end), is_function(fn x -> x * 2 end, 1)}
  end

  def is_integer_example do
    # true
    is_integer(1)
  end

  def is_list_example do
    # true
    is_list([])
  end

  def is_map_example do
    is_map(%{})
  end

  def is_map_key_example do
    map = %{a: 1}

    # true
    is_map_key(map, :a)
  end

  def is_nil_example do
    # true
    is_nil(nil)
  end

  def is_number_example do
    # true
    is_number(1)
  end

  def is_tuple_example do
    # true
    is_tuple({})
  end

  def length_example do
    # 3
    length([1, 2, 3])
  end

  def map_size_example do
    # 1
    map_size(%{a: 1})
  end

  def tuple_size_example do
    # 2
    tuple_size({:a, 1})
  end

  def not_operator_example do
    not false
  end

  def left_or_right_example do
    # {false, true}
    {false or false, true or "A"}
  end

  def tl_example do
    # [2, 3]
    tl([1, 2, 3])
  end
end
