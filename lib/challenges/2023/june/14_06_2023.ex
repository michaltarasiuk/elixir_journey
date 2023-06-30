defmodule ElixirJourney.Challenges.FourteenthOfMay2023 do
  defmodule Hello do
    defmacro __using__(opts) do
      greeting = Keyword.get(opts, :greeting, "Hi")

      quote do
        def hello(name), do: unquote(greeting) <> ", " <> name
      end
    end
  end

  defmodule Example do
    use Hello, greeting: "Hola"
  end
end
