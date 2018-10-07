import Css exposing (..)
import Html.Styled exposing (h1, text)
import Html.Styled.Attributes exposing (css)

main =
    Html.Styled.toUnstyled title


title =
    h1
        [ css
              [ backgroundColor (rgb 255 200 50)
              , padding (px 20)
              , textAlign center
              , fontSize (em 3)
              ]
        ]
        [ text "Hello World" ]
