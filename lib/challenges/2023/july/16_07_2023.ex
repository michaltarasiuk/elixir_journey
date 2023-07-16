defmodule ElixirJourney.Challenges.SixteenthOfJuly2023.MyMacros do
  defmacro my_if(condition, do: do_clause, else: else_clause) do
    quote do
      case unquote(condition) do
        true ->
          unquote(do_clause)

        _ ->
          unquote(else_clause)
      end
    end
  end

  defmacro pretty_math({:+, _meta, [left, right]} = ast) do
    quote do
      IO.puts("""
        #{unquote(left)}
      + #{unquote(right)}
      ---
        #{unquote(ast)}
      """)
    end
  end
end
