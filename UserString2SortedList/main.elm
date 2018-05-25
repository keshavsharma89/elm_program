import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

main = Html.program{
    init =init
    , view = view
    , update = update
    , subscriptions = subscriptions
  }

type alias Model= {
    userString : String
    , sortedString : String
  }

init = (Model "" "", Cmd.none)

subscriptions model =
  Sub.none

type Msg = GetElments String | GetSortedList
update: Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    GetElments stng ->
      ({model | userString=stng }, Cmd.none)
    GetSortedList ->
      let
        newsstring = getsortedstring model.userString
      in
      ({model | sortedString=newsstring}, Cmd.none)

getsortedstring: String -> String
getsortedstring usestring =
  let
    list = (String.split ","  usestring )  |> List.sort
  in
    toString list

view model =div[][
    h1[][
      text "Get a comma separated numbers and we'll print the Sorted List of the same."
    ]
    , div[][
      p[][
        span[][text "Please enter comma separated numbers: "]
        , input[value model.userString, onInput GetElments ][]
      ]
      , p[][
        span[][text "Click on button to genrate sorted list: "]
        , button[value "Genrate", onClick GetSortedList][text "Genrate"]
      ]
      , p[][
        span[][text "Result list: "]
        , text model.sortedString
      ]
    ]
  ]
