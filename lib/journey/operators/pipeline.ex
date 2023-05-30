defmodule ElixirJourney.Operators.Pipeline do
  def example_1 do
    [1, [2], 3]
    |> List.flatten()
    |> Enum.map(&(&1 * 2))
  end

  @doc """
    String.graphemes "Hello" |> Enum.reverse
    translates to:
    String.graphemes("Hello" |> Enum.reverse())
  """
  def example_2 do
    # ** (Protocol.UndefinedError)
    String.graphemes("Hello" |> Enum.reverse())
  end

  def example_3 do
    # ["o", "l", "l", "e", "H"]
    "Hello" |> String.graphemes() |> Enum.reverse()
  end

  @doc """
    Alternatively, you can use then/2 for the same effect:

    some_fun = &Regex.replace(~r/l/, &1, "L")
    "Hello" |> then(some_fun)
  """
  def example_4 do
    some_fun = &Regex.replace(~r/l/, &1, "L")
    "Hello" |> some_fun.()
  end

  def example_5 do
    "Hello" |> then(&Regex.replace(~r/l/, &1, "L"))
  end
end
