module Isogram exposing (isIsogram)

import Set


isIsogram : String -> Bool
isIsogram sentence =
    let
        letters =
            sentence
                |> String.toList
                |> List.filter Char.isAlpha
                |> List.map Char.toLower
    in
    letters
        |> List.length
        |> (==) (letters |> Set.fromList |> Set.size)
