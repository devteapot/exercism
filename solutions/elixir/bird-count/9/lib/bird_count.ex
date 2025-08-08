defmodule BirdCount do
  def today([]), do: nil
  def today([today]), do: today
  def today([today | _]), do: today

  def increment_day_count([today]), do: [today+1]
  def increment_day_count([today | rest]), do: [today+1 | rest]
  def increment_day_count([]), do: [1]

  def has_day_without_birds?([0]), do: true
  def has_day_without_birds?([0 | _]), do: true 
  def has_day_without_birds?([_ | rest]), do: has_day_without_birds?(rest)
  def has_day_without_birds?([]), do: false

  def total([]), do: 0
  def total([last_item]), do: last_item
  def total([head | tail]), do: head + total(tail)

  def busy_days([tail]) when tail >= 5, do: 1
  def busy_days([head | tail]) when head >= 5, do: busy_days(tail) + 1
  def busy_days([_ | tail]), do: busy_days(tail)
end
