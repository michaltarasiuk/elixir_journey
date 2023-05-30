defmodule ElixirJourney.Sigils.NamingConventions do
  defmodule Journey.NamingConventions do
    def _wont_be_imported do
      :oops
    end
  end

  defmodule TrailingBang do
    @doc """
      A trailing bang (exclamation mark) signifies a function or macro where failure cases raise an exception.
    """
    def example do
      File.read!("file.txt")
    end
  end

  defmodule TrailingQuestionMark do
    @doc """
      Functions that return a boolean are named with a trailing question mark.
    """
    def example do
      Keyword.keyword?(a: 1)
    end

    @doc """
      Type checks and other boolean checks that are allowed in guard clauses are named with an is_ prefix.
    """
    def guard_example(term) when is_atom(term) do
      :is_atom
    end
  end

  defmodule SpecialNames do
    @doc """
      Functions having "length" in its name will take more time as the data structure grows in size.
    """
    def length do
      length([1, 2, 3, 4, 5])
    end

    @doc """
      Functions using the word "size" in its name will take the same amount of time whether the data structure is tiny or huge.
    """
    def size do
      map_example = %{a: 1, b: 2}

      map_size(map_example)
    end
  end
end
