import gleam/int
import gleam/list
import gleam/pair
import gleam/string

pub fn convert(number: Int) -> String {
  case
    [#(3, "Pling"), #(5, "Plang"), #(7, "Plong")]
    |> list.filter(fn(x) { number % x.0 == 0 })
    |> list.map(pair.second)
    |> string.join("")
  {
    "" -> int.to_string(number)
    result -> result
  }
}
