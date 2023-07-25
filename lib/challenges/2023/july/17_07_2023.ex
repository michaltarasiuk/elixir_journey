defmodule ElixirJourney.Challenges.SeventeenthOfJuly2023 do
  defmodule Say do
    defp say(tense, power) do
      text = ["it"]

      text =
        case tense do
          :past -> [text, " was"]
          :present -> [text, " is"]
          :future -> [text, " will be"]
        end

      text =
        case power > 9000 do
          true -> [text, " over"]
          false -> [text, " under (or equal!)"]
        end

      IO.iodata_to_binary([text, " 9000!"])
    end

    def example do
      # "it was under (or equal!) 9000!"
      say(:past, 9000)
    end
  end

  defmodule CountJsonEntries do
    defp count_json_entries(input) do
      [first | lines] = String.split(input, "\n", trim: true)

      {count, entries} =
        Enum.reduce(lines, {0, [first]}, fn line, {count, acc} ->
          {count + 1, [acc, ",", line]}
        end)

      IO.iodata_to_binary(["{\"count\":", to_string(count), ",\"data\":[", entries, "]}"])
    end

    def example do
      input = ~s({"id": 1, "message": "it's"}
{"id": 2, "message": "over"}
{"id": 3, "message": "9000"}
{"id": 4, "message": "!!!!"})

      # "{\"count\":3,\"data\":[{\"id\": 1, \"message\": \"it's\"},{\"id\": 2, \"message\": \"over\"},{\"id\": 3, \"message\": \"9000\"},{\"id\": 4, \"message\": \"!!!!\"}]}"
      count_json_entries(input)
    end
  end
end
