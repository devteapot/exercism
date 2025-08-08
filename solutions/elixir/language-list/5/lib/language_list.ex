defmodule LanguageList do
  def new() do
    []
  end

  def add(list, language) do
    [language | list]
  end

  def remove([_ | tail]) do
    tail
  end

  def first([head | _]) do
    head
  end

  def count(list) do
    length(list)
  end

  def functional_list?(list) do
    # Enum.reduce(list, false, fn curr, acc -> acc or curr == "Elixir" end)
    "Elixir" in list
  end
end
