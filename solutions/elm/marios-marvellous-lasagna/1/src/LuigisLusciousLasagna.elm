module LuigisLusciousLasagna exposing (remainingTimeInMinutes)

-- TODO: define the remainingTimeInMinutes function
remainingTimeInMinutes : Int -> Int -> Int
remainingTimeInMinutes layers minutes = 
    let
        expectedMinutesInOven = 40

        preparationTimeInMinutes : Int -> Int
        preparationTimeInMinutes l = l * 2
    in
        expectedMinutesInOven + preparationTimeInMinutes layers - minutes


        
    