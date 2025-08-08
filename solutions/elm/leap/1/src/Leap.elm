module Leap exposing (isLeapYear)


isLeapYear : Int -> Bool
isLeapYear year =
    case (remainderBy 4 year == 0, remainderBy 100 year == 0, remainderBy 400 year == 0) of
        (True, True, True) -> True
        (True, True, False) -> False
        (True, _, _) -> True
        _ -> False
