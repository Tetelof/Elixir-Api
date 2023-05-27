defmodule App.Game.Status do
  alias App.Game

  def print_round_message() do
    IO.puts("======== The game has started! ========")
    IO.inspect(Game.info())
    IO.puts("=======================================")
  end

  def print_wrong_move_message(move) do
    IO.puts("======== #{move} is not a valid move! ========")
    IO.puts("======== Please try again! ========")
  end
end
