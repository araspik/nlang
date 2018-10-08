/**** Provides constant integral expressions.
  * 
  * It provides integral, floating-point, and character
    types. It also includes the 'void' type.
  * It provides limited conversions between these types
    as implicit coercion and any conversion as explicit
    conversions.
    * For implicit coercion, truncation is prevented,
      including for floating-point fractionals.
  * 
  * Author: ARaspiK
  * License: MIT
  */
module nlang.expr.integral;

import nlang.expr;
import nlang.type;

/// The Integral constant expression type.
class IntegralExpression: ConstantExpression {
  private { // Variables
    /// The integral type.
    const IntegralType type_;
    /// The value type.
    /// It stores by the largest space needed.
    /// The type determines the actual bytes used.
    union Value {
      ulong integral;
      real floating;
    }
    /// The value.
    Value val;
  }

  @safe nothrow pure:

  /// Constructor: Takes type.
  this(const IntegralType type) {
    this.type_ = type;
  }

  /// Full constructor: For integral expressions.
  this(const IntegralType type, ulong val) {
    this(type);
    assert (this.type.integral,
      "An integral constant was passed with a non-integral type!");
    this.val.integral = val;
  }

  /// Full constructor: For floating-point expressions.
  this(const IntegralType type, real val) {
    this(type);
    assert (this.type.floating,
      "A floating-point constant was passed with a non-floating-point type!");
    this.val.floating = val;
  }

  /// Returns the type of the expression.
  override @property const(IntegralType) type() const {
    return type_;
  }
}