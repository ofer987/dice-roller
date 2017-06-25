module View.Image exposing (view)

import MyCss exposing (..)
import Die exposing (..)
import Html exposing (..)
import Html.CssHelpers
import Html.Attributes exposing (..)
import View.RemoveDie exposing (view)
import View.SetDie exposing (view)
import Model exposing (Msg)


{ id, class, classList } =
    Html.CssHelpers.withNamespace "Dice"


view : Int -> Die -> Html Msg
view index die =
    div [ class [ DieClass ] ]
        [ img [ class [ Value ], src (String.concat [ "die_", Die.toString die.face, ".png" ]) ] []
        , View.RemoveDie.view index
        , View.SetDie.view index die
        ]
