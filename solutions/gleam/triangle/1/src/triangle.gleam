import gleam/list

fn is_valid_triangle(a: Float, b: Float, c: Float) -> Bool {
  case a, b, c {
    0.0, _, _ | _, 0.0, _ | _, 0.0, _ -> False
    _, _, _ -> True
  }
  && a +. b >=. c
  && b +. c >=. a
  && a +. c >=. b
}

pub fn equilateral(a: Float, b: Float, c: Float) -> Bool {
  is_valid_triangle(a, b, c) && a == b && b == c
}

pub fn isosceles(a: Float, b: Float, c: Float) -> Bool {
  is_valid_triangle(a, b, c)
  && list.combinations([a, b, c], 2)
  |> list.filter_map(fn(x) {
    case x {
      [y, z] if y == z -> Ok(Nil)
      _ -> Error(Nil)
    }
  })
  |> list.length
  > 0
}

pub fn scalene(a: Float, b: Float, c: Float) -> Bool {
  is_valid_triangle(a, b, c) && a != b && b != c && a != c
}
