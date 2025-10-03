defmodule FreelancerRates do
  def daily_rate(hourly_rate), do: hourly_rate * 8.0

  def apply_discount(before_discount, discount) do
    (100 - discount) / 100 * before_discount
  end
  
  def monthly_rate(hourly_rate, discount) do
    22 * daily_rate(hourly_rate) 
    |> apply_discount(discount)
    |> ceil 
    |> trunc
  end
  
  def days_in_budget(budget, hourly_rate, discount) do
    budget / apply_discount(daily_rate(hourly_rate), discount)
    |> Float.floor(1)
  end
end
