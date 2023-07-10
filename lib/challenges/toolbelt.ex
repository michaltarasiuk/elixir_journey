defmodule ElixirJourney.Challenges.Toolbelt do
  def flush() do
    receive do
      msg ->
        IO.inspect(msg)
        flush()
    after
      10 -> :ok
    end
  end
end
