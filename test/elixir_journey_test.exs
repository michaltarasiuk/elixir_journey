defmodule ElixirJourneyTest do
  use ExUnit.Case
  doctest ElixirJourney

  test "greets the world" do
    assert ElixirJourney.hello() == :world
  end
end
