module Raindrops exposing (raindrops)


raindrops : Int -> String
raindrops number =
    case [ ( 3, "Pling" ), ( 5, "Plang" ), ( 7, "Plong" ) ]
        |> List.filter (\( d, _ ) -> modBy d number == 0)
        |> List.map Tuple.second 
    of
        [] -> String.fromInt number
        list -> List.foldr (++) "" list
