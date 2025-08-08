import gleam/list
import gleam/int

pub fn square_of_sum(n: Int) -> Int {
  let sum =
    list.range(0, n)
    |> int.sum

  int.multiply(sum, sum)
}

pub fn sum_of_squares(n: Int) -> Int {
  list.range(0, n)
  |> list.map(fn(x) { x * x })
  |> int.sum
}

pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}
