defmodule ElixirJourney.Operators.BinaryConcatenation do
  def example_1 do
    # "foobar"
    "foo" <> "bar"
  end

  def example_2 do
    "foo" <> x = "foobar"

    # "bar
    x
  end
end
