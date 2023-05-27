defmodule App.Game.Actions do
  alias App.Game
  alias App.Game.Actions.Attack

  def attack(move) do
    case Game.turn() do
      :player -> Attack.attack_opponent(:computer,move)
      :computer -> Attack.attack_opponent(:player,move)
    end
  end
  end
  def fetch_move(move) do
    Game.player()
    |> Map.get(:moves)
    |> find_move(move)
  end

  defp find_move(moves, move) do
    Enum.find_value(moves, {:error, move}, fn {key, value} ->
      if value == move, do {:ok, key}
    end)
  end
end