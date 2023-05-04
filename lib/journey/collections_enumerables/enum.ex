defmodule ElixirJourney.CollectionsAndEumerables.Enum do
  # When an element has a falsy value (false or nil) iteration stops immediately and false is returned. In all other cases true is returned.
  def all_1_example do
    # {true, false, true}
    {Enum.all?([]), Enum.all?([nil]), Enum.all?([1])}
  end

  def all_2_example do
    list = [1.0, 2.0]

    # {true, true, false}
    {Enum.all?([], fn -> nil end), Enum.all?(list, &(&1 == trunc(&1))),
     Enum.all?(list, &(&1 === trunc(&1)))}
  end

  def any_1_example do
    # {false, true, false}
    {Enum.any?([]), Enum.any?([false, true]), Enum.any?([false, nil])}
  end

  def any_2_example do
    list = [{:age, 18}, {:divisible, 10}]

    # true
    Enum.any?(list, &(elem(&1, 0) > 10))
  end

  def at_example do
    list = [1, 2, 3, 4, 5]

    # {1, nil, :none}
    {Enum.at(list, 0), Enum.at(list, 5), Enum.at(list, 5, :none)}
  end

  def chunk_by_example do
    list = [1, 2, 3, 4, 5]

    # [[1], [2], [3], [4], [5]]
    Enum.chunk_by(list, & &1)
  end

  def chunk_every_2_example do
    list = [1, 2, 3, 4, 5]

    # [[1, 2], [3, 4], [5]]
    Enum.chunk_every(list, 2)
  end

  def chunk_every_3_example do
    list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

    # [[1, 2], [4, 5], [7,8], [10]]
    Enum.chunk_every(list, 2, 3)
  end

  def chunk_every_4_example do
    list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

    # {[[1, 2], [4, 5], [7,8], [10, 11]], [[1, 2], [4, 5], [7,8]]}
    {Enum.chunk_every(list, 2, 3, [11]), Enum.chunk_every(list, 2, 3, :discard)}
  end
end
