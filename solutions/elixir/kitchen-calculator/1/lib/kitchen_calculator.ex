defmodule KitchenCalculator do
  def get_volume({_, volume} = _volume_pair), do: volume

  def to_milliliter({:milliliter, _volume} = volume_pair), do: volume_pair

  def to_milliliter({:cup, volume} = _volume_pair), do: {:milliliter, volume * 240}

  def to_milliliter({:fluid_ounce, volume} = _volume_pair), do: {:milliliter, volume * 30}

  def to_milliliter({:teaspoon, volume} = _volume_pair), do: {:milliliter, volume * 5}

  def to_milliliter({:tablespoon, volume} = _volume_pair), do: {:milliliter, volume * 15}

  def from_milliliter({:milliliter, _volume} = volume_pair, :milliliter = _unit), do: volume_pair

  def from_milliliter({:milliliter, volume} = _volume_pair, :cup = unit), do: {unit, volume / 240}

  def from_milliliter({:milliliter, volume} = _volume_pair, :fluid_ounce = unit), do: {unit, volume / 30}

  def from_milliliter({:milliliter, volume} = _volume_pair, :teaspoon = unit), do: {unit, volume / 5}

  def from_milliliter({:milliliter, volume} = _volume_pair, :tablespoon = unit), do: {unit, volume / 15}

  def convert({source_unit, _volume} = volume_pair, target_unit) when source_unit == target_unit, do: volume_pair

  def convert(volume_pair, target_unit) do
    to_milliliter(volume_pair)
    |> from_milliliter(target_unit)
  end
end
