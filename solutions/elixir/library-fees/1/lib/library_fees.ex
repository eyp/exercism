defmodule LibraryFees do
  import NaiveDateTime
  
  def datetime_from_string(string), do: from_iso8601!(string)

  def before_noon?(datetime) do
    to_time(datetime)
    |> Time.before?(~T[12:00:00])
  end

  def return_date(checkout_datetime) do
    to_date(add(checkout_datetime, get_borrowing_days(checkout_datetime), :day))
  end

  defp get_borrowing_days(checkout_datetime) do
    if before_noon?(checkout_datetime), do: 28, else: 29
  end

  def days_late(planned_return_date, actual_return_datetime) do
    if Date.before?(to_date(actual_return_datetime), planned_return_date) do
      0
    else  
      Date.diff(to_date(actual_return_datetime), planned_return_date)
    end  
  end

  def monday?(datetime), do: Date.day_of_week(datetime) == 1

  def calculate_late_fee(checkout, return, rate) do
    checkout_datetime = datetime_from_string(checkout)
    return_datetime = datetime_from_string(return)
    fee = if monday?(return_datetime), do: rate / 2, else: rate
    days_late = days_late(return_date(checkout_datetime), return_datetime)
    
    trunc(days_late * fee)
  end
end
