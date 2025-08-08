defmodule Username do
  def sanitize(username) do
    Enum.flat_map(username, fn char ->
      case char do
        ?ä -> ~c"ae"
        ?ö -> ~c"oe"
        ?ü -> ~c"ue"
        ?ß -> ~c"ss"
        _  -> [char]
      end
    end) |> Enum.filter(fn char -> char == ?_ or (?a <= char and char <= ?z) end)
  end
end
