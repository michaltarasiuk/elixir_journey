defmodule ElixirJourney.Sigils do
  defmodule MySigils do
    def sigil_p(string, []), do: String.upcase(string)
  end

  def string_example do
    # "welcome to elixir \#{String.downcase \"SCHOOL\"}"
    ~S/welcome to elixir #{String.downcase "SCHOOL"}/
  end

  def regexp_example do
    re = ~r/elixir/

    # {false, true}
    {"Elixir" =~ re, "elixir" =~ re}
  end

  def word_list_example do
    # ["i", "love", "elixir", "school"]
    ~w/i love elixir school/
  end
end
