defmodule ElixirJourney.Kernel.Import1 do
  def example_1 do
    import List

    to_tuple([1, 2, 3])
  end

  def example_2 do
    # undefined(function(to_tuple / 1))
    # to_tuple([1, 2, 3])

    :error
  end

  def example_3 do
    List.to_tuple([1, 2, 3])
  end

  def _example_4 do
    :none
  end
end

defmodule ElixirJourney.Kernel.Import2 do
  def example_1 do
    # 1) Disable "if/2" from Kernel
    # import Kernel, except: [if: 2]

    # 2) Require the new "if/2" macro from MyMacros
    # import MyMacros

    # 3) Use the new macro
    # if do_something, it_works

    :example
  end
end
