defmodule ElixirJourney.Challenges.TwentyEighthOfJune2023 do
  defmodule ConfigLoader do
    defstruct config: %{}

    def load_config(config_data) do
      %ConfigLoader{config: config_data}
    end

    def access(config_loader, key) do
      keys = key |> String.split(".") |> Enum.map(&String.to_atom/1)

      get_in(config_loader.config, keys)
    end
  end

  def example do
    config_data = %{
      db: %{
        host: "localhost",
        port: 5432,
        username: "admin",
        password: "password"
      },
      app: %{
        name: "MyApp",
        version: "1.0.0",
        environment: "prod"
      }
    }

    config = ConfigLoader.load_config(config_data)

    #  {"localhost", "1.0.0"}
    {ConfigLoader.access(config, "db.host"), ConfigLoader.access(config, "app.version")}
  end
end
