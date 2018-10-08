/**** Provides a base class for declarations.
  * 
  * Declarations act like statements and at
    the same time provide their own semantics.
  * They optionally take an Initialiser class
    (which is checked for being of a valid
    subclass) which is used to initialise the
    declaration.
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
  protected this(string ident) {
    this.ident = ident;
  }
}