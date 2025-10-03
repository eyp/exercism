defmodule NameBadge do
  defp get_department(department) do
    if department, do: String.upcase(department), else: "OWNER"
  end

  def print(id, name, department) do
    if id do
      "[#{id}] - #{name} - #{get_department(department)}"
    else
      "#{name} - #{get_department(department)}"
    end
  end
end
