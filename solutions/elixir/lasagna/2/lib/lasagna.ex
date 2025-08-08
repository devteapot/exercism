defmodule Lasagna do
  def expected_minutes_in_oven(), do: 40
  def remaining_minutes_in_oven(passed_minutes), do: expected_minutes_in_oven() - passed_minutes 
  def preparation_time_in_minutes(n_layers), do: n_layers * 2
  def total_time_in_minutes(n_layers, passed_minutes), do: preparation_time_in_minutes(n_layers) + passed_minutes
  def alarm(), do: "Ding!"
end
