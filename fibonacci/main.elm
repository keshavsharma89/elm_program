import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Task

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
    list: List Int
  }

init = (Model [], Task.perform identity (Task.succeed CreateFibo))

view model = div[][
    h1[][text "function to print Fibonacci series"]
    , div[][
      p[][
        span[][text "Here is the list of 100 elements: "]
        ,   text <| toString <| model.list
      ]
    ]
  ]

type Msg = CreateFibo
update msg model =
    case msg of
      CreateFibo ->
          createList model

createList: Model -> (Model, Cmd Msg)
createList model=
  let
    list = List.reverse <| fctfibonacci 0 1 [1, 0]
  in
    ({model | list=list}, Cmd.none)

fctfibonacci: Int -> Int -> List Int -> List Int
fctfibonacci a b list =
    let
      c = a + b
      list1 = c::list
    in
      if List.length list1 > 100 then
        list1
      else
        fctfibonacci b c list1
