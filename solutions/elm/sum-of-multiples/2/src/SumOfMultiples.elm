module SumOfMultiples exposing (sumOfMultiples)

import Set

sumOfMultiples : List Int -> Int -> Int
sumOfMultiples divisors limit =
    List.range 1 (limit - 1)
        |> List.filter (\n -> List.any (\d -> modBy d n == 0) divisors)
        |> List.sum
