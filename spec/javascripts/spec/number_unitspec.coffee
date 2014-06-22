define [
  "angular-mocks"
  "number/number"
], ->
  describe "filter 100000", ->
    numberFilter = undefined
    beforeEach module("numberModule")
    beforeEach inject((_$filter_) ->
      numberFilter = _$filter_("numberFilter")
      return
    )
    it "should be equal 100,000", ->
      expect(numberFilter(100000)).toEqual "100,000"
      return

    return

  return
