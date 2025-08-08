defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add({n1, d1}:: rational, {n2, d2}:: rational) :: rational
  def add(a, b) do
    {n1 * d2 + n2 * d1, d1 * d2 }
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract({n1, d1}:: rational, {n2, d2} :: rational) :: rational
  def subtract(a, b) do
    {n1 * d2 - n2 * d1, d1 * d2 }
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply({n1, d1}:: rational, {n2, d2} :: rational) :: rational
  def multiply(a, b) do
    {n1 * n2, d1 * d2 }
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by({n1, d1}:: rational, {n2, d2}:: rational) :: rational
  def divide_by(num, den) do
    {n1 * d2, n2 * d1}
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs({n, d} :: rational) :: rational
  def abs(a) do
    {abs(n), abs(d)}
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational({n1, d1}, n) when n > 0 do
    {n1 ** n, d1 ** n}
  end
  def pow_rational({n1, d1}, n) do
    {d1 ** abs(n), n1 ** abs(n)}
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {n, d}) do
    root(x ** n, b)
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce(a) do
  end
end
