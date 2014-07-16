{stub, dump, mock, must, assert, spy} = require 'unit.js'
expect = must

describe "Javasript class", ->
  testObject = null
  beforeEach ->
    Class = require '../pureJsClass'
    testObject = new Class 1, 2
  describe "private properties/methods",->
    it 'cannot be accessed from outside', ->
      expect testObject._privateProperty
        .be.falsy()
      expect testObject._privateMethod
        .be.falsy()

  describe "public properties/methods", ->
    it 'can be accessed from outside', ->
      testObject.publicProperty.must.be 2
      testObject.publicMethod(3)
      testObject.publicProperty.must.be 3

    it 'cannot access private properties', ->
      testObject.getPrivateProperty.must.throw()

    it 'cannot access private methods', ->
      testObject.callPrivateMethod.must.throw()

  describe "privileged method", ->
    it 'can access private properties', ->
      testObject.privilegedMethod_getPrivateProperty().must.be 1
      testObject.privilegedMethod_setPrivateProperty(3)
      testObject.privilegedMethod_getPrivateProperty().must.be 3

    it 'can access public properties', ->
      testObject.privilegedMethod_getPublicProperty().must.be 2
      testObject.privilegedMethod_setPublicProperty(3)
      testObject.privilegedMethod_getPublicProperty().must.be 3

    it 'can access private methods', ->
      callback = spy()
      testObject.privilegedMethod_callPrivateMethod(callback)
      assert callback.called

    it 'can access public method', ->
      callback = spy()
      testObject.privilegedMethod_callPublicMethod(callback)
      assert callback.called
