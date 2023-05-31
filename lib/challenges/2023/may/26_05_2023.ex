defmodule ElixirJourney.Challenges.TwentySixthOfMay2023.ZipMapDeep do
  defp get_key(path) do
    Enum.map(path, &Access.key(&1, %{}))
  end

  defp zip_map_deep_impl(acc, {path, value}) when is_map(acc) do
    put_in(acc, get_key(path), value)
  end

  defp zip_map_deep_impl(props, values) when is_list(props) and is_list(values) do
    Enum.zip([props, values])
    |> Enum.reduce(%{}, &zip_map_deep_impl(&2, &1))
  end

  def zip_map_deep_example do
    # %{a: %{b: %{c: 1, d: 2}}}
    zip_map_deep_impl([[:a, :b, :c], [:a, :b, :d]], [1, 2])
  end
end
