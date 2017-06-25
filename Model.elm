module Model exposing (..)

import Die exposing (..)
import Array


type alias Model =
    List Die


withIndex : Model -> List ( Int, Die )
withIndex model =
    model
        |> Array.fromList
        |> Array.toIndexedList


type Msg
    = Start
    | SleepAndRoll Int
    | Roll Int
    | Rolled Int Model
    | SetDie Int Die
    | AddDie
    | RemoveDie Int
