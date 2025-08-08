defmodule ResistorColorTrio do
  @color_map %{
    :black   => 0,
    :brown   => 1,
    :red     => 2,
    :orange  => 3,
    :yellow  => 4,
    :green   => 5,
    :blue    => 6,
    :violet  => 7,
    :grey    => 8,
    :white   => 9
  }
  @doc """
  Calculate the resistance value in ohms from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms | :megaohms | :gigaohms}
  def label([c1, c2, c3 | _]), do: {
    "#{@color_map[c1]}#{@color_map[c2]}" |> String.to_integer() |> Kernel.*(10 ** Map.drop(@color_map, [:orange, :blue, :white])[c3] || 0),
    cond do
      c3 == :white                     -> :gigaohms
      c3 in [:blue, :violet, :grey]    -> :megaohms
      c3 in [:orange, :yellow, :green] -> :kiloohms
      c3 in [:black, :brown, :red]     -> :ohms
    end
  }
end
