defmodule PokemonStats.PokemonApi.Parser do
  def parse(%{"name" => name, "height" => height, "weight" => weight}), do: {:ok, %{name: name, height: height, weight: weight}}
end
