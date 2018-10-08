/**** Provides an interface for anything that has scope.
  * 
  * This is used by Scope to store classes which
    store the scopes back. As these are classes, which
    are stored by reference, it actually works!
  * Scopes need to know their enclosing object as in
    some cases it is useful to find a scope matching
    with certain structures (such as a function).
  * As these are interfaces which do not define
    actual variables and instead require property
    functions to provide access to the actual scope,
    functions use the same scope as the statement
    block they contain even though both are
    individually marked as Scoped.
  * 
  * Author: ARaspiK
  * License: MIT
  */
module nlang.scoped;
import nlang.scoping;

/// Provides a scoped interface.
interface Scoped {
  @safe nothrow pure:

  /// Returns the contained scope.
  @property const(Scope) context() const;
}