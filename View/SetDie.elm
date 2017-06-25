module View.SetDie exposing (view)

import MyCss exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onCheck)
import Html.CssHelpers
import Die exposing (..)
import Model exposing (..)


{ id, class, classList } =
    Html.CssHelpers.withNamespace "Dice"


checkbox : Int -> Die -> ViewType -> Html Msg
checkbox index die viewType =
    let
        isSelected =
            viewType == die.view

        string =
            fromViewType viewType

        newDie =
            Die die.face viewType

        idValue = string ++ "-" ++ (Basics.toString index)
    in
        div
            []
            [ input
                [ id idValue, type_ "checkbox", value string, checked isSelected, onCheck (\_ -> SetDie index newDie) ]
                []
            , label [ for idValue ] [ text string ]
            ]


checkboxes : Int -> Die -> List (Html Msg)
checkboxes index die =
    List.map (checkbox index die) Die.viewTypes


view : Int -> Die -> Html Msg
view index die =
    div [ class [ Selection ] ] (checkboxes index die)
