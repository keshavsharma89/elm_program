import Html exposing (..)
import Html.Events exposing (onClick)

model = 0

view model =
  div[][
    div[][
      h1[][
        text "Add and Subtract"
      ]
    ]
    , div[][text (toString model)]
    , div[][
      button[ onClick Inc ][text " + "]
    ]
    , div[][
      button[ onClick Dec ][text " - "]
    ]
  ]

type Message = Inc | Dec

update msg model =
  if msg==Inc then
    model + 1
  else
    model - 1



main =
  beginnerProgram
  {
    model= model
    , view= view
    , update= update
  }
