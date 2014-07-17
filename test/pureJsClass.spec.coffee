{stub, dump, mock, must, assert, spy} = require 'unit.js'
expect = must

describe "pure Javascript class", ->
  testObject = null
  Class = require '../src/pureJsClass'
  beforeEach ->
    testObject = new Class 1, 2
  describe "private properties/methods", ->
    it 'cannot be accessed from outside', ->
      expect testObject._privateProperty
      .not.exist()
      expect testObject._privateMethod
      .not.exist()

  describe "public properties/methods", ->
    it 'can be accessed from outside', ->
      testObject.publicProperty.must.be 2
      testObject.publicMethod(3)
      testObject.publicProperty.must.be 3

    it 'can access private properties', ->
      testObject.getPrivateProperty().must.be 1

    it 'can access private methods', ->
      callback = spy()
      testObject.callPrivateMethod(callback)
      assert callback.called

  describe 'static method', ->
    it 'can be access directly via class name', ->
      Class.staticMethod_countObjects().must.be.at.least 1
    it 'cannot be called from object instance', ->
      expect testObject.staticMethod_countObjects
      .not.exist()