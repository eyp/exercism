defmodule HighSchoolSweetheart do
  import Enum

  def first_letter(name) do
    name 
    |> String.trim()
    |> String.first()
  end

  def initial(name) do
    first_letter(name) <> "."
     |> String.capitalize()
  end

  def initials(full_name) do
    full_name
    |> String.split()
    |> map(fn (token) -> initial(token) end)
    |> reduce(fn (initial, result) -> "#{result} #{initial}" end)
  end

  def pair(full_name1, full_name2) do
    """
    ❤-------------------❤
    |  #{initials(full_name1)}  +  #{initials(full_name2)}  |
    ❤-------------------❤
    """
  end
end
