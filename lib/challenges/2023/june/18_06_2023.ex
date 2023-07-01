defmodule ElixirJourney.Challenges.EighteenthOfJune2023.StringReverse do
  defp string_reverse(sentence) when is_binary(sentence) do
    sentence
    |> String.split(" ")
    |> Enum.reverse()
    |> Enum.join(" ")
  end

  def example do
    #  "test a is This"
    string_reverse("This is a test")
  end
end
