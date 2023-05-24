defmodule ElixirJourney.Challenges.TwentyFourthMay2023 do
  defmodule CoffeTask do
    # coffe_task
    @example %{
      first: %{
        "1" => "first:10",
        "2" => "first:232"
      },
      second: %{
        "1" => "second:7",
        "2" => "second:22"
      }
    }
    @mapper %{
      first: "1",
      second: "2"
    }

    def get_value(term) when is_binary(term) do
      term
      |> String.replace(~r/(first|second):(\w+)/, "\\g{2}")
      |> String.to_integer()
    end

    def get_acc do
      @mapper
      |> Map.keys()
      |> Map.from_keys(%{})
    end
  end
end
