defmodule BlockchainAPIWeb.BlockController do
  use BlockchainAPIWeb, :controller

  alias BlockchainAPI.Explorer

  action_fallback BlockchainAPIWeb.FallbackController

  def index(conn, params) do
    blocks = Explorer.list_blocks(params)
    render(conn, "index.json", blocks: blocks)
  end

  def show(conn, %{"height" => height}) do
    block = Explorer.get_block!(height)
    render(conn, "show.json", block: block)
  end

end
