defmodule PokemonStats.PokemonApi.Fetcher do
  use HTTPoison.Base

  def fetch(pokemon) do
    HTTPoison.get("https://pokeapi.co/api/v2/pokemon/#{pokemon}")
    |> handle_response()
  end

  def handle_response({:ok, %HTTPoison.Response{body: body}}), do: Poison.decode(body)
end
