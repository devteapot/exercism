import gleam/int
import gleam/set
import gleam/list

pub fn sum(factors factors: List(Int), limit limit: Int) -> Int {
  list.flat_map(factors, fn(x) {
    list.range(0, limit / x - 1)
    |> list.map(fn(y) {
      list.range(0, y)
      |> list.map(fn(_) { x })
      |> list.fold(0, int.add)
    })
    |> list.filter(fn(y) { y < limit })
  })
  |> set.from_list
  |> set.to_list
  |> int.sum
}
