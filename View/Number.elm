module View.Number exposing (view)

import MyCss exposing (..)
import Html exposing (..)
import Html.CssHelpers
import Die exposing (..)
import View.RemoveDie exposing (view)
import View.SetDie exposing (view)
import Model exposing (Msg)


{ id, class, classList } =
    Html.CssHelpers.withNamespace "Dice"


view : Int -> Die -> Html Msg
view index die =
    div [ class [ DieClass ] ]
        [ h2 [ class [ Value, NumberClass ] ] [ text (Die.toString die.face) ]
        , View.RemoveDie.view index
        , View.SetDie.view index die
        ]
