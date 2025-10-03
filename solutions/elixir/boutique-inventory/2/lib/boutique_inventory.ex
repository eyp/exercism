defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, & &1.price, :asc)
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, &(&1[:price] == nil))
  end

  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, fn item ->
      %{item | name: String.replace(item.name, old_word, new_word)}
    end)
  end

  def increase_quantity(item, count) do
    %{item | quantity_by_size: _increase_quantities(item.quantity_by_size, count)}
  end

  defp _increase_quantities(quantities_by_size, count) do
    Enum.into(quantities_by_size, %{}, fn {size, quantity} -> {size, quantity + count} end)
  end
  
  def total_quantity(item) do
    Enum.reduce(item.quantity_by_size, 0, fn {_size, quantity}, total -> total + quantity end)
  end
end
