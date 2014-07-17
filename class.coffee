# static private property
_privateStaticCount = 0

class Class

  # private members
  # note: '=' is used to define private members
  # naming convention for private members is _camelCase
  _privateMethod = (param) ->
    if typeof param is "function"
      param()
    else
      _privateProperty = param
    return
  _privateProperty = 0

  # static private property
  # @_count = Class._count
  # although Class._count can be accessed directly,
  # we never do so because of naming convention
  @count = 0

  # static public method
  # @staticMethod_countObjects = Class.staticMethod_countObjects
  # in this context, this = Class
  # therefore, @_count = this.count = Class._count
  @staticMethod_countObjects = ->
    @count

  @getPrivateStaticCount = ->
    _privateStaticCount

  constructor: (privateProperty, @publicProperty) ->
    _privateProperty = privateProperty
    _privateStaticCount++
    Class.count++;

  # public methods
  # note that we use ':' to define public methods
  # naming convention for public members is camelCase
  publicMethod : (@publicProperty) ->

  getPrivateProperty : ->
    _privateProperty

  callPrivateMethod : (callback) ->
    _privateMethod callback
    return

module.exports = Class