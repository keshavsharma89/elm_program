import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

main = Html.program{
    init =init
    , view = view
    , update = update
    , subscriptions = subscriptions
  }

init = (Model [1,2,3,4,5], Cmd.none)

subscriptions model =
  Sub.none

update model model1 = (model, Cmd.none)

type alias Model = {
    list : List Int
  }

view model = div[][
    h1[][ text "here we have a function to find the running total of all the elements of list"]
    , div[][
      p[][text "Here is the list:"]
      , text <| toString <| model.list
    ]
    , div[][
      p[][text "Total of list:"]
      , text <| toString <| getListTotal <| model.list
    ]
  ]

getListTotal: List Int -> Int
getListTotal list=
  let
    total= List.sum list
  in
    total
