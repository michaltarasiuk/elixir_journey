defmodule ElixirJourney.Challenges.FifteenthOfJune2023 do
  defmodule Hello do
    def hello do
      quote do
        def say_hello(greeting, name), do: greeting <> ", " <> name
      end
    end

    defmacro __using__(which) when is_atom(which) do
      apply(__MODULE__, which, [])
    end
  end

  defmodule Example do
    use Hello, :hello

    def test do
      say_hello("Hola", "John")
    end
  end
end
