defmodule ElixirJourney.Functions do
  def overview do
    Enum.__info__(:functions)
    |> Enum.each(fn {function, arity} ->
      IO.puts("#{function}/#{arity}")
    end)
  end

  def anonymous_functions do
    sum = fn x, y -> x + y end
    exponentiation = &(&1 ** &1)

    # {3, 4}
    {sum.(1, 2), exponentiation.(2)}
  end

  def pattern_matching do
    handle_result = fn
      {:ok, result} -> IO.puts("Handling result...")
      {:ok, _} -> IO.puts("This would be never run as previous will be matched beforehand.")
      {:error} -> IO.puts("An error has occurred!")
    end

    some_result = 1

    # Handling result...
    # An error has occurred!

    # {:ok, :ok}
    {handle_result.({:ok, some_result}), handle_result.({:error})}
  end

  defmodule Length do
    def of([]), do: 0
    def of([_ | tail]), do: 1 + of(tail)
  end

  defmodule Greeter do
    def hello(name), do: phrase() <> name
    defp phrase, do: "Hello, "
  end

  defmodule Greeter_2 do
    def hello(), do: "Hello, anonymous person!"
    def hello(name), do: "Hello, " <> name
    def hello(name1, name2), do: "Hello, #{name1} and #{name2}"
  end

  defmodule Greeter_3 do
    def hello(names) when is_list(names) do
      names = Enum.join(names, ", ")

      hello(names)
    end

    def hello(name) when is_binary(name) do
      phrase() <> name
    end

    defp phrase, do: "Hello, "
  end

  defmodule Greeter_4 do
    def hello(name, language_code \\ "en") do
      phrase(language_code) <> name
    end

    defp phrase("en"), do: "Hello, "
    defp phrase("es"), do: "Hola, "
  end

  defmodule Greeter_5 do
    def hello(%{name: person_name} = person) do
      IO.puts("Hello, " <> person_name)
      IO.inspect(person)
    end
  end

  # When we combine our guard example with default arguments, we run into an issue. Let’s see what that might look like:
  # ** (CompileError) iex:8: def hello/2 defines defaults multiple times. Elixir allows defaults to be declared once per definition.
  defmodule Greeter_6 do
    def hello(names, language_code \\ "en")
    def hello(names, language_code) when is_list(names) do
      names = Enum.join(names, ", ")

      hello(names, language_code)
    end

    def hello(name, language_code) when is_binary(name) do
      phrase(language_code) <> name
    end

    defp phrase("en"), do: "Hello, "
    defp phrase("es"), do: "Hola, "
  end
end
