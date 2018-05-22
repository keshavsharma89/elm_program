import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import Json.Decode as Decode

main =
  Html.program
    { init=init
      ,view=view
      ,update=update
      ,subscriptions=subscriptions
    }

type alias Model=
  {
    imgurl: String
  }

--init
init: ( Model, Cmd Msg )
init =
  (Model "Test.jpg", getNewImage)


--view
view: Model -> Html Msg
view model=
  div[][
    h1[][text "Json test"]
    , div[][
      p[][
        span[][text "Image: "]
        , img[ src model.imgurl][]
        , button [onClick Loadmore][text "Loadmore"]
      ]
    ]
  ]


type Msg
  = Loadmore
  | NewImage (Result Http.Error String)
update:  Msg -> Model -> ( Model, Cmd Msg )
update  msg model
  = case msg of
    NewImage (Ok newurl)->
      ( {model| imgurl=newurl}, Cmd.none )
    NewImage (Err _)->
        ( model, getNewImage )
    Loadmore ->
      ( model, getNewImage )


getNewImage =
  let
    url="https://dog.ceo/api/breeds/image/random"
  in
    Http.send NewImage (Http.get url decodeUrl)

decodeUrl: Decode.Decoder String
decodeUrl=
  Decode.at["message"] Decode.string

--subscriptions
subscriptions: Model -> Sub Msg
subscriptions model=
  Sub.none
