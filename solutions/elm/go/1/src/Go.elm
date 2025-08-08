module Go exposing (..)

import GoSupport exposing (..)


applyRules : Game -> Rule -> NonValidatingRule -> Rule -> Rule -> Game
applyRules game oneStonePerPointRule captureRule libertyRule koRule =
    let 
        rules = ( oneStonePerPointRule game, libertyRule game, koRule game )
        updatedGame = captureRule game
    in
    case rules of
        ( Ok _, Ok _, Ok _ ) -> 
            { updatedGame | player = if game.player == Black then White else Black }
        ( Err e, _, _ ) -> { game | error = e }
        ( _, Err e, _ ) -> { game | error = e }
        ( _, _, Err e ) -> { game | error = e }
