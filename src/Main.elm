module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


type alias Place =
    { imageSrc : String
    , name : String
    , location : String
    , rating : Int
    , distance : Float
    , cost : Int
    , hours : String
    }


place : Place
place =
    { imageSrc = "https://s3-media3.fl.yelpcdn.com/bphoto/hqMyiQVBVwfcz8jPpkgN6A/ms.jpg"
    , name = "Charizard's Kitchen"
    , location = "123 Elm Street, Pallet Town"
    , rating = 4
    , distance = 1.5
    , cost = 2
    , hours = "5am to 8pm"
    }


places : List Place
places =
    List.map (always place) (List.range 0 19)


placeEntryView : Place -> Html msg
placeEntryView place =
    div [ class "list-group-item row" ]
        [ div [ class "col-xs-3" ]
            [ img [ class "img-round", src place.imageSrc ] [] ]
        , div [ class "col-xs-9" ]
            [ div [ class "col-xs-9" ]
                [ div [] [ text place.name ]
                , div [] [ text place.location ]
                , ratingView place.rating
                , div [] [ text place.hours ]
                ]
            , div [ class "col-xs-3" ]
                [ distanceView place.distance
                , costView place.cost
                ]
            ]
        ]


distanceView : Float -> Html msg
distanceView distance =
    div
        [ class "badge badge-primary" ]
        [ text (toString place.distance ++ " mi") ]


ratingView : Int -> Html msg
ratingView rating =
    div []
        (List.range 1 5
            |> List.map
                (\i ->
                    if i <= rating then
                        span [ class "glyphicon glyphicon-star" ] []
                    else
                        span [ class "glyphicon glyphicon-star-empty" ] []
                )
        )


costView : Int -> Html msg
costView cost =
    h5 []
        (List.range 1 cost
            |> List.map
                (\i -> span [] [ text "$" ])
        )


main =
    div [ class "list-group" ] (List.map placeEntryView places)
