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

  constructor: (privateProperty, @publicProperty) ->
    _privateProperty = privateProperty

  # public methods
  # note that we use ':' to define public methods
  # naming convention for private members is camelCase
  publicMethod : (param) ->
    if typeof param is "function"
      param()
    else
      @publicProperty = param
    return

  getPrivateProperty : ->
    return _privateProperty


  callPrivateMethod : (callback) ->
    _privateMethod callback
    return


module.exports = Class