{stub, dump, mock, must, assert, spy} = require 'unit.js'
expect = must

describe "Node module as a singleton", ->
  testObject = require '../module'

  describe "private properties/methods", ->
    it 'cannot be accessed from outside', ->
      expect testObject._privateProperty
      .not.exist()
      expect testObject._privateMethod
      .not.exist()

  describe "public properties/methods", ->
    it 'can be accessed from outside', ->
      testObject.publicProperty.must.be 2
      testObject.publicMethod(5)
      testObject.publicProperty.must.be 5

    it 'can access private properties', ->
      testObject.setPrivateProperty(5)
      testObject.getPrivateProperty().must.be 5

    it 'can access private methods', ->
      callback = spy()
      testObject.callPrivateMethod(callback)
      assert callback.called