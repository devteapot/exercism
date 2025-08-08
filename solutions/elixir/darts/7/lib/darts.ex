defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    abs_x = abs(x)
    abs_y = abs(y)

    distance = (abs_x ** 2 + abs_y ** 2) ** 0.5

    cond do
      distance <= 1  -> 10
      distance <= 5  -> 5
      distance <= 10 -> 1
      true           -> 0
    end
  end
end
