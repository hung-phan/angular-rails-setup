define [
  "angular-mocks"
  "greet/greet"
], ->
  describe "service name", ->
    GreetService = undefined
    beforeEach module("greetModule")
    beforeEach inject((_GreetService_) ->
      GreetService = _GreetService_
      return
    )
    it "should be equal dummy", ->
      expect(GreetService).toEqual "Hello world"
      return

    return

  return
