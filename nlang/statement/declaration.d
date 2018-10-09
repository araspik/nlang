/**** Provides a base class for declarations.
  * 
  * Declarations act like statements and at the same
    time provide their own semantics.
  * Nothing specific is assumed about declaration types;
    Only an identifier is required and enforced, along
    with the Statement's requirement of scope.
  * 
  * Author: ARaspiK
  * License: MIT
  */
module nlang.statement.declaration;

import nlang.statement;

/// Provides a declaration type.
class Declaration: Statement {
  /// Identifier.
  string ident;

  @safe nothrow pure:

  /// Internal constructor.
  protected this(Scope context, string ident) {
    super(context);
    this.ident = ident;
  }
}