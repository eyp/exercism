defmodule NameBadge do
  def get_department(department) do
    if department == nil, do: "OWNER", else: String.upcase(department)
  end

  def print(nil, name, department) do
    "#{name} - #{get_department(department)}"
  end

  def print(id, name, department) do
    "[#{id}] - #{name} - #{get_department(department)}"
  end
end
