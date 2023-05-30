defmodule ElixirJourney.Challenges.TwentyFourthMay2023.ConformsTo do
  defp conforms_to_impl(map, source) do
    map
    |> Enum.to_list()
    |> Enum.filter(&Keyword.has_key?(source, elem(&1, 0)))
    |> Enum.all?(fn {key, value} ->
      assert_fn = Keyword.get(source, key)

      assert_fn.(value)
    end)
  end

  def conforms_to_example do
    map_example = %{a: 1, b: 2}
    source = [a: fn x -> x > 2 end]

    # false
    conforms_to_impl(map_example, source)
  end
end
