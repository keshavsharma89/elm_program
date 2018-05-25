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
    , kElement: Int
    , finallList: List Int
  }

init = (Model [1,2,3,4,5,6] 0 [], Cmd.none)

view model = div[][
    h1[][text "Write a function that rotates a list by k elements"]
    , div[][
      p[][
        span[][text "Here is the firstList: "]
        ,   text <| toString <| model.firstList
      ]
      , p[][
        span[][text "Please enter K element: "]
        , input[value <| toString <| model.kElement, onInput ChangeK][]
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

type Msg= GetFinalList | ChangeK String
update: Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    GetFinalList ->
      createList model
    ChangeK k ->
      ({model | kElement= Result.withDefault 0 (String.toInt k) }, Cmd.none)


createList: Model -> (Model, Cmd Msg)
createList model=
  let
    list1 = List.take model.kElement model.firstList
    list2 = List.drop model.kElement model.firstList
    list3 = List.append list2 list1
  in
    ({model | finallList=list3}, Cmd.none)
