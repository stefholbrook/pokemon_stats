defmodule PokemonStats.Plug do
  import Plug.Conn

  def init(options) do
    options
  end

  def call(conn, _opts) do
    match(conn.method, conn.path_info, conn)
  end

  defp match("GET", ["hello"], conn) do
    send_resp(conn, 200, "world")
  end

  defp match(_, _, conn) do
    send_resp(conn, 404, "oops")
  end
end
