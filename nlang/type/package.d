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
  shared static immutable const(Type)[string] builtins;
  
  shared static this() {
    builtins = [
      "null": cast(Type) new IntegralType(0,  true),
      "void": cast(Type) new IntegralType(1,  true),
      "bool": cast(Type) new IntegralType(1,  true),
      "char": cast(Type) new IntegralType(8,  true),
      "i8":   cast(Type) new IntegralType(8,  true, true),
      "u8":   cast(Type) new IntegralType(8,  true),
      "i16":  cast(Type) new IntegralType(16, true, true),
      "u16":  cast(Type) new IntegralType(16, true),
      "i32":  cast(Type) new IntegralType(32, true, true),
      "u32":  cast(Type) new IntegralType(32, true),
      "i64":  cast(Type) new IntegralType(64, true, true),
      "u64":  cast(Type) new IntegralType(64, true),
      "isize":cast(Type) new IntegralType(size_t.sizeof * 8, true, true),
      "usize":cast(Type) new IntegralType(size_t.sizeof * 8, true),
      "f32":  cast(Type) new IntegralType(32, false),
      "f64":  cast(Type) new IntegralType(64, false),
      "fbig": cast(Type) new IntegralType(real.sizeof * 8, false),
    ];
  }

  @safe nothrow pure:

  /// Returns the size of the type, in bits.
  /// '0' indicates an unknown size or the 'null' type.
  @property size_t sizeBits() const;

  @property final size_t size() const {
    return (sizeBits + 7) & -8;
  }

  /// Returns an expression representing the default
  /// initialisation value of the type.
  /// Returns 'null' if the type's internals are not known.
  ConstantExpression defInit() const;

  /// Per-type definition of whether it can be converted to
  /// another type implicitly.
  protected bool convertibleTo(Type type) const;

  /// Returns whether the type is coercible to another one.
  final bool coercibleTo(Type type) const {
    /// 'null' converts to all types.
    if (this is Type.builtins["null"])
      return true;
    /// All types convert to 'void'.
    if (type is Type.builtins["void"])
      return true;
    /// Otherwise, convertibleTo() is used.
    return convertibleTo(type);
  }
}