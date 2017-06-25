module View.RemoveDie exposing (view)

import MyCss exposing (..)
import Model exposing (..)
import Html exposing (..)
import Html.CssHelpers
import Html.Events exposing (onClick)
import Svg exposing (..)
import Svg.Attributes exposing (..)


{ id, class, classList } =
    Html.CssHelpers.withNamespace "Dice"


view : Int -> Html Msg
view index =
    div [ class [ RemoveClass ], onClick (RemoveDie index) ] [ draw ]


draw : Html msg
draw =
    svg
        [ width "50", height "50", viewBox "0 0 50 50" ]
        drawX


drawX : List (Svg msg)
drawX =
    [ line1, line2 ]


line1 : Svg msg
line1 =
    line [ x1 "0", y1 "0", x2 "50", y2 "50" ] []


line2 : Svg msg
line2 =
    line [ x1 "50", y1 "0", x2 "0", y2 "50" ] []
