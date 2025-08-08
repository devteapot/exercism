module TwoFer exposing (twoFer)


twoFer : Maybe String -> String
twoFer name =
    let
        result = case name of
            Just n -> n
            _ -> "you"
    in
    String.join "" [ "One for ", result, ", one for me." ]
