/**** Provides return statements.
  * 
  * Returns statements quite literally return
    expressions back to an upper function.
  * 
  * Author: ARaspiK
  * License: MIT
  */
module nlang.statement.returning;

import nlang.statement;
import nlang.expr;
import nlang.callable;
import nlang.scoping;

/// Provides return statements.
class ReturnStatement: Statement {
  /// Expression to return.
  Expression expr;

  @safe nothrow pure:

  /// Full constructor.
  this(Scope context, Expression expr) {
    super(context);
    // Find the enclosing function.
    Function func = context.find!Function;
    assert (func !is null,
      "Return statement not within function!");
    // Check on matching types.
    assert (expr.type.coercibleTo(func.ret),
      "Return statement value does not match expected"
      ~ " return type!");
  }

  /// Returns whether the statement can be resolved.
  bool resolvable() const {
    return expr.resolvable;
  }
}