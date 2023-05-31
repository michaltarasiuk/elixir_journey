defmodule ElixirJourney.Challenges.TwentyFirstOfMay2023 do
  defmodule UnflattenMap do
    defp split_key(key) do
      key
      |> String.split(".")
      |> Enum.map(&Access.key(&1, %{}))
    end

    defp unflatten_map_impl(key, value) when is_binary(key) do
      splitted_key = split_key(key)

      put_in(%{}, splitted_key, value)
    end

    defp unflatten_map_impl(term) when is_map(term) do
      Enum.reduce(term, %{}, fn {key, value}, acc ->
        Map.merge(acc, unflatten_map_impl(key, value))
      end)
    end

    def unflatten_map_example do
      map = %{"a.b.0" => 8, "c" => "four"}

      # %{"a" => %{"b" => %{"0" => 8}}, "c" => "four"}
      unflatten_map_impl(map)
    end
  end

  defmodule Upperize do
    defp upperize_impl(term) when is_atom(term) do
      term
      |> Atom.to_string()
      |> String.upcase()
    end

    defp upperize_impl(term) when is_map(term) do
      term
      |> Enum.map(fn {key, value} -> {upperize_impl(key), value} end)
      |> Map.new()
    end

    def upperize_example do
      user = %{name: "John", age: 22}

      upperize_impl(user)
    end
  end
end
