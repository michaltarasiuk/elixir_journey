defmodule ElixirJourney.Challenges.FirstOfJuly2023.Actor do
  def listen do
    receive do
      msg -> IO.puts("RECEIVED: #{msg}")
    end
  end
end
