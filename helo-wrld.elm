import Html.Styled exposing (Html, div, button, audio, text, p)
import Css exposing (..)
import Html.Styled.Attributes exposing (css)
import Html.Styled.Events exposing (onClick)
import Html.Styled.Attributes exposing (src, autoplay, controls, class)

main =
    Html.Styled.beginnerProgram
    { view = view
        , model = Model False "http://stream-tx4.radioparadise.com/mp3-192" 8
        , update = update
    }

type alias Model =
    { playing : Bool
        , src : String
        , banana : Int
    }


type Msg
    = Play
    | Pause
    | Banana

classicStyle = [backgroundColor (rgb 255 200 50)
              , padding (px 20)
              , textAlign center
              , fontSize (em 3)]

update : Msg -> Model -> Model

update msg model = case msg of
    Play -> { model | playing = True }

    Pause -> { model | playing = False }

    Banana -> { model | banana = model.banana + 1 }

view : Model -> Html Msg
view model = if model.playing
             then playingView model
             else notPlayingView model

notPlayingView : Model -> Html Msg
notPlayingView model =
    div [] [
        button [ css classicStyle
                 , onClick Play ] [ text "Play" ]
    ]

playingView : Model -> Html Msg
playingView model =
    div [class "RadioPlayer"]
        [ button [ css classicStyle, onClick Pause ] [ text "Pause" ]
    , audio [ src model.src, autoplay True, controls True ] []
    , p [class "Banana__counter"] [ text (toString model.banana) ]
    ,button [class "lolwat", onClick Banana] [text "Something else"]
    ]

