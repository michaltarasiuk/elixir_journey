defmodule ElixirJourney.Challenges.SixthOfJune2023 do
  defmodule ForumTask1 do
    @example [
      %{
        id: 1,
        created_by: :user
      },
      %{
        id: 2,
        created_by: :customer
      },
      %{
        id: 3,
        created_by: :user
      },
      %{
        id: 4,
        created_by: :user
      },
      %{
        id: 5,
        created_by: :customer
      },
      %{
        id: 6,
        created_by: :customer
      }
    ]

    def solution_1 do
      # [%{created_by: :user, id: 1}, %{created_by: :user, id: 3}]

      @example
      |> Enum.filter(&(Map.fetch!(&1, :created_by) === :user))
      |> Enum.take(2)
    end

    def solution_2 do
      # [%{created_by: :user, id: 1}, %{created_by: :user, id: 3}]

      @example
      |> Enum.filter(&(Map.fetch!(&1, :created_by) === :user))
      |> Enum.slice(0..1)
    end
  end

  defmodule ForumTask2 do
    def split_1_example do
      # ["123", "45", "678", "9"]

      String.split("123045067809", "0")
    end

    def split_2_example do
      # [[1, 2, 3], [4, 5], [6, 7, 8], '\t']

      [1, 2, 3, 0, 4, 5, 0, 6, 7, 8, 0, 9]
      |> Enum.chunk_by(&(&1 == 0))
      |> Enum.reject(&(&1 == [0]))
    end

    def split_3_example do
      # [[1, 2, 3], [4, 5], [6, 7, 8], '\t']

      [1, 2, 3, 0, 4, 5, 0, 6, 7, 8, 0, 9]
      |> Enum.join()
      |> Enum.split("0")
    end

    def split_4_example do
      # [[1, 2, 3], [4, 5], [6, 7, 8], '\t']

      Enum.chunk_while(
        [1, 2, 3, 0, 4, 5, 0, 6, 7, 8, 0, 9],
        [],
        fn
          0, acc -> {:cont, Enum.reverse(acc), []}
          element, acc -> {:cont, [element | acc]}
        end,
        fn
          [] -> {:cont, []}
          acc -> {:cont, Enum.reverse(acc), []}
        end
      )
    end
  end
end
