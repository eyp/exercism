defmodule KitchenCalculator do
  @cup_in_ml 240
  @fluid_ounce_in_ml 30
  @teaspoon_in_ml 5
  @tablespoon_in_ml 15
  
  def get_volume({_, volume} = _volume_pair), do: volume

  def to_milliliter({:milliliter, _volume} = volume_pair), do: volume_pair

  def to_milliliter({:cup, volume} = _volume_pair), do: {:milliliter, volume * @cup_in_ml}

  def to_milliliter({:fluid_ounce, volume} = _volume_pair), do: {:milliliter, volume * @fluid_ounce_in_ml}

  def to_milliliter({:teaspoon, volume} = _volume_pair), do: {:milliliter, volume * @teaspoon_in_ml}

  def to_milliliter({:tablespoon, volume} = _volume_pair), do: {:milliliter, volume * @tablespoon_in_ml}

  def from_milliliter({:milliliter, _volume} = volume_pair, :milliliter = _unit), do: volume_pair

  def from_milliliter({:milliliter, volume} = _volume_pair, :cup = unit), do: {unit, volume / @cup_in_ml}

  def from_milliliter({:milliliter, volume} = _volume_pair, :fluid_ounce = unit), do: {unit, volume / @fluid_ounce_in_ml}

  def from_milliliter({:milliliter, volume} = _volume_pair, :teaspoon = unit), do: {unit, volume / @teaspoon_in_ml}

  def from_milliliter({:milliliter, volume} = _volume_pair, :tablespoon = unit), do: {unit, volume / @tablespoon_in_ml}

  def convert({source_unit, _volume} = volume_pair, target_unit) when source_unit == target_unit, do: volume_pair

  def convert(volume_pair, target_unit) do
    to_milliliter(volume_pair)
    |> from_milliliter(target_unit)
  end
end
