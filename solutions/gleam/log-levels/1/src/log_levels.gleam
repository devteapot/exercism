import gleam/string
import gleam/list
import gleam/result

pub fn message(log_line: String) -> String {
  case log_line {
    "[INFO]: " <> msg -> msg
    "[ERROR]: " <> msg -> msg
    "[WARNING]: " <> msg -> msg
    _ -> ""
  }
}

pub fn log_level(log_line: String) -> String {
  case log_line {
    "[INFO]: " <> _ -> "info"
    "[ERROR]: " <> _ -> "error"
    "[WARNING]: " <> _ -> "warning"
    _ -> ""
  }
}

pub fn reformat(log_line: String) -> String {
  message(log_line) <> " (" <> log_level(log_line) <> ")"
}
