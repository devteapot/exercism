defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    abs_x = abs(x)
    abs_y = abs(y)

    cond do
      abs_x <= 1 and abs_y <= 1   -> 10
      abs_x <= 5 and abs_y <= 5   -> 5
      abs_x <= 10 and abs_y <= 10 -> 1
      true                        -> 0
    end
  end
end
