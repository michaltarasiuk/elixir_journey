defmodule ElixirJourney.Challenges.TwelvethOfJune2023.TypescriptParser do
  @null "null"
  @undefined "undefined"

  defp to_typescrip(spec) do
    """
    export type State = #{state(spec)};

    export type Actions = {
    #{actions(spec)}
    };

    export type ActionName = keyof Actions;

    export type Action = <T extends ActionName>(
      action: T,
      params: Actions[T]
    ) => Promise<null>;
    """
  end

  defp state([]), do: "never"

  defp state(specs) do
    specs
    |> Enum.flat_map(fn
      {:handle_call, _} -> []
      {:serialize, value} -> [value |> to_type() |> stringify()]
    end)
    |> Enum.uniq()
    |> Enum.join(" | ")
  end

  defp actions([]) do
    []
  end

  defp actions(specs) do
    specs
    |> Enum.flat_map(fn
      {:handle_call, {action_name, action_value}} ->
        [{action_name, to_type(action_value)}]

      {:serialize, _} ->
        []
    end)
    |> Enum.map_join("\n", fn {action_name, type} -> "  #{action_name}: #{type};" end)
  end

  defp to_type(value) do
    case value do
      :boolean -> "boolean"
      :integer -> "number"
      :binary -> "string"
      nil -> @null
      _ -> @undefined
    end
  end

  defp is_nil_value(value) do
    case value do
      @null -> true
      @undefined -> true
      _ -> false
    end
  end

  defp stringify(type) when is_binary(type) do
    cond do
      is_nil_value(type) ->
        type

      true ->
        "\"#{type}\""
    end
  end

  def example do
    # "export type State = \"boolean\";\n\nexport type Actions = {\n  name: string\n};\n\nexport type ActionName = keyof Actions;\n\nexport type Action = <T extends ActionName>(\n  action: T,\n  params: Actions[T]\n) => Promise<null>;\n"
    to_typescrip(serialize: :boolean, handle_call: {"name", :binary})
  end
end
