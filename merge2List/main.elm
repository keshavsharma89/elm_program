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

-- subscriptions
--subscriptions: Model-> Sub Msg
subscriptions model =
  Sub.none

type alias Model=
  {
    firstList: List String
    , secondList: List String
    , finallList: List String
  }

init = (Model ["1", "2", "3"] ["a", "b", "c"] [], Cmd.none)

view model =
    div[][
      h1[][text "We will have nested list and return a single flattened list with all values except nil/null"]
      , div[][
        div[][
          p[][
            span[][text "Here is the First list: "]
            , text <| toString <| model.firstList
          ]
          , p[][
            span[][text "Here is the Second list: "]
            , text <| toString <| model.secondList
          ]
          , p[][
            span[][text "Click the button to see the output: "]
            , button[onClick CreateList][text "Genrate List"]
          ]
          , p[][
            span[][text "Here is the Final list: "]
            , text <| toString <| model.finallList
          ]
        ]
      ]
    ]

type Msg= CreateList
update msg model=
  case msg of
    CreateList ->
      fnctFinalList model


fnctFinalList: Model -> (Model, Cmd msg)
fnctFinalList model=
  let
    finallist = createlist model.firstList model.secondList []
  in
  ({model | finallList=finallist}, Cmd.none)

createlist: List String -> List String -> List String -> List String
createlist list1 list2 list3=
    if List.length list1 > 0 then
      let
        element1 = Maybe.withDefault "" (List.head list1)
        element2 = List.head list2 |> Maybe.withDefault ""
        templist=[element1, element2]
        list4 = List.append list3 templist
      in
        createlist (List.drop 1 list1) (List.drop 1 list2) list4
    else
      list3
