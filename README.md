Understanding javascript object oriented programming (OOP)
========
Javascript is the most confusing programming language,
it does not have built-in OOP elements like class, private, public,
static properties, methods. Fortunately, Javascript flexibility allows us to customize and bend it to our needs. This project will show you
how to implement OOP style in Javascript. You will see how class, private, public, static members are introduced into pure Javascript,
Coffeescipt - another way of writing Javascript. Furthermore,
you will see how a nodejs module can be used as a class as well as a singleton

Detail sample implementation is inside `src/` directory

Running the `test` by `mocha` or `npm test` offers an insight into the implementation
```
Coffeescript class
  private properties/methods
    ✓ cannot be accessed from outside
  public properties/methods
    ✓ can be accessed from outside
    ✓ can access private properties
    ✓ can access private methods
  static members
    static methods
      ✓ can be access directly via class name
      ✓ cannot be called from object instance
    public static properties
      ✓ can be access directly via class name from outside
    private static properties
      ✓ cannot be access from outside
      ✓ can be access via a public static method

Node module as a singleton
  private properties/methods
    ✓ cannot be accessed from outside
  public properties/methods
    ✓ can be accessed from outside
    ✓ can access private properties
    ✓ can access private methods

pure Javascript class
  private properties/methods
    ✓ cannot be accessed from outside
  public properties/methods
    ✓ can be accessed from outside
    ✓ can access private properties
    ✓ can access private methods
  static method
    ✓ can be access directly via class name
    ✓ cannot be called from object instance

Node module as both class and singleton
  as normal class
    private properties/methods
      ✓ cannot be accessed from outside
    public properties/methods
      ✓ can be accessed from outside
      ✓ can access private properties
      ✓ can access private methods
    static method
      ✓ can be access directly via class name
      ✓ cannot be called from object instance
  as singleton
    private properties/methods
      ✓ cannot be accessed from outside
    public properties/methods
      ✓ can be accessed from outside
      ✓ can access private properties
      ✓ can access private methods
  relationship between members of singleton and normal class
    singleton
      ✓ cannot access instance private members
      ✓ cannot use instance public members
    class instance
      ✓ cannot access singleton private members
      ✓ cannot use singleton public members
```
