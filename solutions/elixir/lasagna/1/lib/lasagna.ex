defmodule Lasagna do
  # Please define the 'expected_minutes_in_oven/0' function
  def expected_minutes_in_oven do
    40
  end

  # Please define the 'remaining_minutes_in_oven/1' function
  def remaining_minutes_in_oven(current_minutes) do
    remaining_time = expected_minutes_in_oven() - current_minutes
    if (remaining_time < 0) do
      0
    else
      remaining_time
    end
  end

  # Please define the 'preparation_time_in_minutes/1' function
  def preparation_time_in_minutes(lasagna_layers), do: lasagna_layers * 2

  # Please define the 'total_time_in_minutes/2' function
  def total_time_in_minutes(lasagna_layers, minutes_in_the_oven) do
      preparation_time_in_minutes(lasagna_layers) + minutes_in_the_oven
  end

  # Please define the 'alarm/0' function
  def alarm(), do: "Ding!"
end
