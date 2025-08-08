module Anagram exposing (detect)


detect : String -> List String -> List String
detect word candidates =
    candidates
        |> List.filter (\c -> not (String.toLower c == String.toLower word))
        |> List.filter (\c -> (c |> String.toLower |> String.toList |> List.sort) == (word |> String.toLower |> String.toList |> List.sort))
