class Class

  # private members
  _privateMethod = (param) ->
    if typeof param is "function"
      param()
    else
      _privateProperty = param
    return
  _privateProperty = 0

  constructor: (privateProperty, @publicProperty) ->
    _privateProperty = privateProperty

    # privileged methods
    @privilegedMethod_callPrivateMethod = (callback) ->
      _privateMethod callback
      return

    @privilegedMethod_getPrivateProperty = ->
      _privateProperty

    @privilegedMethod_setPrivateProperty = (value) ->
      _privateProperty = value
      return

    @privilegedMethod_getPublicProperty = ->
      @publicProperty

    @privilegedMethod_setPublicProperty = (value) ->
      @publicProperty = value
      return

    @privilegedMethod_callPublicMethod = (callback) ->
      @publicMethod callback
      return

  # public methods
  publicMethod : (param) ->
    if typeof param is "function"
      param()
    else
      @publicProperty = param
    return

  getPrivateProperty : ->
    if typeof _privateProperty isnt "undefined"
      return _privateProperty
    else if typeof @_privateProperty isnt "undefined"
      return @_privateProperty
    else
      throw ("Cannot access private property")
    return

  callPrivateMethod : (callback) ->
    if typeof _privateMethod isnt "undefined"
      _privateMethod callback
    else if typeof @_privateMethod isnt "undefined"
      @_privateMethod callback
    else
      throw ("Cannot call private method")
    return

module.exports = Class