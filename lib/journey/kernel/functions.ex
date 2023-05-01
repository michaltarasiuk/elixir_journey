defmodule ElixirJourney.Kernel.Functions do
  # Note that, unlike and/2, this operator accepts any expression as the first argument, not only booleans.
  def boolean_and_operator_example do
    # true
    Enum.empty?([]) && Enum.empty?([])
  end

  def list_concatenation_operator_example do
    # {[1, 2, 3], 'foobar'}
    {[1] ++ [2, 3], 'foo' ++ 'bar'}
  end

  def list_subtraction_operator_example do
    # [3, 1]
    [1, 2, 3, 2, 1] -- [1, 2, 2]
  end

  def full_slice_range_example do
    # "Hello world!"
    String.slice("Hello world!", ..)
  end

  def range_example do
    # {[1, 2, 3], [3, 1]}
    {Enum.to_list(1..3), Enum.to_list(3..1//-2)}
  end

  def boolean_not_operator_example do
    # {false, true}
    {!Enum.empty?([]), !List.first([])}
  end

  def binary_concatenation_operator_example do
    # "foobar"
    "foo" <> "bar"
  end

  def text_based_match_operator_example do
    # {true, true, true}
    {"abcd" =~ ~r/c(d)/, "abcd" =~ "bc", "abcd" =~ ""}
  end

  def pipe_operator_example do
    # {[2, 4, 6]}
    {[1, [2], 3] |> List.flatten() |> Enum.map(fn x -> x * 2 end)}
  end

  def boolean_or_operator_example do
    # {false, true}
    {Enum.empty?([1]) || Enum.empty?([1]), List.first([]) || true}
  end

  def tap_example do
    # 2
    %{a: 1}
    |> Map.update!(:a, &(&1 + 1))
    |> tap(&IO.inspect(&1.a))
    |> Map.update!(:a, &(&1 * 2))
  end

  def then_example do
    # ["b", "c"]
    1 |> then(fn x -> Enum.drop(["a", "b", "c"], x) end)
  end

  def throw_example do
    # 1, 2, 3, 4, 5
    try do
      Enum.to_list(1..10)
      |> Enum.each(fn x ->
        x == 5 && throw(x)
      end)
    catch
      value -> value
    end
  end

  def to_charlistx_example do
    # 'foo'
    to_charlist(:foo)
  end

  def to_string_example do
    # "foo"
    to_string(:foo)
  end

  def unless_example do
    list = [2, 2]

    unless Enum.sum(list) == 5 do
      # nil
      unless(length(list) == 2, do: "Math still works")
    else
      "Math is broken"
    end
  end

  def update_in_example do
    options = %{foo: %{bar: 0}}

    # {%{foo: %{bar: 1}}, %{foo: %{bar: 1}}}
    {update_in(options, [:foo, :bar], &(&1 + 1)), update_in(options.foo.bar, &(&1 + 1))}
  end
end
