import Html exposing (..)
import Html.Events exposing(..)
import Html.Attributes exposing(..)
import Task
import Http

main =
  Html.program{
    init = init
    , view = view
    , update = update
    , subscriptions  = subscriptions
  }

subscriptions: Model -> Sub Msg
subscriptions model =
  Sub.none

type alias Model= {
  listOfEle: List Int
  , elementToFind: Int
  , result: Bool
}

init: (Model, Cmd Msg)
init= (Model [1, 2, 6, 7, 8, 15] 0 True, Cmd.none)


type Msg = CheckElement | ChangeElement String
update : Msg -> Model -> (Model, Cmd Msg )
update msg model =
  case msg of
    CheckElement ->
      findelement model

    ChangeElement newEle ->
      ({model| elementToFind= Result.withDefault 0 (String.toInt newEle)  }, Cmd.none )


findelement: Model -> (Model, Cmd Msg )
findelement model=
  let
    resultfind =( List.member model.elementToFind model.listOfEle )
  in
    ({model| result=resultfind}, Cmd.none )


view : Model -> Html Msg
view model = div[][
    h1[][text "Program to find element exist in List or not"]
    , div[][
      text "List: "
      , text (toString(model.listOfEle))
    ]
    , div[][
      text "Result: "
      , text (toString(model.result))
    ]
    , div[][
      input[placeholder "Please enter the number", model.elementToFind |> toString |> value, onInput ChangeElement ][]
      , button[onClick CheckElement][ text "Find" ]
    ]
  ]
