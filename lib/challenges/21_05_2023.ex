defmodule ElixirJourney.Challenges.TwentyOnethMay2023 do
  # unflatten_map
  def split_key(key) do
    key
    |> String.split(".")
    |> Enum.map(&Access.key(&1, %{}))
  end

  def unflatten_map(key, value) when is_binary(key) do
    splitted_key = split_key(key)

    put_in(%{}, splitted_key, value)
  end

  def unflatten_map(term) when is_map(term) do
    Enum.reduce(term, %{}, fn {key, value}, acc ->
      Map.merge(acc, unflatten_map(key, value))
    end)
  end

  def unflatten_map_example do
    map = %{"a.b.0" => 8, "c" => "four"}

    # %{"a" => %{"b" => %{"0" => 8}}, "c" => "four"}
    unflatten_map(map)
  end

  # upperize
  def upperize(term) when is_atom(term) do
    term
    |> Atom.to_string()
    |> String.upcase()
  end

  def upperize(term) when is_map(term) do
    term
    |> Enum.map(fn {key, value} -> {upperize(key), value} end)
    |> Map.new()
  end

  def upperize_example do
    user = %{name: "John", age: 22}

    upperize(user)
  end
end
