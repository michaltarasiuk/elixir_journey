defmodule ElixirJourney.Challenges.FifteenthOfJuly2023.SnakeToCamelCase do
  defp snake_to_camel_case(term) when is_map(term) do
    term
    |> Enum.map(&snake_to_camel_case/1)
    |> Map.new()
  end

  defp snake_to_camel_case({key, value}) do
    {snake_to_camel_case(key), snake_to_camel_case(value)}
  end

  defp snake_to_camel_case(term) when is_list(term) do
    Enum.map(term, &snake_to_camel_case/1)
  end

  defp snake_to_camel_case(term) when is_atom(term) do
    term
    |> Atom.to_string()
    |> snake_to_camel_case()
  end

  defp snake_to_camel_case(term) when is_binary(term) do
    term
    |> String.replace("_", " ")
    |> String.split(" ")
    |> Enum.with_index()
    |> Enum.map_join("", fn
      {word, index} ->
        if index == 0 do
          word
        else
          String.capitalize(word)
        end
    end)
  end

  defp snake_to_camel_case(term) do
    term
  end

  def example do
    # %{
    #   "atom" => "elixir",
    #   "keyword" => [{"aA", 1}, {"bB", 2}],
    #   "keywordWithList" => [1, 2, 3],
    #   "nestedMap" => %{"nestedKey1" => "nestedValue1", "nestedKey2" => 42},
    #   "number" => 123.45,
    #   "otpValue" => "ok",
    #   "string" => "helloWorld"
    # }
    snake_to_camel_case(%{
      atom: :elixir,
      keyword: [a_A: 1, b_B: 2],
      keyword_with_list: [1, 2, 3],
      nested_map: %{nested_key1: "nested_value1", nested_key2: 42},
      number: 123.45,
      otp_value: :ok,
      string: "hello_world"
    })
  end
end
