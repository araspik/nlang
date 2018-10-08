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

class ReturnStatement: Statement {
  Expression expr;

  @safe nothrow pure:

  /// Returns whether the statement can be resolved.
  override bool resolvable() const {
    return expr.resolvable;
  }
}