module View.AddDie exposing (view)

import MyCss exposing (..)
import Model exposing (..)
import Html exposing (..)
import Html.CssHelpers
import Html.Events exposing (onClick)
import Svg exposing (..)
import Svg.Attributes exposing (..)


{ id, class, classList } =
    Html.CssHelpers.withNamespace "Dice"

view : Html Msg
view =
    div [ class [ AddClass ], onClick AddDie ]
        [ draw ]

draw : Html msg
draw =
    svg [ width "50", height "50", viewBox "0 0 50 50" ]
        drawPlus

drawPlus : List (Svg msg)
drawPlus =
    [ line1, line2 ]

line1 : Svg msg
line1 =
    line [ x1 "25", y1 "0", x2 "25", y2 "50" ] []


line2 : Svg msg
line2 =
    line [ x1 "0", y1 "25", x2 "50", y2 "25" ] []
