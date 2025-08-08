defmodule HighSchoolSweetheart do
  def first_letter(name) do
    first(name)
  end

  def initial(name) do
    "#{name |> first_letter |> capitalize}."
  end

  def initials(full_name) do
    full_name |> split(" ") |> map(initial()) |> reduce("", fn acc, curr -> acc <> " #{curr}" end)
  end

  def pair(full_name1, full_name2) do
    """
    ❤-------------------❤
    |  #{initials(full_name1)}  +  #{initials(full_name2)}  |
    ❤-------------------❤
    """
  end
end
