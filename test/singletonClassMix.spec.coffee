{stub, dump, mock, must, assert, spy} = require 'unit.js'
expect = must

describe "Node module as both class and singleton", ->
  describe 'as normal class', ->
    testObject = null
    Class = require '../src/singletonClassMix'
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

  describe 'as singleton', ->
    singleton = require '../src/singletonClassMix'

    describe "private properties/methods", ->
      it 'cannot be accessed from outside', ->
        expect singleton._privateSingletonProperty
        .not.exist()
        expect singleton._privateSingletonMethod
        .not.exist()

    describe "public properties/methods", ->
      it 'can be accessed from outside', ->
        singleton.publicSingletonProperty.must.be 0
        singleton.publicSingletonMethod(5)
        singleton.publicSingletonProperty.must.be 5

      it 'can access private properties', ->
        singleton.setPrivateSingletonProperty(5)
        singleton.getPrivateSingletonProperty().must.be 5

      it 'can access private methods', ->
        callback = spy()
        singleton.callPrivateSingletonMethod(callback)
        assert callback.called

  describe 'relationship between members of singleton and normal class ', ->
    singleton = Class = require '../src/singletonClassMix'
    instanceObject = new Class 1, 2
    describe 'singleton', ->
      it 'cannot access instance private members', ->
        expect singleton.getPrivateProperty
        .not.exist()
      it 'cannot use instance public members', ->
        expect singleton.publicMethod
        .not.exist()
    describe 'class instance', ->
      it 'cannot access singleton private members', ->
        expect instanceObject.getPrivateSingletonProperty
        .not.exist()
      it 'cannot use singleton public members', ->
        expect instanceObject.publicSingletonMethod
        .not.exist()