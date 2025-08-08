import gleam/int
import gleam/dict
import gleam/list
import gleam/result
import gleam/string

pub fn convert_digit(number: Int, at digit_position: Int) -> String {
  dict.from_list([
    #(0, #("X", "V", "I")),
    #(1, #("C", "L", "X")),
    #(2, #("M", "D", "C")),
    #(3, #("", "", "M")),
  ])
  |> dict.get(digit_position)
  |> result.map(fn(digits) {
    let #(ten, five, one) = digits

    case number {
      n if n <= 3 -> string.repeat(one, n)
      n if n < 5 -> string.repeat(one, 5 - n) <> five
      5 -> five
      n if n > 8 -> string.repeat(one, 10 - n) <> ten
      n if n > 5 -> five <> string.repeat(one, n - 5)
      _ -> ""
    }
  })
  |> result.unwrap("")
}

pub fn convert(number: Int) -> String {
  int.digits(number, 10)
  |> result.map(list.reverse)
  |> result.map(list.index_map(_, fn(digit, idx) { convert_digit(digit, idx) }))
  |> result.map(list.reverse)
  |> result.map(string.concat)
  |> result.unwrap("")
}
