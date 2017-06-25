module View.Svg exposing (view)

import MyCss exposing (..)
import Html exposing (..)
import Html.CssHelpers
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Die exposing (..)
import View.RemoveDie exposing (view)
import View.SetDie exposing (view)
import Model exposing (Msg)


{ id, class, classList } =
    Html.CssHelpers.withNamespace "Dice"


view : Int -> Die -> Html Msg
view index die =
    div [ class [ DieClass ] ]
        [ div [ class [ Value, SvgContainer ] ] [ draw die.face ]
        , View.RemoveDie.view index
        , View.SetDie.view index die
        ]


draw : Face -> Html msg
draw face =
    svg
        [ width "300", height "300", viewBox "0 0 500 500" ]
        (drawRectangle :: drawCircles face)


drawRectangle : Svg msg
drawRectangle =
    rect
        [ x "10"
        , y "10"
        , width "200"
        , height "300"
        , rx "50"
        , cy "50"
        , stroke "green"
        , strokeWidth "4"
        , fill "yellow"
        ]
        []


drawCircles : Face -> List (Svg msg)
drawCircles face =
    case face of
        One ->
            [ circle [ cx "110", cy "150", r "30", fill "green" ] []
            ]

        Two ->
            [ circle [ cx "60", cy "60", r "30", fill "green" ] []
            , circle [ cx "160", cy "260", r "30", fill "green" ] []
            ]

        Three ->
            [ circle [ cx "60", cy "60", r "30", fill "green" ] []
            , circle [ cx "110", cy "160", r "30", fill "green" ] []
            , circle [ cx "160", cy "260", r "30", fill "green" ] []
            ]

        Four ->
            [ circle [ cx "60", cy "60", r "30", fill "green" ] []
            , circle [ cx "160", cy "60", r "30", fill "green" ] []
            , circle [ cx "60", cy "260", r "30", fill "green" ] []
            , circle [ cx "160", cy "260", r "30", fill "green" ] []
            ]

        Five ->
            [ circle [ cx "60", cy "60", r "30", fill "green" ] []
            , circle [ cx "160", cy "60", r "30", fill "green" ] []
            , circle [ cx "110", cy "160", r "30", fill "green" ] []
            , circle [ cx "60", cy "260", r "30", fill "green" ] []
            , circle [ cx "160", cy "260", r "30", fill "green" ] []
            ]

        Six ->
            [ circle [ cx "60", cy "60", r "30", fill "green" ] []
            , circle [ cx "160", cy "60", r "30", fill "green" ] []
            , circle [ cx "60", cy "160", r "30", fill "green" ] []
            , circle [ cx "160", cy "160", r "30", fill "green" ] []
            , circle [ cx "60", cy "260", r "30", fill "green" ] []
            , circle [ cx "160", cy "260", r "30", fill "green" ] []
            ]
