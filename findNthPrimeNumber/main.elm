import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing(..)

main =
  Html.program {
    init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
  }

-- subscriptions
subscriptions: Model-> Sub Msg
subscriptions model =
  Sub.none

--init = (Model 0 "0", Cmd.none)
init = (Model 0 0, Cmd.none)

type alias Model= {
  nPlace: Int
  --, primeAtN: String
  , primeAtN: Int
}

view model=
  div[][
      h1[][text "Given a number n, determine what the nth prime is."]
      , div[][
          p[][
            span[][ text "Please enter the nth place"]
            , input[onInput ChangeNthPlace, value <| toString <| model.nPlace][]
            , button[onClick FindPrime ][text "Get Prime number at N"]
          ]
          , p[][
            span[][text "Result: "]
            , text <| toString <| model.primeAtN
          ]
      ]
  ]

--getLiList: String -> Html
getLiList year=li[][ text(toString(year)) ]

type Msg = ChangeNthPlace String | FindPrime
update : Msg -> Model -> (Model, Cmd Msg )
update msg model =
  case msg of
    FindPrime ->
      fncFindPrime model

    ChangeNthPlace newN ->
      ({model| nPlace= Result.withDefault 0 (String.toInt newN)  }, Cmd.none )

fncFindPrime: Model -> (Model, Cmd Msg)
fncFindPrime model=
  let
    primeNum = getPrime model.nPlace
  in
    ({model| primeAtN=primeNum }, Cmd.none)

--getPrime: Int -> String
getPrime: Int -> Int
getPrime n =
  let
    num = (getleapyeat n 1 []) |> List.head
    --num = (getleapyeat n 1 []) |> List.reverse |> toString
  in
     Maybe.withDefault 5 (num)
     --num

getleapyeat: Int -> Int -> List Int -> List Int
getleapyeat n currnum listofprime =
  let
    newlist = getUpdatedList currnum listofprime
  in
    if List.length newlist < n then
      getleapyeat n (currnum+1) newlist
    else
      newlist

getUpdatedList: Int -> List Int -> List Int
getUpdatedList num listofprime =
  if isprime num then
    num::listofprime
  else
    listofprime

isprime: Int -> Bool
isprime num =
    if num < 2 then
      False
    else
      primeloop num 2 True

primeloop: Int -> Int -> Bool -> Bool
primeloop num i result=
  if i < num then
    if num % i == 0 then
      primeloop num (i+1) False
    else
      primeloop num (i+1) result
  else
    result
