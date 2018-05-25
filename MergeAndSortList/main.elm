import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

main =
  Html.program {
    init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
  }

subscriptions model =
  Sub.none

type alias Model=
  {
    firstList: List Int
    , secondList: List Int
    , finallList: List Int
  }

init = (Model [1,4,6] [2,3,5] [], Cmd.none)

view model = div[][
    h1[][text "Write a function that merges two sorted lists into a new sorted list"]
    , div[][
      p[][
        span[][text "Here is the firstList: "]
        ,   text <| toString <| model.firstList
      ]
      , p[][
        span[][text "Here is the secondList: "]
        , text <| toString <| model.secondList
      ]
      , p[][
        span[][text "Click button to see the result: "]
        , button[onClick GetFinalList ][text "Genrate list"]
      ]
      , p[][
        span[][text "Here is the Result list: "]
        , text <| toString <| model.finallList
      ]
    ]
  ]

type Msg= GetFinalList
update: Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    GetFinalList ->
      createList model

createList: Model -> (Model, Cmd Msg)
createList model=
  let
    list3 = List.append model.firstList model.secondList |> List.sort
  in
    ({model | finallList=list3}, Cmd.none)
