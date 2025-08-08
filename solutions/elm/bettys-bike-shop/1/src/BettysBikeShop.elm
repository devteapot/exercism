module BettysBikeShop exposing (penceToPounds, poundsToString)

-- TODO: import the String module
import String

-- TODO: define the type annotations for the functions
-- TODO: define body of functions
 
penceToPounds : Int -> Float
penceToPounds pence =
    (toFloat pence) / 100

poundsToString : Float -> String
poundsToString pounds =
    String.append "£" (Debug.toString  pounds)
