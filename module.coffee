# private members
_privateProperty = 0
_privateMethod = (param) ->
  if typeof param is "function"
    param()
  else
    _privateProperty = param
  return

module.exports =
  # public members
  publicProperty : 2
  publicMethod : (@publicProperty) ->

  setPrivateProperty : (value) ->
    _privateProperty = value
    return

  getPrivateProperty : ->
    _privateProperty

  callPrivateMethod : (callback) ->
    _privateMethod callback
    return