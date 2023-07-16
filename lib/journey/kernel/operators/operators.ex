defmodule ElixirJourney.Kernel.Operators do
  def text_based_match_example do
    value = "hello world"

    result_1 = value =~ "hello"
    result_2 = value =~ ""
    result_3 = value =~ "helloworld"
    result_4 = value =~ ~r/\w/

    # {true, true, false, true}
    {result_1, result_2, result_3, result_4}
  end
end
