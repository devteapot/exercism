pub fn reply(guess: Int) -> String {
  case guess {
    42 -> "Correct"
    i if 41 == i || i == 43 -> "So close"
    i if i < 41 -> "Too low"
    i if i > 43 -> "Too high"
    _ -> ""
  }
}
