module Raindrops exposing (raindrops)


raindrops : Int -> String
raindrops number =
    case [ ( modBy 3 number == 0, "Pling" )
         , ( modBy 5 number == 0, "Plang" )
         , ( modBy 7 number == 0, "Plong" ) ]
            |> List.filter Tuple.first
            |> List.map Tuple.second of
        [] -> String.fromInt number
        list -> List.foldr (++) "" list
