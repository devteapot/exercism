pub fn is_leap_year(year: Int) -> Bool {
  case [year % 4, year % 100, year % 400] {
    [0, 0, 0] -> True
    [0, x, _] -> x != 0
    _ -> False
  }
}
