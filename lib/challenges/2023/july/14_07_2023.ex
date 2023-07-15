defmodule ElixirJourney.Challenges.FourteenthOfJuly2023.Size do
  defprotocol SizeProtocol do
    @doc "Calculates the size (and not the length!) of a data structure"
    def size(data)
  end

  defimpl SizeProtocol, for: BitString do
    def size(string), do: byte_size(string)
  end

  defimpl SizeProtocol, for: Map do
    def size(map), do: map_size(map)
  end

  defimpl SizeProtocol, for: Tuple do
    def size(tuple), do: tuple_size(tuple)
  end

  def example do
    # {3, 2, 1}
    {SizeProtocol.size("foo"), SizeProtocol.size({:ok, "hello"}),
     SizeProtocol.size(%{label: "some label"})}
  end
end
