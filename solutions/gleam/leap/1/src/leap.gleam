import gleam/int

pub fn is_leap_year(year: Int) -> Bool {
  case [int.modulo(year, 4), int.modulo(year, 100), int.modulo(year, 400)] {
    [Ok(0), _, _] -> True
    [_, Ok(0), Ok(0)] -> True
    _ -> False
  }
}
