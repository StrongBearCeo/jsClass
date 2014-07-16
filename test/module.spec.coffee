{stub, dump, mock, must, assert, spy} = require 'unit.js'
expect = must

describe "Node module as a singleton", ->
  testObject = require '../module'
  beforeEach ->
    return
  describe "private properties/methods",->
    it 'cannot be accessed from outside', ->
      expect testObject._privateProperty
      .be.falsy()
      expect testObject._privateMethod
      .be.falsy()
      # ensure the private members do not leak out to global scope
      expect typeof _privateProperty
      .be 'undefined'
      expect typeof _privateMethod
      .be 'undefined'

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