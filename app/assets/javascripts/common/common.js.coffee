define [
  "angular"
  "angular-ui-router"
], (angular) ->

  #config path for common page
  angular.module("commonModule", ["ui.router"]).config([
    "$stateProvider"
    ($stateProvider) ->
      $stateProvider.state "home",
        url: "/"
        templateUrl: "/assets/common/common.html"
        controller: "CommonController"

  ]).controller "CommonController", [
    "$scope"
    "$location"
    ($scope, $location) ->

      # initialize
      $scope.pageTitle = "dummy"
  ]
