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

init = (Model [10,20,70,55,95,28], Cmd.none )

update model model1= (model, Cmd.none )

type alias Model =
  {
    list: List Int
  }

view model =
    div[][
      h1[][ text "Program to print largest element in a list."]
      , div[][
        p[][
          span[][text "List of all elements: "]
          , text <| toString <| model.list
        ]
        , p[][
          span[][text "Largest element in the list: "]
          , text <| toString <| findLagestElement <| model.list
        ]
      ]
    ]

findLagestElement: List Int -> Maybe Int
findLagestElement list =
  let
    newlist= list |> List.sort |> List.reverse
  in
    List.head newlist
