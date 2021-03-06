/**** Provides a base class for expressions.
  * 
  * An Expression is any value that is known at runtime.
  * The implementation and base are primarily setup for
    LLVM, but this may change in the future.
  * Expressions may be calculated at compile time.
  * 
  * Author: ARaspiK
  * License: MIT
  */
module nlang.expr;

public import nlang.expr.constant;
public import nlang.expr.integral;

import nlang.type;

/// The Expression class, used to classify different
/// expressions.
abstract class Expression {
  @safe nothrow pure:

  /// Returns the type of the expression.
  abstract @property const(Type) type() const
    out(result; result !is null, "Type must be valid");

  /// Returns whether the expression can be resolved at
  /// compile time.
  abstract bool resolvable() const;

  /// Resolves the expression to a constant expression.
  /// Returns 'null' if the expression is not resolvable
  /// at compile time.
  abstract const(ConstantExpression) resolve() const;
}