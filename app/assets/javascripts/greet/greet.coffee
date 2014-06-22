define ["angular"], (angular) ->
  "use strict"
  angular.module("greetModule", []).factory "GreetService", [->
    "Hello world"
  ]
  return
