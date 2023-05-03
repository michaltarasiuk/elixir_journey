defmodule ElixirJourney.CollectionsAndEumerables.Access do
  def behaviour do
    map = %{1.0 => "1", "Hello" => "World", a: "A"}

    # {"A", "1", "World", nil}
    {map.a, map[1.0], map["Hello"], nil[:prop]}
  end

  def all_example do
    list = [%{name: "john"}, %{name: "mary"}]

    # {["john", "mary"], {["john", "mary"], [%{name: "JOHN"}, %{name: "MARY"}]}}
    {get_in(list, [Access.all(), :name]),
     get_and_update_in(list, [Access.all(), :name], fn prev ->
       {prev, String.upcase(prev)}
     end)}
  end

  def at_example do
    list = [%{name: "john"}, %{name: "mary"}]

    # {"mary", {"john", [%{name: "JOHN"}, %{name: "mary"}]}}
    {get_in(list, [Access.at(-1), :name]),
     get_and_update_in(list, [Access.at(0), :name], fn prev ->
       {prev, String.upcase(prev)}
     end)}
  end

  def required_at_example do
    # ** (Enum.OutOfBoundsError) out of bounds error
    # get_in([:a, :b, :c], [Access.at!(3)])

    # :c
    get_in([:a, :b, :c], [Access.at!(2)])
  end

  def elem_example do
    map = %{user: {"john", 27}}

    # {"john", {"john", %{user: {"JOHN", 27}}}}
    {get_in(map, [:user, Access.elem(0)]),
     get_and_update_in(map, [:user, Access.elem(0)], fn prev ->
       {prev, String.upcase(prev)}
     end)}
  end

  def fetch_example do
    # {{:ok, 1}, :error}
    {Access.fetch(%{a: 1, b: 2}, :a), Access.fetch([a: 1, b: 2], :c)}
  end

  def required_fetch_example do
    # "meg"
    Access.fetch!(%{name: "meg", age: 26}, :name)
  end

  def filter_example do
    list = [%{name: "john", salary: 10}, %{name: "francine", salary: 30}]

    # {["john"], [%{name: "JOHN", salary: 10}, %{name: "francine", salary: 30}]}
    get_and_update_in(list, [Access.filter(&(&1.salary <= 20)), :name], fn prev ->
      {prev, String.upcase(prev)}
    end)
  end

  def get_example do
    # {"john", 25, nil}
    {Access.get(%{name: "john"}, :name, "default name"), Access.get(%{name: "john"}, :age, 25),
     Access.get([ordered: true], :timeout)}
  end

  def get_and_update_example do
    # {1, [a: 2]}
    Access.get_and_update([a: 1], :a, fn current_value ->
      {current_value, current_value + 1}
    end)
  end

  def key_example do
    # {"meg"}
    {get_in(%{}, [Access.key(:user, %{}), Access.key(:name, "meg")])}
  end

  def required_key_example do
    map = %{user: %{name: "john"}}

    # ** (KeyError) key :unknown not found in: %{name: "john"}
    # get_in(map, [Access.key!(:user), Access.key!(:unknown)])

    # {"john", {"john", %{user: %{name: "JOHN"}}}}
    {get_in(map, [Access.key!(:user), Access.key!(:name)]),
     get_and_update_in(map, [Access.key!(:user), Access.key!(:name)], fn prev ->
       {prev, String.upcase(prev)}
     end)}
  end

  def pop_example do
    map = %{a: 1, b: 2}

    # {{2, %{a: 1}}, {nil, %{a: 1, b: 2}}, {2, [a: 1]}}
    {Access.pop(map, :b), Access.pop(map, :c), Access.pop([a: 1, b: 2], :b)}
  end

  def slice_example do
    list = [
      %{name: "john", salary: 10},
      %{name: "francine", salary: 30},
      %{name: "vitor", salary: 25}
    ]

    # {["francine", "vitor"],
    #  {["francine"],
    #   [
    #     %{name: "john", salary: 10},
    #     %{name: "FRANCINE", salary: 30},
    #     %{name: "vitor", salary: 25}
    #   ]}}
    {get_in(list, [Access.slice(1..2), :name]),
     get_and_update_in(list, [Access.slice(1..3//2), :name], fn name ->
       {name, String.upcase(name)}
     end)}
  end
end
