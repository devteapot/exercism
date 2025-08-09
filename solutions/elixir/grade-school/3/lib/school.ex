defmodule School do
  @moduledoc """
  Simulate students in a school.

  Each student is in a grade.
  """

  @type school :: any()

  @doc """
  Create a new, empty school.
  """
  @spec new() :: school
  def new() do
    %{1 => [], 2 => [], 3 => [], 4 => [], 5 => []}
  end

  @doc """
  Add a student to a particular grade in school.
  """
  @spec add(school, String.t(), integer) :: {:ok | :error, school}
  def add(school, name, grade) do
    if name in school[grade] do
      {:error, school}
    else
      {:ok, %{school | grade => Enum.sort([name | school[grade]])}}
    end
  end

  @doc """
  Return the names of the students in a particular grade, sorted alphabetically.
  """
  @spec grade(school, integer) :: [String.t()]
  def grade(school, grade) do
    school[grade]
  end

  @doc """
  Return the names of all the students in the school sorted by grade and name.
  """
  @spec roster(school) :: [String.t()]
  def roster(school) do
    school
      |> Enum.sort_by(& elem(&1, 0))
      |> Enum.flat_map(& elem(&1, 1))
  end
end
