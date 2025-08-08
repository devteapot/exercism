defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({n1, d1}, {n2, d2}) do
    {n1 * d2 + n2 * d1, d1 * d2} |> reduce
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract({n1, d1}, {n2, d2}) do
    {n1 * d2 - n2 * d1, d1 * d2} |> reduce
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({n1, d1}, {n2, d2}) do
    {n1 * n2, d1 * d2} |> reduce
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by({n1, d1}, {n2, d2}) do
    {n1 * d2, n2 * d1} |> reduce
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({d, n}) do
    {Kernel.abs(n), Kernel.abs(d)} |> reduce
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational({n1, d1}, n) when n > 0 do
    {n1 ** n, d1 ** n} |> reduce
  end
  def pow_rational({n1, d1}, n) do
    {d1 ** Kernel.abs(n), n1 ** Kernel.abs(n)} |> reduce
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {n, d}) do
    (x ** n) ** 1/d
  end

  def gcd(a,b) when b == 0, do: a
  def gcd(a, b), do: gcd(b, rem(a, b))
  
  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({n, d}) do
    divisor = gcd(n, d)

    n_res = n/divisor
    d_res = d/divisor

    cond do
      d_res < 0 -> {n_res*-1, d_res*-1}
      true      -> {n_res,    d_res}
    end
  end
end
