defmodule ElixirJourney.Challenges.SeventhOfJuly2023.TaskScheduler do
  defp execute_chunk(chunk) do
    chunk
    |> Enum.map(&Task.await(&1, :infinity))
    |> IO.inspect(label: "Results")
  end

  defp start(tasks, max_concurrency) do
    tasks
    |> Enum.map(&Task.async(fn -> &1.() end))
    |> Enum.chunk_every(max_concurrency)
    |> Enum.each(&execute_chunk(&1))
  end

  def example do
    tasks = [
      fn ->
        IO.puts("Task 1")
        :timer.sleep(1000)
        IO.puts("Task 1 completed")
      end,
      fn ->
        IO.puts("Task 2")
        :timer.sleep(2000)
        IO.puts("Task 2 completed")
      end,
      fn ->
        IO.puts("Task 3")
        :timer.sleep(1500)
        IO.puts("Task 3 completed")
      end,
      fn ->
        IO.puts("Task 4")
        :timer.sleep(500)
        IO.puts("Task 4 completed")
      end
    ]

    # Task 1
    # Task 2
    # Task 3
    # Task 4
    # Task 4 completed
    # Task 1 completed
    # Task 3 completed
    # Task 2 completed
    # Results: [:ok, :ok]
    # Results: [:ok, :ok]

    start(tasks, 2)
  end
end
