module SumOfMultiples exposing (sumOfMultiples)

import Set

sumOfMultiples : List Int -> Int -> Int
sumOfMultiples divisors limit =
    List.sum 
        (Set.toList 
            (List.foldl
                (\acc curr -> Set.union acc curr)
                (Set.fromList [])
                (List.map 
                    (\d -> Set.fromList 
                            (List.filter 
                                (\r -> modBy d r == 0)
                                (List.range d (limit-1))))
                    divisors)))
