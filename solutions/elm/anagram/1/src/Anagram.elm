module Anagram exposing (detect)

import Dict exposing (Dict)


letterFreq : String -> Dict Char Int
letterFreq s =
    s
        |> String.toLower
        |> String.toList
        |> List.foldl
            (\c dict ->
                Dict.union
                    (Dict.singleton c
                        (case Dict.get c dict of
                            Just freq ->
                                freq + 1

                            _ ->
                                1
                        )
                    )
                    dict
            )
            Dict.empty


detect : String -> List String -> List String
detect word candidates =
    let
        lf =
            letterFreq word

        len =
            String.length word
    in
    candidates
        |> List.filter (\c -> not ((String.toLower c) == (String.toLower word)))
        |> List.filter (\c -> len == String.length c && ((letterFreq <| String.toLower c) == lf))
