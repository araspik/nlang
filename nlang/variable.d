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
import nlang.scoping;
import nlang.type;

/// Variable declaration.
class Variable: Declaration {
  private { // Variables
    /// Internal expression
    Expression exp;
  }

  @safe nothrow pure:

  /// Constructor: From ParseTree.
  this(PT)(Scope context, PT p) {
    // Get type from parsed
    const Type type = Type.of(p.children[0]);
    // Get identifier from parsed
    string ident = p.children[1].matches[0];
    // Get expression if available
    Expression expr = p.children.length > 2
      ? new Expression(context, p.children[2])
      : type.defInit;
    // Pass to normal constructor
    this(context, ident, expr);
  }

  /// Full constructor
  this(Scope context, string ident, Expression exp) {
    super(context, ident);
    this.exp = exp;
  }

  /// Returns the current value of the variable.
  @property ref Expression expr() {
    return exp;
  }

  /// Returns whether the variable is resolvable.
  override bool resolvable() const {
    return exp.resolvable;
  }
}