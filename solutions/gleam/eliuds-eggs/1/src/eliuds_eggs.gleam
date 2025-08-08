import gleam/int
import gleam/string
import gleam/list

pub fn egg_count(number: Int) -> Int {
  int.to_string(number)
  |> string.split("")
  |> list.filter(fn(x) { x == "1" })
  |> list.length
}
