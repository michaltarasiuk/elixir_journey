defmodule ElixirJourney.CollectionsAndEumerables.ControlStructures do
  defmodule FunctionPatternMatching do
    def example_1 do
      handle_result = fn
        {:ok, result} when is_number(result) -> "Handling result..."
        {:error} -> "An error has occurred!"
      end

      some_result = 1

      # {"Handling result...", "An error has occurred!"}
      {handle_result.({:ok, some_result}), handle_result.({:error})}
    end
  end

  # If none of the clauses match, an error is raised.
  # Keep in mind errors in guards do not leak but simply make the guard fail.
  defmodule Case do
    def example_1 do
      # "This clause will match and bind x to 2 in this clause"
      case {1, 2, 3} do
        {4, 5, 6} ->
          "This clause won't match"

        {1, x, 3} ->
          "This clause will match and bind x to #{x} in this clause"

        _ ->
          "This clause would match any value"
      end
    end

    def example_2 do
      # x = 1

      # "Will match"
      # case 10 do
      #   ^x -> "Won't match"
      #   _ -> "Will match"
      # end
    end

    def example_3 do
      # "Will match"
      case {1, 2, 3} do
        {1, x, 3} when x > 0 ->
          "Will match"

        _ ->
          "Would match, if guard condition were not satisfied"
      end
    end
  end

  defmodule Cond do
    # "But this will"
    def example_1 do
      cond do
        2 + 2 == 5 ->
          "This will not be true"

        2 * 2 == 3 ->
          "Nor this"

        1 + 1 == 2 ->
          "But this will"
      end
    end

    def example_2 do
      # "Catch all"
      cond do
        7 + 1 == 0 -> "Incorrect"
        true -> "Catch all"
      end
    end
  end

  defmodule IfAndUnless do
    def example_1 do
      # "Valid string!"
      if String.valid?("Hello") do
        "Valid string!"
      else
        "Invalid string."
      end
    end

    def example_2 do
      # "truthy"
      if "a string value" do
        "truthy"
      end
    end

    def example_3 do
      #  "not integer"
      unless is_integer("Hello") do
        "not integer"
      end
    end
  end
end
