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

/// Provides a statement type.
abstract class Statement {
  @safe nothrow pure:

  /// Returns whether the statement can be
  /// evaluated at compile time.
  bool resolvable() const;
}