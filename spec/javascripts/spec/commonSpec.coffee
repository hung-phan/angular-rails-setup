define [
  "angular-mocks"
], ->
  console.log "hello"
  describe "controller title", ->
    $scope = undefined
    $location = undefined
    commonController = undefined
    beforeEach module("commonModule")
    beforeEach inject((_$injector_, _$rootScope_) ->
      $scope = _$rootScope_.$new()
      $location = _$injector_.get("$location")
      $controller = _$injector_.get("$controller")
      commonController = $controller("CommonController",
        $scope: $scope
        $location: $location
      )
      return
    )
    it "should be equal dummy", ->
      expect($scope.pageTitle).toEqual "dummy"
