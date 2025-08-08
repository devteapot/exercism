module Acronym exposing (abbreviate)


abbreviate : String -> String
abbreviate phrase =
    phrase
        |> String.map (\c -> if Char.isAlpha c then c else ' ')
        |> String.words
        |> List.map (String.slice 0 1)
        |> List.map String.toUpper
        |> List.foldr (++) ""
