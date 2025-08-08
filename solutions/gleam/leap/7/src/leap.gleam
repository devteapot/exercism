pub fn is_leap_year(year: Int) -> Bool {
  case [year % 4, year % 100, year % 400] {
    [0, 0, 0] -> True
    [0, 0, _] -> True
    [0, _, 0] -> True
    _ -> False
  }
}
