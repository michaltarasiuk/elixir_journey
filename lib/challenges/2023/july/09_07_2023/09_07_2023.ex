defmodule ElixirJourney.Challenges.NinethOfJuly2023.JsonFilter do
  alias ElixirJourney.Challenges.Toolbelt

  def wait_for_response() do
    receive do
      {:DOWN, _monitor, _func, _pid, :normal} ->
        Process.send(self(), "Processing successful!", [])

      {:DOWN, _monitor, _func, _pid, reason} ->
        Process.send(self(), {:error, "Processing failed: #{inspect(reason)}"}, [])

      data ->
        Process.send(self(), data, [])

        wait_for_response()
    end
  end

  def extract_data(pid, json, key) when is_pid(pid) and is_binary(json) and is_binary(key) do
    {:ok, term} = Poison.decode(json)

    Process.send(pid, {:progress, 50}, [])
    Process.send(pid, term[key], [])
    Process.send(pid, {:progress, 100}, [])
  end

  defp extract(json, key) when is_binary(json) and is_binary(key) do
    {_worker_pid, _monitor_ref} = spawn_monitor(__MODULE__, :extract_data, [self(), json, key])

    wait_for_response()
  end

  def example do
    json_data = Path.expand("./data.json", __DIR__) |> File.read!()

    extract(json_data, "user")

    Toolbelt.flush()
  end
end
