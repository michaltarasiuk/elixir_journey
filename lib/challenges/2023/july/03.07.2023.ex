defmodule ElixirJourney.Challenges.ThirdOfJuly2023 do
  defmodule PhoneNumberFormatter do
    defp format_phone_number(number) do
      digits = String.replace(number, ~r/[^0-9]/, "")

      if String.length(digits) < 10 do
        ""
      else
        "(#{String.slice(digits, 0..2)}) #{String.slice(digits, 3..5)}-#{String.slice(digits, 6..9)}"
      end
    end

    def example do
      # (123) 456-7890
      format_phone_number("123-456-7890")
    end
  end

  defmodule MapValueSum do
    defp values(value) when is_map(value) do
      Map.values(value)
    end

    defp values(value) when is_number(value) or is_list(value) do
      value
    end

    defp sum_map_values(map) do
      values(map)
      |> Enum.map(&values(&1))
      |> List.flatten()
      |> Enum.sum()
    end

    def example do
      map = %{
        "a" => 1,
        "b" => [2, 3],
        "c" => %{"d" => 4, "e" => [5, 6]}
      }

      # 21
      sum_map_values(map)
    end
  end
end
