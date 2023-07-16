defmodule ElixirJourney.Types.Tuple do
  defmodule KernelFunctions do
    def elem_example do
      tuple = {0, "Hello World", 1..10}

      # ** (ArgumentError) argument error
      # elem(tuple, 3)

      # "Hello World"
      elem(tuple, 1)
    end

    def put_elem_example do
      tuple = {:foo, :bar, 3}

      # ** (ArgumentError) argument error
      # put_elem(tuple, 3, :new_elem)

      # {:baz, :bar, 3}
      put_elem(tuple, 0, :baz)
    end

    def tuple_size_example do
      # 3
      tuple_size({:a, :b, :c})
    end
  end

  def append_example do
    tuple = {:foo, :bar}

    # {:foo, :bar, :baz}
    Tuple.append(tuple, :baz)
  end

  def delete_at_example do
    tuple = {:foo, :bar, :baz}

    # {:bar, :baz}
    Tuple.delete_at(tuple, 0)
  end

  def duplicate_example do
    # {:hello, :hello, :hello}
    Tuple.duplicate(:hello, 3)
  end

  def insert_at_example do
    tuple = {:bar, :baz}

    # {:foo, :bar, :baz}
    Tuple.insert_at(tuple, 0, :foo)
  end

  def product_example do
    # {1, 255.0, 65025}
    {Tuple.product({}), Tuple.product({255, 1.0}), Tuple.product({255, 255})}
  end

  def sum_example do
    # 510
    Tuple.sum({255, 255})
  end

  def to_list_example do
    tuple = {:foo, :bar, :baz}

    # [:foo, :bar, :baz]
    Tuple.to_list(tuple)
  end
end
