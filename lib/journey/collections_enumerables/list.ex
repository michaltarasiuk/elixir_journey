defmodule ElixirJourney.CollectionsAndEumerables.List do
  # TODO
  def ascii_printable_example do
  end

  def delete_example do
    example = [1, {:b, 2}]

    result_1 = List.delete(example, 1)
    result_2 = List.delete(example, {:b, 2})

    # {[b: 2], [1]}
    {result_1, result_2}
  end

  def delete_at_example do
    example = [1, 2, 3]

    result_1 = List.delete_at(example, 0)
    result_2 = List.delete_at(example, 10)
    result_3 = List.delete_at(example, -1)

    # {[2, 3], [1, 2, 3], [1, 2]}
    {result_1, result_2, result_3}
  end

  def duplicate_example do
    result_1 = List.duplicate("Hello", 2)
    result_2 = List.duplicate([], 0)

    # {["Hello", "Hello"], []}
    {result_1, result_2}
  end

  def first_example do
    result_1 = List.first([])
    result_2 = List.first([1])
    result_3 = List.first([0], 0)

    # {nil, 1, 0}
    {result_1, result_2, result_3}
  end

  def flatten_1_example do
    # [1, 2, 3]
    List.flatten([1, [[2], 3]])
  end

  def flatten_2_example do
    result_1 = List.flatten([1, [[2], 3]], [4, 5])
    result_2 = List.flatten([1, [], 2], [3, [], 4])

    # {[1, 2, 3, 4, 5], [1, 2, 3, [], 4]}
    {result_1, result_2}
  end

  def foldl_example do
    # {6, -6}
    List.foldl([1, 2, 3], {0, 0}, fn x, {a1, a2} -> {a1 + x, a2 - x} end)
  end

  def foldr_example do
    # %{product: 24, sum: 10}
    List.foldr([1, 2, 3, 4], %{sum: 0, product: 1}, fn x, %{sum: a1, product: a2} ->
      %{sum: a1 + x, product: a2 * x}
    end)
  end

  # TODO
  def improper_example do
  end

  def insert_at_example do
    example = [1, 2, 3]

    result_1 = List.insert_at(example, 1, 0)
    result_2 = List.insert_at(example, 10, 0)
    result_3 = List.insert_at(example, -1, 0)
    result_4 = List.insert_at(example, -10, 0)

    # {[1, 0, 2, 3], [1, 2, 3, 0], [1, 2, 3, 0], [0, 1, 2, 3]}
    {result_1, result_2, result_3, result_4}
  end

  def keydelete_example do
    example = [a: 1, b: 2]

    result_1 = List.keydelete(example, :a, 0)
    result_2 = List.keydelete(example, :c, 0)

    # {[b: 2], [a: 1, b: 2]}
    {result_1, result_2}
  end

  def keyfind_example do
    example = [a: 1, b: 2]

    result_1 = List.keyfind(example, :a, 0)
    result_2 = List.keyfind(example, 2, 1)
    result_3 = List.keyfind(example, :c, 0)

    # {{:a, 1}, {:b, 2}, nil}
    {result_1, result_2, result_3}
  end

  def required_keyfind_example do
    example = [a: 1, b: 2]

    # ** (KeyError) key :c at position 0 not found in: [a: 1, b: 2]
    # List.keyfind!(example, :c, 0)

    List.keyfind!(example, 2, 1)
  end

  def keymember_example do
    example = [a: 1, b: 2]

    result_1 = List.keymember?(example, :a, 0)
    result_2 = List.keymember?(example, 2, 1)
    result_3 = List.keymember?(example, :c, 0)

    # {true, true, false}
    {result_1, result_2, result_3}
  end

  def keyreplace_example do
    example = [a: 1, b: 2]

    result_1 = List.keyreplace(example, :a, 0, {:a, 3})
    result_2 = List.keyreplace(example, :a, 1, {:a, 3})

    # {[a: 3, b: 2], [a: 1, b: 2]}
    {result_1, result_2}
  end

  # TODO
  def keysort_example do
  end

  def keystore_example do
    example = [a: 1, b: 2]

    result_1 = List.keystore(example, :a, 0, {:a, 3})
    result_2 = List.keystore(example, :c, 0, {:c, 3})

    # {[a: 3, b: 2], [a: 1, b: 2, c: 3]}
    {result_1, result_2}
  end

  def keytake_example do
    example = [a: 1, b: 2]

    result_1 = List.keytake(example, :b, 0)
    result_2 = List.keytake(example, 1, 1)
    result_3 = List.keytake(example, :c, 0)

    # {{{:b, 2}, [a: 1]}, {{:a, 1}, [b: 2]}, nil}
    {result_1, result_2, result_3}
  end

  def last_example do
    result_1 = List.last([1, 2, 3])
    result_2 = List.last([])
    result_3 = List.last([], 0)

    # {3, nil, 0}
    {result_1, result_2, result_3}
  end

  # TODO
  def myers_difference_2_example do
  end

  # TODO
  def myers_difference_3_example do
  end

  def pop_at_example do
    example = [1, 2, 3]

    result_1 = List.pop_at(example, 0)
    result_2 = List.pop_at(example, 3)
    result_3 = List.pop_at(example, 3, 4)

    # {{1, [2, 3]}, {nil, [1, 2, 3]}, {4, [1, 2, 3]}}
    {result_1, result_2, result_3}
  end

  def replace_at_example do
    example = [1, 2, 3]

    result_1 = List.replace_at(example, 0, 10)
    result_2 = List.replace_at(example, 3, 3)
    result_3 = List.replace_at(example, -1, 7)

    # {[10, 2, 3], [1, 2, 3], [1, 2, 7]}
    {result_1, result_2, result_3}
  end

  def starts_with_example do
    example = [1, 2, 3]

    result_1 = List.starts_with?(example, [1, 2, 3, 4])
    result_2 = List.starts_with?(example, [1, 2, 3])
    result_3 = List.starts_with?(example, [1, 2, 3])

    # {false, true, true}
    {result_1, result_2, result_3}
  end

  # TODO
  def to_atom_example do
  end

  # TODO
  def to_charlist_example do
  end

  # TODO
  def to_existing_atom_example do
  end

  # TODO
  def to_float_example do
  end

  # TODO
  def to_integer_1_example do
  end

  # TODO
  def to_integer_2_example do
  end

  # TODO
  def to_string_example do
  end

  def to_tuple_example do
    # {:share, [:elixir, 163]}
    List.to_tuple([:share, [:elixir, 163]])
  end

  def update_at_example do
    example = [1, 2, 3]

    result_1 = List.update_at(example, 0, &(&1 + 2))
    result_2 = List.update_at(example, 3, &(&1 + 2))
    result_3 = List.update_at(example, -1, &(&1 + 2))

    # {[3, 2, 3], [1, 2, 3], [1, 2, 5]}
    {result_1, result_2, result_3}
  end

  def wrap_example do
    result_1 = List.wrap([:first])
    result_2 = List.wrap(:first)

    # {[:first], [:first]}
    {result_1, result_2}
  end

  def zip_example do
    result_1 = List.zip([[1, 2], [3, 4]])
    result_2 = List.zip([[1, 2], [3]])

    # {[{1, 3}, {2, 4}], [{1, 3}]}
    {result_1, result_2}
  end
end
