defmodule ElixirJourney.Challenges.TwentySeventhMay2023.DefaultsDeep do
  defp defaults_deep_impl(map, source) when is_map(map) and is_map(source) do
    Map.merge(map, source, fn _key, v1, v2 -> defaults_deep_impl(v1, v2) end)
  end

  defp defaults_deep_impl(v1, _v2) do
    v1
  end

  def defaults_deep_example do
    map = %{a: %{b: 2}}
    source = %{a: %{b: 1, c: 3}}

    # %{a: %{b: 2, c: 3}}
    defaults_deep_impl(map, source)
  end
end
