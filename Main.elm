module Main exposing (..)

import Random exposing (generate, int)
import MyRandom exposing (die, dice)
import Task
import Model exposing (..)
import Array
import Process
import Time exposing (millisecond)
import Die exposing (..)
import View exposing (view)
import Html
import Tuple exposing (first, second)


-- INIT


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }


init : ( Model, Cmd Msg )
init =
    ( [], Cmd.none )



--- UPDATE


rollCount : Int
rollCount =
    5


delay : Time.Time
delay =
    500 * millisecond


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Start ->
            let
                cmd =
                    Task.succeed rollCount
                        |> Task.perform SleepAndRoll
            in
                ( model, cmd )

        -- sleep and then roll the dice
        SleepAndRoll remainingRolls ->
            if remainingRolls > 0 then
                let
                    remaining =
                        remainingRolls - 1

                    cmd =
                        Process.sleep delay
                            |> Task.andThen (always (Task.succeed remaining))
                            |> Task.perform Roll
                in
                    ( model, cmd )
            else
                -- stop rolling the dice
                ( model, Cmd.none )

        -- Roll the dice
        Roll remainingRolls ->
            let
                views =
                    List.map .view model

                cmd =
                    case views of
                        [] ->
                            Task.succeed []
                                |> Task.perform (Rolled remainingRolls)

                        head :: tail ->
                            MyRandom.die head
                                |> Random.list 1
                                |> MyRandom.dice tail
                                |> Random.generate (Rolled remainingRolls)
            in
                ( model, cmd )

        -- Convert the face integer values to Model and
        -- then sleep and roll again
        Rolled remainingRolls dice ->
            let
                cmd =
                    Task.succeed remainingRolls
                        |> Task.perform SleepAndRoll
            in
                ( dice, cmd )

        AddDie ->
            ( (Die One Svg) :: model, Cmd.none )

        RemoveDie index ->
            let
                newModel =
                    withIndex model
                        |> List.filter (\item -> first item /= index)
                        |> List.map second
            in
                ( newModel, Cmd.none )

        SetDie index newDie ->
            let
                newModel =
                    model
                        |> Array.fromList
                        |> Array.set index newDie
                        |> Array.toList

            in
                ( newModel, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
