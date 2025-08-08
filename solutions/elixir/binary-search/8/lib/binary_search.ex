defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search({}, _key), do: :not_found
  def search({number}, key) when number == key, do: {:ok, 0}
  def search({_number}, _key), do: :not_found
  def search(numbers, key) do
    index = tuple_size(numbers)/2 |> trunc
    {before, [middle | rest]} = Enum.split(Tuple.to_list(numbers), index)
    cond do
      middle == key -> {:ok, index}
      middle > key  -> search(List.to_tuple(before), key)
      middle < key  -> search(List.to_tuple(rest), key)
      true          -> :not_found
    end
  end
end
