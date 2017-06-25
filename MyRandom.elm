module MyRandom exposing (die, dice)

import List
import Die exposing (..)
import Random
import Maybe


die : ViewType -> Random.Generator Die
die type_ =
    Random.int 1 6
        |> Random.map toFace
        |> Random.map (Maybe.withDefault One)
        |> Random.map (\face -> { face = face, view = type_ })


dice : List ViewType -> Random.Generator (List Die) -> Random.Generator (List Die)
dice types_ results =
    case types_ of
        [] ->
            Random.map List.reverse results

        head :: tail ->
            let
                newResults =
                    Random.map2 (::) (die head) results
            in
                dice tail newResults
