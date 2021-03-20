defmodule PokemonStats.PokemonApi do
  require Math

  alias PokemonStats.PokemonApi.Fetcher
  alias PokemonStats.PokemonApi.Parser

  defstruct [:pokemon]

  defguard is_even?(list) when rem(length(list), 2) == 0

  # ["charmander", "bulbasaur", "squirtle", "pidgey", "rattata"]
  def fetch_and_calculate(pokemon) do
    data = Enum.map(pokemon, fn pokeman ->
      {:ok, response} = Fetcher.fetch(pokeman)
      {:ok, data} = Parser.parse(response)

      data
    end)

    heights = Enum.map(data, fn pokeman -> pokeman[:height] end)
    weights = Enum.map(data, fn pokeman -> pokeman[:weight] end)

    {:ok,
      %{
        mean_height: mean(heights),
        median_height: median(heights),
        mode_height: mode(heights),
        mean_weight: mean(weights),
        median_weight: median(weights),
        mode_weight: mode(weights)
      }
    }
  end

  def mean(list), do: Enum.sum(list) / length(list)

  def median(list)
    when is_even?(list) do
    mid_one = length(list) / 2
    mid_two = mid_one + 1

    sorted_list = Enum.sort(list)

    midpoint = sorted_list[mid_one] + sorted_list[mid_two]

    Enum.sum(sorted_list) / midpoint
  end

  def median(list) do
    sorted_list = Enum.sort(list)

    midpoint_index = ((length(sorted_list) + 1) / 2) - 1

    Enum.sum(sorted_list) / midpoint_index
  end


  def mode(list) do
    if length(Math.Enum.mode(list)) > 1 do
      [0]
    else
      Math.Enum.mode(list)
    end
  end
end
