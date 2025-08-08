defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    char_map = String.codepoints(base) |> Enum.frequencies()
    Enum.filter(candidates, fn candidate -> (String.codepoints(candidate) |> Enum.frequencies())== char_map  end)
  end
end
