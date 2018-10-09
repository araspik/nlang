/**** Provides expressions as statements.
  * 
  * Expressions like assignment which are used as both
    expressions and statements creates a need for this.
  * 
  * Author: ARaspiK
  * License: MIT
  */
module nlang.statement.expr;

import nlang.statement;
import nlang.expr;
import nlang.scoping;

/// Provides expressions as statements.
class ExpressionStatement: Statement {
  private { // Variables
    /// Expression to evaluate.
    Expression expr_;
  }

  @safe nothrow pure:

  /// Constructor.
  this(Scope context, Expression expr) {
    super(context);
    this.expr_ = expr;
  }

  /// Returns the expression.
  @property const(Expression) expr() const {
    return expr_;
  }

  /// Returns whether the statement can be evaluated at
  /// compile time.
  bool resolvable() const {
    return expr.resolvable;
  }
}