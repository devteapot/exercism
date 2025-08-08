module AtbashCipher exposing (decode, encode)

import Dict exposing (Dict)


mapper : Dict Char Char
mapper =
    let
        keys =
            List.range (Char.toCode 'a') (Char.toCode 'z')
                |> List.map Char.fromCode

        values =
            List.reverse keys
    in
    keys
        |> List.map2 Tuple.pair values
        |> Dict.fromList


reverseDict : Dict Char Char -> Dict Char Char
reverseDict dict =
    dict
        |> Dict.toList
        |> List.map (\( a, b ) -> ( b, a ))
        |> Dict.fromList


decodeWithDict : Dict Char Char -> String -> String
decodeWithDict dict input =
    input
        |> String.filter Char.isAlphaNum
        |> String.toLower
        |> String.toList
        |> List.map (\c -> Maybe.withDefault c <| Dict.get c dict)
        |> String.fromList


encode : String -> String
encode plain =
    let
        encodedString =
            decodeWithDict mapper plain

        charsToDecode =
            String.length encodedString

        chunkSize =
            5
    in
    List.range 0 (ceiling ((toFloat charsToDecode) / (toFloat chunkSize)) - 1)
        |> List.map
            (\a ->
                String.slice
                    (a * chunkSize)
                    (min ((a + 1) * chunkSize) <| charsToDecode)
                    encodedString
            )
        |> String.join " "


decode : String -> String
decode cipher =
    cipher
        |> decodeWithDict (reverseDict mapper)
