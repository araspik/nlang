/**** Provides variables.
  * 
  * Variables are declarations of named expressions.
  * They consist of an identifier, the expression,
    and an initialiser (with a valid default).
  * 
  * Author: ARaspiK
  * License: MIT
  */
module nlang.variable;

import nlang.statement.declaration;
import nlang.expr;

/// Variable declaration.
class Variable: Declaration {
  private { // Variables
    /// Internal expression
    Expression exp;
  }

  @safe nothrow pure:

  /// Full constructor
  this(string ident, Expression exp) {
    super(ident);
    this.exp = exp;
  }

  @property ref Expression expr() {
    return exp;
  }
}