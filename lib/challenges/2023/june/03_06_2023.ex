defmodule ElixirJourney.Challenges.ThirdOfJune2023 do
  defmodule ForumTask1 do
    @example [1, 2, 3, 0, 4, 5, 0, 6, 7, 8, 0, 9]

    def solution do
      # [[1, 2, 3], [4, 5], [6, 7, 8], '\t']

      List.foldr(@example, [[]], fn
        0, acc -> [[] | acc]
        element, [head | tail] -> [[element | head] | tail]
      end)
    end
  end

  defmodule ForumTask2 do
    @orders %{
      "_csrf_token" => "gwsgw",
      "custom_tags" => "",
      "id" => "62212",
      "products" => %{
        "123456" => %{
          "category" => "3",
          "tag" => ["hero", "superstar"],
          "title" => "Product title"
        },
        "234567" => %{"category" => "5", "title" => "Product title"},
        "345678" => %{
          "category" => "8",
          "tag" => ["creation", "dynasty"],
          "title" => "Product title"
        },
        "456789" => %{
          "category" => "5",
          "title" => "Product title"
        }
      },
      "order_id" => "193885",
      "custom_message" => "Nothing to declare",
      "tags_title" => %{"tag" => ["preview"]},
      "allcats" => "5"
    }

    @products %{
      "123456" => [
        %{
          "id" => "4984944",
          "has_stock" => false,
          "name" => "Other product Name",
          "product_id" => "123456"
        },
        %{
          "id" => "3511064",
          "has_stock" => true,
          "name" => "Other product Name",
          "product_id" => "123456"
        }
      ],
      "234567" => [
        %{
          "id" => "3511075",
          "has_stock" => true,
          "name" => "Other product Name",
          "product_id" => "234567"
        },
        %{
          "id" => "3511076",
          "has_stock" => false,
          "name" => "Other product Name",
          "product_id" => "234567"
        }
      ],
      "345678" => [
        %{
          "id" => "3511082",
          "has_stock" => true,
          "name" => "Other product Name",
          "product_id" => "345678"
        },
        %{
          "id" => "3511083",
          "has_stock" => false,
          "name" => "Other product Name",
          "product_id" => "345678"
        }
      ]
    }

    def solution do
      Enum.reduce(@products, @orders, fn {id, associated_products}, acc ->
        update_in(
          acc,
          ["products", id],
          &Map.put(&1, "associated_products", associated_products)
        )
      end)
    end
  end
end
