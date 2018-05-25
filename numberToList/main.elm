import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

main = Html.program{
    init = init
    , view =view
    , update = update
    , subscriptions = subscriptions
  }

subscriptions model =
  Sub.none

init = (Model 4528, Cmd.none )

update model model1= (model, Cmd.none )

type alias Model =
  {
    number: Int
  }

view model =
    div[][
      h1[][ text "Program to convert number to list elements."]
      , div[][
        p[][
          span[][text "Provided number was: "]
          , text <| toString <| model.number
        ]
        , p[][
          span[][text "Largest element in the list: "]
          , text <| toString <| convertNumberToList <| model.number
        ]
      ]
    ]

convertNumberToList: Int -> List Char
convertNumberToList num =
  let
    newlist= num |> toString |> String.toList
  in
    newlist
