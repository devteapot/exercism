module TisburyTreasureHunt exposing (..)

-- Consider defining a type alias for TreasureLocation,
-- Treasure, PlaceLocation and Place,
-- and using them in the function type annotations

type alias TreasureLocation = ( Int, Char )
type alias PlaceLocation = ( Char, Int )

placeLocationToTreasureLocation : PlaceLocation -> TreasureLocation
placeLocationToTreasureLocation (place, location) =
    (location, place)

treasureLocationMatchesPlaceLocation : PlaceLocation -> TreasureLocation -> Bool
treasureLocationMatchesPlaceLocation placeLocation treasureLocation =
    treasureLocation == placeLocationToTreasureLocation placeLocation

countPlaceTreasures : ( String, PlaceLocation ) -> List ( String, TreasureLocation ) -> Int
countPlaceTreasures (placeName, placeLocation) treasures =
        List.length (List.filter (\(name, position) -> treasureLocationMatchesPlaceLocation placeLocation position) treasures)

specialCaseSwapPossible : ( String, TreasureLocation ) -> ( String, PlaceLocation ) -> ( String, TreasureLocation ) -> Bool
specialCaseSwapPossible ( foundTreasure, _ ) ( place, _ ) ( desiredTreasure, _ ) =
    case ( foundTreasure, place, desiredTreasure ) of
        ( "Brass Spyglass", "Abandoned Lighthouse", _ ) -> True
        ( "Amethyst Octopus", "Stormy Breakwater", t ) ->
            t == "Crystal Crab" || t == "Glass Starfish"
        ( "Vintage Pirate Hat",  "Harbor Managers Office", t ) ->
            t == "Model Ship in Large Bottle" || t == "Antique Glass Fishnet Float"
        ( _, _, _) -> False
