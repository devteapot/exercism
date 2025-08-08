defmodule HighSchoolSweetheart do
  def first_letter(first_char <> rest) do
    first_char
  end

  def initial(name) do
    "#{name |> first_letter |> capitalize}."
  end

  def initials(full_name) do
    full_name |> split(" ") |> map(initial) |> reduce("", fn acc, <>)
  end

  def pair(full_name1, full_name2) do
    """
    ❤-------------------❤
    |  #{initials(full_name1)}  +  #{initials(full_name2)}  |
    ❤-------------------❤
    """
  end
end
