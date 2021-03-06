module Leaderboard exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)


-- Model


type alias Model =
    { runners : List Runner
    , query : String
    }


type alias Runner =
    { id : Int
    , name : String
    , location : String
    }


initModel : Model
initModel =
    { runners = []
    , query = ""
    }



-- update


update : Msg -> Model -> Model
update msg model =
    case msg of
        QueryInput query ->
            { model | query = query }



-- view


view : Model -> Html Msg
view model =
    div []
        [ h3 [] [ "Leaderboard page... So far" ]
        , input
            [ type_ "text"
            , onInput QueryInput
            , value model.query
            , placeholder "Search for a runner..."
            ]
            []
        , hr [] []
        , h4 [] [ text "Leaderboard Model:" ]
        , p [] [ text <| toString model ]
        ]
