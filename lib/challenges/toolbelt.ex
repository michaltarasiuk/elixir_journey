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

  def push(list, element) do
    list
    |> Enum.reverse()
    |> then(&[element | &1])
    |> Enum.reverse()
  end
end
