defmodule ElixirJourney.Kernel do
  def arithmetic_multiplication_operator do
    # 2
    1 * 2
  end

  def arithmetic_positive_unary_operator do
    # 1
    +1
  end

  def arithmetic_addition_operator do
    # 3
    1 + 2
  end

  def arithmetic_nagative_unary_operator do
    # -2
    -2
  end

  def arithmetic_subtraction_operator do
    # -1
    1 - 2
  end

  # The result is always a float.
  def arithmetic_division_operator do
    # 5.0
    5 / 1
  end

  def not_equal_operator do
    # {true, false}
    {1 != 2, 1 != 1.0}
  end

  def strict_not_equal_operator do
    # {true, true}
    {1 !== 2, 1 !== 1.0}
  end

  def less_then_operator do
    # true
    1 < 2
  end

  def less_then_or_equal_operator do
    # true
    1 <= 2
  end

  def equal_operator do
    # {false, true}
    {1 == 2, 1 == 1.0}
  end

  def strict_equal_operator do
    # {false, false}
    {1 === 2, 1 === 1.0}
  end

  def greater_then_operator do
    # false
    1 > 2
  end

  def greater_then_or_equal_operator do
    # false
    1 >= 2
  end

  def abs do
    # 3.33
    abs(-3.33)
  end

  def ceil do
    # 2
    ceil(1.1)
  end

  def div do
    # 2
    div(5, 2)
  end

  def elem do
    tuple = {:foo, :bar, 3}
    elem(tuple, 1)
  end

  def floor do
    # 1
    floor(1.5)
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
end
