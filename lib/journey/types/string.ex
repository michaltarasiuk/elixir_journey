defmodule ElixirJourney.Types.String do
  def string_pattern_matching do
    "foo" <> x = "foobar"

    # "bar"
    x
  end
end
