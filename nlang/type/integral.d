/**** Provides integral type support.
  * 
  * It provides support for integral, floating-point,
    character, and boolean types, as well as 'void' and
    'null'.
  * Type sizes are defined in bits.
  * Here is a list of integral types:
    * i8: Signed byte
    * u8: Unsigned byte
    * ...
    * i64: Signed long
    * u64: Unsigned long
    * isize: Architecture-dependent signed
    * usize: Architecture-dependent unsigned
    * f32: Float
    * f64: Double
    * fbig: Real
    * void: byte of no type
    * null: nothingness (0) of every type
  * 
  * Author: ARaspiK
  * License: MIT
  */
module nlang.type.integral;

import nlang.type;
import nlang.expr;

import std.bitmanip;

/// The integral type class.
class IntegralType: Type {
  private { // Variables
    /// Storage as a bitfield.
    mixin(bitfields!(
      size_t, "size_", size_t.sizeof * 8 - 2,
      bool, "signedness", 1,
      bool, "integral_", 1,
    ));
  }

  @safe nothrow pure:

  /// Full Constructor
  this(size_t size, bool integral, bool signed = false) {
    this.size_ = size;
    this.integral_ = integral;
    this.signedness = signed;
  }

  /// Returns the size of the type, in bits.
  override @property size_t sizeBits() const {
    return size_;
  }

  /// Returns whether the type is integral or not.
  @property bool integral() const {
    return integral_;
  }

  /// Returns whether the type is floating-point or not.
  @property bool floating() const {
    return !integral_;
  }

  /// Returns whether the type is signed or not.
  @property bool signed() const {
    return signedness;
  }

  /// Returns an expression representing the default
  /// initialisation value of the type.
  override ConstantExpression defInit() const {
    if (integral)
      return new IntegralExpression(this, 0);
    else
      return new IntegralExpression(this, 0.0);
  }

  /// Checks whether the type is coercible to the given one.
  override bool convertibleTo(Type type) const {
    /// If converting to boolean, fine.
    if (type is Type.builtins["bool"])
      return true;
    /// Otherwise we check if the type is an integral type.
    if (auto to = cast(IntegralType)type) {
      /// If so, then we follow a few rules:
      /// No truncation!
      if (sizeBits < to.sizeBits)
        return false;
      /// No converting floating point to integral!
      if (integral && to.floating)
        return false;
      /// If those pass, then it is convertible.
      return true;
    }
    return false;
  }
}