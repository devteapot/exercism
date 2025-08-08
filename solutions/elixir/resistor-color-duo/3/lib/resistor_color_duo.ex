defmodule ResistorColorDuo do
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
  Calculate a resistance value from two colors
  """
  @spec value(colors :: [atom]) :: integer
  def value([c1, c2 | _]), do: "#{@color_map[c1]}#{@color_map[c2]}" |> String.to_integer()
end
