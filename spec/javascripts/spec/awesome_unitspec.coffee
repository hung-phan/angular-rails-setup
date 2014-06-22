define [
  "angular-mocks"
  "awesome/awesome"
], ->
  describe "directive with templateUrl", ->
    # initialize
    element = undefined
    $scope = undefined

    beforeEach ->
      module("awesomeModule")
      module("awesome/awesome.tpl.html")
      inject(($compile, _$rootScope_) ->
        $scope = _$rootScope_
        element = angular.element("<awesome></awesome>")
        element = $compile(element)($scope)
        return
      )
      return
    it "template should be loaded", ->
      $scope.$digest()
      expect(element.html()).toBe "This is directive for dummy"
      return

    return

  return
