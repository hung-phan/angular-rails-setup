define ["angular"], (angular) ->
  "use strict"
  angular.module("numberModule", []).filter "numberFilter", ->
    (input) ->
      input.toString().replace /\B(?=(\d{3})+(?!\d))/g, ","

  return
