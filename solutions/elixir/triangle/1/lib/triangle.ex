defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}
  def kind(a, b, c) when a <= 0 or b <= 0 or c <= 0, do: {:error, "not a triangle"}
  def kind(a, b, c) do
    cond do
      a == b and b == c          -> :equilateral
      a == b or b == c or c == a -> :isosceles
      true                       -> :scalene
    end
  end
end
