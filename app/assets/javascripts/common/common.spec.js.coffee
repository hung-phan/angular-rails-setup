define [
  "angular-mocks"
  "common/common"
], ->
  describe "controller title", ->
    $scope = undefined
    $location = undefined
    homeController = undefined
    beforeEach module("homeModule")
    beforeEach inject((_$injector_, _$rootScope_) ->
      $scope = _$rootScope_.$new()
      $location = _$injector_.get("$location")
      $controller = _$injector_.get("$controller")
      homeController = $controller("HomeController",
        $scope: $scope
        $location: $location
      )
      return
    )
    it "should be equal dummy", ->
      expect($scope.pageTitle).toEqual "dummy"
