module Hamming exposing (distance)

import String exposing (right)


distance : String -> String -> Result String Int
distance left right =
    if not (String.length left == String.length right) then
        Err "strands must be of equal length"

    else
        Ok
            (left
                |> String.toList
                |> List.map2 Tuple.pair (String.toList right)
                |> List.filter (\( a, b ) -> not (a == b))
                |> List.length
            )
