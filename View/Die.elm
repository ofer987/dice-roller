module View.Die exposing (view)

import Die exposing (..)
import Html exposing (Html)
import View.Number
import View.Image
import View.Svg
import Model exposing (Msg)


view : Int -> Die -> Html Msg
view index die =
    case die.view of
        Number ->
            View.Number.view index die

        Image ->
            View.Image.view index die

        Svg ->
            View.Svg.view index die
