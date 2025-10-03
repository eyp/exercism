defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score(position) do
    do_get_score_from_distance(do_get_distance_to_center(position))
  end

  @spec do_get_distance_to_center(position) :: float
  defp do_get_distance_to_center({x, y}) do 
    Float.pow(Float.pow(x + 0.0, 2) + Float.pow(y + 0.0, 2), 0.5)
  end 

  @spec do_get_score_from_distance(float) :: integer
  defp do_get_score_from_distance(distance) when distance > 10.0, do: 0
  defp do_get_score_from_distance(distance) when distance <= 10.0 and distance > 5.0, do: 1
  defp do_get_score_from_distance(distance) when distance <= 5.0 and distance > 1.0, do: 5
  defp do_get_score_from_distance(distance) when distance <= 1.0, do: 10

end
