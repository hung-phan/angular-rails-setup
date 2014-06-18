describe "controller title", ->

  # initialize
  $scope = undefined
  $location = undefined
  commonController = undefined

  beforeEach ->
    flag = false
    require [
      "angular-mocks"
      "common/common"
    ], ->
      flag = true
      return

    waitsFor ->
      flag

    return

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
    return

  return
