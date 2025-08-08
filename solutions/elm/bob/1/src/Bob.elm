module Bob exposing (hey)

import Char exposing (isUpper, isAlpha)

isUpperCase : String -> Bool
isUpperCase s =
    let
        chars = String.filter (\c -> isAlpha c) s
    in
    String.all isUpper chars && String.length chars > 0

hey : String -> String
hey remark =
    let
        input = String.trim remark
    in
    if input == ""
        then "Fine. Be that way!"
        else case (String.right 1 input, isUpperCase input) of
            ("?", True) -> "Calm down, I know what I'm doing!"
            ("?", False) -> "Sure."
            (_, True) -> "Whoa, chill out!"
            (_, False) -> "Whatever."
