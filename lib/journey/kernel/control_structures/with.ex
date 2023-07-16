defmodule ElixirJourney.Kernel.ControlStructures.With do
  def example_1 do
    user = %{first: "Sean", last: "Callan"}

    # "Callan, Sean"
    with {:ok, first} <- Map.fetch(user, :first),
         {:ok, last} <- Map.fetch(user, :last),
         do: last <> ", " <> first
  end

  def example_2 do
    user = %{first: "Sean", last: "Callan"}

    # "Callan, Sean"
    with {:ok, first} <- Map.fetch(user, :first), {:ok, last} <- Map.fetch(user, :last) do
      last <> ", " <> first
    end
  end

  def example_3 do
    map = %{width: 20, height: 25}

    # {:ok, 500}
    case Map.fetch(map, :width) do
      {:ok, width_value} ->
        case Map.fetch(map, :height) do
          {:ok, height_value} ->
            {:ok, width_value * height_value}

          :error ->
            :error
        end

      :error ->
        :error
    end
  end

  def example_4 do
    users = %{"melany" => "guest", "bob" => :admin}

    # {:status, "admin"}
    with {:ok, role} when not is_binary(role) <- Map.fetch(users, "bob") do
      {:status, to_string(role)}
    end
  end

  def example_5 do
    opts = %{width: 10, height: 15}

    # {:ok, 150}
    with({:ok, width} <- Map.fetch(opts, :width), {:ok, height} <- Map.fetch(opts, :height)) do
      {:ok, width * height}
    end
  end

  def example_6 do
    opts = %{width: 10}

    with {:ok, width} <- Map.fetch(opts, :width),
         {:ok, height} <- Map.fetch(opts, :height) do
      {:ok, width * height}
    else
      :error ->
        {:error, :wrong_data}

      _other_error ->
        :unexpected_error
    end
  end

  def example_7 do
    path = "/user/user_name/file.ex"

    validate_extension = fn path ->
      if Path.extname(path) == ".ex", do: :ok, else: {:error, :invalid_extension}
    end

    validate_exists = fn path ->
      if File.exists?(path), do: :ok, else: {:error, :missing_file}
    end

    # :missing_file
    with :ok <- validate_extension.(path),
         :ok <- validate_exists.(path) do
      backup_path = path <> ".backup"
      File.cp!(path, backup_path)
      {:ok, backup_path}
    else
      {:error, msg} -> msg
    end
  end

  def example_8 do
    opts = %{width: 10, height: 15}

    # {:ok, 300}
    with {:ok, width} <- Map.fetch(opts, :width),
         double_width = width * 2,
         {:ok, height} <- Map.fetch(opts, :height) do
      {:ok, double_width * height}
    end
  end
end
