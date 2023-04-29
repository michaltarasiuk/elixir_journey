defmodule ElixirJourney.Kernel.Functions do
  # Note that, unlike and/2, this operator accepts any expression as the first argument, not only booleans.
  def boolean_and_operator do
    # true
    Enum.empty?([]) && Enum.empty?([])
  end

  def list_concatenation_operator do
    # {[1, 2, 3], 'foobar'}
    {[1] ++ [2, 3], 'foo' ++ 'bar'}
  end

  def list_subtraction_operator do
    # [3, 1]
    [1, 2, 3, 2, 1] -- [1, 2, 2]
  end

  def full_slice_range do
    # "Hello world!"
    String.slice("Hello world!", ..)
  end

  def range do
    # {[1, 2, 3], [3, 1]}
    {Enum.to_list(1..3), Enum.to_list(3..1//-2)}
  end

  def boolean_not_operator do
    # {false, true}
    {!Enum.empty?([]), !List.first([])}
  end

  def binary_concatenation_operator do
    # "foobar"
    "foo" <> "bar"
  end

  def text_based_match_operator do
    # {true, true, true}
    {"abcd" =~ ~r/c(d)/, "abcd" =~ "bc", "abcd" =~ ""}
  end

  def pipe_operator do
    # {[2, 4, 6]}
    {[1, [2], 3] |> List.flatten() |> Enum.map(fn x -> x * 2 end)}
  end

  def boolean_or_operator do
    # {false, true}
    {Enum.empty?([1]) || Enum.empty?([1]), List.first([]) || true}
  end
end
