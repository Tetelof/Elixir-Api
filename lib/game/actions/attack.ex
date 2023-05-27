defmodule App.Game.Actions.Attack do

  def attack_opponent(opponent, move) do
    opponent
    |> Map.get(:moves)
    |> find_move(move)
  end
end
