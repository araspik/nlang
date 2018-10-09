/**** Provides a class of constant expressions.
  * 
  * It provides a subclass of expressions for values
    which are known at compile-time.
  * These are either known during parsing or are
    calculated at compile time using other constant
    expressions.
  * 
  * Author: ARaspiK
  * License: MIT
  */
module nlang.expr.constant;

import nlang.expr;

/// A subclass of expressions which are known at compile
/// time.
abstract class ConstantExpression: Expression {

  @safe nothrow pure:

  /// Returns whether the expression is resolvable
  /// at compile time.
  final bool resolvable() const {
    return true;
  }

  /// Resolves the expression to a constant expression.
  /// Since all constant expressions are constant
  /// expressions, we finalize the resolver function and
  /// return it back.
  final const(ConstantExpression) resolve() const {
    return this;
  }
}