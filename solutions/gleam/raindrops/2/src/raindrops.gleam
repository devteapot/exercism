import gleam/int
import gleam/list
import gleam/result
import gleam/string
import gleam/option.{None, Some}

pub fn convert(number: Int) -> String {
  case
    [3, 5, 7]
    |> list.map(int.modulo(number, _))
    |> result.all
    |> result.unwrap([])
    |> list.index_map(fn(mod, i) {
      case i {
        _ if mod != 0 -> None
        0 -> Some("Pling")
        1 -> Some("Plang")
        2 -> Some("Plong")
        _ -> None
      }
    })
    |> option.values
    |> string.join("")
  {
    "" -> int.to_string(number)
    result -> result
  }
}
