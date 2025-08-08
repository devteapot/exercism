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
  def label([c1, c2, c3 | _]) do
    ohm_value = "#{@color_map[c1]}#{@color_map[c2]}"
      |> String.to_integer()
      |> Kernel.*(10 ** @color_map[c3])

    cond do
      rem(ohm_value, 1_000_000_000) == 0 -> :gigaohms
      rem(ohm_value, 1_000_000)     == 0 -> :megaohms
      rem(ohm_value, 1_000)         == 0 -> :kiloohms
      true                          == 0 -> :ohms
    end
  end
end
