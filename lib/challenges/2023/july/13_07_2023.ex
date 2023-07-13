defmodule ElixirJourney.Challenges.ThirteenthOfJuly2023 do
  defmodule GroupConsecutiveNumbers do
    alias ElixirJourney.Challenges.Toolbelt

    def group_consecutive_numbers(numbers) do
      Enum.chunk_while(
        numbers,
        [],
        fn number, chunk ->
          cond do
            number - List.last(chunk, 0) == 1 ->
              {:cont, Toolbelt.push(chunk, number)}

            true ->
              {:cont, chunk, [number]}
          end
        end,
        fn collector -> {:cont, collector, []} end
      )
    end

    def example do
      # [[1, 2], [4]]
      group_consecutive_numbers([1, 2, 4])
    end
  end

  defmodule RangeRepresentation do
    defp range_to_string(range) do
      case length(range) do
        1 ->
          Integer.to_string(hd(range))

        _ ->
          "#{hd(range)}-#{List.last(range)}"
      end
    end

    defp range_representation(numbers) do
      numbers
      |> GroupConsecutiveNumbers.group_consecutive_numbers()
      |> Enum.map(&range_to_string/1)
    end

    def example do
      # ["1-3", "6-8", "11", "15-17"]
      range_representation([1, 2, 3, 6, 7, 8, 11, 15, 16, 17])
    end
  end
end
