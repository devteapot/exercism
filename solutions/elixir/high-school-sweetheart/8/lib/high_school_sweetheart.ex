defmodule HighSchoolSweetheart do
  def first_letter(name) do
    String.first(name)
  end

  def initial(name) do
    "#{name |> first_letter |> String.capitalize}."
  end

  def initials(full_name) do
    full_name |> String.split(" ") |> Enum.map(&initial/1) |> Enum.reduce("", fn acc, curr -> acc <> " #{curr}" end)
  end

  def pair(full_name1, full_name2) do
    """
    ❤-------------------❤
    |  #{initials(full_name1)}  +  #{initials(full_name2)}  |
    ❤-------------------❤
    """
  end
end
