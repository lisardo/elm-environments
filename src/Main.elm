module Main exposing (..)

import Environment
import Html exposing (text, div, input, Html)
import Html.Attributes exposing (value)
import Html.Events exposing (onInput)
import Html exposing (program)
import Task


main : Program Never Model Msg
main =
    program
        { view = view
        , init = init
        , update = update
        , subscriptions = subscriptions
        }


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


type alias Model =
    { text : String
    }


init : ( Model, Cmd Msg )
init =
    ( Model "", Cmd.none )


type Msg
    = ChangeText String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeText value ->
            ( { model | text = value }, Cmd.none )


view : Model -> Html Msg
view model =
    div []
        [ text Environment.env
        , input
            [ onInput ChangeText, value model.text ]
            []
        ]
