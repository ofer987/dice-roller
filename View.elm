module View exposing (view)

import MyCss exposing (..)
import Model exposing (..)
import Html exposing (..)
import Html.CssHelpers
import Html.Events exposing (onClick)
import View.Die exposing (view)
import View.AddDie exposing (view)
import List
import Tuple exposing (first, second)
import Model exposing (Msg)


{ id, class, classList } =
    Html.CssHelpers.withNamespace "Dice"


roll : Html Msg
roll =
    div [ class [ RollDice ], onClick Start ]
        [ h2 [ class [ NumberClass] ] [ text "Roll" ] ]


dice : Model -> List (Html Msg)
dice model =
    withIndex model
        |> List.map (\item -> View.Die.view (first item) (second item))


view : Model -> Html Msg
view model =
    div
        []
        [ div [] [ roll ]
        , div [] (View.AddDie.view :: dice model)
        ]
