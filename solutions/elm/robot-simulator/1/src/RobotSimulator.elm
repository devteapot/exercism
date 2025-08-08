module RobotSimulator exposing
    ( Bearing(..)
    , Robot
    , advance
    , defaultRobot
    , simulate
    , turnLeft
    , turnRight
    )


type Bearing
    = North
    | East
    | South
    | West


type alias Robot =
    { bearing : Bearing
    , coordinates : { x : Int, y : Int }
    }


defaultRobot : Robot
defaultRobot =
    { bearing = North
    , coordinates = { x = 0, y = 0 }
    }


turnRight : Robot -> Robot
turnRight robot =
    let
        bearing = case robot.bearing of
            North -> East
            East -> South
            South -> West
            West -> North
    in
    { robot | bearing = bearing } 


turnLeft : Robot -> Robot
turnLeft robot =
    let
        bearing = case robot.bearing of
            North -> West
            East -> North
            South -> East
            West -> South
    in
    { robot | bearing = bearing } 


advance : Robot -> Robot
advance ({ bearing, coordinates } as robot) =
    let
        x = coordinates.x
        y = coordinates.y
    in
    case bearing of
        North -> { robot | coordinates = { coordinates | y = y + 1 } }
        East -> { robot | coordinates = { coordinates | x = x + 1 } }
        South -> { robot | coordinates = { coordinates | y = y - 1 } }
        West -> { robot | coordinates = { coordinates | x = x - 1 } }


simulate : String -> Robot -> Robot
simulate directions robot =
    directions
        |> String.toList
        |> List.foldl
            (\curr acc -> case curr of 
                'A' -> advance acc
                'L' -> turnLeft acc
                'R' -> turnRight acc
                _ -> acc) 
            robot
