defmodule ElixirJourney.Challenges.TwentyTwothMay2023.TaskFromWork do
  @item_prefix "item"
  @example %{
    appid: "ambassador",
    referralcode: "someCode",
    email: "john@gmail.com",
    transactionid: "12345",
    "item-sku-XYZ123": "abc",
    "item-quantity-XYZ123": "1",
    "item-sn-XYZ123": "XYZ123",
    "item-sku-ABC234": "cde",
    "item-quantity-ABC234": "1",
    "item-sn-ABC234": "ABC234",
    purchase: %{posid: "abc-1234", operationid: "123/456/789"}
  }

  defp get_id(key) when is_atom(key) do
    key
    |> Atom.to_string()
    |> String.replace(~r/\w+-\w+-(\w+)/, "\\g{1}")
  end

  defp get_name(key) when is_atom(key) do
    key
    |> Atom.to_string()
    |> String.replace(~r/\w+-(\w+)-\w+/, "\\g{1}")
  end

  defp is_item_key(key) when is_atom(key) do
    key
    |> Atom.to_string()
    |> String.starts_with?(@item_prefix)
  end

  def task_from_work_impl do
    # %{
    #   "ABC234" => %{"quantity" => "1", "sku" => "cde", "sn" => "ABC234"},
    #   "XYZ123" => %{"quantity" => "1", "sku" => "abc", "sn" => "XYZ123"}
    # }
    @example
    |> Enum.to_list()
    |> Enum.filter(&(elem(&1, 0) |> is_item_key()))
    |> Enum.reduce(%{}, fn {key, value}, acc ->
      id = get_id(key)
      name = get_name(key)

      acc
      |> Map.put_new(id, %{})
      |> Map.update!(id, &Map.put(&1, name, value))
    end)
  end
end
