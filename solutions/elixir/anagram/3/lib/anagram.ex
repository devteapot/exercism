defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    char_map = String.downcase(base) |> String.codepoints() |> Enum.frequencies()
    Enum.filter(candidates, fn candidate ->
      candidate != base and ((String.downcase(candidate) |> String.codepoints() |> Enum.frequencies()) == char_map) end
    )
  end
end
