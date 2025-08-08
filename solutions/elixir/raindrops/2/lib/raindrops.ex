defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    Integer.digits(number) |> Enum.map(fn digit ->
      cond do
        rem(digit, 3) == 0 -> "Pling"
        rem(digit, 5) == 0 -> "Plang"
        rem(digit, 7) == 0 -> "Plong"
        true                -> Integer.to_string(digit)
      end
    end) |> Enum.join()
  end
end
