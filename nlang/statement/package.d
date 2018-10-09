/**** Provides a base class for statements.
  * 
  * Statements include expressions, declarations,
    returning, loops, etc.
  * 
  * Author: ARaspiK
  * License: MIT
  */
module nlang.statement;

public import nlang.statement.block;
public import nlang.statement.expr;
public import nlang.statement.declaration;

import nlang.scoping;

/// Provides a statement type.
class Statement {
  /// Scope.
  private Scope context_;

  @safe nothrow pure:

  /// Constructor
  this(Scope context) {
    this.context_ = context;
  }

  /// Returns whether the statement can be evaluated at
  /// compile time.
  abstract bool resolvable() const;

  /// Returns the stored scope (context).
  final @property const(Scope) context() const {
    return context_;
  }
}