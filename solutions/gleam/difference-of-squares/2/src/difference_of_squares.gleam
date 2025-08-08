import gleam/list
import gleam/int

fn square(n: Int) -> Int {
  int.multiply(n, n)
}

pub fn square_of_sum(n: Int) -> Int {
  list.range(0, n)
  |> int.sum
  |> square
}

pub fn sum_of_squares(n: Int) -> Int {
  list.range(0, n)
  |> list.map(square)
  |> int.sum
}

pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}
