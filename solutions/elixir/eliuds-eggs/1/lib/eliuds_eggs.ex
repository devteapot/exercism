defmodule EliudsEggs do
  @doc """
  Given the number, count the number of eggs.
  """
  @spec egg_count(number :: integer()) :: non_neg_integer()
  def egg_count(number) when number == 0, do: 0
  def egg_count(number) do
    next_number = div(number, 2)
    cond do
      rem(number, 2) == 0 -> egg_count(next_number)
      true                -> egg_count(next_number) + 1  
    end
  end
end
