defmodule HighScore do
  @initial_score 0
  
  def new(), do: %{}

  def add_player(scores, name, score \\ @initial_score), do: Map.put(scores, name, score)

  def remove_player(scores, name), do: Map.delete(scores, name)

  def reset_score(scores, name), do: remove_player(scores, name) |> add_player(name)

  def update_score(scores, name, score) do
    map_result= Map.fetch(scores, name)
    cond do
      map_result == :error              -> add_player(scores, name)
      {:ok, current_score} = map_result -> %{scores | name => current_score + score}
    end
  end

  def get_players(scores), do: Map.keys(scores)
end
