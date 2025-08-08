defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, &(&1.price))
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, &(is_nil(&1.price)))
  end

  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, fn item -> %{item | name: String.replace(item.name, old_word, new_word)} end)
  end

  def increase_quantity(item, count) do
    %{item | quantity_by_size: Enum.map(item.quantity_by_size, fn {key, value} -> {key, value + count} end) |> Map.new()}
  end

  def total_quantity(item) do
    Map.values(item.quantity_by_size) |> Enum.reduce(0, &Kernel.+/2)
  end
end
