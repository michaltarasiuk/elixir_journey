defmodule ElixirJourney.Challenges.ThirtyFirstOfMay.ForumTask do
  @olds [
    %{class_id: 1, user_id: 1},
    %{class_id: 1, user_id: 2},
    %{class_id: 1, user_id: 3},
    %{class_id: 1, user_id: 4},
    %{class_id: 1, user_id: 5}
  ]

  @news [
    %{class_id: 1, user_id: 2, new_key: 123},
    %{class_id: 1, user_id: 4, new_key: 456, another_new_key: 789}
  ]

  def solution do
    news_by_id = Map.new(@news, &{&1.user_id, &1})

    # [
    #   %{class_id: 1, user_id: 1},
    #   %{class_id: 1, new_key: 123, user_id: 2},
    #   %{class_id: 1, user_id: 3},
    #   %{another_new_key: 789, class_id: 1, new_key: 456, user_id: 4},
    #   %{class_id: 1, user_id: 5}
    # ]

    Enum.map(@olds, fn old -> Map.get(news_by_id, old.user_id, old) end)
  end
end
