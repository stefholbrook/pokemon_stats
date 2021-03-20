defmodule PokemonStats.Router do
  use Plug.Router

  import Plug.Conn

  alias PokemonStats.PokemonApi

  plug(:match)
  plug Plug.Parsers, parsers: [:json],
                     pass: ["application/json"],
                     json_decoder: Poison
  plug(:dispatch)

  get "/pokemon" do
    send_resp(conn, 200, "Gotta catch them all")
  end

  post "stats" do
    with  %{"pokemon" => pokemon} <- conn.body_params,
          {:ok, response} <- PokemonApi.fetch_and_calculate(pokemon) do
      send_resp(conn |> put_resp_content_type("application/json"), 200, Poison.encode!(response))
    else
      {:error, error} -> {:error, error}
    end

  end
end
