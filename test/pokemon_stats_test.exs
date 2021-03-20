defmodule PokemonStatsTest do
  use ExUnit.Case
  doctest PokemonStats

  test "greets the world" do
    assert PokemonStats.hello() == :world
  end
end
