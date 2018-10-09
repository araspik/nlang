/**** Provides support for scoped blocks.
  * 
  * A Block stores a series of other statements
    exactly like an array, but it additionally
    provides scoping.
  * 
  * Author: ARaspiK
  * License: MIT
  */
module nlang.statement.block;

import nlang.statement;
import nlang.scoping;

/// Provides scoped statement blocks.
final class Block: Statement, Scoped {
  /// The statements it holds.
  Statement[] statements;
  /// The scope.
  private Scope context_;

  @safe nothrow pure:

  /// Full constructor.
  this(Statement[] statements, Scope context) {
    this.statements = statements;
    this.context_ = context;
  }

  /// Returns whether the statement can be
  /// evaluated at compile time.
  bool resolvable() const {
    foreach (const s; statements)
      if (!s.resolvable)
        return false;
    return true;
  }

  /// Returns the contained scope.
  @property const(Scope) innerScope() const {
    return context_;
  }

}