pub fn is_leap_year(year: Int) -> Bool {
  case [year % 4, year % 100, year % 400] {
    [0, _, _] -> True
    [x, 0, 0] -> x != 0
    _ -> False
  }
}
