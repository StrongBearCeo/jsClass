function Class(privateProperty, publicProperty) {
  var _privateProperty = privateProperty;
  this.publicProperty = publicProperty;

  function _privateMethod(param) {
    if(typeof param == 'function')
      param();
    else
      _privatePropery = param;
  }

  this.privilegedMethod_callPrivateMethod = function(callback) {
    _privateMethod(callback);
  };

  this.privilegedMethod_getPrivateProperty = function() {
    return _privateProperty;
  };

  this.privilegedMethod_setPrivateProperty = function(value) {
    _privateProperty =value;
  };

  this.privilegedMethod_getPublicProperty = function() {
    return this.publicProperty;
  };

  this.privilegedMethod_setPublicProperty = function(value) {
    this.publicProperty =value;
  };

  this.privilegedMethod_callPublicMethod = function(callback) {
    this.publicMethod(callback);
  }
}
Class.prototype.publicMethod = function(param) {
  if (typeof param == 'function')
    param();
  else
    this.publicProperty = param;
};

Class.prototype.getPrivateProperty = function() {
  if (typeof _privateProperty !== 'undefined')
    return _privateProperty;
  else if (typeof this._privateProperty !== 'undefined')
    return this._privateProperty;
  else throw("Cannot access private property");
};

Class.prototype.callPrivateMethod = function() {
  if (typeof _privateMethod !== 'undefined')
    _privateMethod(5);
  else if (typeof this._privateMethod !== 'undefined')
    this._privateMethod(5);
  else throw("Cannot call private method");
};

module.exports = Class;

