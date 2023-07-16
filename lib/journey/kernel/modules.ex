defmodule ElixirJourney.Kernel.Modules do
  def multiple_references_of_the_same_attribute do
    defmodule ElixirJourney.Common.Attribute do
      @files %{
        example1: File.read!("lib/example1.data"),
        example2: File.read!("lib/example2.data")
      }

      defp files(), do: @files
      def example1, do: files()[:example1]
      def example2, do: files()[:example2]
    end
  end
end
