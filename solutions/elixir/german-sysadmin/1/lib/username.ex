defmodule Username do
  def sanitize(username) do
    # ä becomes ae
    # ö becomes oe
    # ü becomes ue
    # ß becomes ss

    # Please implement the sanitize/1 function
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
