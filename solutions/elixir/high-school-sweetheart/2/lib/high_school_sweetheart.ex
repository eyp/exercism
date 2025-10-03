defmodule HighSchoolSweetheart do
  import Enum
  import String

  def first_letter(name) do
    name 
    |> trim()
    |> first()
  end

  def initial(name) do
    first_letter(name) <> "."
     |> capitalize()
  end

  def initials(full_name) do
    full_name
    |> split()
    |> map(&initial(&1))
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
