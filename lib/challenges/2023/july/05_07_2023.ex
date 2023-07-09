defmodule ElixirJourney.Challenges.FivethOfJuly2023.TaskManager do
  use Agent

  def start_link() do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def get_tasks(by \\ :all) do
    tasks = Agent.get(__MODULE__, & &1)

    if by == :all do
      tasks
    else
      tasks
      |> Enum.map(fn {user_name, user_tasks} ->
        filtered_tasks = user_tasks |> Enum.filter(&(elem(&1, 1) == by)) |> Map.new()

        {user_name, filtered_tasks}
      end)
      |> Map.new()
    end
  end

  def create_task(user_name, task_name) do
    Agent.update(__MODULE__, fn tasks ->
      Map.update(
        tasks,
        user_name,
        Map.new([{task_name, :pending}]),
        &Map.put(&1, user_name, task_name)
      )
    end)

    :ok
  end

  def complete_task!(user_name, task_name) do
    Agent.update(__MODULE__, fn tasks ->
      Map.update!(tasks, user_name, &Map.replace!(&1, task_name, :completed))
    end)

    :ok
  end
end
