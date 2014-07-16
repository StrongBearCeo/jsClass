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
  publicMethod : (param) ->
    if typeof param is "function"
      param()
    else
      @publicProperty = param
    return
  setPrivateProperty : (value) ->
    _privateProperty = value

  getPrivateProperty : ->
    _privateProperty

  callPrivateMethod : (callback) ->
    _privateMethod callback
    return