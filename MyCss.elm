module MyCss exposing (..)

import Css exposing (..)
import Css.Elements exposing (body, div, h2, svg, img, line)
import Css.Colors exposing (gray)
import Css.Namespace exposing (namespace)

grey : Color
grey = gray

type CssClasses
    = DieClass
    | NumberClass
    | SvgClass
    | SvgContainer
    | Selection
    | Value
    | RemoveClass
    | AddClass
    | RollDice


css : Stylesheet
css =
    (stylesheet << namespace "Dice")
        [ body []
        , h2 [ margin (px 0)]
        , class DieClass
            [ float left
            , width (px 300)
            , height (px 300)
            , margin (px 10)
            , hover
                [ children
                    [ class Value
                        [ display none ]
                    , class RemoveClass
                        [ display block ]
                    , class Selection
                        [ display block ]
                    ]
                ]
            , children
                [ class Value
                    [ display block ]
                , class RemoveClass
                    [ display none ]
                , class Selection
                    [ display none ]
                , img
                    [ margin (px 50) ]
                , class SvgContainer
                    [ margin (px 50) ]
                ]
            ]
        , class NumberClass
            [ lineHeight (px 300)
            , textAlign center
            ]
        , class SvgClass
            [ paddingTop (px 90)
            , paddingLeft (px 110)
            , height (px 210)
            , children
                [ svg
                    [ marginLeft auto
                    , marginRight auto
                    ]
                ]
            ]
        , class RemoveClass
            [ float right
            , children
                [ svg
                    [ children
                        [ line
                            [ property "stroke" "black"
                            , property "stroke-width" "2"
                            ]
                        ]
                    ]
                ]
            ]
        , class AddClass
            [ float left
            , width (px 300)
            , height (px 300)
            , margin (px 10)
            , children
                [ svg
                    [ margin (px 125)
                    , children
                        [ line
                            [ property "stroke" "black"
                            , property "stroke-width" "2"
                            ]
                        ]
                    ]
                ]
            ]
        , class Selection
            [ property "clear" "both"
            , height (px 225)
            , paddingTop (px 75)
            , children
                [ div
                    [ height auto
                    , lineHeight (px 0)
                    , margin2 (px 0) (px 100)
                    ]
                ]
            ]
        , class RollDice
            [ height (px 300)
            , margin auto
            , backgroundColor grey
            ]
        ]
