module PhoneNumber exposing (getNumber)

import List exposing (foldl)


getNumber : String -> Maybe String
getNumber phoneNumber =
    let
        numbers =
            phoneNumber |> String.toList |> List.filter Char.isDigit
    in
    (case numbers |> List.length of
        10 ->
            Just numbers

        11 ->
            case numbers of
                '1' :: noPrefix ->
                    Just noPrefix

                _ ->
                    Nothing

        _ ->
            Nothing
    )
        |> Maybe.andThen
            (\mn ->
                if
                    ( List.take 1 mn ) ++ ( mn |> List.drop 3 |> List.take 1 )
                        |> List.map String.fromChar
                        |> List.map String.toInt
                        |> List.map (Maybe.map (\x -> x >= 2 && x <= 9))
                        |> foldl (\curr acc -> (Maybe.withDefault False curr) && acc) True
                then
                    Just mn

                else
                    Nothing
            )
        |> Maybe.map String.fromList
