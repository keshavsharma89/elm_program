# Some small program created in ELM

# Installation process
To Install and run any other the project follow the commands:
1. elm-package install
2. elm-package install elm-lang/http
3. elm-package install NoRedInk/elm-decode-pipeline (If API involve in program)
4. Create and keep the files in the src folder


# List of functions
  1. CatGIF:
      In this function we will hit a static API which is https://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&tag=cats this in this case. We will have a button to click to get the new Gif image from the same API and render it to the page.
  2. AnOtherAPI:
      In this function we have done something similar in the first function, But with a different API which is this one https://dog.ceo/api/breeds/image/random
  3. GetJsonDataWithInput:
      This is something similar but here we will go to the next stage. We will be fetching Id, Title, Details and UserId fetching from API which is this one https://jsonplaceholder.typicode.com/posts/ And the one more thing we will have a input field where one enter the Id and click button to fetch info from the API.
  4. IncrementDecrementButton:
      This program will just have 2 button one for increment and one for decrement and a div that will show the number which we will increase or decrease on the button click.  
  5. IsElementInList:
      This function will have a static list and a user enter element value, which we will find in the list and return true or false, If we found it in the list or not.
  6. IsElementInList:
      Write a function that checks whether an element occurs in a list.
  7. Merge&SortList:
      Write a function that merges two sorted lists into a new sorted list. [1,4,6],[2,3,5] → [1,2,3,4,5,6]. You can do this quicker than concatenating them followed by a sort.
  8. Print20LeapYear:
      Write a program that prints the next 20 leap years.
  9. RunningTotal:
      Write a function that computes the running total of a list.
  10. UserString2SortedList:
      Take a comma separated string of numbers in a text box. On click of a button SORT , Make a list of numbers , Sort it , and print the Sorted List.
  11. fibonacci:
      Write a function that computes the list of the first 100 Fibonacci numbers.
  12. findNthPrimeNumber:
      Given a number n, determine what the nth prime is. By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13. If your language provides methods in the standard library to deal with prime numbers, pretend they don't exist and implement them yourself.
  13. largestInList:
      Write a function that returns the largest element in a list.
  14. merge2List:
      Write a function that merges two sorted lists into a new sorted list. [1,4,6],[2,3,5] → [1,2,3,4,5,6]. You can do this quicker than concatenating them followed by a sort.
  15. numberToList:
      Write a function that takes a number and returns a list of its digits.
  16. rotateList:
      Write a function that rotates a list by k elements. For example [1,2,3,4,5,6] rotated by two becomes [3,4,5,6,1,2]. Try solving this without creating a copy of the list. How many swap or move operations do you need?
