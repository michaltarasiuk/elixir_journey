defmodule ElixirJourney.Types.Atom do
  def naming do
    [:abc, :"123", :abc_123, :monkey@, :"hello world"]
  end

  def to_charlist_example do
    # [~c"abc", ~c"123", ~c"abc_123", ~c"monkey@", ~c"hello world"]
    Enum.map(naming(), &Atom.to_charlist/1)
  end

  def to_string_example do
    # ["abc", "123", "abc_123", "monkey@", "hello world"]
    Enum.map(naming(), &Atom.to_string/1)
  end
end
