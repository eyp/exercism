defmodule Lasagna do
  def expected_minutes_in_oven, do: 40

  def remaining_minutes_in_oven(current_minutes) do
    remaining_time = expected_minutes_in_oven() - current_minutes
    if (remaining_time < 0) do
      0
    else
      remaining_time
    end
  end

  def preparation_time_in_minutes(lasagna_layers), do: lasagna_layers * 2

  def total_time_in_minutes(lasagna_layers, minutes_in_the_oven) do
      preparation_time_in_minutes(lasagna_layers) + minutes_in_the_oven
  end

  def alarm(), do: "Ding!"
end
