var Class = (function () {
  // private members
  var _privateProperty;

  function _privateMethod(param) {
    if (typeof param == 'function')
      param();
    else
      _privatePropery = param;
  }

  // static members
  Class._count = 0;

  Class.staticMethod_countObjects = function () {
    return this._count;
  };

  // constructor
  function Class(privateProperty, publicProperty) {
    _privateProperty = privateProperty;
    this.publicProperty = publicProperty;
    Class._count++;
  }

  // public methods
  Class.prototype.publicMethod = function (value) {
    this.publicProperty = value;
  };

  Class.prototype.getPrivateProperty = function () {
    return _privateProperty;
  };

  Class.prototype.callPrivateMethod = function (callback) {
    _privateMethod(callback);
  };
  return Class;
})();

module.exports = Class;

