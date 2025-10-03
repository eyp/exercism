defmodule BasketballWebsite do
  def extract_from_path(data, []), do: data

  def extract_from_path(data, [head|tail]) do
    extract_from_path(data[head], tail)
  end

  def extract_from_path(data, path) do
    extract_from_path(data, String.split(path, "."))
  end

  def get_in_path(data, path) do
    get_in(data, String.split(path, "."))
  end
end
