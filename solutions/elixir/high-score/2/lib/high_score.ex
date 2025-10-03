defmodule HighScore do
  import Map

  @initial_score 0
  
  def new(), do: %{}

  def add_player(scores, name, score \\ @initial_score), do: put(scores, name, score)

  def remove_player(scores, name), do: delete(scores, name)

  def reset_score(scores, name), do: add_player(scores, name)

  def update_score(scores, name, score), do: update(scores, name, score, fn current_score -> current_score + score end)

  def get_players(scores), do: keys(scores)
end
