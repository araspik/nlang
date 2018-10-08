/**** Provides a base class for types.
  * 
  * A Type defines the type of an expression.
  * The type is always known at compile time, while the
    expression's value itself may not be.
  * Different expression classes match to different types,
    except for specific cases such as constant compile-time
    expressions.
  * Types include size in bits, which can be represented as
    bytes by rounding up to 8 bits.
    If the size is '0' then the actual size is unknown,
    which is possible with opaque structures or the 'null'
    type.
  * 
  * Author: ARaspiK
  * License: MIT
  */
module nlang.type;

public import nlang.type.integral;

import nlang.expr;

/// The Type class, used to determine expression types.
abstract class Type {

  /// A list of builtin types.
  shared static immutable const(IntegralType)[string] builtins;
  
  shared static this() {
    builtins = [
      "null": new IntegralType(0,  true),
      "void": new IntegralType(1,  true),
      "bool": new IntegralType(1,  true),
      "char": new IntegralType(8,  true),
      "i8":   new IntegralType(8,  true, true),
      "u8":   new IntegralType(8,  true),
      "i16":  new IntegralType(16, true, true),
      "u16":  new IntegralType(16, true),
      "i32":  new IntegralType(32, true, true),
      "u32":  new IntegralType(32, true),
      "i64":  new IntegralType(64, true, true),
      "u64":  new IntegralType(64, true),
      "isize":new IntegralType(size_t.sizeof * 8, true, true),
      "usize":new IntegralType(size_t.sizeof * 8, true),
      "f32":  new IntegralType(32, false),
      "f64":  new IntegralType(64, false),
      "fbig": new IntegralType(real.sizeof * 8, false),
    ];
  }

  /// Returns the size of the type, in bits.
  /// '0' indicates an unknown size or the 'null' type.
  @property size_t size() const;

  /// Returns an expression representing the default
  /// initialisation value of the type.
  /// Returns 'null' if the type's internals are not known.
  ConstantExpression defInit() const;
}