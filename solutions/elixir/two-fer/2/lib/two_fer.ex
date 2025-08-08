defmodule TwoFer do
  @doc """
  Two-fer or 2-fer is short for two for one. One for you and one for me.
  """
  @spec two_fer(String.t()) :: String.t()
  def two_fer(name \\ "you") do
    checked_name = cond do
      not String.valid?(name) -> name
      true -> "you"
    end
     
    "One for #{checked_name}, one for me."
  end
end
