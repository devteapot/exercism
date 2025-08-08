defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    downcase_base = String.downcase(base)
    char_map = String.codepoints(downcase_base) |> Enum.frequencies()

    Enum.filter(candidates, fn candidate ->
      String.downcase(candidate) != downcase_base and ((String.downcase(candidate) |> String.codepoints() |> Enum.frequencies()) == char_map) end
    )
  end
end
