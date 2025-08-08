module Series exposing (slices)


slices : Int -> String -> Result String (List (List Int))
slices size input =
    let
        len =
            String.length input
    in
    if input == "" then
        Err "series cannot be empty"

    else
        case ( size > len, size == 0, size < 0 ) of
            ( True, _, _ ) ->
                Err "slice length cannot be greater than series length"

            ( _, True, _ ) ->
                Err "slice length cannot be zero"

            ( _, _, True ) ->
                Err "slice length cannot be negative"

            _ ->
                List.range 0 (len - size)
                    |> List.map (\start -> String.slice start (start + size) input)
                    |> List.map String.toList
                    |> List.map (List.map String.fromChar)
                    |> List.map (List.map (\digit -> digit |> String.toInt |> Maybe.withDefault 0))
                    |> Ok
