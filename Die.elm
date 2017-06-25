module Die exposing (..)

import String exposing (trim)


viewTypes : List ViewType
viewTypes =
    [ Number, Image, Svg ]


type ViewType
    = Number
    | Image
    | Svg


type alias Die =
    { face : Face
    , view : ViewType
    }


type Face
    = One
    | Two
    | Three
    | Four
    | Five
    | Six


toString : Face -> String
toString face =
    case face of
        One ->
            "1"

        Two ->
            "2"

        Three ->
            "3"

        Four ->
            "4"

        Five ->
            "5"

        Six ->
            "6"


toFace : Int -> Maybe Face
toFace value =
    if value == 1 then
        Just One
    else if value == 2 then
        Just Two
    else if value == 3 then
        Just Three
    else if value == 4 then
        Just Four
    else if value == 5 then
        Just Five
    else if value == 6 then
        Just Six
    else
        Nothing


toViewType : String -> Maybe ViewType
toViewType value =
    case trim value of
        "Number" ->
            Just Number

        "Image" ->
            Just Image

        "SVG" ->
            Just Svg

        _ ->
            Nothing


fromViewType : ViewType -> String
fromViewType value =
    case value of
        Number ->
            "Number"

        Image ->
            "Image"

        Svg ->
            "SVG"
