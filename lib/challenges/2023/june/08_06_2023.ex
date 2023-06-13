defmodule ElixirJourney.Challenges.EighthOfJune2023.HasDependencyConflict do
  def has_dependency(dependencies_map, package_name, package_dependencies)
      when is_map(dependencies_map) and is_integer(package_name) and is_list(package_dependencies) do
    Enum.any?(package_dependencies, fn dependency ->
      dependencies_map
      |> Map.fetch!(dependency)
      |> Enum.member?(package_name)
    end)
  end

  defp has_dependency_conflict(dependencies_map) when is_map(dependencies_map) do
    Enum.any?(dependencies_map, fn {package_name, package_dependencies} ->
      has_dependency(dependencies_map, package_name, package_dependencies)
    end)
  end

  def example_1 do
    dependencies = %{
      1 => [3, 4],
      2 => [1],
      3 => [4],
      4 => [1, 2]
    }

    # true
    has_dependency_conflict(dependencies)
  end

  def example_2 do
    dependencies = %{
      1 => [3, 4],
      2 => [1],
      3 => [4],
      4 => [2]
    }

    # false
    has_dependency_conflict(dependencies)
  end
end
