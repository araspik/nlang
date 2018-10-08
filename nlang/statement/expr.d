/**** Provides expressions as statements.
  * 
  * Expressions like assignment which are used
    as both expressions and statements creates
    a need for this.
  * 
  * Author: ARaspiK
  * License: MIT
  */
module nlang.statement.expr;

import nlang.statement;
import nlang.expr;

/// Provides expressions as statements.
class ExpressionStatement: Statement {
  private { // Variables
    /// Expression to evaluate.
    Expression expr_;
  }

  @safe nothrow pure:

  /// Constructor.
  this(Expression expr) {
    this.expr_ = expr;
  }

  /// Returns the expression.
  @property const(Expression) expr() const {
    return expr_;
  }

  /// Returns whether the statement can be
  /// evaluated at compile time.
  override bool resolvable() const {
    return expr.resolvable;
  }
}