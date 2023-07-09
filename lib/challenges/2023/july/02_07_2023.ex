defmodule ElixirJourney.Challenges.SecondOfJuly2023.Movie do
  def start_link do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def add(movie) do
    Agent.update(__MODULE__, &Map.put(&1, movie, 1))
  end

  def reset do
    Agent.update(__MODULE__, fn _state -> %{} end)
  end

  def watch_count(movie) do
    Agent.get(__MODULE__, &Map.get(&1, movie))
  end

  def watch(movie) do
    Agent.update(__MODULE__, &Map.update(&1, movie, 1, fn counter -> counter + 1 end))
  end
end
