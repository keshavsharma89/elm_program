# Some small program created in ELM

# Installation process
To Install and run any other the project follow the commands:
1. elm-package install
2. elm-package install elm-lang/http
3. elm-package install NoRedInk/elm-decode-pipeline (If API involve in program)


# List of functions
  1. CatGIF
      In this function we will hit a static API which is https://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&tag=cats this in this case. We will have a button to click to get the new Gif image from the same API and render it to the page.
  2. AnOtherAPI
    In this function we have done something similar in the first function, But with a different API which is this one https://dog.ceo/api/breeds/image/random
  3. GetJsonDataWithInput
    This is something similar but here we will go to the next stage. We will be fetching Id, Title, Details and UserId fetching from API which is this one https://jsonplaceholder.typicode.com/posts/ And the one more thing we will have a input field where one enter the Id and click button to fetch info from the API.
  4. IncrementDecrementButton
    This program will just have 2 button one for increment and one for decrement and a div that will show the number which we will increase or decrease on the button click.  
