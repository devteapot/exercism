import gleam/int
import gleam/list
import gleam/result

pub fn convert(number: Int) -> String {
  case
    [3, 5, 7]
    |> list.map(int.modulo(number, _))
    |> result.all
  {
    Ok([0, 0, 0]) -> "PlingPlangPlong"
    Ok([_, 0, 0]) -> "PlangPlong"
    Ok([0, 0, _]) -> "PlingPlang"
    Ok([0, _, 0]) -> "PlingPlong"
    Ok([0, _, _]) -> "Pling"
    Ok([_, 0, _]) -> "Plang"
    Ok([_, _, 0]) -> "Plong"
    _ -> int.to_string(number)
  }
}
