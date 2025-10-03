defmodule HighScore do
  import Map
  
  def new(), do: %{}

  def add_player(scores, name), do: put(scores, name, 0)

  def add_player(scores, name, score), do: put(scores, name, score)

  def remove_player(scores, name), do: delete(scores, name)

  def reset_score(scores, name), do: add_player(scores, name, 0)

  def update_score(scores, name, score), do: update(scores, name, score, fn current_score -> current_score + score end)

  def get_players(scores), do: keys(scores)
end
