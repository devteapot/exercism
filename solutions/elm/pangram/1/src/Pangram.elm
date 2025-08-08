module Pangram exposing (isPangram)

import Set


isPangram : String -> Bool
isPangram sentence =
    sentence
        |> String.toList
        |> List.map Char.toLower
        |> List.map Char.toCode
        |> List.foldl Set.remove (Set.fromList (List.range 97 122))
        |> Set.isEmpty
